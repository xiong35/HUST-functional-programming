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
fun reverse([]) = []
    | reverse(a::aRest) = reverse(aRest)@[a]

fun reverse2 xs =
        let
            fun revhelp([], ys) = ys
                | revhelp (x::xs, y) = revhelp(xs, [x]@y)
        in
            revhelp(xs, [])
        end;

(*****End*****)

val R = getIntList(5);
printIntList (reverse R);
printIntList (reverse2 R); 