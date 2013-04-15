shared_examples 'web view' do |panel_type|

  before do
    visit path
  end

  it 'links to the application css file' do
    should have_css('link[href="/assets/application.css"]', visible: false)
  end

  it 'links to the widget' do
    should have_css("a[href='#{ status_board_url panel_type }']")
  end

end

shared_examples 'widget view' do |panel_type|

  before do
    visit path
  end

  it 'does not link to the application css file' do
    should_not have_css('link[href^="/assets/application.css"]', visible: false)
  end

  it 'does not link to the widget' do
    should_not have_css("a[href='#{ status_board_url panel_type }']")
  end

end

def status_board_url panel_type
  params = %W[
    url=#{ u current_url }.widget
    panel=#{ panel_type }
    sourceDisplayName=#{ u 'Github StatusBoard' }
  ]

  "panicboard://?#{ params.join '&' }"
end
