require 'capybara/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'

# fill_in_fields user_email: 'bob@smith.com'
# fill_in_fields :user, email: 'bob@smith.com'
def fill_in_fields *args
  raise 'Too many arguments!' if args.size > 2
  prefix = args.first.is_a?(Hash) ? '' : "#{ args.shift }_" 
  args.last.each { |field, value| fill_in "#{ prefix }#{ field }", with: value }
end

# check_boxes :user_option_one, :user_option_two
# check_boxes :user, :option_one, :option_two
def check_boxes *args
  prefix = args.first.is_a?(Hash) ? '' : "#{ args.shift }_" 
  args.last.each { |field| check "#{ prefix }#{ field }" }
end

def reload_page
  visit current_path
end

def should_be_on path
  current_path.should == path.split('?').first #ignore query string
end

def should_not_be_on path
  current_path.should_not == path
end
