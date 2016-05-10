require 'capybara/poltergeist'
require 'json'
require 'yaml'

def setup
Capybara.default_driver = :selenium   
@session = Capybara::Session.new(:selenium)
@users = Array.new
end

def loadUsers path 
  File.open(path).each do |usr|
    @users << JSON.parse(usr)
  end
end

def books_number
  ((@session.document.find_css('.c1 > table:nth-child(1) > tbody:nth-child(1)').first.all_text.split("•").length) -1)
end

def dumb_click
  button_id = "#botao_renovar{index}"
  @session.document.find_xpath('//*[@id="botao_renovar1"]/center/input').first.click
end


def login user
  @session.visit('http://www.biblioteca.asav.org.br/biblioteca_s/php/login_usu.php?flag=index.php')
  @session.fill_in('id_login', with: user['name'])
  @session.fill_in('id_senhaLogin', with: user['password'])
  @session.click_button('button')
  if @session.current_path != "/biblioteca_s/meu_pergamum/index.php"
    puts "Login incorreto: Usuário #{user} ou respectiva senha estão incorretos."
    end
end


def come_back
  @session.click_on('btn_gravar4')
end

setup
loadUsers('secrets/secrets.json')
login @users.first 
books_number.times {|i| dumb_click; come_back; }
puts 'end'


