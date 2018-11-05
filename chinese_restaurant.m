function [table_sizes,pdf] = chinese_restaurant(p, T)
    table = zeros(1,T);
    table(1)=1;
    table_index = 2;

    for t=1:T
        if(binornd(1,p)==1) %open a new table
            table(table_index)= 1; %table_index refers to index of newly opened table
            table_index=table_index+1;
        else %join existing table
            A=[];
            for i=1:table_index-1
                A=horzcat(A,repelem(i,table(i)));
            end
            join_table = A(randi(length(A)));
            table(join_table) = table(join_table)+1;
        end
    end

    table_sizes = nonzeros(table)';
    my_hist=zeros(1,max(table_sizes));
    
    for i=1:table_index-1
        my_hist(table_sizes(i)) = my_hist(table_sizes(i))+1; %create histogram
    end
    pdf = my_hist/sum(my_hist);
end