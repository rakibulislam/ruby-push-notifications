#!/usr/bin/env ruby

$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'ruby-push-notifications'

tokens = [
  'First token here',
  'Second token here'
]

notification = RubyPushNotifications::APNS::APNSNotification.new tokens, { aps: { alert: 'Hello APNS World!', sound: 'true', badge: 1 } }

pusher = RubyPushNotifications::APNS::APNSPusher.new(File.read('/path/to/your/apps/certificate.pem'), true)
pusher.push [notification]
p notification.results
