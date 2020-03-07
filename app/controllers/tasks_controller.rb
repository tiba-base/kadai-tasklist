class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    
    def index
        @tasks = Task.all
    end
    
    def show
    end
    
    def new
        @task = Task.new
    end
    
    def create
         @task = Task.new
        if @task.save
            flash[:success] = 'タスクが追加されました'
            redirect_to @task
        else
            flash.now[:danger] = 'タスクが追加されませんでした'
            render :new
        end
    end
    
    def edit
    end
    
    def update
        
        if @task.update(message_params)
           flash[:success] = 'タスクは正常に更新されました'
           redirect_to @task
        else 
           flash.now[:danger] = 'タスクは更新されませんでした'
           render :edit
        end
    end
    
    def destroy
        @task.destroy
        
        flash[:success] = 'タスクは正常に削除されました'
        redirect_to tasks_url
    end

private
    
    def set_task
        @task =  @task = Task.find(params[:id])
    end
#Storong Parameter
    def message_params
        params.require(:task).permit(:content)
    end
end