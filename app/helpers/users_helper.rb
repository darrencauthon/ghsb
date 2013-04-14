module UsersHelper

  def gravatar_for id
    default = 'https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png'
    "https://secure.gravatar.com/avatar/#{ id }?s=30&d=#{ default }"
  end

end
