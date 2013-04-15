module ApplicationHelper

  def fork_me
    return nil if Rails.env.test?
    img = image_tag 'https://s3.amazonaws.com/github/ribbons/forkme_right_red_aa0000.png', class: 'fork-me'
    link_to img, 'https://github.com/BM5k/ghsb'
  end

end
