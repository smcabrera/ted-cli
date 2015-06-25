require 'httparty'
require 'yaml'

require "ted-cli/version"
require "ted-cli/talk"

module TedCli
  def self.api_key=(key)
    data = {"apikey" => key}
    File.open("conf.yml", "w+") {|f| f.write(data.to_yaml) }
  end

  def self.api_key
    y = YAML::load_file('conf.yml')
    y['apikey']
  rescue
    false
  end
end