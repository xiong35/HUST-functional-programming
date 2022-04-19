
fun subsetSumOption(L, s) = 
          let fun innerSubsetSumOption([], 0) = true
                    | innerSubsetSumOption([], _) = false
                    | innerSubsetSumOption(l::ls, sum) = innerSubsetSumOption(ls, sum-l) orelse innerSubsetSumOption(ls, sum)
          in if innerSubsetSumOption(L, s) then SOME L else NONE
          end