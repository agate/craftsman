require File.expand_path('../spec_helper', __FILE__)

describe :package do
  before :all do
    @package = CustomPackage.new("package_a")
  end

  it "should return all the targets" do
    expect(@package.targets.size).to eq(6)
  end

  it "can get target's content" do
    file = File.expand_path('../resources/package_a/helpers/main.rb', __FILE__)
    content = File.read(file)
    expect(@package.get('helpers/main.rb')).to eq(content)
  end
end
