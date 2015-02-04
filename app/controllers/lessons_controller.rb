class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  # GET /lessons
  def index
    @lessons = Lesson.all
  end

  # GET /lessons/1
  def show
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
    @lesson.images.build
  end

  # GET /lessons/1/edit
  def edit
    @lesson.images.build
  end

  # POST /lessons
  def create
    @lesson = Lesson.new(lesson_params)

    if @lesson.save
      questions_ids = params[:lesson][:questions]
      Question.where(id: questions_ids).update_all(lesson_id: @lesson.id)
      redirect_to @lesson, notice: 'Урок успешно создан.'
    else
      @lesson.images.build if @lesson.images.empty?
      render :new
    end
  end

  # PATCH/PUT /lessons/1
  def update
    if @lesson.update(lesson_params)
      questions_ids = params[:questions]
      Question.where(id: questions_ids).update_all(lesson_id: @lesson.id)
      redirect_to @lesson, notice: 'Урок успешно отредактирован.'
    else
      render :edit
    end
  end

  # DELETE /lessons/1
  def destroy
    @lesson.destroy
    redirect_to lessons_url, notice: 'Урок успешно удален.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lesson_params
      params.require(:lesson).permit(:name, :description, :questions,
        images_attributes: [:id, :file, :_destroy])
    end
end
