class SessionsController < ApplicationController
  #skip_before_action :authenticate!

    def create
        user = User.find_by(email: session_params[:email])
        # if user.try(:authenticate, session_params[:password])
        if user&.authenticate(session_params[:password])
          token = JWT.encode({ user_id: user.id }, ApplicationController::SECRET)
          render json: { token: token }
        else
          render json: { error: 'Bad credentials' }, status: 401
        end
    end
  
    private
    
    def session_params
      params.require(:user).permit(:email, :password)
    end
end