%mandelbrot set 
clear all
close all
for x=-1.5:.01:0.5 
    for y=-1:0.01:1
        z = x + y*i;
        z_n = 0;
        for k = 1:100
            z_n = (z_n)^2 + z;
            if abs(z_n) > 10;
                c = 'k';
                break
            else
                c = 'r';
            end
        end
        plot(x,y,'.','color',c);
            hold on;
    end
end

%same but using 'matrix-at-once' calculation (much quicker but less control on plots)
clear all
close all
x=-1.5:.01:0.5; 
y=-1:.01:1; 
[X,Y]=meshgrid(x,y);
Z=X+1i*Y;   % use 1i since you can overwrite i but 1i will always be sqrt(-1)
Zn=0*Z;     % Start with zeros everywhere
iter = zeros(length(x));

%This asks how many steps before each element of Zn exceeds 10. This
%plotting is still very slow
for k=1:100
    Zn=Zn.^2+Z;
    for i=1:numel(iter)
        if abs(Zn(i)) < 10
        iter(i) = iter(i) +1;
        end
    end
end
p=pcolor(X,Y,iter); set(p,'edgecolor','none'); axis equal

% Same but much faster plotting
for k=1:100
    Zn=Zn.^2+Z;
    iter = iter + ~(abs(Zn) > 10);
end
p=pcolor(X,Y,iter); set(p,'edgecolor','none'); axis equal


%Here then is the code for a detailed fractal. Decrease the steps between
%x's and y's and increase the number of iterations for more detail
clear all
close all
x=-1.5:.0001:0.5; 
y=-1:.0001:1; 
[X,Y]=meshgrid(x,y);
Z=X+1i*Y;   % use 1i since you can overwrite i but 1i will always be sqrt(-1)
Zn=0*Z;     % Start with zeros everywhere
iter = zeros(length(x));
for k=1:150
    Zn=Zn.^2+Z;
    iter = iter + ~(abs(Zn) > 10);
    k
end
p=pcolor(X,Y,iter); set(p,'edgecolor','none'); axis equal