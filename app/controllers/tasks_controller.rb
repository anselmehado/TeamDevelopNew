class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index

    if params[:task].present?
      if params[:task][:task_name].present? && params[:task][:status].present?
        @tasks = Task.task_name_fuzzy_search(params[:task][:task_name]).status_search(params[:task][:status])

      elsif params[:task][:task_name].present?
        @tasks = Task.task_name_fuzzy_search(params[:task][:task_name])
      elsif params[:task][:status].present?
        @tasks = Task.status_search(params[:task][:status])
      else
        @tasks = Task.page(params[:page]).per(10)

      end
    elsif params[:sort_by]
      @tasks = Task.order('deadline DESC')
      @tasks = Task.order('task_name').page(params[:page]).per(3)
    elsif params[:sort_priority]
      @tasks = Task.order('priority DESC')
      @tasks = Task.order('task_name').page(params[:page]).per(3)
    else
      Task.order('created_at DESC')
      @tasks = Task.all
      @tasks = Task.order('task_name').page(params[:page]).per(3)

    end
  end



    #users = User.where(name: 'David', occupation: 'Code Artist').order(created_at: :desc)

  # GET /tasks/1 or /tasks/1.json
  def show

  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create

    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end

    end
  end


  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end


#   def search
#   if params[:deadline]
#     @tasks = Task.search(params[:deadline])
#   else
#     @tasks = Task.all
#   end
# end


# class MoviesController < ApplicationController
#   def index
#     @movies = if params[:sort_by] == "title"
#       Movie.order(:title)
#     else
#       Movie.all
#     end
#   end
# end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      #params.require(:task).permit(:name, :content, :deadline, :status)
      params.require(:task).permit(:task_name, :content, :deadline, :status, :task, :priority).merge(status: params[:task][:status].to_i, priority: params[:task][:priority].to_i)
    end
  end
