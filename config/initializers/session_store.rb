# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_calendar_engine_session',
  :secret      => '59d5bbe18dde8e7d989a7c95951ac46a269093d38deed0745bad2dc1e3b2c8cf7fe4693130e863e0f2fae3ea2adb4947f4be63d6064a5e9fc821b5e4c33950ea'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
