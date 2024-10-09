Vector = {}
Vector.__index = Vector

function Vector:new(x,y)
	local instance = setmetatable({}, self)
	
	instance.x = x or 0
	instance.y = y or 0
	
	return instance
end

function Vector:Distance(vector)
	return math.sqrt( (vector.x - self.x)^2 + (vector.y - self.y)^2 )
end

function Vector:Abs()
	return Vector:new( math.abs(self.x), math.abs(self.y) )
end

function Vector:Ceil()
	return Vector:new( math.ceil(self.x), math.ceil(self.y) )
end

function Vector:Floor()
	return Vector:new( math.floor(self.x), math.floor(self.y) )
end

function Vector:Sign()
	return Vector:new( ( self.x > 0 and 1 or (self.x == 0 and 0 or -1 ) ), ( self.y > 0 and 1 or (self.y == 0 and 0 or -1) ) )
end

function Vector:Angle(vector)
	local deltaX = vector.x - self.x
	local deltaY = vector.y - self.y
	
	return math.atan2(deltaY, deltaX)
end

function Vector:Min(vector)
	return Vector:new( math.min(self.x, vector.x), math.min(self.y, vector.y) )
end

function Vector:Max(vector)
	return Vector:new( math.max(self.x, vector.x), math.max(self.y, vector.y) )
end

function Vector:Dot(vector)
	return self.x * vector.x + self.y * vector.y
end

function Vector:Array()
	return {self.x, self.y}
end

function Vector:Unpack()
	return self.x, self.y
end

--

function Vector:__tostring()
	return 'x: ' .. self.x .. '\ty: ' .. self.y
end

function Vector.__add(vector1, vector2)
	return Vector:new(vector1.x + vector1.x, vector1.y + vector2.y)
end

function Vector.__sub(vector1, vector2)
	return Vector:new(vector1.x - vector1.x, vector1.y - vector2.y)
end

function Vector.__mul(vector1, vector2)
	return Vector:new(vector1.x * vector1.x, vector1.y * vector2.y)
end

function Vector.__div(vector1, vector2)
	return Vector:new(vector1.x / vector1.x, vector1.y / vector2.y)
end

function Vector.__mod(vector1, vector2)
	return Vector:new(vector1.x % vector1.x, vector1.y % vector2.y)
end

function Vector.__pow(vector1, vector2)
	return Vector:new(vector1.x ^ vector1.x, vector1.y ^ vector2.y)
end

function Vector.__eq(vector1, vector2)
	return (vector1.x == vector2.x) and (vector1.y == vector2.y)
end

function Vector.__lt(vector1, vector2)
	return (vector1.x < vector2.x) and (vector1.y < vector2.y)
end

function Vector.__le(vector1, vector2)
	return (vector1.x <= vector2.x) and (vector1.y <= vector2.y)
end