class IssuesController < ApplicationController

  def index
    @issues = Issue.for params
    @panel_type = 'table'
  end

end
