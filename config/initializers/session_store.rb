# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_openfan_session',
  :secret      => 'cf7ee4f40d1bc3e29f24ddeead63584672ceb7840a3f05db588e34c212bb385d869f43bb2c01e10f0830c9053c3cc8b8dfd7e89a11ebf9f4b58494dfb4e8a372'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
