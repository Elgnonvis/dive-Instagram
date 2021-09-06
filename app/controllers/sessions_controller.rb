class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :only_signed_out, only: [:new, :create]
  
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'Connexion réussie'
      redirect_to profil_path

      else
        flash[:danger] = 'Identifiants incorrects'
        render :new
    end
  end

  def destroy
    session.destroy
    redirect_to new_session_path
    flash[:success] = 'Déconnexion réussie'
  end
end
