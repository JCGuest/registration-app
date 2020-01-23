class UsersController < ApplicationController

    def new
        @user = User.new
        @user.addresses.build(address_type: "Home")
        @user.addresses.build(address_type: "Biz")
        @user.addresses.build(address_type: "Space")
        @user.build_team
    end
    
    def create
        raise params.inspect
        @user = User.new(user_params)
        if @user.save
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
    end
    
    private

    def user_params
        params.require(:user).permit(:email)
    end
end