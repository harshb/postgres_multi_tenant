
class Tenant < ActiveRecord::Base
  after_create :prepare_tenant

  private

  def prepare_tenant
  	@mytenant = Tenant.find(id)

  	Apartment::Database.create (@mytenant.subdomain) unless PgTools.schemas.include? @mytenant.subdomain
	Apartment::Database.switch(@mytenant.subdomain)  
end

  

end

