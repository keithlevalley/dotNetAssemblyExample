# Add a reference to the dll
Add-Type -Path 'dotNetAssemblyExample.dll'
       
# can look at the class

[TestLibrary1.TestStaticClass] | gm
[TestLibrary1.TestStaticClass].GetMethods().Name
[TestLibrary1.TestInstanceClass].GetMethods().Name

# consume the dll static method(s) (Intellisense works)

[TestLibrary1.TestStaticClass]::timesMethodStatic(5,2)
[TestLibrary1.TestStaticClass]::addMethodStatic(5,2)

# With a Non-Static class we need to first create the object

$dotNetObject = New-Object TestLibrary1.TestInstanceClass(5,2)

$dotNetObject | gm

# consume instance method(s)

$dotNetObject.X
$dotNetObject.timesMethodInstance()
$dotNetObject.addMethodInstance()

# This test illistrates the efficiency of C# Linq vs the PowerShell equivalent
# using LINQ example

$numbers = 1..5000000
$checkNumber = 50

# run the array through a "Gauntlet" looking for numbers less than the check number that are even

# run the "Gauntlet" using the PowerShell Where function
Measure-Command -Expression {$temp = $numbers.Where( {$_ -lt $checkNumber -and $_ % 2 -eq 0})} |
    Select-Object -Property TotalSeconds # on my PC this took roughly 23 seconds...

# Create the Link object from the dll, yes this is the actual syntax...
$LinqObject = New-Object TestLibrary1.UsingLinq(,[int[]]$numbers)
$LinqObject | gm

# run the same "Gauntlet" using the Linq query from the dll
Measure-Command -Expression {$temp2 = $LinqObject.lessThanNumAndEven($checkNumber)} |
    Select-Object -Property TotalSeconds # on my PC this took a fraction of a second...

# we get the same result
$temp
$temp2