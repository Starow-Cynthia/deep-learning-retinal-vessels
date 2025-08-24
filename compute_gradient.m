function [gx,gy, gradient_img] = compute_gradient(input_img)


    [gx, gy] = imgradientxy(input_img);
    %figure; quiver (gx,gy)

    BW = edge(input_img,'canny');
    %imagesc(BW);
    
    gx=gx.*BW;
    gy=gy.*BW;
    %figure; quiver (gx,gy)

    norm=sqrt(gx.^2+gy.^2)+eps;
    gx=gx./norm;
    gy=gy./norm;
    
    gradient_img = gx + gy;
 
end