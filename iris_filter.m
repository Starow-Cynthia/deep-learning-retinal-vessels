function convergence_map = iris_filter(img, gx, gy, N, support_region)
%given an image img, it outputs the gradient convergence map obtained with
%the iris filter

  %auxiliary kernel    
  [X,Y]=meshgrid(N:-1:-N,N:-1:-N);
  norm=sqrt(X.^2+Y.^2)+eps;
  X=X./norm;
  Y=Y./norm;


  [rows,cols] = size(img); 

  %// New - Create a padded matrix that is the same class as the input
  %S = 1;  %stride
  F = (2*N)+1;   %filter size 
  pad_x_direction = (F-1)/2;  %% N
  pad_y_direction = (F-1)/2;  %% N
  
  new_img = zeros(rows+2*pad_x_direction,cols+2*pad_y_direction);
  new_img_x = zeros(rows+2*pad_x_direction,cols+2*pad_y_direction);
  new_img_y = zeros(rows+2*pad_x_direction,cols+2*pad_y_direction);
  %new_img = cast(new_img, class(img));

  %// New -  Place original image in padded result
  new_img(pad_x_direction+1:end-pad_x_direction,pad_y_direction+1:end-pad_y_direction) = img;
  new_img_x(pad_x_direction+1:end-pad_x_direction,pad_y_direction+1:end-pad_y_direction) = gx;
  new_img_y(pad_x_direction+1:end-pad_x_direction,pad_y_direction+1:end-pad_y_direction) = gy;

  %// Also create new output image the same size as the padded result
  image = zeros(size(new_img));
  %image = cast(image, class(img));

  for i=pad_x_direction+1:1:rows+pad_x_direction %// 
    for j=pad_y_direction+1:1:cols+pad_y_direction %// 
      value=0;
      
      %img_slice = new_img(i-N:i+N, j-N:j+N);
      gx_slice = new_img_x(i-N:i+N, j-N:j+N);
      gy_slice = new_img_y(i-N:i+N, j-N:j+N);
      
      for k=1:length(support_region)  %% for each line
          
          radial_direction = support_region(:,:,k);   %line k
          cos_X = radial_direction.*X;  
          cos_Y = radial_direction.*Y;
          
          conv_x = (gx_slice.*cos_X) / sum(radial_direction(:));  %eq 1, division by N
          conv_y = (gy_slice.*cos_Y) / sum(radial_direction(:));  %eq 1, division by N
          
          conv = conv_x + conv_y;  %% convergence degree, eq 1
          
          value = value + max(conv(:)); %% sum, eq 3
          
          
      end
      
     image(i,j)=value/length(support_region);  %% C(x,y) = 1/M ( sum ci^0)
     %disp(i)
    end
  end

%// Change
%// Crop the image and remove the extra border pixels
convergence_map = image(pad_x_direction+1:end-pad_x_direction,pad_y_direction+1:end-pad_y_direction);

% gaussian filtering
h=fspecial('gaussian',N, (1/3)*N);
convergence_map = imfilter(convergence_map, h);

end
