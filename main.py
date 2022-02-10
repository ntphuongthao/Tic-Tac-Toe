board = ["1", "2", "3",
         "4", "5", "6",
         "7", "8", "9"]


def display_board():
    print(board[0] + ' | ' + board[1] + ' | ' + board[2] + ' | ')
    print(board[3] + ' | ' + board[4] + ' | ' + board[5] + ' | ')
    print(board[6] + ' | ' + board[7] + ' | ' + board[8] + ' | ')


def play_game():
    cur = 1
    turn = 1
    display_board()
    print('------------------------------START GAME------------------------------')

    while turn <= 9:
        player = handle_turn(cur)
        print("This is player {}'s turn".format(player))

        pos = int(input("Please choose an available number: ")) - 1
        while board[pos] != str(pos + 1):
            print("Choose another number!")
            pos = int(input("Please choose an available number: ")) - 1

        board[pos] = player
        display_board()
        turn += 1

        if turn >= 3:
            if check_if_win(turn):
                print("Player {} wins!".format(player))
                break
            elif check_if_tie(turn):
                print("Tie Game!")
                break
        cur = flip_player(cur)
        print()


def handle_turn(cur):
    if cur:
        player = 'X'
    else:
        player = 'O'
    return player


def check_if_game_over(turns):
    return check_if_win(turns) or check_if_tie(turns)


def check_row():
    three_important_pos = [(0, 1, 2), (3, 4, 5), (6, 7, 8)]
    for x, y, z in three_important_pos:
        if board[x] == board[y] == board[z]:
            return True
    return False


def check_cols():
    three_important_pos = [(0, 3, 6), (1, 4, 7), (2, 5, 8)]
    for x, y, z in three_important_pos:
        if board[x] == board[y] == board[z]:
            return True
    return False


def check_diagonals():
    two_important_pos = [(0, 4, 8), (2, 4, 6)]
    for x, y, z in two_important_pos:
        if board[x] == board[y] == board[z]:
            return True
    return False


def check_if_win(turns):
    return turns >= 3 and check_row() or check_cols() or check_diagonals()


def check_if_tie(turns):
    if turns < 9:
        return False
    elif not check_if_win(turns) and turns == 9:
        return True


def flip_player(cur):
    cur = 1 - cur
    return cur

play_game()

