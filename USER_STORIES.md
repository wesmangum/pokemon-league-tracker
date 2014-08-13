# User Types

* League Moderators: The people recording and refereeing pokemon battles.
* Pokemon Trainers: The people battling in the Pokemon League.

# Stories

<!-- ## Users are greeted with a welcome screen

As a League Moderator or Pokemon Trainer
In order to access the system
I want to see a welcome screen when the program is run

Acceptance Criteria:
* User types in the command to start the program
* User is prompted with the greeting screen

Usage:
* Accessing the program from the command line:
    plt -->

<!-- ## League Moderator enters Pokemon Trainer's profile

As a League Moderator
In order to keep track of all of the league's contestants
I want to enter a profile of each Pokemon Trainer

Acceptance Criteria:
* Moderator navigates to the 'add a profile' portion of app
* Prompts Moderator for Name of Trainer
* Displays profile for Moderator to confirm information

Usage:
* Adding profile from command line menu:

    1

* Moderator is prompted with:
  What is the trainer's name?
* Moderator types in the Trainer's name. Example:
  What is the trainer's name?
    Ash
* Display confirmation message for profile creation with Trainer ID, Example:
  Ash's profile is ready to be edited! Trainer ID: 123 -->

<!-- ## Trainers access their respective profile

As a Pokemon Trainer
In order to keep track of my progress in the league
I want to access my league profile

Acceptance Criteria:
* Trainer accesses the command line with their TrainerID(TID) to pull up their profile
* Displays Trainer's profile with all statistics

Usage:
* Accessing profile from the command line menu:

    2

* Trainer is prompted with:

    Enter the ID of the Trainer you would like to update.

* Trainer puts in their unique ID they received at registration. Example:

    Enter the ID of the Trainer you would like to update.
    123

* Trainer's profile is displayed. Example:

    TRAINER PROFILE
    Name: Ash
    TID: 123
    Pokemon: <none> -->
    BattleLog: <none>

<!-- ## Trainer inputs Trainer's pokemon from their National Pokedex ID

As a Pokemon Trainer
In order to record each pokemon in my team
I want to record each pokemon's National Pokedex ID under my profile

Acceptance Criteria:
* Trainer navigates to their profile through the command line
* Trainer is prompted to add pokemon to profile
* Trainer types in a National Pokedex ID (integer)
* Repeat until Trainer has six (and only six) pokemon
* If one or more of the National Pokedex IDs are illegal pokemon or incorrect National Pokedex IDs, the Trainer is shown the appropriate error message
* Display updated Trainer profile with newly registered pokemon

Usage:
* Adding pokemon from the command line (while at their profile):

    1

* Trainer is prompted with:
  What is the ID of the pokemon you would like to add (National Pokedex ID)?
* Trainer types in the integer representing their pokemon. Example:
  What is the ID of the pokemon you would like to add (National Pokedex ID)?
    26 <-- Pikachu
* Trainer is sent back to their profile menu -->

<!-- ## Trainer selects one of their pokemon to view it's statistics

As A Pokemon Trainer
In order to add moves and see statistics about my pokemon
I want to view each pokemon's statistics

Acceptance Criteria:
* Trainer navigates to profile and selects to view a Pokemon
* Trainer selects a pokemon (via their display number) to view
* Displays Pokemon and statistics

Usage:
* Selecting a pokemon from Trainer profile:

    2

* Trainer is prompted with:

    What is the display number of the pokemon you wish to view?

* Trainer types in the Pokemon's display number. Example:

    What is the display number of the pokemon you wish to view?
      1 <-- Pikachu -->

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

    plt --pokemon [National Pokedex ID] --move

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

Usage:
* Recording a battle from the command line:
  record battle
* Moderator is prompted with:
