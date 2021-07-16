class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # # GET /tasks or /tasks.json
  def index
    @tasks = Task.all.order(created_at: :desc)

    @tasks = if params[:sort_by] == "deadline"
        Task.order(:deadline)
      else
        Task.all
      end
    end
  #
  #   #users = User.where(name: 'David', occupation: 'Code Artist').order(created_at: :desc)
  # end

  def index
    #Use params sort_expired + deadline property
    #to create tri ystem
    if params[:sort_expired] == "true"
      @task = Task.all.order(deadline: :asc).page params[:page]
      #It's date, there a choose order by asc (Old date)
    #Define Pirority, order by desc
    elsif params[:sort_priority]
      #Define function to sort by priority, there i choose order by asc (High => Middle => low)
      @task = Task.all.order(priority: :asc).page params[:page]
    elsif params[:name].blank? && params[:status]
      #This function checks if the name field is empty,
      #then checks if the status field contains a value.
      if params[:status] == ""
        flash[:danger] =  "No data found"
        redirect_to tasks_path
      else
        @task = Task.where(status: params[:status]).page params[:page]
      end
    elsif params[:name] && params[:status].blank?
      #This function checks if the status field is empty,
      #then checks if the name field contains a value.
      @task = Task.where(name: params[:name]).page params[:page]
    elsif params[:name] && params[:status]
      #This function controls whether the name and status fields contain values
      @task = Task.where(name: params[:name]).where(status: params[:status]).page params[:page]
    else
      #@task = Task.all.order(created_at: :desc).page params[:page]
    end
  end
  #



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


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :content, :deadline, :status)
    end
end
