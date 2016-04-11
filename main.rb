require 'capybara/poltergeist'
require 'json'

def setup
Capybara.default_driver = :poltergeist
@session = Capybara::Session.new(:poltergeist)
@users = Array.new
end

def loadUsers path 
  File.open(path).each do |usr|
    @users << JSON.parse(usr)  
  end
end


def login user
  @session.visit('http://www.biblioteca.asav.org.br/biblioteca_s/php/login_usu.php?flag=index.php')
  @session.fill_in('id_login', with: user['name'])
  @session.fill_in('id_senhaLogin', with: user['senha'])
  @session.click_button('button')
end

def check_books
  @Session
end


def come_back
end

setup
loadUsers('secrets/secrets.json')
require 'pry'; binding.pry;
puts ""
