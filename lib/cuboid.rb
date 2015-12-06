class Point
  attr_accessor :x, :y, :z

  def initialize(coordinates)
    @x = coordinates[:x]
    @y = coordinates[:y]
    @z = coordinates[:z]
  end
end


class Cuboid
  attr_reader :origin, :vertices, :length, :width, :height

  def initialize(dimensions)
    @origin = dimensions[:origin] #bottom, left, front vertex
    @vertices = []
    @length = dimensions[:length]
    @width = dimensions[:width]
    @height = dimensions[:height]
    set_vertices
  end

  #BEGIN public methods that should be your starting point

  def move_to!(x, y, z)
    @origin = Point.new({x: x, y: y, z: z})
    set_vertices
    @origin
  end

  def set_vertices
    anti_origin = Point.new({ x: @origin.x + @width, y: @origin.y + @height, z: @origin.z + @length }) # top, right, back
    b = Point.new({ x: @origin.x + @width, y: @origin.y, z: @origin.z }) # bottom, right, front
    c = Point.new({ x: @origin.x, y: @origin.y, z: @origin.z + @length }) # bottom, left, back
    d = Point.new({ x: @origin.x, y: @origin.y + @height, z: @origin.z }) # top, left, front
    e = Point.new({ x: @origin.x, y: @origin.y + @height, z: @origin.z + @length }) # top, left, back
    f = Point.new({ x: @origin.x + @width, y: @origin.y + @height, z: @origin.z }) #top, right, front
    g = Point.new({ x: @origin.x + @width, y: @origin.y, z: @origin.z + @length }) # bottom, right, back
    @vertices = [@origin, b, c, d, e, f, g, anti_origin]
  end

  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other_cuboid)
    anti_origin = self.vertices[-1]
    other_cuboid.vertices.each do |other_vertex|
      # if x, y, and z value is greater than origin vertex and less than diagonal vertex
      if other_vertex.x >= @origin.x && other_vertex.x <= anti_origin.x &&
          other_vertex.y >= @origin.y && other_vertex.y <= anti_origin.y &&
          other_vertex.z >= @origin.z && other_vertex.z <= anti_origin.z
        return true
      end
    end
    return false
  end

  #END public methods that should be your starting point
end

origin = Point.new({x: 1, y: 1, z: 1})
cuboid = Cuboid.new({origin: origin, length: 3, height: 2, width: 4})
# p cuboid.vertices

origin2 = Point.new({x: 3, y: 2, z: 2})
cuboid2 = Cuboid.new({origin: origin2, length: 1, height: 1, width: 1})

p cuboid.intersects?(cuboid2)
# # true

# origin3 = Point.new({x: 7, y: 7, z: 7})
# cuboid3 = Cuboid.new({origin: origin3, length: 1, height: 1, width: 1})

# p cuboid.intersects?(cuboid3)
