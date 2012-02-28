
class Tenant < ActiveRecord::Base
  after_create :prepare_tenant

  private

  def prepare_tenant

  end

  

end

