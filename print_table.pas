unit print_table;

interface
    uses crt, types;
    {Print tables head}
    procedure print_head;

    {Print table's bot}
    procedure print_bot;

    {Print one row}
    procedure print_row(i:integer;work:a);

    {Print body}
    procedure print_body(work:a; var i:integer);

implementation

    {Print tables head}
    procedure print_head;
    begin
        {Tables head}
        writeln('+==+==============+=====================+========================+==============+');
        writeln('| N|  Group code  |   Children number   |      Teacher name      |  Group type  |');
    end;


    {Print table's bot}
    procedure print_bot;
    begin
        {Table's bot}
        writeln('+==+==============+=====================+========================+==============+');
    end;

    {Print one row}
    procedure print_row(i:integer;work:a);
    var x:integer;
    begin
        {Print the number of string}
        if i <= 9 then 
            write('| ',i,'| ')
        else
            write('|',i,'| ');
        {endif}

        {Print group_code}
        write(work^.value.group_code);

        {Alignment group_code}
        if {!!!CHANGE here->}20>length(work^.value.group_code) then
            for x:=1 to 20-length(work^.value.group_code) do
                write(' ');
            {endfor x}
        {endif}

        {Print children_number}      
        write(' |',work^.value.children_number:{!!!CHANGE here->}10,' |');

        {Print Points}
        write(work^.value.teacher_name:{!!!CHANGE here->}9,' |');

        {Print group_type} 
        case work^.value.group_type of
            yaselnaya:
                {!!!CHANGE length here->} write(' Yaselnaya ');
            mladshaya: 
                {!!!CHANGE length here->} write(' Mladshaya ');
            srednaya: 
                {!!!CHANGE length here->} write(' Srednaya  ');
            starshaya:
                {!!!CHANGE length here->} write(' Starshaya ');
        end;
        writeln('|'); 
    end;

    {Print body}
    procedure print_body(work:a; var i:integer);
    begin
        clrscr;
        {Print Head}
        print_head;
        i:=0; 
        {Print body}
        repeat
            i:= i + 1;
            if i=20 then
                begin
                    print_row(i,work);
                    print_bot;
                    work:=work^.next;
                    writeln('Press any key...');
                    readln();
                    print_head;
                    continue;
                end;
            {Print punkt with number i}
            print_row(i,work);
            {move to the next item}
            work:=work^.next;
        until work=nil;
        {Print bot} 
        print_bot;
    end;

end.