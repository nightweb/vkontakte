require 'bundler'
Bundler.setup :default

require 'byebug'
require 'vkontakte'

puts Vkontakte::VERSION

if __FILE__ == $0
  CLIENT_ID = '5987497'

  email = ARGV[0]
  pass  = ARGV[1]

  vk = Vkontakte::Client.new(CLIENT_ID)
  vk.login!(email, pass, permissions: 'friends')

  info = vk.api.account_getInfo

  # https://vk.com/dev/friends.get
  friends = vk.api.friends_get(fields: 'online,last_seen')['items']
  friends.each do |f|
    deactivated = f['deactivated'] == 'banned' ? true : false
    if deactivated
      puts "Delete user with id `#{f['id']}`"
      res = vk.api.friends_delete(user_id: f['id'])
    end
  end
end