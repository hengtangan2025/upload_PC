class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def log_in_users
    find_user = User.find(params[:user_id])
    sign_out if user_signed_in?
    sign_in :user, find_user 
    render :json => {
      current_user_name:find_user.name
      }, :status => 200
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to '/', notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def sign_up_from_app
    @user = User.create(:name => params[:name], :account_number => params[:account_number], :password => params[:password])
    if @user.save
      render :json => {:status => 200}
    end
  end

  def login_from_app
    user = User.where(account_number: params[:account_number]).first
    if user && user.authenticate(params[:password])
      render :json => {
        :name => user.name,
        :id => user.id,
        :status => 200
      }
    end
  end

  def user_params
    params.require(:user).permit(:name, :account_number, :password)
  end
end