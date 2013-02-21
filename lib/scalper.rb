require "scalper/version"
require "scalper/github"
require "typhoeus"

module Scalper
  def self.parse(url)
    Scalper::Github.parse(url)
  end
end
