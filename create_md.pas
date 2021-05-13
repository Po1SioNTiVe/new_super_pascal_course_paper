program create_md;
uses types;

var start:a;

/////////////////////////////////////////////////////////////

{Create a list in dynamic memory}
procedure create_list(var start:a);
var n, i:integer;
    work:a;
begin
    {Enter the number of list}
    writeln('Enter the number of list items');
    readln(n);

    {create first element of list}
    new(start);
    writeln('Enter group code');
    readln(start^.value.group_code);
    writeln('Enter children number');
    readln(start^.value.children_number);
    writeln('Enter teacher name');
    readln(start^.value.teacher_name);
    repeat
        {$i-}
        writeln('Enter group type');
        readln(start^.value.group_type);
        if IOResult<>0 then  
            begin
                {Incorrect input message}
                writeln('Error input, enter correct value:');
                writeln('yaselnaya, mladshaya, srednaya, starshaya');
            end
        else break;
        {$i+}
    until false;
    start^.next := nil;
    work := start;
    {create next element of list}
    for i:=2 to n do
        begin
            new(work^.next);
            work := work^.next;
            writeln('Enter group code');
            readln(work^.value.group_code);
            writeln('Enter children number');
            readln(work^.value.children_number);
            writeln('Enter teacher name');
            readln(work^.value.teacher_name);
            repeat
                {$i-}
                writeln('Enter group type');
                readln(work^.value.group_type);
                if IOResult<>0 then  
                    begin
                        {Incorrect input message}
                        writeln('Error input, enter correct value:');
                        writeln('yaselnaya, mladshaya, srednaya, starshaya');
                    end
                else break;
                {$i+}
            until false;
            work^.next := nil;
        end;
    {end for i}
end;

{Write dynamic list to file and display it}
procedure write_to_file(work:a);
var f: file_type;
    str:data;
begin
    {open file m2.txt for write}
    writeln('Write in file');
    assign(f, 'm2.txt');
    rewrite(f);
    {write data of list to m2.txt}
    repeat
        write(f,work^.value);
        work := work^.next;
    until work = nil;
    close(f);
    {Read from file}
    writeln('Read from file');
    assign(f, 'm2.txt');
    reset(f);
    repeat
        read(f, str);
        write(str.group_code, str.children_number, str.teacher_name, str.group_type);
        writeln();
    until eof(f);
    close(f);
end;

begin
    create_list(start);
    write_to_file(start);

end.
