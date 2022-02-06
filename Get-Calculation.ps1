#Global variables
[string]$global:yes = "y"
[string]$global:no = "n"
$factOut = 1


<#
.SYNOPSIS
Calculates the addition of two numbers

.DESCRIPTION
    The function takes two integer and calculates the addition of those two numbers. 
    

.PARAMETER Int1
First integer for calculation

.PARAMETER Int2
Second integer for calculation

.INPUTS
None. You cannot pipe objects to Get-MathOperationPlus

.OUTPUTS
System.Int. Get-MathOperationPlus returns an addition of number as an integer

.EXAMPLE
PS> Get-MathOperationPlus -Int1 10 -Int2 20
#>
function Get-MathOperationPlus {
  [CmdletBinding()]
  [Alias("PlusOperation")]
  [OutputType([int])]
  Param
  (
    [Parameter(Mandatory = $true,
      ValueFromPipelineByPropertyName = $true,
      Position = 0)]
    [ValidatePattern("\d+")]
    [Int]
    $Int1,

    [Parameter(Mandatory = $true,
      ValueFromPipelineByPropertyName = $true,
      Position = 1)]
    [ValidatePattern("\d+")]
    [Int]
    $Int2
  )

  Begin {
    $Output = 0
  }
  Process {
    $Output = $Int1 + $Int2
  }
  End {
    return $Output
  }
}

<#
.SYNOPSIS
Calculates the subtraction of two numbers

.DESCRIPTION
    The function takes two integer and calculates the subtraction of those two numbers. 
    

.PARAMETER Int1
First integer for calculation

.PARAMETER Int2
Second integer for calculation

.INPUTS
None. You cannot pipe objects to Get-MathOperationMinus

.OUTPUTS
System.Int. Get-MathOperationMinus returns an subraction of number as an integer

.EXAMPLE
PS> Get-MathOperationMinus -Int1 10 -Int2 20
#>
function Get-MathOperationMinus {
  [CmdletBinding()]
  [Alias("PlusOperation")]
  [OutputType([int])]
  Param
  (
    [Parameter(Mandatory = $true,
      ValueFromPipelineByPropertyName = $true,
      Position = 0)]
    [ValidatePattern("\d+")]
    [Int]
    $Int1,

    [Parameter(Mandatory = $true,
      ValueFromPipelineByPropertyName = $true,
      Position = 1)]
    [ValidatePattern("\d+")]
    [Int]
    $Int2
  )

  Begin {
    $Output = 0
  }
  Process {
    $Output = $int1 - $int2
  }
  End {
    return $Output
  }
}


<#
.SYNOPSIS
Calculates the multiplication of two numbers

.DESCRIPTION
    The function takes two integer and calculates the multiplication of those two numbers. 
    

.PARAMETER Int1
First integer for calculation

.PARAMETER Int2
Second integer for calculation

.INPUTS
None. You cannot pipe objects to Get-MathOperationMultiply

.OUTPUTS
System.Int. Get-MathOperationMultiply returns multiplication of number as an integer

.EXAMPLE
PS> Get-MathOperationMultiply -Int1 10 -Int2 20
#>
function Get-MathOperationMultiply {
  [CmdletBinding()]
  [Alias("MultiplyOperation")]
  [OutputType([int])]
  Param
  (
    [Parameter(Mandatory = $true,
      ValueFromPipelineByPropertyName = $true,
      Position = 0)]
    [ValidatePattern("\d+")]
    [Int]
    $Int1,

    [Parameter(Mandatory = $true,
      ValueFromPipelineByPropertyName = $true,
      Position = 1)]
    [ValidatePattern("\d+")]
    [Int]
    $Int2
  )

  Begin {
    $Output = 0
  }
  Process {
    $Output = $Int1 * $Int2
  }
  End {
    return $Output
  }
}

<#
.SYNOPSIS
Calculates the division of two numbers

.DESCRIPTION
    The function takes two integer and calculates the division of those two numbers. 
    

.PARAMETER Int1
First integer for calculation

.PARAMETER Int2
Second integer for calculation

.INPUTS
None. You cannot pipe objects to Get-MathOperationDivide

.OUTPUTS
System.Int. Get-MathOperationDivide returns an division of number as an integer

