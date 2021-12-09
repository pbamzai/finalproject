Rails.application.routes.draw do

  get("/", { :controller => "home", :action => "index"})

  # Routes for the Group event resource:

  # CREATE
  post("/insert_group_event", { :controller => "group_events", :action => "create" })
          
  # READ
  get("/group_events", { :controller => "group_events", :action => "index" })
  
  get("/group_events/:path_id", { :controller => "group_events", :action => "show" })
  
  # UPDATE
  
  post("/modify_group_event/:path_id", { :controller => "group_events", :action => "update" })
  
  # DELETE
  get("/delete_group_event/:path_id", { :controller => "group_events", :action => "destroy" })

  #------------------------------

  # Routes for the User group resource:

  # CREATE
  post("/insert_user_group", { :controller => "user_groups", :action => "create" })
          
  # READ
  get("/user_groups", { :controller => "user_groups", :action => "index" })
  
  get("/user_groups/:path_id", { :controller => "user_groups", :action => "show" })
  
  # UPDATE
  
  post("/modify_user_group/:path_id", { :controller => "user_groups", :action => "update" })
  
  # DELETE
  get("/delete_user_group/:path_id", { :controller => "user_groups", :action => "destroy" })

  #------------------------------

  # Routes for the Group resource:

  # CREATE
  post("/insert_group", { :controller => "groups", :action => "create" })
          
  # READ
  get("/groups", { :controller => "groups", :action => "index" })
  
  get("/groups/:path_id", { :controller => "groups", :action => "show" })
  
  # UPDATE
  
  post("/modify_group/:path_id", { :controller => "groups", :action => "update" })
  
  # DELETE
  get("/delete_group/:path_id", { :controller => "groups", :action => "destroy" })

  #------------------------------

  # Routes for the Attendee resource:

  # CREATE
  post("/insert_attendee", { :controller => "attendees", :action => "create" })
          
  # READ
  get("/attendees", { :controller => "attendees", :action => "index" })
  
  get("/attendees/:path_id", { :controller => "attendees", :action => "show" })
  
  # UPDATE
  
  post("/modify_attendee/:path_id", { :controller => "attendees", :action => "update" })
  
  # DELETE
  get("/delete_attendee/:path_id", { :controller => "attendees", :action => "destroy" })

  #------------------------------

  # Routes for the Event resource:

  # CREATE
  post("/insert_event", { :controller => "events", :action => "create" })
          
  # READ
  get("/events", { :controller => "events", :action => "index" })
  
  get("/events/:path_id", { :controller => "events", :action => "show" })
  
  # UPDATE
  
  post("/modify_event/:path_id", { :controller => "events", :action => "update" })
  
  # DELETE
  get("/delete_event/:path_id", { :controller => "events", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
