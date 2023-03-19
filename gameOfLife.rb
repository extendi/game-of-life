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

def getNext(grid, dirs)
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

def getNextInplace(grid, dirs)
    rows, cols = grid.size, grid[0].size

    for r in 0...rows do
        for c in 0...cols do
            # code: keeps track of the previous configuration
            # first next  code
            # 0     0     0
            # 1     0     1
            # 0     1     2
            # 1     1     3
            # count neighbors
            neighbors = 0
            for dr, dc in dirs
                row, col = r + dr, c + dc
                #puts row.to_s + ' ' + col.to_s
                if row >= 0 and row < rows and col >= 0 and col < cols
                    if grid[row][col] == 1 or grid[row][col] == 3
                        neighbors += 1
                    end
                end
            end
            #puts 'neighbors: ' + neighbors.to_s

            # evaluate next inplace
            if grid[r][c] == 1 # cell is alive
                if neighbors >= 2 and neighbors <= 3 # condition to remain alive
                    grid[r][c] = 3 # from 1 to 1, code is 3
                else
                    grid[r][c] = 1 # from 1 to 0, code is 1
                end
            else # cell is dead
                if neighbors == 3 # condition to get alive
                    grid[r][c] = 2 # from 0 to 1, code is 2
                # else condition to remain dead, from 0 to 0, code is already 0
                end
            end
        end
    end

    # convert code to next
    for r in 0...rows do
        for c in 0...cols do
            if grid[r][c] == 1
                grid[r][c] = 0
            elsif grid[r][c] != 0
              grid[r][c] = 1
            end
        end
    end

    return grid
end

################################################################################
dirs = [[1, 0], [-1, 0], [0, 1], [0, -1], [1, 1],
  [-1, -1], [-1, 1], [1, -1]]

# puts 'Hello, world!'
# a = Array.new(3) { Array.new(2) { 0 } }
grid = [[0,0,0,0,1,0,0,0],
        [0,0,0,0,0,1,0,0],
        [0,0,0,1,1,1,0,0],
        [0,0,0,0,0,0,0,0]]

printGrid(grid, 0)
#grid = getNext(grid, dirs)
grid = getNextInplace(grid, dirs)
printGrid(grid, 1)
