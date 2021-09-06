class UsersController < ApplicationController
  # before_action :set_user, only: %i[ show edit update destroy ]
  skip_before_action :login_required, only: [:new, :create]
  
  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
  end

 
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Compte crée avec succès, vous pouvez vous connectez'
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
      if @user.update(user_params)
        flash[:success] = "Votre compte a été mis à jour avec succès"
        redirect_to profil_path
      else
        render :edit
      end
  end


  private

  # def set_user
  #   @user = User.find(params[:id])
  # end

  def user_params
    params.require(:user).permit(:email, :name, :username, :avatar, :password, :password_confirmation)
  end
end
