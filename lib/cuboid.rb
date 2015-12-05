
class Cuboid

  def initialize(x , y, z)
    @x = x
    @y = y
    @z = z
    @length = length
    @width = width
    @height = height
  end

  #BEGIN public methods that should be your starting point

  def move_to!(x, y, z)
  end

  def edges
    # find range between two points in 3D space
    # square root of the sum of the square of each of x1 - x2, y1-y2, z1-z2
    # distance = Math.sqrt(point_a ** 2 + point_b ** 2 + point_c ** 2)
    #
  end

  def vertices
    # given origin (x,y,z) and length, width, and height
    # return 8 vertices (no repeats) (origin -> 3 adjacent -> 2 adjacent -> final)
    # add length, width, and height to origin points (x,y,z)
    # total will be vertices (3 of them)
    # repeat process with new 3 vertices to find 2 new vertices
    # repeat process to find final vertex
  end

  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other)
  end

  #END public methods that should be your starting point
end

c = Cuboid.new(1, 1, 0, 5, 2, 10)

