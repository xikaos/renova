require_relative "secret"

module LoginGenerate
  def self.generate
    LoginGenerate.write(LoginGenerate::prompt)
  end

  def self.prompt
    puts('MinhaUnisinos User:')
    login = gets.chomp
    puts('MinhaUnisinos Password:') 
    pass = gets.chomp
    Secret.new(login, pass)
  end

  def self.write secret
    require 'pry'; binding.pry;
    f = open("secrets.json", "a") do |line| 
      line << "#{secret.json}\n"
    end
  end

end


LoginGenerate::generate()