# 随堂测试

## 1 分析题

从功能和性能两方面比较下列两个函数的异同点：

```sml
fun take( [ ], i) = [ ]
    | take(x::xs, i) =
         if i > 0 then x::take(xs, i-1)
         else [ ];

fun rtake ([ ], _, taken) = taken
     | rtake (x::xs,i,taken) =
          if i>0 then rtake(xs, i-1, x::taken)
          else taken;
```

take 函数取数组(第一个参数)中的前 n(第二个参数) 个元素并返回  
rtake 函数取数组(第一个参数)中的前 n(第二个参数) 个元素, 逆序后与第三个参数拼接并返回

性能上, 两个函数的 work 均为 O(n)

## 2 定义如下三个函数

```sml
fun hd (x::_) = x;
fun next(xlist, y::ys) : int list =
              if hd xlist < y
              then next(y::xlist, ys)
              else   let fun swap [x] = y::x::ys
                                |  swap (x::xk::xs)  = if xk > y
                                         then x::swap(xk::xs)
                                        else (y::xk::xs)@(x::xs)
                        in swap (xlist)
                        end;
fun nextperm(y::ys) = next ([y], ys);
```

调用上述代码，nextperm[2,3,1,4]的计算结果是什么？用“=>”详细描述其计算过程。

```txt
nextperm [2,3,1,4]
↓
next [2] [3, 1, 4]
↓
next [3, 2] [1, 4]
↓
swap [3, 2]
↓
3::swap([2])
   ↓
   1::2::4
↓
[3, 1, 2, 4]
```

## 3 编写函数 subsetSumOption: int list \* int -> int list option

要求：对函数 subsetSumOption(L, s)：如果 L 中存在子集 L'，满足其中所有元素之和为 s，则结果为 SOME L'；否则结果为 NONE。

```sml
fun subsetSumOption(L, s) =
          let fun innerSubsetSumOption([], 0) = true
                    | innerSubsetSumOption([], _) = false
                    | innerSubsetSumOption(l::ls, sum) = innerSubsetSumOption(ls, sum-l) orelse innerSubsetSumOption(ls, sum)
          in if innerSubsetSumOption(L, s) then SOME L else NONE
          end
```
