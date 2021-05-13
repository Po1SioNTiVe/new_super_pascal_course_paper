unit load_md;
{create md on physical memory and load it to dynamic memory}

interface
    uses types, crt;

    {create md}
    procedure new_md(var start:a; name_md:string);

    {load md}
    procedure load_mds(var start_1:a; var start_2:a);

implementation

    {Writing to the dynamic memory of the list from the name_md file}
    procedure new_md(var start:a; name_md:string);
    var f:file_type;
        work:a;
        buffer:data;
    begin
        {open file with name name_md for read}
        assign(f,name_md);
        reset(f);
        read(f,buffer);
        {read in memory first first element of list}
        new(start);
        start^.value.group_code := buffer.group_code;
        start^.value.children_number := buffer.children_number;
        start^.value.teacher_name := buffer.teacher_name;
        start^.value.group_type := buffer.group_type;
        start^.next := nil;
        work := start;
        {read in memory next elements of list}
        repeat
            read(f,buffer);
            new(work^.next);
            work:=work^.next;
            work^.value.group_code := buffer.group_code;
            work^.value.children_number := buffer.children_number;
            work^.value.teacher_name := buffer.teacher_name;
            work^.value.group_type := buffer.group_type;
            work^.next := nil;
        until eof(f);
        close(f);
    end;

    {Record in dynamic memory of lists of MD1 and MD2}
    procedure load_mds(var start_1:a; var start_2:a);
    begin   
        {load m1.txt}
        new_md(start_1,'m1.txt');
        {load m2.txt}
        new_md(start_2,'m2.txt');
        writeln('Workink with md1');
        writeln('Press any key');
        readln();
    end;
end.