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

  def contains?(point)
    anti_origin = self.vertices[-1]
    return false if point.x < @origin.x || point.x > anti_origin.x
    return false if point.y < @origin.y || point.y > anti_origin.y
    return false if point.z < @origin.z || point.z > anti_origin.z
    return true
  end

  def touches?(point)
    anti_origin = self.vertices[-1]
    return true if point.x == @origin.x || point.x == anti_origin.x
    return true if point.y == @origin.y || point.y == anti_origin.y
    return true if point.z == @origin.z || point.z == anti_origin.z
    return false
  end

  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(cuboid)
    cuboid.vertices.each do |vertex|
      if self.contains?(vertex) || self.touches?(vertex)
        return true
      end
    end
    return false
  end

  #END public methods that should be your starting point
end