.EXAMPLE
PS> Get-MathOperationDivide -Int1 10 -Int2 20
#>
function Get-MathOperationDivide {
  [CmdletBinding()]
  [Alias("DivideOperation")]
  [OutputType([int])]
  Param
  (
    [Parameter(Mandatory = $true,
      ValueFromPipelineByPropertyName = $true,
      Position = 0)]
    [ValidatePattern("\d+")]
    [Int]
    $Int1,

    [Parameter(Mandatory = $true,
      ValueFromPipelineByPropertyName = $true,
      Position = 1)]
    [ValidatePattern("\d+")]
    [Int]
    $Int2
  )

  Begin {
    $Output = 0
  }
  Process {
    $Output = $Int1 / $Int2
  }
  End {
    return $Output
  }
}
<#
  .SYNOPSIS
  Calculates the factorial of two numbers

  .DESCRIPTION
    The function takes two integer and calculates the factorial of those two numbers. 
    

  .PARAMETER Int1
  First integer for calculation

  .PARAMETER Int2
  Second integer for calculation

  .INPUTS
  None. You cannot pipe objects to Get-Fact

  .OUTPUTS
  System.Int. Get-Fact returns an factorial of number as an integer

  .EXAMPLE
  PS> Get-Fact -Int1 10 
  #>
function Get-Fact {
  [CmdletBinding()]
  [Alias("FactorialOperation")]
  [OutputType([int])]
  Param
  (
    [Parameter(Mandatory = $true,
      ValueFromPipelineByPropertyName = $true,
      Position = 0)]
    [ValidatePattern("\d+")]
    [Int]
    $Int1
  )

  Begin {
      
  }
  Process {
    if($Int1 -ne 0)
    {
     $script:factOut = $script:factOut * ($Int1)
     Get-Fact ($Int1-1)
    }
  }
  End {

  }
}

function Get-Calculation {
<#
  .SYNOPSIS
  Calculates the addition,subtraction,multiplication, division and factorial of numbers

  .DESCRIPTION
    The function read input for operation such as addition for option 1,subtraction for option 2,multiplication for option 3, division for option 4 and factorial for option 5. To Quit Q. Then it reads user input, and do the selected operation 

  .INPUTS
  None. You cannot pipe objects to Get-Calculation

  .OUTPUTS
  System.Int. Get-Calculation returns the addition,subtraction,multiplication, division and factorial of numbers

  .EXAMPLE
  PS> Get-Calculation
  #>
  Clear-Host
  Write-Output "Do you want to start?"
  $YesorNo = Read-Host "( Y | N )"
  $solution = $null

  #Beggining of a program
  if ($YesorNo -contains $global:yes) {
    $menu = @"
1 Add
2 Derive
3 Multiply
4 Divide
5 Factorial
Q Quit
Select a task by number or Q to quit
"@

    #The program itself
    while (($input = Read-Host $menu) -ne "Q") {
      switch ($input) {
        1 {
          Write-Output "Do you want to continue from the last calculation?"
          $yesorno = Read-Host "( Y | N )"
          if ($yesorno -contains $global:no) {
            $solution = Get-MathOperationPlus
          }
          else {
            $solution = Get-MathOperationPlus -Int1 $solution
          }
          Write-Output "Solution: $solution"
        }
        2 {
          Write-Output "Do you want to continue from the last calculation?"
          $yesorno = Read-Host "( Y | N )"
          if ($yesorno -contains $global:no) {
            $solution = Get-MathOperationMinus
          }
          else {
            $solution = Get-MathOperationMinus -Int1 $solution
          }
          Write-Output "Solution: $solution"
        }
        3 {
          Write-Output "Do you want to continue from the last calculation?"
          $yesorno = Read-Host "( Y | N )"
          if ($yesorno -contains $global:no) {
            $solution = Get-MathOperationMultiply
          }
          else {
            $solution = Get-MathOperationMultiply -Int1 $solution
          }
                    
          Write-Output "Solution: $solution"
        }
        4 {
          Write-Output "Do you want to continue from the last calculation?"
          $yesorno = Read-Host "( Y | N )"
          if ($yesorno -contains $global:no) {
            $solution = Get-MathOperationDivide
          }
          else {
            $solution = Get-MathOperationDivide -Int1 $solution
          }
                    
          Write-Output "Solution: $solution"
        }
        5 {
          Write-Output "Do you want to continue from the last calculation?"
          $yesorno = Read-Host "( Y | N )"
          $script:factOut = 1
          if ($yesorno -contains $global:no) {            
            Get-Fact
            $solution = $script:factOut
          }
          else {
            $solution = Get-Fact -Int1 $solution
            $solution = $script:factOut
          } 
          Write-Output "Solution: $solution"
        }
        default { Write-Host -ForegroundColor Red "`nInvalid entry`n" }
      }
    }    
    #default { Write-Host "`nI don't understand what you want to do." -ForegroundColor Red }  
  }

  #Output if user types "N"
  elseif ($global:yesorno -contains $global:no) {
    Write-Output "( ˘_˘ )"
    Start-Sleep -Seconds 3
    Clear-Host
    break
  }

  #Output if user types anything except for "Y" or "N"
  else {
    Write-Output "Please, use <Y> or <N>!"
    Start-Sleep -Seconds 3
    Clear-Host
    break
  }
}

Get-Calculation