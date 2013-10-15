(* A date has a positive year, a month between 1 and 12*)
(*, and a day no greater than 31*)

(* make get year more expressive waiting to learn for records *)
fun get_year(date: int*int*int) = #1 date

(* make get month more expressive waiting to learn for records *)
fun get_month(date: int*int*int) = #2 date

(* make get day more expressive waiting to learn for records *)
fun get_day(date: int*int*int) =  #3 date

val month_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
val month_days_leap_year = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
val months = ["January", "February", "March", "April", "May", "June", "July","August", "September", "October","November", "December"]

fun is_older(date1: int*int*int, date2: int*int*int) = 
    let 
    fun normalize(date: int*int*int) = 
        get_year(date) * 10000 + get_month(date)* 100 + get_day(date)
    in
        normalize(date1) < normalize(date2)
    end

fun in_month(date: int*int*int, month: int) = 
    get_month(date) = month 
 
fun number_in_month(dates: (int*int*int) list, month: int) = 
    if null dates then 0
    else if in_month(hd dates, month) then 1 + number_in_month(tl dates, month)
    else number_in_month(tl dates, month)
    
fun number_in_months(dates: (int*int*int) list, months: int list) = 
    if null months orelse null dates
    then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months)
        
fun dates_in_month(dates: (int*int*int) list, month: int) = 
    if null dates then []
    else if in_month(hd dates, month) then (hd dates) :: dates_in_month(tl dates, month)
    else dates_in_month(tl dates, month)

fun dates_in_months(dates: (int*int*int) list, months: int list) = 
    if null months 
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

fun get_nth(strs: string list, n: int) = 
    if n = 1
    then hd strs
    else get_nth(tl strs, n - 1)

fun date_to_string(date: (int*int*int)) = 
    get_nth(months, get_month(date)) ^ " " ^ Int.toString(get_day(date)) ^ ", " ^ Int.toString(get_year(date))

fun number_before_reaching_sum(sum: int, nums: int list) = 
    let 
    fun seek_number(dec: int, rem: int list) = 
        if dec <= 0 then ~ 1 
        else if null rem then 0          
        else 1 + seek_number(dec - hd rem, tl rem)
    in
        seek_number(sum, nums)
    end

fun what_month(day: int) = 
    number_before_reaching_sum(day, month_days) + 1

fun month_range(day1: int, day2: int) = 
    if day1 <= day2
    then what_month(day1)::month_range(day1 + 1, day2) 
    else []

fun oldest(dates: (int*int*int) list) = 
    let
        fun get_oldest(curr: (int*int*int) option, maybe: (int*int*int)) = 
            if isSome(curr) andalso is_older(valOf curr, maybe) 
            then curr 
            else SOME(maybe)
        fun seek_oldest(oldest: (int*int*int) option, rem: (int*int*int) list) =
            if null rem
            then oldest
            else seek_oldest(get_oldest(oldest, hd rem), tl rem)
    in
        seek_oldest(NONE, dates)
    end
    
fun remove (x, xs) = 
    if null xs then []
    else let val h = hd xs
         in if x = h 
            then remove(x, tl xs) 
            else h::remove(x, tl xs) 
         end
         
fun filter_duplicates xs = 
    if null xs
    then []
    else let val h = hd xs
         in h::filter_duplicates(remove(h, tl xs)) end
         
fun is_leap_year(year: int) = 
    (year mod 400) = 0 orelse ((year mod 4) = 0 andalso (year mod 100) > 0)

fun number_in_months_challenge(dates: (int*int*int) list, months: int list) = 
    number_in_months(dates, filter_duplicates months)
    
fun dates_in_months_challenge(dates: (int*int*int) list, months: int list) = 
    dates_in_months(dates, filter_duplicates months)
    
fun reasonable_date(date: (int*int*int)) = 
    let  (* hides previously defined specific function*)
        fun get_nth (n, xs) = if n = 1 then hd xs else get_nth(n - 1, tl xs) 
    
        fun reasonable_year(date: (int*int*int)) = (get_year date) > 0
           
        fun reasonable_month(date: (int*int*int)) = 
            let val m = get_month date in 1 <= m andalso m <= 12 end
        
        fun reasonable_day(date: (int*int*int)) = 
            let 
                val ms = if is_leap_year(get_year date) then month_days_leap_year else month_days
            in 
                let val d = get_day date 
                in 1 <= d andalso d <= get_nth(get_month date, ms) end
            end       
    in 
        reasonable_year(date) andalso reasonable_month(date) andalso reasonable_day(date)
    end
    

         

            