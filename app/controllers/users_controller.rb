class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def admin_panel
    if current_user.admin?
      @all_students = User.select { |s| s.user_type == "student"}.sort! { |a,b| a.last_name <=> b.last_name }
      @students_today = @all_students.map { |s| s if (!s.checkins.last.nil? && s.checkins.last.created_at.strftime("%Y-%m-%e") == (Date.today +1).to_s) }.compact! || []
      @all_other_students = @all_students - @students_today
    else
      redirect_to :root
    end
  end

  def admin_student
    if current_user.admin?
      @student = User.find(params[:id])
      @checkins = Checkin.get_last_five_checkins(@student)
      @respect_scores = Checkin.gather_last_five(@student, 1, @checkins)
      @integrity_scores = Checkin.gather_last_five(@student, 2, @checkins)
      @perseverance_scores = Checkin.gather_last_five(@student, 3, @checkins)
      @passion_scores = Checkin.gather_last_five(@student, 4, @checkins)
      @empowerment_scores = Checkin.gather_last_five(@student, 5, @checkins)
      @team_scores = Checkin.gather_last_five(@student, 6, @checkins)
      @total_scores = Checkin.gather_last_five_total_scores(@student, @checkins)
    else
      redirect_to :root
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @student = current_user.id
    @checkins = Checkin.get_last_five_checkins(@student)
    @respect_scores = Checkin.gather_last_five(@student, 1, @checkins)
    @integrity_scores = Checkin.gather_last_five(@student, 2, @checkins)
    @perseverance_scores = Checkin.gather_last_five(@student, 3, @checkins)
    @passion_scores = Checkin.gather_last_five(@student, 4, @checkins)
    @empowerment_scores = Checkin.gather_last_five(@student, 5, @checkins)
    @team_scores = Checkin.gather_last_five(@student, 6, @checkins)
    @dates = Checkin.gather_last_five_dates(@student, @checkins)
    @total_scores = Checkin.gather_last_five_total_scores(@student, @checkins)
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
