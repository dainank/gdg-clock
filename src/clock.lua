local digits = { 0, 0, 0, 0 } -- control four digits in clock

local function allocateDigits(clock_time, previous_seconds_first)
    local total_seconds_inital = clock_time -- inital time

    local total_minutes = math.floor(total_seconds_inital / 60)
    local minutes_tenth = math.floor(total_minutes / 10)
    local minutes_first = total_minutes - (minutes_tenth * 10)

    local total_seconds = math.fmod(total_seconds_inital, 60)
    local seconds_tenth = math.floor(total_seconds / 10)
    local seconds_first = total_seconds - (seconds_tenth * 10)

    digits = { minutes_tenth, minutes_first, seconds_tenth, seconds_first }
    if previous_seconds_first ~= seconds_first then
        print("{ " .. digits[1] .. digits[2] .. ":" .. digits[3] .. digits[4] .. " }")
    end
    return seconds_first
end

function Main()
    local seconds_first = 0
    local program_time_start = os.time()
    while (true) do -- simulate ticks
        local current_time = os.time()
        local time_diff = os.difftime(current_time, program_time_start)
        seconds_first = allocateDigits(time_diff, seconds_first) -- clock since program start
    end
end

Main()