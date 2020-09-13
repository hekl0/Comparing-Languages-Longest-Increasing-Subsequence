open Printf

let rec get_nth mylist index = match mylist with
    | [] -> raise (Failure "empty list")
    | first::rest -> 
        if index = 0 then first 
        else get_nth rest (index - 1)
;;

let rec bs x nums =
  let lo = ref 0 and hi = ref ((List.length nums) - 1) in
  while lo <= hi do
    let mid = ref ((!lo + !hi) / 2) in
    hi := if (get_nth nums !mid >= x) then !mid - 1 else !hi;
    lo := if (get_nth nums !mid >= x) then 0 else !mid + 1;
  done;
  !lo;;

let replace l pos a  = 
  List.mapi(fun i x -> if i = pos then a else x) l;;

let rec print_list = function
[] -> ()
| e::l -> print_int e; print_string" ";print_list l;;

let rec lis nums =
  let bucket = ref [] and order = ref [] in
  for i = 0 to (List.length nums) - 1 do
    let tmp = get_nth nums i in
    let pos = bs tmp !bucket in
    bucket := if pos == (List.length !bucket) then !bucket@[0] else !bucket;
    bucket := replace !bucket pos tmp;
    order := !order@[pos];
  done;
  
  let max_len = ref ((List.length !bucket) - 1) 
  and res = ref [] and len = ref ((List.length !order)) in
  for i = 0 to !len - 1 do
    let pos = !len - 1 - i in
    let tmp = get_nth !order pos in
    res := if tmp == !max_len then !res@[get_nth nums pos] else !res;
    max_len := !max_len - if tmp == !max_len then 1 else 0;
  done;
  
  print_list (List.rev !res);;

let main() =
  let n = read_int() and nums = ref[] in
  for i = 0 to n - 1 do
    let num = read_int() in
    nums := !nums@[num];
  done;
  lis !nums;;

let _ = main()