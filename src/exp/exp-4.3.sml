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

fun double (0 : int) : int = 0
  | double n = 2 + double (n - 1);

(*begin*)
fun mapList(f, []) = []
  | mapList(f, x::xs) = f(x)::mapList(f, xs)
fun mapList2(f) =
    let fun returnFn([]) = []
        | returnFn(x::xs) = f(x)::returnFn(xs) 
    in returnFn 
    end
(*end*)

val INPUT = getIntList(6);
printIntList (mapList (double, INPUT));
printIntList (mapList2 double INPUT);