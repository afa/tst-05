class Users::Create < ActiveInteraction::Base
  hash :params do
    string :email
    string :name
    string :patronymic
    string :surname, optional: true
    integer :age
    string :nationality
    string :country
    string :gender
    string :interests
    string :skills
  end

  def execute
    # don't do anything if params is empty
    return unless params['name']
    return unless params['patronymic']
    return unless params['email']
    return unless params['age']
    return unless params['nationality']
    return unless params['country']
    return unless params['gender']
    ##########
    return if User.where(email: params['email']).first
    return if params['age'] <= 0 || params['age'] > 90
    return if params['gender'] != 'male' and params['gender'] != 'female'

    user_full_name = "#{params['surname']} #{params['name']} #{params['patronymic']}"
    user_params = params.except(:interests, :skills)
    user = User.create(user_params.merge(full_name: user_full_name))

    Interest.where(name: params['interests']).each do |interest|
      user.interests = user.interest + interest
      user.save!
    end

    user_skills = []
    params['skills'].split(',').each do |skil|
      skil = Skil.find_by(name: skil)
      user_skills =  user_skills + [skil]
    end
    user.skills = user_skills
    user.save
  end
end
