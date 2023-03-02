function process_instructions(instructions)
    local floor = 0
    for i = 1, #instructions do
        local instruction = instructions:sub(i, i)
        if instruction == "(" then
            floor = floor + 1
        elseif instruction == ")" then
            floor = floor - 1
        end
    end
    return floor
end

-- read input from file
local f = io.open("input.txt", "r")
local instructions = f:read("*all")
f:close()

local final_floor = process_instructions(instructions)
print("Santa ended up on floor " .. final_floor)
