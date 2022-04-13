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

fun split [ ]  = ([ ], [ ]) 
    | split [x] = ([ ], [x])
    | split (x::y::L) =
        let val (A, B) =split L
        in (x::A, y::B) 	
        end;

datatype tree = Empty | Br of tree * int * tree; 

fun trav(Br(t1,a,t2)) = trav(t1)@(a::trav(t2))
    |trav empty = [];

fun listToTree ([] : int list) : tree = Empty
    | listToTree (x::l) = let val (l1, l2) = split l
        in Br(listToTree l1, x, listToTree l2)
        end;


(*begin*)

fun heapify(Empty : tree) = Empty
(* | heapify(Br(tl, x, tr)) =  *)


(* when given two trees, returns a value of type order, based on which tree has a larger value at the root node *) 
fun treecompare(Empty : tree, Empty : tree) = EQUAL
    |treecompare(Empty : tree, _ : tree) = LESS
    |treecompare(_ : tree, Empty : tree) = GREATER
    |treecompare(Br(t1l, v1, t1r), Br(t2l, v2, t2r)) = Int.compare(v1, v2)

fun SwapDown(Empty: tree) = Empty
    | SwapDown(Br(tl, v, tr)) = 
        if tl = Empty then 
            if tr = Empty then Br(tl, v, tr) (* 左右都为空 *)
            else (* 只有右非空 *)
                let val Br(trl, trv, trr) = SwapDown(tr) 
                in 
                    case Int.compare(trv, v) of 
                        LESS => Br(tl, trv, Br(trl, v, trr))
                    | _ => Br(tl, v, Br(trl, trv, trr))
                end
        else 
            if tr = Empty (* 只有左非空 *)
            then let val Br(tll, tlv, tlr) = SwapDown(tl) 
                in 
                    case Int.compare(tlv, v) of 
                        LESS => Br(Br(tll, v, tlr), tlv, tr)
                    | _ => Br(Br(tll, tlv, tlr), v, tr)
                end 
            else  (* 左右子树都不为空 *)
                let 
                    val Br(trl, trv, trr) = SwapDown(tr) 
                    val Br(tll, tlv, tlr) = SwapDown(tl)
                in 
                    if Int.compare(trv, tlv) = LESS(* 右边更小 *) then
                        case Int.compare(trv, v) of 
                            LESS (* 右边比 v 更小 *) => Br(Br(tll, tlv, tlr), trv, Br(trl, v, trr)) 
                        | _ => Br(Br(tll, tlv, tlr), v, Br(trl, trv, trr)) 
                    else (* 左边更小 *) 
                        case Int.compare(tlv, v) of 
                            LESS (* 左边比 v 更小 *) => Br(Br(tll, v, tlr), tlv, Br(trl, trv, trr)) 
                        | _ => Br(Br(tll, tlv, tlr), v, Br(trl, trv, trr))
                end

fun heapify(t) = SwapDown(t)


val L = getIntList(7);
printIntList (trav(heapify(listToTree L)));
