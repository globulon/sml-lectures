(* Homework1 Extended Test *)

use "dates.sml";

val test1_1 = is_older((1,2,3),(2,3,4)) = true
val test1_2 = is_older((1,2,3),(1,2,3)) = false
val test1_3 = is_older((2,3,4),(1,2,3)) = false

val test2_1 = number_in_month([(2012,2,28),(2013,12,1)],2) = 1
val test2_2 = number_in_month([(2012,2,28),(2013,12,1)],3) = 0
val test2_3 = number_in_month([(2010, 2, 23),(2012,2,28),(2013,3,1)],2) = 2
val test2_4 = number_in_month([],2) = 0

val test3_1 = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val test3_2 = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = 0
val test3_3 = number_in_months([],[2,3,4]) = 0
val test3_4 = number_in_months([(2012,4,28),(2013,5,1),(2011,6,31),(2011,7,28)],[2,3,10]) = 0

val test4_1 = dates_in_month([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val test4_2 = dates_in_month([],2) = []
val test4_3 = dates_in_month([(2012,2,28),(2013,12,1)],5) = []

val test5_1 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test5_2 = dates_in_months([],[2,3,4]) = []
val test5_3 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = []
val test5_4 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[1,5,7]) = []

val test6_1 = get_nth(["hi", "there", "how", "are", "you"], 2) = "there"
val test6_2 = get_nth(["hi", "there", "how", "are", "you"], 1) = "hi"
val test6_3 = get_nth(["hi", "there", "how", "are", "you"], 5) = "you"

val test7_1 = date_to_string((2013, 6, 1)) = "June 1, 2013"
val test7_2 = date_to_string((2013, 1, 20)) = "January 20, 2013"

val test8_1 = number_before_reaching_sum(10, [1,2,3,4,5]) = 3
val test8_2 = number_before_reaching_sum(9, [1,2,3,4,5]) = 3
val test8_3 = number_before_reaching_sum(11, [1,2,3,4,5]) = 4
val test8_4 = number_before_reaching_sum(20, [1,2,3,4,5]) = 5
val test8_5 = number_before_reaching_sum(5, [10,2,3,4,5]) = 0
val test8_6 = number_before_reaching_sum(10, [1,2,3,4]) = 3

val test9_1 = what_month(70) = 3
val test9_2 = what_month(1) = 1
val test9_3 = what_month(31) = 1
val test9_4 = what_month(32) = 2
val test9_5 = what_month(59) = 2
val test9_6 = what_month(60) = 3
val test9_7 = what_month(365) = 12

val test10_1 = month_range(31, 34) = [1,2,2,2]
val test10_2 = month_range(31, 31) = [1]
val test10_3 = month_range(34, 31) = []

val test11_1 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val test11_2 = oldest([]) = NONE

val test12_1 = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val test12_2 = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = 0
val test12_3 = number_in_months_challenge([],[2,3,4]) = 0
val test12_4 = number_in_months_challenge([(2012,4,28),(2013,5,1),(2011,6,31),(2011,7,28)],[2,3,10]) = 0
val test12_5 = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4,4,3]) = 3
val test12_6 = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,2,2,2,2]) = 1

val test13_1 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test13_2 = dates_in_months_challenge([],[2,3,4]) = []
val test13_3 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = []
val test13_4 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[1,5,7]) = []
val test13_5 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4,4,3]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test13_6 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,2,2,2,2]) = [(2012,2,28)]

val test14_1 = reasonable_date((1971, 8, 28)) = true
val test14_2 = reasonable_date((0, 8, 28)) = false
val test14_3 = reasonable_date((0, 2, 29)) = false
val test14_4 = reasonable_date((1971, 13, 28)) = false
val test14_5 = reasonable_date((1971, 8, 34)) = false
val test14_6 = reasonable_date((4, 2, 29)) = true
val test14_7 = reasonable_date((400, 2, 29)) = true
val test14_8 = reasonable_date((100, 2, 29)) = false

