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
    @checkin = Checkin.find(params[:id])
    @answers = @checkin.answers
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
    checkin = Checkin.create(user_id: current_user.id)
    params[:question].each do |question_id, option_id|
      Answer.create(question_id: question_id, option_id: option_id, user_id: current_user.id, checkin_id: checkin.id)
    end
    redirect_to user_path(current_user)
    # @checkin = Checkin.new(checkin_params)

    # respond_to do |format|
    #   if @checkin.save
    #     format.html { redirect_to @checkin, notice: 'Checkin was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @checkin }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @checkin.errors, status: :unprocessable_entity }
    #   end
    # end
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkin
      @checkin = Checkin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checkin_params
      params[:checkin]
    end
end
