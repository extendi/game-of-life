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

def getNext(grid)
    dirs = [[1, 0], [-1, 0], [0, 1], [0, -1], [1, 1],
      [-1, -1], [-1, 1], [1, -1]]

    rows, cols = grid.size, grid[0].size
    res = Array.new(rows) { Array.new(cols) { 0 } }

    for r in 0...rows do
        for c in 0...cols do
            # count neighbors
            neighbors = 0
            for dr, dc in dirs
                row, col = r + dr, c + dc
                #puts row.to_s + ' ' + col.to_s
                if row >= 0 and row < rows and col >= 0 and col < cols
                    neighbors += grid[row][col]
                end
            end
            #puts 'neighbors: ' + neighbors.to_s

            # evaluate next
            if grid[r][c] == 1 # is alive
                if neighbors >= 2 and neighbors <= 3
                    res[r][c] = 1
                end
            else # is dead
                if neighbors == 3
                    res[r][c] = 1
                end
            end
        end
    end

    return res
end

# puts 'Hello, world!'
# a = Array.new(3) { Array.new(2) { 0 } }
grid = [[0,0,0,0,1,0,0,0],
        [0,0,0,0,0,1,0,0],
        [0,0,0,1,1,1,0,0],
        [0,0,0,0,0,0,0,0]]

printGrid(grid, 0)
grid = getNext(grid)
printGrid(grid, 1)
