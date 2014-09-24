module Craftsman::Decorator
  class Helper < Base
    def process(content)
      helper_targets.map do |t|
        build_filter t
      end.join + content
    end

    private

    def helper_targets
      @package.targets.select do |t|
        t.match(/^helpers\/.*rb$/)
      end
    end
  end
end
