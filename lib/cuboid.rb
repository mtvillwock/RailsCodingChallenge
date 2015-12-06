
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
    puts "known_vertices are #{known_vertices}"
    known_vertices
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

cuboid_hash = { x: 2, y: 3, z: 4, width: 3, height: 4, length: 5 }
c = Cuboid.new(cuboid_hash)
c.vertices

cuboid_hash2 = { x: 3, y: 1, z: 2, width: 4, height: 2, length: 3 }
c2 = Cuboid.new(cuboid_hash2)
c.vertices

p c.intersects?(c2)

c3 = Cuboid.new({ x: 1, y:1, z: 1, width: 2, height: 2, length: 2})
c4 = Cuboid.new({ x: 2, y:2, z: 2, width: 2, height: 2, length: 2})
p c4.intersects?(c3)
