# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tmp-app_session',
  :secret      => '9ef93e28d1509fff426cbb89d0d2a760a5fd05097bf5417b5bb8cf51afc09edd21851fc0e72a4d3623fec983c879d0a649fa98ed5d8aacdc84ab79c5a1e68ab4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
