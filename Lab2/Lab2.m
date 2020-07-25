clear all
close all
clc

%Exercise 1 - RLE Compression Algorithm
f = str2num('1 1 1 1 1 2 2 2 2 2 2 2 3 3 3 3 3 3 3'); %Transform our string to a numerical array (it has to be separated by space)
A = [f 0];                                            %Create a vector A with one more element to solve the "Index exceeds matrix dimensions" when I do f(i+1)
N = 1;
Comp = [];                                            %Initialization of final array

for i = 1:length(A)-1                                 %Checks all the array
    if A(i) == A(i+1)                                 %Checks if current number is equal to the next
        N = N+1;                                      %Add 1 to our Nr flag
    else
        New = [A(i) N-1];                             %A(i+1) is different from A(i), we will convert the A(i+1) to our N
        Comp = horzcat(Comp,New);                     %Append all the arrays
        N = 1;                                        %Reset Nr flag
    end
end

%Exercise 2 - ByteRun Compression Algorithm
String = str2num('1 1 1 1 1 2 2 2 2 2 2 2 4 4 4 4 4 4 4');
A = [String 0];
Dictionary = [];
Compres = [];

for i = 1:length(A)-1
    B = numel(Dictionary);
    Match = cell(1,B);
    for j = 1:B
        if ~find(A{i} == Dictionary{j})  
            Dictionary = horzcat(Dictionary, A(i));
        else
            Compress = horzcat(Compress, Dictionary(i));
        end
    end
end