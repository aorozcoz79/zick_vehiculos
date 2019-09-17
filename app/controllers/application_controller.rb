require 'rest-client'

class ApplicationController < ActionController::Base

#    before_action :authenticate!
#   SECRET = 'tu vehículo está seguro'
#    @current_user = ''
#
#    private

#    def authenticate!
#        begin
#            token = request.headers[:authorization]
#            data = JWT.decode(token, SECRET).first
#            @current_user = User.find(data['user_id'])
#            render json: @current_user, status: :authorized
#        rescue
#            render json: { error: 'unauthorized' }, status: :unauthorized
#        end
#    end
end
