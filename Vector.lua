Vector = {}
Vector.__index = Vector

local function isVector(a)
	if type(a) ~= 'table' then return false end
	if not a['__index'] then return false end
	if a.__index == Vector.__index then return true end
	return false
end

function Vector:new(x,y)
	local instance = setmetatable({}, self)
	
	instance.x = x or 0
	instance.y = y or 0
	
	return instance
end

function Vector:Distance(vector)
	assert(isVector(vector), 'Tried to get distance between a non-Vector object.')
	return math.sqrt( (vector.x - self.x)^2 + (vector.y - self.y)^2 )
end

function Vector:Normalize()
	local length = self:Distance(Vector:new(0, 0)) -- Distance from the origin
	if length == 0 then
		return Vector:new(0, 0) -- Return zero vector if length is zero to avoid division by zero
	end
	return Vector:new(self.x / length, self.y / length)
end

function Vector:Direction(vector)
	assert(isVector(vector), 'Tried to get direction between a non-Vector object.')
	return Vector:new(vector.x - self.x, vector.y - self.y):Normalize()
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
	assert(isVector(vector), 'Tried to get angle between a non-Vector object.')

	local deltaX = vector.x - self.x
	local deltaY = vector.y - self.y
	
	return math.atan2(deltaY, deltaX)
end

function Vector:Min(vector)
	assert(isVector(vector), 'Tried to get min between a non-Vector object.')
	if (self < vector) then
		return self
	end
	return vector
end

function Vector:Max(vector)
	assert(isVector(vector), 'Tried to get max between a non-Vector object.')
	if (self > vector) then
		return self
	end
	return vector
end

function Vector:Dot(vector)
	assert(isVector(vector), 'Tried to get dot between a non-Vector object.')
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
	if isVector(vector2) then return Vector:new(vector1.x + vector2.x, vector1.y + vector2.y) end
	return Vector:new(vector1.x + vector2, vector1.y + vector2)
end

function Vector.__sub(vector1, vector2)
	if isVector(vector2) then return Vector:new(vector1.x - vector2.x, vector1.y - vector2.y) end
	return Vector:new(vector1.x - vector2, vector1.y - vector2)
end

function Vector.__mul(vector1, vector2)
	if isVector(vector2) then return Vector:new(vector1.x * vector2.x, vector1.y * vector2.y) end
	return Vector:new(vector1.x * vector2, vector1.y * vector2)
end

function Vector.__div(vector1, vector2)
	if isVector(vector2) then return Vector:new(vector1.x / vector2.x, vector1.y / vector2.y) end
	return Vector:new(vector1.x / vector2, vector1.y / vector2)
end

function Vector.__mod(vector1, vector2)
	if isVector(vector2) then return Vector:new(vector1.x % vector2.x, vector1.y % vector2.y) end
	return Vector:new(vector1.x % vector2, vector1.y % vector2)
end

function Vector.__pow(vector1, vector2)
	if isVector(vector2) then return Vector:new(vector1.x ^ vector2.x, vector1.y ^ vector2.y) end
	return Vector:new(vector1.x ^ vector2, vector1.y ^ vector2)
end

function Vector.__eq(vector1, vector2)
	if not isVector(vector2) then return false end
	return (vector1.x == vector2.x) and (vector1.y == vector2.y)
end

function Vector.__lt(vector1, vector2)
	if not isVector(vector2) then return false end
	return (vector1.x < vector2.x) and (vector1.y < vector2.y)
end

function Vector.__le(vector1, vector2)
	if not isVector(vector2) then return false end
	return (vector1.x <= vector2.x) and (vector1.y <= vector2.y)
end
