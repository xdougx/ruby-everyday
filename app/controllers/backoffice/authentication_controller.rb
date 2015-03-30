class Backoffice::AuthenticationController < ApplicationController  
  layout 'login'

  def sign_in
    @user = User.new
  end

  def sign_out
    session.destroy
    redirect_to(backoffice_authentication_sign_in_path)
  end

  def authenticate
    @user = User.find_by(email: auth_params[:email])
    if @user.try(:authenticate, auth_params[:frase])
      session[:user] = @user.id.to_s
      redirect_to("/backoffice")
    else
      @user.errors.add(:login, "Email or frase inválid")
      render action: :sign_in
    end
  end

  private
  def auth_params
    params.require(:user).permit(:email, :frase)
  end

end
