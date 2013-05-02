require "uri"

class Heroku::Plugin

  def initialize(uri)
    if uri =~ URI::regexp
      @uri = uri
    else
      parts = uri.split("/")
      parts.unshift "heroku" if parts.length == 1
      @uri = "https://github.com/#{parts.join("/")}.git"
    end
    guess_name(@uri)
  end

end
