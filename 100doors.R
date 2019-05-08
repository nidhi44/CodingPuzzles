# Problem Statement:
# There are 100 doors in a row that are all initially closed.
# 
# You make 100 passes by the doors.
# The first time through, visit every door and  toggle  the door  (if the door is closed,  open it;   if it is open,  close it).
# The second time, only visit every 2nd door   (door #2, #4, #6, ...),   and toggle it.
# The third time, visit every 3rd door   (door #3, #6, #9, ...), etc,   until you only visit the 100th door.
# 
# Task
# Answer the question:   what state are the doors in after the last pass?   Which are open, which are closed?


######## Solution: ###########33


# All doors are initially closed. If they are toggled just once, they stay open; twice, they close again; thrice they open again...
# Essentially, if you toggle the door even number of times, it closes again. Else it stays open
# Now, not every door get's toggled on each pass. Mathematically, we could say the problem of will a pass toggle my door depend on this:
# doorNum %% passNum ==0. Essentially, we need to count the number of divisors for each doorNum less than equal to itself.

#Let's simulate...

#Creating doors and passes variable

doors = 1:100L
passes = 1:100L

# Let's count the number of divisors for each door.
numberOfTogglesPerDoor <- sapply(doors, function(x) length(which(x%% passes ==0)) )

#What door numbers were toggled odd number of times i.e. stayed open
which(numberOfTogglesPerDoor%%2 !=0)


#This conceptually makes sense. Every number as even number of unique divisors, including itself ( since you need 2 numbers for multiplication!!)
# 6; 2*3, 1*6... 18: 9*2; 6*3, 18*1

#; Except when it's a perfect square.
# 4: 2*2; 4*1... unique number of divisors is THREE!
#If the door get's toggled odd number of times, it stays open. Hence the solution.


# Let's increase the simulation length and see how long does our solution take

for(doors in c(100L,1000L,10000L,100000L)){
print(system.time({

numberOfTogglesPerDoor <- sapply(doors, function(x) length(which(x%% doors ==0)) )

which(numberOfTogglesPerDoor%%2 !=0)
}) )
}

