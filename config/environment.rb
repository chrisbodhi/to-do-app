# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
ToDoApp::Application.initialize!

# ActionMailer::Base.delivery_method = :letter_opener
# ActionMailer::Base.perform_deliveries = true
# ActionMailer::Base.raise_delivery_errors = true