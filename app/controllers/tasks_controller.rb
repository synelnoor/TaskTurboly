class TasksController < ApplicationController
    #has_scope :today, type: :boolean
    #has_scope :week, type: :boolean
    #has_scope :month, type: :boolean

    def index
        @task = Task.where("user_id =?", current_user.id).or(Task.where("created_by =?" , current_user.id )).order(due_date: :asc)
        @task = @task.today() if params[:today].present?
        @task = @task.week() if params[:week].present?
        @task = @task.month() if params[:month].present?
        @task = @task.status(params[:status]) if params[:status].present?
        @task = @task.priority(params[:priority]) if params[:priority].present?
        @task = @task.due_date(params[:due_date]) if params[:due_date].present?
        @task = @task.starts_with(params[:starts_with]) if params[:starts_with].present?
       
        
    end
   
    def new
        @task = Task.new
        @user = User.all
       
    end

    def create
        @task = Task.new(task_params)
        @task.created_by =  current_user.id
        
        @task.save
        redirect_to @task
    end

    def show
        @task = Task.find(params[:id]) 
    end

    def edit
        @task =  Task.find(params[:id]) 
        @user = User.all
    end

    def confirm
        @task =  Task.find(params[:id]) 
        @user = User.all
    end

    def update
        @task = Task.find(params[:id])
        
         @task.update(task_params)
         redirect_to @task
        
    end

    def destroy
        @task =  Task.find(params[:id])
        @task.destroy
    end

    
    

    private
    def task_params
        params.require(:task).permit(:name, :description, :status, :priority, :created_date, :due_date, :user_id,:created_by )
    end

end
