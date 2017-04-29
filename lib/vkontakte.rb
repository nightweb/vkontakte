# frozen_string_literal: true

require 'json'
require 'net/http'
require 'mechanize'

require 'vkontakte/version'
require 'vkontakte/client'
require 'vkontakte/api'
require 'vkontakte/api_error'
require 'vkontakte/ask_for_credentials'

module Vkontakte
  API_VERSION = '5.63'
end
