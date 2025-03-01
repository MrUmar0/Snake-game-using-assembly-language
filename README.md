# Snake-game-using-assembly-language

Description 
This assembly language program implements a simple text-based maze navigation game. The player navigates through a grid-based maze by entering movement commands ('w', 's', 'a', 'd') to control a player character represented by a "y". The goal of the game is to reach a target location marked by 'X', while avoiding walls marked by '#'. The player is given a limited number of moves to reach the target. If the player successfully reaches the target, they win the game; if they run out of moves or hit a wall, the game ends.

Program Breakdown
Data Section:
The data section contains several predefined strings for user messages, maze layout, and other game information. For example:
ro1, ro2, ro3, ..., ro7: Represent the lines of the maze, where:
# denotes a wall,
* marks a movable path,
y represents the player's current position,
X is the target position.
msg, msg1, msg2, etc., hold messages that are displayed during the game, such as the "Game Start", "Game Over", and "You Win" messages.
nle is used to introduce newline characters in the output.
Code Section:
The main procedure initializes the data segment and starts the game. The game flow follows a loop where the user is asked to input commands to move the player.
Key Steps:
Game Start:

A welcome message is displayed using int 21h interrupt with mov ah, 09h to print strings.
The initial maze setup displays the player's position (y), and the player is prompted to enter their moves.
Movement:

The player can move the character using 'w' (up), 's' (down), 'a' (left), or 'd' (right).
The program checks for boundaries and walls before making a move:
If the player moves into a wall (#), a "There is a wall" message is displayed, and the move is invalid.
If the player successfully moves onto the target ('X'), a "You Win" message is shown, and the game ends.
If the player runs out of moves (mos variable), the game ends with a "Game Over" message.
Game Logic:

The Repeat loop keeps the game running until the player either wins or runs out of moves.
The player's position is updated in the maze (stored in ro1 to ro7) after each move.
Each move involves checking the character's current position (hei and wit for height and width) and comparing it to the maze layout.
After each move, the remaining number of moves is displayed.
Input Validation:

The player inputs one of the characters ('w', 's', 'a', or 'd'), and the corresponding conditional checks are used to update the player's position.
End Conditions:

If the player reaches the target ('X'), a victory message is displayed, and the program ends.
If the player runs out of moves or hits a wall, the game ends with an appropriate message.
Key Variables:
hei: Represents the current vertical position of the player.
wit: Represents the current horizontal position of the player.
mos: Tracks the number of moves remaining.
ro1, ro2, ..., ro7: Represent the lines of the maze and store the layout of walls and the player's position.
Functionality:
The game provides basic functionality for maze navigation, including:
Movement through a 2D grid-based maze.
Displaying the remaining moves.
Checking for valid and invalid moves (walls and out-of-bounds).
Printing appropriate messages for game status updates.
Handling both win and game-over conditions.
Program Flow Summary:
Initialization: Data segment setup and display of the game start message.
Input and Processing: User inputs move commands, and the player's position is updated accordingly.
Game Over Conditions: The game ends either when the player runs out of moves, hits a wall, or reaches the target.
Exit: The program terminates once a win or game over condition is met.
