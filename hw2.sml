(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(*Return NONE if the x itme is not in the list *)
(*return SOME lst where lst is identical to xs minus the searched item*)
fun all_except_option (x, xs) = 
    let 
        fun lookup ([]) = NONE
           | lookup (y::ys) =  
                if same_string(x,y)  then SOME(ys) 
                else case lookup ys of
                    SOME(zs) => SOME(y::zs)
                  | _ => NONE
    in lookup xs end

    
fun get_substitutions1 ([], s) = []
  | get_substitutions1 (xs::rest, s) =  
        case all_except_option(s, xs) of
                SOME(lst) => lst @ get_substitutions1(rest, s)
              | _ => get_substitutions1(rest, s)
              
fun get_substitutions2 (xs, s) = 
    let fun recur (acc, []) = acc
         | recur (acc, xs::rest) = 
            case all_except_option(s, xs) of
                SOME(lst) => recur(acc @ lst, rest)
              | _ => recur(acc, rest)
    in recur ([], xs) end

fun similar_names (xs, name) = 
    let 
        val {first = first, middle = middle, last = last} = name
        
        fun make_alias first_name = {first = first_name, middle = middle, last = last}
        
        fun map (acc, []) = acc
          | map (acc, x::rest) = map(acc @ [make_alias x], rest)           
    in name::map([], get_substitutions2(xs, first)) end
    
fun card_color (Clubs, _: rank) = Black
  | card_color (Spades, _) = Black
  | card_color _ = Red
  
fun card_value (_: suit, Num(v)) = v
    | card_value (_, Ace) = 11
    | card_value (_, _) = 10
 
(*RRRR : make it tail recursive*) 
fun remove_card ([], c, e) = raise e 
    | remove_card (c'::rest, c, e) = 
        if c = c' then rest else c::remove_card(rest, c, e)

fun all_same_color ([]) = true
    | all_same_color (c::[]) = true
    | all_same_color (c1::c2::rest) =  
        if (card_color c1 = card_color c2) then all_same_color(c2::rest) 
        else false
    
fun sum_cards cs = 
    let 
        fun fold_sum(acc, []) = acc
            | fold_sum(acc, c::rest) = fold_sum(acc + card_value c, rest)
    in fold_sum(0, cs) end
    
fun score (cs, goal) = 
    let 
        fun make_preliminary_score cs =
            let val sum = sum_cards cs
            in  if sum > goal then 3 * (sum - goal) else goal - sum end
            
        fun make_factor cs = if all_same_color cs then 2 else 1            
    in (make_preliminary_score cs) div (make_factor cs) end
    
fun officiate (cards, moves, goal) = 
    let 
        fun discard(hs, h) = remove_card(hs, h, IllegalMove)
    
        fun play (_  , hs, []) = score (hs, goal)
            | play (cs , hs, Discard(h)::ms) = play(cs, discard(hs, h), ms)
            | play ([], hs, Draw::_) = score(hs, goal)
            | play (c::cs, hs, Draw::ms) = 
                let val held = c::hs
                in  
                    if sum_cards held > goal  then score (held, goal) else play(cs, held, ms) 
                end
                
    in play(cards, [], moves) end
        
        
    
