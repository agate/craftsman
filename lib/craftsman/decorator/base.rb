module Craftsman::Decorator
  class Base
    FILTER_EXT_MAPPING = {
      'js' => 'javascript',
      'rb' => 'ruby',
      'md' => 'markdown',
    }

    def initialize(package)
      @package = package
    end

    def process(content)
      raise 'need be implemented'
    end

    def self.process(package, content)
      self.new(package).process(content)
    end

    private

    def build_filter(target)
      target_ext = target.match(/([^.]+)$/)[1]
      filter_name = FILTER_EXT_MAPPING[target_ext] || target_ext

      target_content = @package.get(target)

      filter = <<FILTER.strip
:#{filter_name}
#{append_indent(target_content.lstrip)}
FILTER

      if ['js', 'coffee'].include? target_ext
        filter = <<FILTER.strip
- content_for :javascripts do
#{append_indent(filter)}
FILTER
      end

      <<FILTER
///////////// #{target} /////////////
#{filter}

FILTER
    end

    def append_indent(str)
      str.lines.map do |l|
        "  #{l}"
      end.join
    end
  end
end
