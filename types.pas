unit types;
{module with types}

interface
    uses crt;
    const menu_fields_num = 7;
          x = 1;
          y = 6;

    type
        menu_array = array[1..menu_fields_num] of string;
        group_type_enum = (yaselnaya, mladshaya, srednaya, starshaya);
        a = ^data_node;
        
        data = record
            group_code: string;
            children_number: integer;
            teacher_name: string;
            group_type: group_type_enum;
        end;

        data_node = record
            value: data;
            next: a;
        end;

        file_type = file of data;

implementation

end.
