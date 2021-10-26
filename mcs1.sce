clc;
clear all;
disp("Shubham Shirsekar ET2 40 BATCH - E");
function [p1]=erlangB(A1, c1)// calculate blocking probability for Erlang B system
    pr2=0;
    pr1=A1^c1/factorial(c1);
    for k=1:c1
        pr2=pr2+(A1^k/factorial(k));
    end
    // A1=A1+1;
    p1=pr1/pr2;
endfunction
function [p2]=erlangC(A2, c2)// calculate probability of blocked call delayed in Erlang C system
    temp_1=0;
    for k=0:c2-1
        temp_1=temp_1+A2^k/factorial(k);
    end
    denominator=A^c2+(factorial(c2)*(1-(A2/c))*temp_1);
    p2=A2^c2/denominator;
endfunction
pr_blocking=input('enter probability of blocking');//enter probability of blocking for perticular system
pr_delay=input('enter probability of block call delay');//enter probability of blocked call delayed for particular system
    y=input('enter call rate');// Average no .of calls per minute
    H=input('enter the average call duration'); //Average call duration in minute
    c=input('enter no.of channels');//Enter no. of channels

    disp('no.of channel=');
    disp(c);
    Au=y*H;//Traffic intensity per user
    p=0;
    for A=1:1:100
        while(p<pr_blocking)//Find maximum traffic intensity for entered blocking probability pr_blocking
            [p]=erlangB(A,c)//calling function erlangB
            A=A+1;
        end
        disp(pr_blocking,'for blocking probability of');//display blocking probability
            disp(A-1,'Maximum traffic intensity is');//display max. traffic intensity
            u=(A-1)/Au;//no. of users calculation
            disp(u,'no .of users are accomodated');//display maximum no.of users accomodated in Erlang B system
            break;
        end//
        p=0;
        for A=1:1:100
            while(p<pr_delay)//Find maximum traffic intensity for entered blocking probability pr_blocking
                [p]=erlangC(A,c)//calling funtion to calculate erlang C probability
                A=A+1;
            end
            disp(pr_delay,'for block call delay probability of');//display blocking probability
                disp(A-1,'Maximum traffic intensity is');//display max. traffic intensity
                u=(A-1)/Au;
                disp(u,'no.of users are accomodated');//display maximum no.of users accomodated in Erlang C system
                break;
            end
