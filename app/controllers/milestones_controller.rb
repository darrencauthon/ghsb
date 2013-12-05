class MilestonesController < ApplicationController

  def index
    @milestones = Milestone.for params
    @show_due_column = @milestones.select { |m| m.due_on }.any?
  end

end
