require 'cuboid'

#This test is incomplete and, in fact, won't even run without errors.
#  Do whatever you need to do to make it work and please add your own test cases for as many
#  methods as you feel need coverage
describe Cuboid do
    origin = Point.new(x: 1, y: 1, z: 1)
    subject = Cuboid.new(origin: origin, length: 3, height: 3, width: 3)

  describe "#initialize" do
    it "assigns a height to the Cuboid" do
      expect(subject.height).to be 3
    end
    it "assigns a width to the Cuboid" do
      expect(subject.width).to be 3
    end
    it "assigns a length to the Cuboid" do
      expect(subject.length).to be 3
    end
    it "assigns an origin to the Cuboid" do
      p subject.origin
      expect(subject.origin).to be_a Point
    end
  end

  describe "#vertices" do
    it "returns an array of the cuboid's vertices" do
      expect(subject.vertices.length).to eq(8)
      expect(subject.vertices.last).to be_a Point
      expect(subject.vertices.last.x).to eq(4)
      expect(subject.vertices.last.y).to eq(4)
      expect(subject.vertices.last.z).to eq(4)
    end
  end

  describe "#move_to" do
    it "changes the origin in the simple happy case" do
      subject.move_to!(1,2,3)
      expect(subject.origin.x).to be 1
      expect(subject.origin.y).to be 2
      expect(subject.origin.z).to be 3
    end
  end

  describe "#intersects?" do
    non_overlapping_origin = Point.new(x: 7, y: 7, z: 7)
    non_overlapping_cube = Cuboid.new(origin: non_overlapping_origin, length: 2, width: 3, height: 4)
    overlapping_origin = Point.new(x: 1, y: 1, z: 1)
    overlapping_cube = Cuboid.new(origin: overlapping_origin, length: 2, width: 3, height: 4)
    it "returns true when there is an overlap" do
      expect(subject.intersects?(overlapping_cube)).to be true
      expect(overlapping_cube.intersects?(subject)).to be true
    end
    it "returns false when there is no overlap" do
      expect(subject.intersects?(non_overlapping_cube)).to be false
    end
  end

end
