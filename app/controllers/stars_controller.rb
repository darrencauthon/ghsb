class StarsController < ApplicationController

  before_filter { @panel_type = 'diy' }

  def index
    @stars = Star.count_for params

    label = "#{ params[:repo] } Stars"

    @widget = PanicBoardData::SingleValue.new label, @stars
  end

end
