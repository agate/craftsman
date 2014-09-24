require File.expand_path('../spec_helper', __FILE__)

describe Craftsman do
  it "can paint correctly" do
    output = Craftsman.paint(CustomPackage, 'package_a')
    expect(output).to eq(<<OUTPUT)
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
  end
end
