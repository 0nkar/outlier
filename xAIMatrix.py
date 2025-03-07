def solution(n, m, figures):
    SHAPES = {
        'A': [[1]],
        'B': [[1, 1, 1]],
        'C': [[1, 1],
              [1, 1]],
        'D': [[1, 0],
              [1, 1],
              [1, 0]],
        'E': [[0, 1, 0],
              [1, 1, 1]]
    }
    
    grid = [[0] * m for _ in range(n)]
    
    def can_place(shape, r, c):
        for i in range(len(shape)):
            for j in range(len(shape[0])):
                if shape[i][j] == 1:
                    if r + i >= n or c + j >= m or grid[r + i][c + j] != 0:
                        return False
        return True
    
    def place(shape, r, c, index):
        for i in range(len(shape)):
            for j in range(len(shape[0])):
                if shape[i][j] == 1:
                    grid[r + i][c + j] = index
    
    for index, figure in enumerate(figures, start=1):
        shape = SHAPES[figure]
        placed = False
        
        for r in range(n):
            if placed:
                break
            for c in range(m):
                if can_place(shape, r, c):
                    place(shape, r, c, index)
                    placed = True
                    break
    
    return grid
