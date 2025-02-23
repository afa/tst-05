class UsersController < ApplicationController
  def create
    result = Users::Create.run(create_params.to_hash)
    if result.valid?
      render json: result.result.to_json
    else
      render json: { error: true, messages: result.errors.messages }, status: 422
    end
  end

  private

  def create_params
    params.permit(:name, :patronymic, :surname, :email, :age, :skills, :country, :nationality, :gender, interests: [])
  end
end
