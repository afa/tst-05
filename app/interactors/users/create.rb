class Users::Create < ActiveInteraction::Base
  string :email
  string :name
  string :patronymic
  string :surname, optional: true, default: nil
  integer :age
  string :nationality
  string :country
  string :gender
  string :skills, default: '', optional: true
  array :interests, optional: true, default: [], index_errors: true do
    string optional: true
  end

  validates :age, inclusion: 1..90
  validates :gender, inclusion: %w[male female]
  validate :user_unexpected

  def execute
    user = create_user
    add_interests(user)
    add_skills(user)
    user.save
  end

  private

  def user_unexpected
    errors.add(:email, :duplicate) if User.where(email: email).exists?
  end

  def create_user
    User.create(user_params)
  end

  def add_interests(user)
    user.interests = Interest.where(name: interests)
  end

  def add_skills(user)
    user.skills = Skill.where(name: skills.split(','))
  end

  def full_name
    [surname, name, patronymic].compact.join(' ')
  end

  def user_params
    { email:, name:, patronymic:, surname:, age:, nationality:, country:, gender:, full_name: }
  end
end
