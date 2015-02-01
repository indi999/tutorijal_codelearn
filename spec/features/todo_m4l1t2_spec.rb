require 'spec_helper'

describe "In shared_todo_app - " do
  before do

    @t1 = Todo.create(todo_item: "Draw Money")
    @t2 = Todo.create(todo_item: "Buy Milk")
    @t3 = Todo.create(todo_item: "Pay bill")
  end


  describe "Adding non-empty todo successfully using form_for - " do

    it "Fill in todo in the text box, click on 'Add todo' button, 
                  the todo should be added successfully and
                  should display message 'Todo added successfully'" do 
      visit '/todos/index'
      fill_in "todo_todo_item", :with => 'Todo filled by input'
      click_on 'Add todo'
      page.should have_selector('li', :text=> 'Todo filled by input' )
      page.should have_selector('div', :text=> /Todo added successfully/i )
    end
    
    it "Click on 'Add todo' button leaving text box blank - todo add fails, failure message 
            'Todo item can\'t be blank' displayed " do 
      visit '/todos/index'
      fill_in "todo_todo_item", :with => ''
      click_on 'Add todo'
      page.should have_selector('div', :text=> 'Todo item can\'t be blank' )
    end

  end


end
