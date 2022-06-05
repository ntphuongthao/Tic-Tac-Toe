$board = ["1", "2", "3",
    "4", "5", "6",
    "7", "8", "9"]


def display_board
    puts "#{$board[0]} | #{$board[1]} | #{$board[2]} |"
    puts "#{$board[3]} | #{$board[4]} | #{$board[5]} |"
    puts "#{$board[6]} | #{$board[7]} | #{$board[8]} |"
end

def play_game
    cur = 1
    turn = 1

    display_board
    puts "------------------------------START GAME------------------------------"

    while turn <= 9 
        player = handle_turn(cur)
        puts "This is player #{player}'s turn"

        puts "Please choose an available number!"
        pos = gets.chomp

        while $board[pos.to_i - 1] != pos
            puts "Choose another number!"
            puts "Please choose an available number!"
            pos = gets.chomp
        end

        $board[pos.to_i - 1] = player
        display_board()
        turn += 1

        if turn >= 3
            if check_if_win(turn)
                puts "Player #{player} wins!"
                break
            elsif check_if_tie(turn)
                puts "Tie game!"
                break
            end
        end
        cur = flip_player(cur)
        puts "---------------------------------------------------------"
    end
end

def check_if_win(turns)
    turns >= 3 and (check_rows or check_cols or check_diagonals)
end

def check_rows
    res = false
    three_important_pos = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    for x, y, z in three_important_pos
        if $board[x] == $board[y] and $board[z] == $board[x]
            res = true
            break   
        end
    end
    res
end

def check_cols
    res = false
    three_important_pos = [[0, 3, 6], [1, 4, 7], [2, 5, 8]]
    for x, y, z in three_important_pos
        if $board[x] == $board[y] and $board[x] == $board[z]
            res = true
            break
        end
    end
    res
end

def check_diagonals
    res = false
    two_important_pos = [[0, 4, 8], [2, 4, 6]]
    for x, y, z in two_important_pos
        if $board[x] == $board[y] and $board[x] == $board[z]
            res = true
            break
        end
    end
    res
end

def check_if_tie(turns)
    if turns < 9
        false
    elsif !check_if_win(turns)
        true
    end
end

def flip_player(cur)
    cur = 1 - cur
end

def handle_turn(cur)
    if cur == 1
        "X"
    else
        "O"
    end
end

play_game()