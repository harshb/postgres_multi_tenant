module PgTools
  extend self
    def schemas
    sql = "SELECT nspname FROM pg_namespace WHERE nspname !~ '^pg_.*'"
    ActiveRecord::Base.connection.query(sql).flatten
  end
end


class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :handle_subdomain

 
  
  def handle_subdomain
     
  	@tenant = Tenant.find_by_subdomain(request.subdomain)
	  	if @tenant.nil?
	      		
	          Apartment::Database.switch
	    else
	     	Apartment::Database.switch(request.subdomain)
	       
	    end
		
  end

 

end

