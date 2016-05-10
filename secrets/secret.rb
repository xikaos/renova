require "json"

class Secret
  attr_accessor :name, :password

  def initialize name, pass
    @name = name
    @password = pass
  end

  def json
    {name: @name, password: @password}.to_json
  end

end

