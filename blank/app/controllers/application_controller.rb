


class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :handle_subdomain

 
  
  def handle_subdomain
     
  	@tenant = Tenant.find_by_subdomain(request.subdomain)
  	
  end

 

end

