#!/usr/bin/ruby
require 'json'
require 'net/https'

output = {
  "variable" => {
    "deploy_ssh_pubkey" => {
      "description" => "The Deployment ssh pub key",
      "default" => IO.read(File.dirname(__FILE__) + '/../id_rsa.pub').chomp
    },
    "etcd_discovery_uri" => {
      "description" => "An etcd cluster discovery token",
      "default" => IO.read(File.dirname(__FILE__) + '/../etcd_discovery_uri').chomp
    },
    "admin_iprange" => {
      "description" => "The IP range to lock administration down to",
      "default" => IO.read(File.dirname(__FILE__) + '/../admin_iprange.txt').chomp
    }
  }
}

puts JSON.pretty_generate(output)
