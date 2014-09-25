require "craftsman/version"

module Craftsman
  def self.paint(package_class_or_instance, package_id=nil)
    package = case package_class_or_instance
              when Craftsman::Package
                package_class_or_instance
              when Class
                package_class_or_instance.new(package_id)
              end

    Renderer.new(package).render
  end
end

require "craftsman/package"
require "craftsman/renderer"
require "craftsman/decorator/base"
require "craftsman/decorator/helper"
require "craftsman/decorator/annotation"
