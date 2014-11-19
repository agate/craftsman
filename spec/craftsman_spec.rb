require File.expand_path('../spec_helper', __FILE__)

describe Craftsman do
  EXPECT_OUTPUT = <<OUTPUT
///////////// helpers/main.rb /////////////
:ruby
  def display_date
    Time.now.strftime("%Y-%m-%d")
  end

///////////// javascripts/foo.js /////////////
- content_for :javascripts do
  :javascript
    var foo = 'hello';


///////////// javascripts/bar.coffee /////////////
- content_for :javascripts do
  :coffee
    console.log foo


///////////// stylesheets/foo.sass /////////////
:sass
  table
    td:hover
      background-color: green


///////////// stylesheets/pre.blank.characters.sass /////////////
:sass
  body
    background-color: red


= display_date

%table
  %thead
    %tr
      %th Key
      %th Value
  %tbody
    %tr
      %td a
      %td 1
    %tr
      %td b
      %td 2
    %tr
      %td c
      %td 3
OUTPUT

  it "can paint correctly with custom package class and package id" do
    output = Craftsman.paint(CustomPackage, 'package_a')
    expect(output).to eq(EXPECT_OUTPUT)
  end

  it "can paint correctly with custom package instance" do
    package = CustomPackage.new('package_a')
    output = Craftsman.paint(package)
    expect(output).to eq(EXPECT_OUTPUT)
  end
end
