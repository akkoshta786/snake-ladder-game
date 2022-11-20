# README

Following app is hosted in heroku. In case hosting gets expired, clone into local machine and run the application.

1. Create a board with following request:
    POST https://snake-ladder-game-01.herokuapp.com/
    
2. By default, 2 players are playing a game. This number can be changed from backend. Call the following API and it will automatically circulate turn of each player on each valid request.
  
    POST https://snake-ladder-game-01.herokuapp.com/<board_id>/player_move
    with body: dice roll number
    
    For example: POST POST https://snake-ladder-game-01.herokuapp.com/1/player_move, body: 3
    
    NOTE: board_id will get as response of step 1
    
3. To restart game, call following API

  POST POST https://snake-ladder-game-01.herokuapp.com/<board_id>/init, body: "START"
