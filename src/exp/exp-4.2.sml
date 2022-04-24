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

 
(*begin*)
fun findOdd([]) = NONE
  | findOdd(x::xs) = if x mod 2 = 0 then findOdd(xs) else SOME x
(*end*)


val INPUT = getIntList(6);
printInt (valOf(findOdd(INPUT)));