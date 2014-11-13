class UsersController < ApplicationController
  
  def add
	  @names = params[:names]
	  @email = params[:email]
    
    if(@names != '' and @email != '' and params[:names] and params[:email])    
      new_user = User.new
      new_user.names = @names
      new_user.email = @email
      new_user.save
    end
    
  end
  
  def list
    @users = User.all
  end
  
  def edit
    
    if(params[:opt])
      
      if(params[:opt] == 'search')
        @id = params[:id]
        @usr = User.find_by(id: @id)
      end
      
      if(params[:opt] == 'update')
        @names = params[:names]
        @email = params[:email]
        @id = params[:id]
        usr = User.find_by(id: @id)
        usr.update(names: @names, email: @email)
      end
        
    end
   
  end
  
  
  def delete
    if(params[:id] != nil)
      @id = params[:id]
      single_user = User.find_by(id: @id)
      single_user.destroy
    end
  end
  
end
