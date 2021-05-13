unit procedures;

interface

    uses types, crt, print_table;

    {Adding new data to the end of the current MD}
    procedure add_new_el(start:a; var index_current_value:integer);

    {Print of all elements of MD}
    procedure print_current_md(work:a;var index_current_value:integer);

    {Find item by number}
    procedure find_el(start:a; var index_current_value:integer);

    {Going to work with another MD}
    procedure swap_md(var work_link:a; first_md,second_md:a);

    {Saving the specified item in the second MD}
    procedure saving_el(start1:a;start2:a; index_current_value:integer);

    {Adding all elements of the current MD to the end of the second MD.}
    procedure adding_all_to_second_md(start1:a;start2:a);


implementation

    {Adding new data to the end of the current MD}
    procedure add_new_el(start:a; var index_current_value:integer);
    var n,w,i:integer;
        work:a;
    begin
        {Input and initialization}
        clrscr;
        i:=0;
        w:=1;
        write('How many elements do you want to add?');
        readln(n);
        work:=start;
        {Going to the end of md}
        repeat 
            w:= w + 1;
            work:= work^.next;
        until work^.next = nil;
        clrscr;
        repeat
            {Adding element}
            i:= i + 1;
            new(work^.next);
            work:=work^.next;
            {Input group_code, children_number, teacher_name for new element}
            writeln('Enter Group code');
            readln(work^.value.group_code);
            writeln('Enter Children number');
            readln(work^.value.children_number);
            writeln('Enter Teacher name');
            readln(work^.value.teacher_name);
            {error point in case of error}
            repeat
                {$i-}
                {Input group type for new element}
                writeln('Enter Group type');
                readln(work^.value.group_type);
                if IOResult<>0 then  
                    begin
                        {Incorrect input message}
                        writeln('Error input, enter correct value:');
                        writeln('yaselnaya, mladshaya, srednaya, starshaya')
                    end
                else break;
                {$i+}
            until false;
            work^.next:=nil;
            Writeln('Press any key...');
            readln();
            clrscr;
        until i = n;
        {Print Table}
        print_body(start,n);
        writeln(i,' elements was added');
        {Retern current value index}
        index_current_value:=w + i;
    end;

    {Print of all elements of MD}
    procedure print_current_md(work:a;var index_current_value:integer);
    var i:integer;
    begin
        clrscr;
        i:=0;
        print_body(work,i);
        index_current_value:=i;
    end;


    {Find item by number}
    procedure find_el(start:a; var index_current_value:integer);
    var find:integer;
        i:integer;
        work:a;
    begin
        clrscr;
        i:=0;
        Write('Enter number you want:');
        readln(find);
        work:=start;
        {Finding the right item}
        repeat
            i:= i + 1;
            if find = i then
                break;
            {endif}
            work:=work^.next;
        until work = nil;
        if work = nil then 
            {Message about empty element}
            writeln('Nothing found')
        else
            begin
                {Print found item}
                print_head();
                print_row(find,work);
                print_bot();
                {Return current value index}
                index_current_value:=find;
            end;
        {endif}
    end;


    {Going to work with another MD}
    procedure swap_md(var work_link:a; first_md,second_md:a);
    begin
        clrscr;
        writeln('Swapping md...');
        {Swap m1 and m2}
        if work_link = first_md then 
            work_link:=second_md
        else 
            work_link:=first_md;
        {endif}
    end;


    {Saving the specified item in the second MD}
    procedure Saving_el(start1:a;start2:a; index_current_value:integer);
    var i,find:integer;
        work,work2:a;
    begin
        clrscr;
        i:=0;
        Write('Enter number you want:');
        readln(find);
        work:=start1;
        {Finding the right item}
        repeat
            i:= i + 1;
            if find = i then
                break;
            {endif}
            work:=work^.next;
        until work = nil;
        {Message about empty link}
        if work = nil then 
            {Message about empty element}
            writeln('Nothing found')
        else
            begin
                work2:=start2;
                {Going to the end of the second md}
                repeat
                    work2:=work2^.next
                until work2^.next=nil;
                {Saving the specified item in the second MD}
                new(work2^.next);
                work2:=work2^.next;
                work2^.value:=work^.value;
                work2^.next:=nil;
            end;
        {endif}
    end;


    {Adding all elements of the current MD to the end of the second MD.}
    procedure adding_all_to_second_md(start1:a;start2:a);
    var work1,work2,swap1,swap2:a;
    begin
        clrscr;
        writeln('Adding MD');
        work1:=start1;
        work2:=start2;
        new(swap1);
        swap1^.value:=start1^.value;
        swap2:=swap1;
        {Copy current md}
        repeat
            if work1^.next = nil then break;
            new(swap2^.next);
            swap2:=swap2^.next;
            work1:=work1^.next;
            swap2^.value:=work1^.value;
            swap2^.next:=nil
        until false;
        {Going to the end of the second md}
        repeat
            work2:=work2^.next
        until work2^.next=nil;
        {Adding all elements of the current MD to the end of the second MD}
        work2^.next:=swap1;
    end;
end.