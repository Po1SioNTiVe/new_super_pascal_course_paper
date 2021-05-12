unit menu;

interface
    uses crt, types;
    function print_menu(menu:menu_array; n:byte; x1,y1:byte):integer;

implementation

    function print_menu(menu:menu_array; n:byte; x1,y1:byte):integer;
    var key_code:char;
        i,j,maxlength:byte;
        x2,y2:byte;
        curent_item:integer = (0);

    begin
        {Find maxlength of menu items}
        maxlength:=length(menu[1]);
        for i:=2 to n do
            if maxlength < length(menu[i]) then
                maxlength:=length(menu[i]); 
            {endif maxlength<length(menu[i])}
        {endfor i}

        x2:=x1 + maxlength;
        y2:=y1+n;
        for i:=1 to n do
            {add the required number of spaces to the line i}
            for j:=1 to maxlength-length(menu[i]) do
                menu[i]:=menu[i]+' ';
            {endfor j}
        {endfor i}
        
        
        textbackground(black);
        window(x1,y1,x2,y2);
        textbackground(black);
        gotoxy(1,1);
        for i:=1 to n do
            writeln(menu[i]);
        {endfor i}

        curent_item:=1;
        repeat
            gotoxy(1,curent_item);
            textbackground(blue);
            {Output item menu with index curent_item}
            write(menu[curent_item]);
            key_code:=readkey;
            {Check for availability}
            if ord(key_code)=0 then 
                key_code:=readkey;
            {endif ord(key_code)=0}  
            gotoxy(1,curent_item);
            textbackground(black);
            {Output item menu with index curent_item}
            write(menu[curent_item]);
            {Check symbol code key_code}
            case ord(key_code) of

                {Character code esc}   
                27: begin
                        curent_item:=0;
                        window(1,1,80,25); 
                        textbackground(black);
                        break;
                    end;

                {Character code enter}
                13: begin
                        window(1,1,80,25);
                        textbackground(black);
                        break;
                    end;

                {Character code arrow up}
                72: begin
                        curent_item:=curent_item-1;
                        {Check on reaching the start of the menu}
                        if curent_item=0 then
                            curent_item:=n;
                        {endif curent_item=0}  
                    end;

                {Character code arrow down}
                80: begin
                        curent_item:=curent_item+1;
                        {Check on reaching the start of the menu}
                        if curent_item=n+1 then
                            curent_item:=1;
                        {endif curent_item=n+1} 
                        end;
                    end;    
                         
            {endcase ord(key_code)}
        until false;
        print_menu:=curent_item;
    end;
    {endprocedure print_menu} 
end.