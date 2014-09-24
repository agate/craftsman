class CustomPackage < Craftsman::Package
  DIR = File.expand_path('../resources', __FILE__)

  def initialize(id)
    super(id)
    @dir = "#{DIR}/#{@id}"
  end

  def get(target)
    File.read("#{@dir}/#{target}")
  end

  def targets
    Dir["#{@dir}/**/*"].reject do |f|
      File.directory? f
    end.map do |f|
      f.sub("#{@dir}/", '')
    end
  end
end
