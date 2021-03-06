program main;
uses crt, print_table, types, menu, procedures, load_md;

var k, i, w:integer;
    str_menu_array:menu_array = ('Add new element', 'Print current MD', 
    'Find element', 'Swap MD', 'Save specified element to the second md', 
    'Add all elements of curent MD to the end of 2nd MD', 'Exit program');
    
    start_1,start_2,work,work_link:a;

begin
    k:=1;
    i:=1;
    w:=0;
    {Creation of two data sets (MD)}
    start_1:=nil;
    load_mds(start_1,start_2);
    work_link:=start_1;
    repeat
        clrscr;
        {Print head}
        print_head;
        {Find curent item}
        work:=work_link;
        if i<>1 then
            begin
                repeat
                    w:= w + 1;
                    if w=i then
                        break;
                    work:=work^.next;
                until false;
                print_row(i,work);
                w:=0; 
            end
        else
            begin
                print_row(i,work_link);
            end;
        {Print bot}
        print_bot;

        {Menu implementation}
        k:=print_menu(str_menu_array, menu_fields_num, x, y);
        case k of
            {Add new element to the end of the curent MD}
            1:add_new_el(work_link, i);
            {Print all elements of the curent MD }
            2:print_current_md(work_link, i);
            {Find element by index}
            3:find_el(work_link, i);
            {Swap working MD}
            4:  begin
                    i := 1;
                    swap_md(work_link, start_1, start_2);
                end;
            {Saving the specified item in the second MD}
            5:  begin
                    if work_link = start_1 then 
                        saving_el(work_link,start_2,i)
                    else 
                        saving_el(work_link,start_1,i);
                    {endif}
                end;
            {Add all elements from the current MD to the end of the 2nd MD}
            6:  begin
                    if work_link = start_1 then
                        adding_all_to_second_md(work_link, start_2)
                    else
                        adding_all_to_second_md(work_link, start_1);
                    {endif}
                end;
            {Exit program}
            7:  begin
                    clrscr;
                    break;
                end;
        end;
        writeln('Enter any key...');
        readln();
    until false;
end.