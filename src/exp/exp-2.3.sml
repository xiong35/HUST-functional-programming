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
    | getIntList (N:int) = getInt()::getIntList(N-1);

 
(*** Begin ***)
fun interleave([], b: int list) = b
    | interleave(a: int list, []) = a
    | interleave(a1::a, b1::b) = a1::b1::interleave(a, b)
    


(*****End*****)

val L = getIntList(2);
val R = getIntList(6);
val O = interleave (L, R);
printIntList(O); 