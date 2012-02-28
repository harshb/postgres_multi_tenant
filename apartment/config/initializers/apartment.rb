Apartment.configure do |config|
  # set your options (described below) here
  #config.excluded_models = ["tenant"]        # these models will not be multi-tenanted, but remain in the global 
  config.excluded_models = ["Tenant"] 
end