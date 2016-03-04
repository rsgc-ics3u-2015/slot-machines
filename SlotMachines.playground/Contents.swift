// Russell Gordon
//
// "Slot machines"

/*

Basically, when a starting number of coins...

... play three machines, each after the other, A, B, then C.

Then back to A again, and so on.

Machine A pays 30 coins every 35 turns
Machine B pays 60 coins every 100 turns
Machine C 9 coins every 10 turns

I need to keep track of the number of plays before coins run out (reach 0).

*/

// Going to begin by working a simpler version of the problem – just machine A

// Test cases
// 1: Broke after 25 plays
//let q : Int = 1
//let a : Int = 25
// 2: Goes right to broke (0) after 25 plays BUT wins 30 quarters at last minute and then gets 30 more plays... THEN gets 30 more plays but goes broke before machine hits payout threshold of 35 again.  So a total of 55 plays.
let q : Int = 25
let a : Int = 10

// Inputs

var quarters : Int = q
var machineATimesPlayedSincePayout : Int = a

// Other variables and constants
let machineAPayoutThreshold : Int = 35
var timesPlayed : Int = 0

// Process

// NOTES: With these values to test with, I should get exactly 25 plays.  I will run out of 
// quarters before machine hits it's payout threshold.

// Keep playing until the money runs out!  NOTE: Not a good idea in real life.
repeat {
    
    // Play machine A
    timesPlayed += 1
    quarters -= 1
    machineATimesPlayedSincePayout += 1
    // Check for payout
    if machineATimesPlayedSincePayout == machineAPayoutThreshold {

        // She wins – add 30 quarters
        quarters += 30
        
        // Reset machine played since payout value
        machineATimesPlayedSincePayout = 0
    
    }

} while quarters > 0

// Output
print("Martha plays \(timesPlayed) times before going broke.")