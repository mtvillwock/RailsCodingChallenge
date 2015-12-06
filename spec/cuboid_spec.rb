require 'cuboid'

#This test is incomplete and, in fact, won't even run without errors.
#  Do whatever you need to do to make it work and please add your own test cases for as many
#  methods as you feel need coverage
describe Cuboid do

  describe "move_to" do
    subject = Cuboid.new({x: 0, y: 0, z: 0, length: 2, width: 3, height: 4})
    it "changes the origin in the simple happy case" do
      subject.move_to!(1,2,3)
      expect(subject.x).to be 1
      expect(subject.y).to be 2
      expect(subject.z).to be 3
    end
  end

  describe "intersects?" do
    non_overlapping_cube = Cuboid.new({x: 3, y: 3, z: 2, length: 2, width: 3, height: 4})
    overlapping_cube = Cuboid.new({x: 1, y: 1, z: 1, length: 2, width: 3, height: 4})
    subject = Cuboid.new({x: 0, y: 0, z: 0, length: 2, width: 3, height: 4})
    it "returns true when there is an overlap" do
      expect(subject.intersects?(overlapping_cube)).to be true
    end
    it "returns false when there is no overlap" do
      expect(subject.intersects?(non_overlapping_cube)).to be false
    end
  end

end
