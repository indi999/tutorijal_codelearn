require 'spec_helper'

describe "In shared_todo_app - " do
  before do

    @t1 = Todo.create(todo_item: "Draw Money")
    @t2 = Todo.create(todo_item: "Buy Milk")
    @t3 = Todo.create(todo_item: "Pay bill")
  end

  
  describe " URL /todos/index - with bootstrap CSS - " do
      it "Should have the <div class=\"row\"> </div> and <h1> Shared Todo App</h1> within the div" do
        visit '/todos/index'
        page.should have_xpath "//div[@class='row']", :text => /Shared Todo App/i

      end

      it "Should have <div class=\"well\"> </div> and <li>[Any todo in todos table]</li> within the div" do
        visit '/todos/index'
        page.should have_xpath "//div[@class='well']", :text => /Buy Milk/i
      end

       it "Should have <a class=\"brand\" href=\"#\"><i class=\"icon-ok\"> </i> Just did it</a> " do
        visit '/todos/index'
        page.should have_xpath "//a[@class='brand']", :text => /Just did it/i
        
      end

      it "Should have <div class=\"navbar\"> </div> and text 'Just did it' inside the div" do
        visit '/todos/index'
        page.should have_xpath "//div[@class='navbar']", :text => /Just did it/i
      end


  end

end
