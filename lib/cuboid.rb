
class Cuboid
  attr_accessor :x, :y, :z
  attr_reader :length, :width, :height

  def initialize(x , y, z, length, width, height)
    # todo: refactor to use hash as configuration for intialization
    @x = x
    @y = y
    @z = z
    @length = length
    @width = width
    @height = height
  end

  #BEGIN public methods that should be your starting point

  def move_to!(x, y, z)
    @x = x
    @y = y
    @z = z
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
    # add length, width, and height to origin points (x,y,z) to find diagonal vertex
    # add length to origin, add width to origin, add height to origin
    # total will be vertices (3 of them)
    # repeat process with new 3 vertices to find 2 new vertices
    # repeat process to find final vertex
    origin = [@x, @y, @z] # bottom, left, front
    diagonal_vertex = [@x + @width, @y + @height, @z + @length] # top, right, back

    b = [@x + @width, @y, @z] # bottom, right, front
    c = [@x, @y, @z + @length] # bottom, left, back
    d = [@x, @y + @height, @z] # top, left, front
    e = [@x, @y + @height, @z + @length] # top, left, back
    f = [@x + @width + @y + height , @z] #top, right, front
    g = [@x + @width, @y, @z + @length] # bottom, right, back

    known_vertices = [origin, b, c, d, e, f, g, diagonal_vertex]
    p known_vertices.uniq == known_vertices
    puts "known_vertices are #{known_vertices}"
  end

  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other)
  end

  #END public methods that should be your starting point
end

c = Cuboid.new(0, 0, 0, 2, 3, 4)
c.vertices
