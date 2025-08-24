
function radial_directions = iris_radial_directions(N)
% outputs N half-lines from the pixel of interest 

%vertical left
xvalues = 1:2*N+1;
yvalues = ones(1,2*N+1);

%vertical right
xvalues = cat(2,xvalues, 1:2*N+1);
yvalues = cat(2, yvalues, 2*N+1*ones(1,2*N+1));

%horizontal top
xvalues = cat(2, xvalues, ones(1,2*N+1));
yvalues = cat(2, yvalues, 1:2*N+1);

%horizontal bottom
xvalues = cat(2, xvalues, 2*N+1*ones(1,2*N+1));
yvalues = cat(2, yvalues, 1:2*N+1);

radial_directions = zeros(2*N+1,2*N+1,length(xvalues));



for z = 1:length(xvalues)

    x1 = xvalues(z);
    
    y1 = yvalues(z);

A = zeros(2*N+1,2*N+1);

x2 = N;
y2 = N;



% Create a line from point 1 to point 2
spacing = 0.4;
numSamples = ceil(sqrt((x2-x1)^2+(y2-y1)^2) / 0.4);
x = linspace(x1, x2, numSamples);
y = linspace(y1, y2, numSamples);
xy = round([x',y']);
dxy = abs(diff(xy, 1));
duplicateRows = [0; sum(dxy, 2) == 0];
% Now for the answer:
finalxy = xy(~duplicateRows,:);
finalx = finalxy(:, 1);
finaly = finalxy(:, 2);
% Plot the points
% hold on;
% plot(finalx, finaly, 'y*');

for k = 1:length(finalxy)
    A(finalxy(k,1),finalxy(k,2)) = 1;
end


radial_directions(:,:,z) = A;


end
% 
% for i=1:324
%    figure;
%    imshow(support_region(:,:,i));
%    pause;
%    close;
%     
% end

end