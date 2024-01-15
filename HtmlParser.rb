class HtmlParser
  def self.parse(body, url, encoding)
    body.encode!('UTF-8', encoding, invalid: :replace, undef: :replace, replace: '')
    Nokogiri::HTML::Document.parse(body, url, 'UTF-8')
  end
end