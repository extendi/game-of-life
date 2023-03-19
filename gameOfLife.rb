def printGrid(grid, generation)
    rows, cols = grid.size, grid[0].size
    #puts('rows, cols: ' + rows.to_s + ', ' + cols.to_s)

    puts('Generation ' + generation.to_s + ':')
    puts(rows.to_s + ' ' + cols.to_s)

    for r in 0...rows do
        row = ''
        for c in 0...cols do
            row += grid[r][c] == 1 ? '*' : '.'
        end
        puts(row)
    end
end

# puts 'Hello, world!'
# a = Array.new(3) { Array.new(2) { 0 } }
grid = [[0,0,0,0,1,0,0,0],
        [0,0,0,0,0,1,0,0],
        [0,0,0,1,1,1,0,0],
        [0,0,0,0,0,0,0,0]]

printGrid(grid, 0)
