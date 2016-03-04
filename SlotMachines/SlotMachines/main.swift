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
//let q : Int = 25
//let a : Int = 10
// 3: Broke after 99 plays (just testing machine B)
//let q : Int = 99
//let a : Int = 10
//let b : Int = 0
//// 4: Broke after 159 plays (just testing machine B)
//let q : Int = 99
//let a : Int = 10
//let b : Int = 1
// 5: Broke after 1 play (just testing machine C)
//let q : Int = 1
//let a : Int = 10
//let b : Int = 1
//let c : Int = 1
//// 5: Broke after 18 plays (just testing machine C)
//let q : Int = 9
//let a : Int = 10
//let b : Int = 1
//let c : Int = 1
//// 6: Test example given
//let q : Int = 48
//let a : Int = 3
//let b : Int = 10
//let c : Int = 4

// Inputs

// Get quarters (at least 1 coin and fewer than 1000)
// If not valid, just repeat question (no error message)
var quarters : Int = 0          // Set to non-valid input

// Prompt the user
print("How many quarters does Martha have in the jar?")

// OK, try to get input from the user
// readLine always returns an optional data type, so use optional binding to attempt to unwrap it
if let input = readLine(stripNewline: true) {
    
    
    // Optional binding worked, we have something to work with
    // The 'input' variable has a type of String (non-optional data type, must have non-nil value now)
    // Attempt to cast that value as an integer
    if let inputAsInteger = Int(input) {
        
        // If this works, the input was converted to an integer
        if inputAsInteger > 0 && inputAsInteger < 1000 {
            quarters = inputAsInteger
        }
        
    }
}


var machineATimesPlayedSincePayout : Int = 0
var machineBTimesPlayedSincePayout : Int = 0
var machineCTimesPlayedSincePayout : Int = 0

// Other variables and constants
let machineAPayoutThreshold : Int = 35
let machineBPayoutThreshold : Int = 100
let machineCPayoutThreshold : Int = 10
var timesPlayed : Int = 0

// Process

// NOTES: With these values to test with, I should get exactly 25 plays.  I will run out of
// quarters before machine hits it's payout threshold.

// Keep playing until the money runs out!  NOTE: Not a good idea in real life.
repeat {
    
    // Play machine A (but only if Martha has enough quarters)
    if (quarters > 0) {
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
    }
    
    // Play machine B (but only if Martha has enough quarters)
    if (quarters > 0) {
        timesPlayed += 1
        quarters -= 1
        machineBTimesPlayedSincePayout += 1
        // Check for payout
        if machineBTimesPlayedSincePayout == machineBPayoutThreshold {
            
            // She wins – add 60 quarters
            quarters += 60
            
            // Reset machine played since payout value
            machineBTimesPlayedSincePayout = 0
            
        }
    }
    
    // Play machine C (but only if Martha has enough quarters)
    if (quarters > 0) {
        timesPlayed += 1
        quarters -= 1
        machineCTimesPlayedSincePayout += 1
        // Check for payout
        if machineCTimesPlayedSincePayout == machineCPayoutThreshold {
            
            // She wins – add 9 quarters
            quarters += 9
            
            // Reset machine played since payout value
            machineCTimesPlayedSincePayout = 0
            
        }    
    }
    
} while quarters > 0

// Output
print("Martha plays \(timesPlayed) times before going broke.")