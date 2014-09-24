module Craftsman::Decorator
  class Annotation < Base
    REGEX = /^\/\/@require\s+(.*)\s*$/

    def process(content)
      content.gsub(REGEX) do |m|
        target = m.match(REGEX)[1]
        build_filter(target)
      end
    end
  end
end
