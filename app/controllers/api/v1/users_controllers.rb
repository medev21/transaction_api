module API
    module V1
        class UsersController < ApplicationController
        
            def index
                users = User.all();
                render json: {status: 200, count: users.length, data: users}, status: ok
            end
        
        end
    end
end