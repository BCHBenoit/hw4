class SessionsController < ApplicationController
  def new
  end

  def create
    @user_entered_email = params["email"]
    @user_entered_password = params["password"]

    @users_table = User.all
    @users_table_row = @users_table.find_by({"email"=>params["email"]})

    if @users_table_row != nil
      user_password = @users_table_row["password"]
      if BCrypt::Password.new(user_password) == @user_entered_password
        cookies["user_id"] = @users_table_row["id"]
        redirect_to "/places"
      else
        redirect_to "/login"
      end
    else
      redirect_to "/login"
    end


  end

  def destroy
    cookies["user_id"] = nil
    redirect_to "/login"
  end
end
  