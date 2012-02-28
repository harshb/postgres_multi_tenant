
module PgTools
  extend self

  def default_search_path
    @default_search_path ||= %{"$user", public}
  end

  def set_search_path(name, include_public = true)

    path_parts = [name.to_s, ("public" if include_public)].compact

    s = path_parts.join(",")
    

   #hb https://github.com/rails/rails/pull/3232
    ActiveRecord::Base.connection.clear_cache! # HACK: Workaround

    ActiveRecord::Base.connection.schema_search_path = path_parts.join(",")

  end

  def restore_default_search_path
    ActiveRecord::Base.connection.schema_search_path = default_search_path
  end
  
  def create_schema(name)
    sql = %{CREATE SCHEMA "#{name}"}
    ActiveRecord::Base.connection.execute sql
  end

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
  	PgTools.set_search_path @tenant.id
      #if @tenant.nil?
      		
          #PgTools.restore_default_search_path
    	#else
     		#PgTools.set_search_path @tenant.id
        #render :text => @tenant.id
    	#end
  end

 

end

