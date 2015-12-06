
class Cuboid
  attr_accessor :x, :y, :z
  attr_reader :length, :width, :height

  def initialize(args)
    # Origin Vertex
    @x = args[:x] || 0
    @y = args[:y] || 0
    @z = args[:z] || 0
    # Dimensions of Cuboid
    @length = args[:length]
    @width = args[:width]
    @height = args[:height]
  end

  #BEGIN public methods that should be your starting point

  def move_to!(x, y, z)
    @x = x
    @y = y
    @z = z
    [@x, @y, @z]
  end

  def vertices
    origin = [@x, @y, @z] # bottom, left, front
    diagonal_vertex = [@x + @width, @y + @height, @z + @length] # top, right, back

    b = [@x + @width, @y, @z] # bottom, right, front
    c = [@x, @y, @z + @length] # bottom, left, back
    d = [@x, @y + @height, @z] # top, left, front
    e = [@x, @y + @height, @z + @length] # top, left, back
    f = [@x + @width + @y + height , @z] #top, right, front
    g = [@x + @width, @y, @z + @length] # bottom, right, back

    known_vertices = [origin, b, c, d, e, f, g, diagonal_vertex]
  end

  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other_cuboid)
    # given vertices of two cuboids, compare the distance between each pair of points
    # if any of the distances are negative, return true
    # else return false
    current_vertices = self.vertices
    other_cuboid.vertices.each do |other_vertex|
      # if x, y, and z value is greater than origin vertex and less than diagonal vertex
      if other_vertex[0] > current_vertices[0][0] && other_vertex[0] < current_vertices[-1][0] &&
          other_vertex[1] > current_vertices[0][1] && other_vertex[1] < current_vertices[-1][1] &&
          other_vertex[2] > current_vertices[0][2] && other_vertex[2] < current_vertices[-1][2]
        return true
      end
    end
    return false
  end

  #END public methods that should be your starting point
end