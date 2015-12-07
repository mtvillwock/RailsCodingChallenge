require 'cuboid'

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
      original_origin = Point.new(x: 2, y: 2, z: 2)
      moving_cuboid = Cuboid.new(origin: original_origin, length: 2, height: 2, width: 2)
      moving_cuboid.move_to!(1,2,3)
      expect(moving_cuboid.origin.x).to be 1
      expect(moving_cuboid.origin.y).to be 2
      expect(moving_cuboid.origin.z).to be 3
    end
  end

  describe "#contains?" do
    above = Point.new(x: 4, y: 6, z: 4)
    below = Point.new(x: 4, y: -2, z: 4)
    left = Point.new(x: -2, y: 4, z: 4)
    right = Point.new(x: 6, y: 4, z: 4)
    in_front = Point.new(x: 0, y: 0, z: 0)
    behind = Point.new(x: 5, y: 5, z: 5)
    inside = Point.new(x: 2, y: 2, z: 2)
    it "returns false if the point is to the left or right of the cuboid" do
      expect(subject.contains?(left)).to be false
      expect(subject.contains?(right)).to be false
    end
    it "returns false if point is lower or higher than the cuboid" do
      expect(subject.contains?(above)).to be false
      expect(subject.contains?(below)).to be false
    end
    it "returns false if the point is behind or in front of the cuboid" do
      expect(subject.contains?(in_front)).to be false
      expect(subject.contains?(behind)).to be false
    end
    it "returns true if the point is inside the cuboid" do
      expect(subject.contains?(inside)).to be true
    end
  end

  describe "#touches?" do
    top = Point.new(x: 5, y: 4, z: 5)
    bottom = Point.new(x: 5, y: 1, z: 5)
    left = Point.new(x: 1, y: 5, z: 5)
    right = Point.new(x: 4, y: 5, z: 5)
    front = Point.new(x: 5, y: 5, z: 1)
    back = Point.new(x: 5, y: 5, z: 4)
    inside = Point.new(x: 2, y: 2, z: 2)
    it "returns true if the point is touching the cuboid" do
      expect(subject.touches?(top)).to be true
      expect(subject.touches?(bottom)).to be true
      expect(subject.touches?(left)).to be true
      expect(subject.touches?(right)).to be true
      expect(subject.touches?(front)).to be true
      expect(subject.touches?(back)).to be true
    end

    it "returns false if the point is not touching the cuboid" do
      expect(subject.touches?(inside)).to be false
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
