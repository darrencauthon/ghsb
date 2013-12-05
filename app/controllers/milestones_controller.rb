class MilestonesController < ApplicationController
  include ActionView::Helpers::DateHelper

  before_filter { @panel_type = 'table' }

  def index
    @milestones = Milestone.for params
    @show_due_column = @milestones.select { |m| m.due_on }.any?

    @panic_table = PanicBoardData::Table.new convert_milestones_to_panic_records(@milestones)
  end

  private

  def convert_milestones_to_panic_records milestones
    milestones.map do |milestone|

      progress = milestone.closed_issues.to_f / (milestone.closed_issues + milestone.open_issues)
      progress = (progress * 8).to_i

      due = milestone.due_on ? time_ago_in_words(milestone.due_on) : ''

      [milestone.title, due, progress_bar_to(progress)]

    end
  end

end
