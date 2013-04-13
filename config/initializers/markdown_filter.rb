class SyntaxRenderer < Redcarpet::Render::HTML

  def block_code code, language
      "<pre><code>#{ code }</code></pre>"
  end

end

module Haml::Filters

  remove_filter 'Markdown' #remove the existing Markdown filter

  module Markdown

    include Haml::Filters::Base

    def render text
      renderer = SyntaxRenderer.new optionize([ :with_toc_data, :xhtml ])

      markdown = Redcarpet::Markdown.new renderer, optionize([
        :autolink,
        :fenced_code_blocks,
        :no_intra_emphasis,
        :space_after_headers,
        :strikethrough,
        :tables
      ])

       markdown.render text
    end

  private

    def optionize options
      options.each_with_object({}) { |option, memo| memo[option] = true }
    end

  end

end
