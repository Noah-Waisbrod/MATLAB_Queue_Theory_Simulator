function X = queueSim(L, T)
    %variables
    u = 0.75;
    qLenList = zeros(1,T);
    Qlen = 0;

    % sim Q
    for t = 0:1:T
        %generate rand
        tempL = rand();
        tempU = rand();

        %add to queue
        if(tempL < L)
            Qlen = Qlen + 1;
        end
        
        %process item in queue
        if(Qlen > 0 && tempU < u)
            Qlen = Qlen - 1;
        end

        %record len
        qLenList(t+1) = Qlen;
    end    

    % Plot queue length
    str = sprintf('Queue Length Plot for λ = %.3f', L);

    figure;
    plot(qLenList);
    xlim([0 T]);
    xlabel('Timeslot');
    ylabel('Queue Length');
    title(str);

    % Calcualtions
    avgQlen = mean(qLenList);

    Qdelay = avgQlen/L;

    %return
    X = [avgQlen, Qdelay];
end