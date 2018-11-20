# Renova
------

## Docker - Coming soon!

O PROEJTO UTILIZA PhantomJS como Webdriver: https://github.com/ariya/phantomjs

Renove seus livros da Unisinos executando um script Ruby!
É necessário que o interpretador Ruby em uma versão posterior à 1.9 esteja instalado na máquina .

## Justificativa


Sinceramente, a tarefa de renovar livros da biblioteca dispende do meu tempo e da minha energia. A interface gráfica no qual é a única forma de faze-lo é despreźível.
Muitas vezes deixei de pegar livros por esquecer de devolver e pagar multa ou por não querer ficar renovando, CHEGA!

O objetivo não é indisponibilizar os exemplares, e sim prover o tempo necessário que o aluno necessita pra ler um livro sem ter que se estressar com renovação.

## Instruções
Com o Ruby instalado, instale a gem **Bundler**
```
gem install bundler
```


Instale as dependências do script rodando um bundle install
```
bundle install
```

Instaladas as dependências, execute o script pra salvar o login do usuário do MinhaUnisinos que irá renovar os livros:
```
ruby secrets/login_generate.rb
```

Informe ao script o usuário e a senha do MinhaUnisinos, os dados serão salvos em um JSON em texto claro.

Execute o script de renovação. 
```
ruby main.rb
```


