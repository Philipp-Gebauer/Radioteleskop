
for num = 28026:28089
name = 'spectrum_'+num+'txt';

fid = fopen(name);
    for x = 1:7
        text = fgetl(fid);
    end

Z = fscanf(fid,'%g',[2,end]);
plot(Z(1,:),Z(2,:),'*');
fclose(fid);
end