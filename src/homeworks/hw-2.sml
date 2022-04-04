fun ins x [] = [x]
    | ins x (y::ys) = 
        if x < y then x::y::ys
        else y :: (ins x ys)

fun isort [] = []
    | isort (x::L) = ins x (isort L)
    
    
fun all(your, base)=
        case your of
            0 => base
        | _=> "are belong to us"::all(your-1, base) 

fun funny (f, []) = 0
    | funny(f, x::xs)=f(x, funny(f, xs))

        (fn x => (fn y => x)) "Hello, World!"

fun fib n = 
        if n<=2 then 1
        else fib(n-1) + fib(n-2);

(* 这里改成 0 似乎合理一些? 从 1 开始计数, 和 fib 函数保持统一 *)
fun fibber (1: int) : int * int = (1, 1)
    | fibber (n: int) : int * int =
        let val (x: int, y: int) = fibber (n-1)
        in (y, x + y)
        end  