Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index"})

  get("/users", { :controller => "users", :action => "index"})
  get("/users/:path_username", { :controller => "users", :action => "show"})
  get("/add_user", { :controller => "users", :action => "add"})
  get("/update_user/:username", { :controller => "users", :action => "update"})

  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:path_id", { :controller => "photos", :action => "show"})

  get("/delete_photo/:path_id", { :controller => "photos", :action => "delete"})

  get("/insert_photo", { :controller => "photos", :action => "insert"})
  get("/update_photo/:modify_id", { :controller => "photos", :action => "update"})
end
