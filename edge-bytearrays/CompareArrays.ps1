# This script can be used to find the "random" bytes that should be skipped
# when the UnpinApps script looks for pinned apps. Dump the app byte arrays
# on two different computers, put them in the $array1 and $array2 variables
# and run the script. It will print out the index numbers of bytes that are
# different.

$array1 = @()
$array2 = @()
$counter = 0

if ($array1.Length > $array2.Length)
{
    $lastIndex = ($array1.Length - 1)
}
else
{
    $lastIndex = ($array2.Length - 1)
}

while ($counter -le $lastIndex)
{
    if ($array1[$counter] -ne $array2[$counter])
    {
        $counter
    }
    $counter++
}