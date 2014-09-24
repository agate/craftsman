# you need to implement your own Package class
# which is extended from "Craftsman::Package"
class Craftsman::Package
  def initialize(id)
    @id = id
  end

  # return: content of target(file)
  def get(target)
    raise 'needs to be implemented'
  end

  # return: string array of targets(files)
  #         in this package
  def targets
    raise 'needs to be implemented'
  end
end
