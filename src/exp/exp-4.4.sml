fun printBool (a:bool) = print(Bool.toString(a)^" "); 

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

fun isOdd (0) = false
  | isOdd (1) = true
  | isOdd (n) = isOdd (n mod 2);

(*begin*)
fun exists(f) = 
    let fun returnFn([]) = false
        | returnFn(x::xs) = if f(x) = true then true else returnFn(xs)
    in returnFn
    end
(*end*)

val INPUT = getIntList (6);
printBool (exists isOdd INPUT);