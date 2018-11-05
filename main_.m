clc; clear all; close all;
p=[0.2 0.5 0.7];
T=10000;

for i=1:3
    [table_sizes,pdf] = chinese_restaurant(p(i), T);
    figure;
    plot(min(table_sizes):max(table_sizes),pdf,'bo');
    set(gca,'xscale','log');
    set(gca,'yscale','log');
    title(['p = ' num2str(p(i))]);
    xlabel('Table sizes (number of customers in a table)');
    ylabel('Fraction of tables');
end