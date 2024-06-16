
def new_board():
    return [[' ' for _ in range(5)] for _ in range(5)]

def print_board(board):
    print("  0   1   2   3   4")
    for index, row in enumerate(board):
        print(f"{index} " + ' | '.join(row))
        if index < 4:
            print(" -" + "----" * 4 + "--")


def is_game_over(board):
    for row in board:
        for i in range(3):
            if row[i] != ' ' and row[i] == row[i+1] == row[i+2]:
                return row[i]  

    for col in range(3):
        for row in range(3):
            if board[row][col] != ' ' and board[row][col] == board[row+1][col] == board[row+2][col]:
                return board[row][col]  

    for i in range(3):
        if board[i][i] != ' ' and board[i][i] == board[i+1][i+1] == board[i+2][i+2]:
            return board[i][i]  
        if board[i][4-i] != ' ' and board[i][4-i] == board[i+1][3-i] == board[i+2][2-i]:
            return board[i][4-i]  

    if any(' ' in row for row in board):
        return None 

    return 'D'  




def announce_outcome(board, players_move):
    result = is_game_over(board)
    if result == 'D':
        print("Gra zakończyła się remisem!")
    else:
        if result == 'X':
            print("Zwycięzca: Gracz!")
        else:
            print("Zwycięzca: Komputer!")
