class DemoController < ApplicationController

  #layout is by default set to 'application' but you can set it to false
  layout 'application' 

  def index
    @array = [1,2,3,4,5]
  end
  
  def hello
  end

  def other_hello
    redirect_to(:controller => 'demo', :action =>'hello')
  end

  def google
    redirect_to('https://google.com')
  end

  def escape_output
    
  end

end
