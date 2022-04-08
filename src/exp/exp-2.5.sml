fun printInt (a:int) =
        print(Int.toString(a)^" ");

fun getInt () =
        Option.valOf (TextIO.scanStream (Int.scan StringCvt.DEC) TextIO.stdIn);
    
fun printIntList ( [] ) = ()
    | printIntList ( x::xs ) = 
        let
            val tmp = printInt(x)
        in
            printIntList(xs)
        end;

fun getIntList ( 0 ) = []
    | getIntList ( N:int) = getInt()::getIntList(N-1);

(*  完成Begin和End间代码 *)    
(*****Begin*****)
fun PrefixSum(nums) = 
        let
            fun sum([]) = 0
                | sum(x::xs) = sum(xs)+x
            fun sumHelp(added, [], sums) = sums
                | sumHelp(added, cur::rest, sums) = sumHelp(added@[cur], rest, sums@[sum(added@[cur])])
        in
            sumHelp([], nums, [])
        end;

fun fastPrefixSum(nums) = 
        let
            fun sumHelp(sums, [], curSum) = sums
                | sumHelp(sums, cur::rest, curSum) = sumHelp(sums@[cur+curSum], rest, curSum+cur)
        in
            sumHelp([], nums, 0)
        end;


  
(*****End*****)

val L = getIntList(3);
printIntList (PrefixSum L);
printIntList (fastPrefixSum L);
