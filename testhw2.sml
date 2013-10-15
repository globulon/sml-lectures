(* Homework2 Simple Test *)

use "hw2.sml";

val test1_1 = all_except_option("string", ["string"]) = SOME []
val test1_2 = all_except_option("string", []) = NONE
val test1_3 = all_except_option("string", ["1", "2", "3"]) = NONE
val test1_4 = all_except_option("1", ["1", "2", "3"]) = SOME ["2", "3"]
val test1_5 = all_except_option("2", ["1", "2", "3"]) = SOME ["1", "3"]
val test1_6 = all_except_option("3", ["1", "2", "3"]) = SOME ["1", "2"]

val test2_1 = get_substitutions1([["foo"],["there"]], "foo") = []
val test2_2 = get_substitutions1([], "foo") = []
val test2_3 = get_substitutions1([["foo", "bar"],["there"]], "foo") = ["bar"]
val test2_4 = get_substitutions1([["foo", "bar"],["foo", "baz"]], "foo") = ["bar", "baz"]
val test2_5 = get_substitutions1([["there"],["foo", "baz"]], "foo") = ["baz"]
val test2_6 = get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") = ["Fredrick","Freddie","F"]
val test2_7 = get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],"Jeff") = ["Jeffrey","Geoff","Jeffrey"]

(*add tests for recursion*)
val test3_1 = get_substitutions2([["foo"],["there"]], "foo") = []
val test3_2 = get_substitutions2([], "foo") = []
val test3_3 = get_substitutions2([["foo", "bar"],["there"]], "foo") = ["bar"]
val test3_4 = get_substitutions2([["foo", "bar"],["foo", "baz"]], "foo") = ["bar", "baz"]
val test3_5 = get_substitutions2([["there"],["foo", "baz"]], "foo") = ["baz"]
val test3_6 = get_substitutions2([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") = ["Fredrick","Freddie","F"]
val test3_7 = get_substitutions2([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],"Jeff") = ["Jeffrey","Geoff","Jeffrey"]

val test4_1 = similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
	    [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"},
	     {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith", middle="W"}]
val test4_2 = similar_names([], {first="Fred", middle="W", last="Smith"}) = [{first="Fred", last="Smith", middle="W"}];
val test4_3 = similar_names([["Elizabeth","Betty"],["Bernard", "Bernie"]], {first="Fred", middle="W", last="Smith"}) =
    [{first="Fred", last="Smith", middle="W"}]
         
val test5_1 = card_color((Clubs, Num 2)) = Black    
val test5_2 = card_color((Spades, Queen)) = Black      
val test5_3 = card_color((Diamonds, Jack)) = Red
val test5_4 = card_color((Hearts, King)) = Red

val test6_1 = card_value((Clubs, Num 2)) = 2     
val test6_2 = card_value((Spades, Num 7)) = 7
val test6_3 = card_value((Hearts, Ace)) = 11
val test6_4 = card_value((Diamonds, Jack)) = 10
val test6_5 = card_value((Clubs, Queen)) = 10
val test6_6 = card_value((Spades, King)) = 10

exception TestException;

val test7_1 = remove_card([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []
val test7_2 = remove_card([(Hearts, Ace), (Spades, Num(2)), (Hearts, King)], (Hearts, Ace), IllegalMove) = 
    [(Spades, Num(2)), (Hearts, King)]
val test7_3 = remove_card([(Hearts, Ace), (Spades, Num(2)), (Hearts, King), (Hearts, Ace)], (Hearts, Ace), IllegalMove) = 
    [(Spades, Num(2)), (Hearts, King), (Hearts, Ace)]
val test7_4 = (remove_card([], (Hearts, Ace), IllegalMove) handle IllegalMove => [(Hearts, Ace)]) =  [(Hearts, Ace)]
val test7_5 = (remove_card([(Spades, Num(2)), (Hearts, King)], (Hearts, Ace), IllegalMove) handle IllegalMove => [(Hearts, Ace)]) =  [(Hearts, Ace)];

val test8_1 = all_same_color([(Hearts, Ace), (Hearts, Ace)]) = true
val test8_2 = all_same_color([]) = true
val test8_3 = all_same_color([(Hearts, Ace), (Spades, Ace)]) = false
val test8_4 = all_same_color([(Hearts, Ace), (Hearts, Num(7)), (Hearts, Jack)]) = true
val test8_5 = all_same_color([(Hearts, Ace), (Hearts, Num(5)), (Spades, Ace)]) = false

val test9_1 = sum_cards([(Clubs, Num 2),(Clubs, Num 2)]) = 4
val test9_2 = sum_cards([(Clubs, Num 2),(Clubs, Num 3), (Spades, Ace), (Diamonds, Queen)]) = 26
val test9_3 = sum_cards([]) = 0

val test10_1 = score([(Hearts, Num 2),(Clubs, Num 4)],10) = 4
val test10_2 = score([(Hearts, Num 2),(Hearts, Num 4)],10) = 2
val test10_3 = score([(Hearts, Num 2),(Clubs, Num 4), (Diamonds, King)],10) = 18
val test10_4 = score([(Hearts, Num 2),(Hearts, Num 4), (Hearts, King)],10) = 9;
(* ask for specifics about holding no cards *)
val test10_5 = score([],10) = 5

val test11_1 = officiate([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6
val test11_2 = officiate([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                       [Draw,Draw,Draw,Draw,Draw],
                       42)
             = 3
val test11_3 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false) 
              handle IllegalMove => true);
    
(*to be removed*)
 OS.Process.exit(OS.Process.success);
