class CheckinsController < ApplicationController
  before_action :set_checkin, only: [:show, :edit, :update, :destroy]

  # GET /checkins
  # GET /checkins.json
  def index
    @checkins = Checkin.all
  end

  # GET /checkins/1
  # GET /checkins/1.json
  def show
    if current_user.id == @checkin.user_id || current_user.admin?
      @checkin = Checkin.find(params[:id])
      @student_comments = @checkin.comments.map { |c| c if c.user_id == @checkin.user.id }
      @admin_comments = @checkin.comments - @student_comments
      @student_id = @checkin.user_id
      @answers = @checkin.answers
      @checkin_id = @checkin.id
      @all_checkins = Checkin.where(user_id: @student_id).sort! { |a, b| a.created_at <=> b.created_at }
      @back_id = @all_checkins[(@all_checkins.index(@checkin) - 1)]
      @forward_id = @all_checkins[(@all_checkins.index(@checkin) + 1)] || @all_checkins[0]
      @grouped_answers = @checkin.answers.group_by{ |a| a.option.option }
      @strongly_disagree = @grouped_answers["Strongly disagree"]
      @disagree = @grouped_answers["Disagree"]
      @neutral = @grouped_answers["Neutral"]
      @agree = @grouped_answers["Agree"]
      @strongly_agree = @grouped_answers["Strongly agree"]
      @respect_questions = CoreValue.find(1).questions
      @integrity_questions = CoreValue.find(2).questions
      @perseverance_questions = CoreValue.find(3).questions
      @passion_questions = CoreValue.find(4).questions
      @empowerment_questions = CoreValue.find(5).questions
      @team_questions = CoreValue.find(6).questions
      render 'checkins/show'
    elsif current_user
      redirect_to user_path(current_user)
    else
      redirect_to :root
    end
  end

  # GET /checkins/new
  def new
    @checkin = Checkin.new
    @questions = Question.all
    @options = Option.all
  end

  # GET /checkins/1/edit
  def edit
  end

  # POST /checkins
  # POST /checkins.json
  def create

    begin
      Checkin.transaction do
        @checkin = Checkin.new(user_id: current_user.id)
        params[:question].each do |question_id, option_id|
          if option_id.to_i == 0
            flash[:errors] = "Oh no! You forgot to select an answer for one or more questions :("
              @questions = Question.all
              @options = Option.all
              redirect_to new_checkin_path
              return
            else
              Answer.create(question_id: question_id, value: Option.find(option_id.to_i).value, option_id: option_id.to_i, user_id: current_user.id, checkin_id: @checkin.id)
            end
            @checkin.save
          end
          @comment = Comment.create(user_id: current_user.id, checkin_id: @checkin.id, comment: params[:comment])
        end
        redirect_to user_path(current_user)
      rescue ActiveRecord::RecordInvalid => invalid
      end
    end

  # PATCH/PUT /checkins/1
  # PATCH/PUT /checkins/1.json
  def update
    respond_to do |format|
      if @checkin.update(checkin_params)
        format.html { redirect_to @checkin, notice: 'Checkin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @checkin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkins/1
  # DELETE /checkins/1.json
  def destroy
    @checkin.destroy
    respond_to do |format|
      format.html { redirect_to checkins_url }
      format.json { head :no_content }
    end
  end

  def respect
    respond_to do |format|
      format.html
      format.js
    end
  end

  def integrity
    respond_to do |format|
      format.html
      format.js
    end
  end

  def perseverance
    respond_to do |format|
      format.html
      format.js
    end
  end

  def passion
    respond_to do |format|
      format.html
      format.js
    end
  end

  def empowerment
    respond_to do |format|
      format.html
      format.js
    end
  end

  def team
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkin
      @checkin = Checkin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checkin_params
      params[:checkin].require(:questions)
    end
  end
