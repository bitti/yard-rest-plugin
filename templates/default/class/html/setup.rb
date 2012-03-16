def method_details_list
  @meths = object.meths(:inherited => false, :included => false)
  @meths = index_objects(@meths)
  erb(:method_details_list)
end
