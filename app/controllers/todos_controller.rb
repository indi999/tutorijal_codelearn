class TodosController < ApplicationController
  def index
    @todo_items = Todo.all
    render :index, :layaut => :aplication
  end
  
  def delete
    @todo_items = Todo.last.delete
  end
  
  def add
    todo = Todo.create(:todo_item => params[:todo_text])
  if !todo.valid?
        flash[:error] = todo.errors.full_messages.join("<br>").html_safe
   end
    redirect_to :action => 'index'
  end
  
end
