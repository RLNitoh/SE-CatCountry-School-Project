class UsersController < ApplicationController
    before_action :authenticate_user!   #<<<< These are commented out until I find out what exactly need's to be excluded
    before_action :current_user_report, except: [:show]
    before_action :user_banned, except: [:show]

    # Show user's profile
    # def show
    #     @user = User.find(params[:id])
    #     if @user.reportCount == nil
    #         @user.update(reportCount: 0)
    #     end
    #     render :show
    # end

    # # Find Current User To Edit
    def edit
        @user = User.find(params[:id])
    end

    # Update user's edit information
    # def update
    #     current_user.update(params[:user])
    #     redirect_to current_user
    # end

    # ------ PROBLEM WITH USER PROFILE NOT WORKING -------
    def show
        # @user  = User.find(params[:id])
        # @posts = @user.posts.order(created_at: :desc)
      end

    def update
        current_user.update(user_params)
        redirect_to current_user
      end

      private
    def user_params
        params.require(:user).permit(:username, :name, :website,
                                     :bio, :email, :phone, :gender, :avatar)
    end

    def report_user
        if current_user.reportCount == nil
            current_user.update(reportCount: 0)
        end

        @user = User.find(params[:id])
        render :report_user
    end

    def report_user_update
        @user = User.find(params[:id])
        rep = @user.reportCount

        if @user.update(params.require(:user).permit(:reportCount))
            if @user.reportCount > 5 || @user.reportCount < 1
                @user.update(reportCount: rep)
                flash.now[:error] = 'Choose a number between 1 to 5'
                render :report_user
            else
                @user.update(reportCount: rep + 1)
                flash[:success] = 'User was successfully reported!'
                redirect_to posts_url
            end
        else
            flash.now[:error] = 'Unable to report user!'
            render :report_user
        end
    end

    def current_user_report
        @user = User.find(params[:id])
        if @user == current_user
            redirect_to posts_path, flash: { error: "You can't report yourself!"}
        end
    end

    def user_banned
        if current_user.reportCount == nil
            current_user.update(reportCount: 0)
        end

        if current_user.reportCount >= 5
          redirect_to title_path, flash: { error: "You've been banned!"}
        end
    end

    def index
        @posts = Post.order(created_at: :desc).page(params[:page]).per(5)
    end

end
