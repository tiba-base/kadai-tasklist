class TasksController < ApplicationController
    before_action :require_user_logged_in, only: [:index, :show, :new, :edit]
    before_action :correct_user, only: [:show, :edit, :update, :destroy]
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    def index
        if logged_in?
         @tasks = current_user.tasks
        end
    end
    
    def show
        
    end
    
    def new
        @task = Task.new
    end
    
    def create
         @task = current_user.tasks.new(message_params)
         if @task.save
            flash[:success] = 'タスクが追加されました'
            redirect_to root_url
         else
            @tasks = current_user.tasks
            flash.now[:danger] = 'タスクが追加されませんでした'
            render :new
         end
    end
    
    def edit

    end
    
    def update
        if @task.update(message_params)
           flash[:success] = 'タスクは正常に更新されました'
           redirect_to root_url
        else 
           flash.now[:danger] = 'タスクは更新されませんでした'
           render :edit
        end
    end
    
    def destroy
        @task.destroy
        
        flash[:success] = 'タスクは正常に削除されました'
        redirect_to root_url
    end

private
    def correct_user
        @task = current_user.tasks.find_by(id: params[:id])
        unless @task
         redirect_to root_url
        end
    end
    
    def set_task
        @task = Task.find(params[:id])
    end
#Storong Parameter
    def message_params
        params.require(:task).permit(:content, :status)
    end
end