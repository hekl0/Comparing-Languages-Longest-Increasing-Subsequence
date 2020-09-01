with Ada.Integer_Text_IO, Ada.Text_IO, Ada.Containers.Indefinite_Vectors, Ada.Strings.Fixed, Ada.Strings.Maps;
use Ada.Integer_Text_IO, Ada.Text_IO, Ada.Containers, Ada.Strings, Ada.Strings.Fixed, Ada.Strings.Maps;

procedure A1 is
    MAX_NUM: Integer := 100000;

    type Value is tagged record
        leng, index: Integer;
    end record;

    package Integer_Vectors is new Indefinite_Vectors(Positive, Integer);

    arr: Integer_Vectors.Vector;
    fenwick_tree: array (0..MAX_NUM) of Value;
    trace: array (0..MAX_NUM) of Value;
    val, new_val, ans: Value;

    function Input return Integer_Vectors.Vector is
        INPUT_MAX_SIZE: Integer := 100000;
        Input: String(1..INPUT_MAX_SIZE);
        len: Natural;
        Output: Integer_Vectors.Vector := Integer_Vectors.Empty_Vector;
        Start: Positive;
        Finish: Natural := 0;
    begin
        get_line(Input, len);
        Start := Input(1..len)'First;
        while Start <= Input(1..len)'Last loop
            Find_Token(Input, To_Set(' '), Start, Outside, Start, Finish);
            exit when Start > Finish;
            if Finish > len then
                Finish := len;
            end if;
            Output.Append(Integer'Value(Input(Start..Finish)));
            Start := Finish + 1;
        end loop;
        return Output;
    end Input;

    procedure update(index: Integer; val: Value) is
        i: Integer;
        temp: Integer;
    begin
        i := index;
        while i < MAX_NUM loop
            if fenwick_tree(i).leng < val.leng then
                fenwick_tree(i) := val;
            end if;
            temp := 1;
            while (i mod (temp*2)) = 0 loop
                temp := temp*2;
            end loop;
            i := i + temp;
        end loop;
    end update;

    function get(index: Integer) return Value is
        res: Value := (0, 0);
        i: Integer;
        temp: Integer;
    begin
        i := index;
        while i > 0 loop
            if res.leng < fenwick_tree(i).leng then
                res := fenwick_tree(i);
            end if;
            temp := 1;
            while (i mod (temp*2)) = 0 loop
                temp := temp*2;
            end loop;
            i := i - temp;
        end loop;
        return res;
    end get;

    procedure printAns(index: Integer) is
    begin
        if trace(index).leng /= 0 then
            printAns(trace(index).index);
        end if;
        put(arr(index), Width => 0);
        put(" ");
    end printAns;

begin
    arr := Input;
    ans := (0, 0);
    for i in 1..Integer(arr.Length) loop
        val := get(arr(i)-1);
        trace(i) := val;

        new_val := (val.leng+1, i);

        update(arr(i), new_val);

        if ans.leng < new_val.leng then
            ans := new_val;
        end if;
    end loop;

    printAns(ans.index);
    put_line("");
end A1;