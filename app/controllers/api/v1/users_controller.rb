module Api
    module V1
        class UsersController < ApplicationController
        
            def index
                users = User.all();
                render json: {count: users.length, users: users}, status: :ok
            end

            def show
                user = User.find(params[:id])
                render json: {user: user}, status: :ok
            end

            def create
                user = User.new(user_params)

                if user.save()
                    render json: {message: "User Created!", user: user}, status: :ok
                else
                    render json: {message: "ERROR - User not created"}, status: :unprocessable_entity
                end
            end

            private

            #only accept these three parameters in the POST request, reject extra params
            def user_params
                params.permit(:first_name, :last_name, :email)
            end

        end
    end
end