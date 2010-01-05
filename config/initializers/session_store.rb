# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_stonepath_test_session',
  :secret      => '68fdf7229751e50d0adb4d3b38f6584755c81cc210403bbe0fd7778ebcd20c29670669c64f51ae097877ff5efd3b4bd32015e3e43a8806d22463364e6676e1c0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
