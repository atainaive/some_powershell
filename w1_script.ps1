#Global variables
[string]$global:yes = "y"
[string]$global:no = "n"
[string]$global:yesorno
[int]$global:solution

#Functions

#Function to add numbers
function Get-MathOperationPlus {
    param (

        [int]
        $int1,

        [int]
        $int2
    )
            
    #Number 1
    $int1 = Read-Host "Number 1"

    #Number 2
    $int2 = Read-Host "Number 2"

    #Operation
            $global:solution = $int1 + $int2
      
}

#Function to derive numbers
function Get-MathOperationMinus {
    param (

        [int]
        $int1,

        [int]
        $int2
    )
            
    #Number 1
    $int1 = Read-Host "Number 1"

    #Number 2
    $int2 = Read-Host "Number 2"

    #Operation
            $global:solution = $int1 - $int2
      
}

#Function to multiply numbers
function Get-MathOperationMultiply {
    param (

        [int]
        $int1,

        [int]
        $int2
    )
            
    #Number 1
    $int1 = Read-Host "Number 1"

    #Number 2
    $int2 = Read-Host "Number 2"

    #Operation
            $global:solution = $int1 * $int2
      
}

#Function to divide numbers
function Get-MathOperationDivide {
    param (

        [int]
        $int1,

        [int]
        $int2
    )
            
    #Number 1
    $int1 = Read-Host "Number 1"

    #Number 2
    $int2 = Read-Host "Number 2"

    #Operation
            $global:solution = $int1 / $int2
      
}

function Get-Fact
{
    param ([int]$x)

    if ($x -eq 1)
    {
        return 1
    }
    else
    {
        return $x * (Get-Fact ($x-1))
    }
}


#Function to start the program
function Get-YesOrNo {
    Write-Output "Do you want to start?"
    $global:yesorno = Read-Host "( Y | N )"
}

Clear-Host
Get-YesOrNo

#Beggining of a program
if ($global:yesorno -contains $global:yes) {
$menu=@"
1 Add
2 Derive
3 Multiply
4 Divide
5 Factorial
Q Quit
Select a task by number or Q to quit
"@

#The program itself
while(($input = Read-Host $menu) -ne "Q")
{
    switch($input)
    {
        1 { Get-MathOperationPlus
        Write-Output "Solution: $solution"}
        2 { Get-MathOperationMinus
        Write-Output "Solution: $solution"}
        3 { Get-MathOperationMultiply
        Write-Output "Solution: $solution"}
        4 { Get-MathOperationDivide
        Write-Output "Solution: $solution"}
        5 {[int]$x = Read-Host "Number"
        Get-Fact $x}
        default {Write-Host -ForegroundColor Red "`nInvalid entry`n"}
    }
}    
default { Write-Host "`nI don't understand what you want to do." -ForegroundColor Red }  
}

#Output if user types "N"
ElseIf ($global:yesorno -contains $global:no) {
    Write-Output "( ˘_˘ )"
    Start-Sleep -Seconds 3
    Clear-Host
    break
}

#Output if user types anything except for "Y" or "N"
Else {
    Write-Output "Please, use <Y> or <N>!"
    Start-Sleep -Seconds 3
    Clear-Host
    break
}