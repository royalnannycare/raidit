require 'unit/test_helper'
require 'models/guild'
require 'models/user'

describe Guild do

  it "is an entity" do
    Guild.ancestors.must_include Entity
  end

  it "takes a hash on construction" do
    u = User.new
    g = Guild.new id: 12, name: "Exiled"

    g.id.must_equal 12
    g.name.must_equal "Exiled"
  end
end
