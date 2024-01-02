# config.ru

# Carrega as configurações da aplicação a partir de init.rb
require_relative 'init'

# Executa o aplicativo Rack
run Sinatra::Application
