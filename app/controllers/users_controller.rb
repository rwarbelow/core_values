class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @current_user = current_user.id
    @checkins = Checkin.get_last_five_checkins(@current_user)
    @respect_scores = Checkin.gather_last_five(@current_user, 1, @checkins)
    @integrity_scores = Checkin.gather_last_five(@current_user, 2, @checkins)
    @perseverance_scores = Checkin.gather_last_five(@current_user, 3, @checkins)
    @passion_scores = Checkin.gather_last_five(@current_user, 4, @checkins)
    @empowerment_scores = Checkin.gather_last_five(@current_user, 5, @checkins)
    @team_scores = Checkin.gather_last_five(@current_user, 6, @checkins)
    @dates = Checkin.gather_last_five_dates(@current_user, @checkins)
    @total_scores = Checkin.gather_last_five_total_scores(@current_user, @checkins)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user]
    end
end
