%episunapteptai monoselido *.pdf me parathrhseis 
%kai eksodous tou visualizer.m
for b = 8:12
    d = fix(b/2);
    root = './data/';
    first = 30;
    last = 39;
    seq = 'coast';
    figure;
    hold on;
    for current = first:(last-1)        
        file_pat = [root seq '/' seq '_%03d.gif'];
        I = indread(sprintf(file_pat, current));
        J = indread(sprintf(file_pat, current+1));
        [fvx, fvy, obj] = bm_obj(I, J, [b b], [d d]);
        subplot(3, 3, current-first+1);
        imshow(obj);
    end;
    hold off;
    name = sprintf('Movement found(white) with b = %d and d = %d.',b,d);
    suptitle(name);
end;