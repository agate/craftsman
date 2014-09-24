class Craftsman::Renderer
  def initialize(package)
    @package = package
  end

  def render
    output = @package.get("index.html.haml")

    [
      ::Craftsman::Decorator::Annotation,
      ::Craftsman::Decorator::Helper
    ].each do |klass|
      output = klass.process(@package, output)
    end

    output
  end
end
