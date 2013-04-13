module PermissionsMatcher

  RSpec::Matchers.define :allow_access do

    include Rails.application.routes.url_helpers

    chain(:to) { |who| @who = who }

    def login_and_visit
      login_as send(@who) unless @who == :guest
      visit path
    end

    def role
      @who ? @who : :guest
    end

    def helper_from path
      begin
        hash = Rails.application.routes.recognize_path path
        "#{ hash[:controller] }##{ hash[:action] }"
      rescue
        path
      end
    end

    match_for_should     { login_and_visit ; current_path == path }
    match_for_should_not { login_and_visit ; current_path != path }

    description do
      "allow #{ role.inspect } to access #{ helper_from path }"
    end

    failure_message_for_should do
      "#{ role.inspect } should be able to access #{ helper_from path }"
    end

    failure_message_for_should_not do
      "#{ role.inspect } should not be able to access #{ helper_from path }"
    end

  end

end
