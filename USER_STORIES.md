# User Types

* League Moderators: The people recording and refereeing pokemon battles.
* Pokemon Trainers: The people battling in the Pokemon League.

# Stories

## League Moderator enters Pokemon Trainer's profile

As a League Moderator
In order to keep track of all of the league's contestants
I want to enter a profile of each Pokemon Trainer

Acceptance Criteria:
* Moderator navigates to the 'add a profile' portion of app
* Prompts Moderator for Name of Trainer
* Displays profile for Moderator to confirm information

Usage:
* Adding profile from command line:
  plt -a [NAME]

## Trainers access their respective profile

As a Pokemon Triner
In order to keep track of my progress in the leagu
I want to access my league profile

Acceptance Criteria:
* Trainer accesses the command line with their TrainerID(TID) to pull up their profile
* Displays Trainer's profile with all statistics

Usage:
* Accessing profile from the command line:
  plt -p [TID]

## Trainer inputs Trainer's pokemon from PID

As a Pokemon Trainer
In order to record each pokemon in my team
I want to record each pokemon's PID under my profile

Acceptance Criteria:
* Trainer navigates to their profile through the command line
* Trainer is prompted to add pokemon to profile
* Trainer types in a PID (integer)
* Repeat until Trainer has six (and only six) pokemon
* If one or more of the PIDs are illegal pokemon or incorrect PIDs, the Trainer is shown the appropriate error message
* Display updated Trainer profile with newly registered pokemon

Usage:
* Adding pokemon from the command line (while at their profile):
  plt --pokemon --add
* Trainer is prompted with:
  What is the ID of the pokemon you would like to add (PID)?
* Trainer types in the integer representing their pokemon. Example:
  What is the ID of the pokemon you would like to add (PID)?
    26 <-- Pikachu

## Trainer inputs each of their pokemon's movesets

As a Pokemon Trainer
In order to keep record of movesets for each pokemon
I want to record each pokemon's moveset

Acceptance Criteria:
* Trainer navigates through menus and selects a their profile (via their display number) to view
* Trainer selects a pokemon (via their display number) to view
* Trainer is prompted to add a move to selected pokemon
* Repeat until pokemon has four (and only four) moves
* If the move is illegal on specific pokemon or incorrect, the Trainer is shown the appropriate error message
* Display updated pokemon with newly registered moveset

Usage:
* Adding moves to a pokemon from the command line (while at their profile):
  plt --pokemon [PID] --move
* Trainer is prompted with:
  What is the name of the pokemon's move?
* Trainer types in the name of the move. Example:
  What is the name of your pokemon's move?
    Tackle

## Moderator inputs the outcome of a battle

As a League Moderator
In order keep accurate records for the league
I want to update a Trainer's profile with their wins and losses

Acceptance Criteria:
* Moderator navigates through menus and adds a battle
* Moderator is prompted to select each Trainer (via their display number)
* Prompts the Moderator which triner lost or won a battle.
* Displays both Triner's updated profiles with current wins and losses