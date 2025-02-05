class UsersController < ApplicationController
  def create
    pp create_params
    result = Users::Create.run(params: create_params.to_hash)
    if result.valid?
      render json: result.result.to_json
    else
      render json: { error: true, messages: result.error.messages }, status: 422
    end
  end

  private

  def create_params
    params.permit(:name, :patronymic, :surname, :email, :age, :interests, :skills, :country, :nationality, :gender)
  end
end
