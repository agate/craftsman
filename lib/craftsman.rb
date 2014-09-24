require "craftsman/version"

module Craftsman
  def self.paint(package_class, package_id)
    package = package_class.new(package_id)
    Renderer.new(package).render
  end
end

require "craftsman/package"
require "craftsman/renderer"
require "craftsman/decorator/base"
require "craftsman/decorator/helper"
require "craftsman/decorator/annotation"
