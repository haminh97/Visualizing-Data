function [ heatmap ] = GenerateHeatmap( xvals, yvals, xdim, ydim, map )
%   GenerateHeatmap(x, y, xdim, [ydim], [map]) takes in values of x and y as 
%   m-dimensional vectors and output them onto a heatmap of size [ydim xdim]
%   Used for visualizing hotspots on a 2-D coordinate
%   Minh Tran      July 2017

if ~exist('ydim', 'var') || isempty(ydim) 
	ydim = xdim;
end

if ~exist('map', 'var') || isempty(map) 
	map = 'hot';
end

min_xval = min(xvals);
max_xval = max(xvals);
min_yval = min(yvals);
max_yval = max(yvals);

xrange = max_xval - min_xval;
yrange = max_yval - min_yval;
x_norm = 1 + round((xvals - min_xval) ./ xrange * (xdim-1));
y_norm = 1 + round((yvals - min_yval) ./ yrange * (ydim-1));

heatmap = accumarray([y_norm, x_norm], 1, [ydim, xdim]); 
colormap(map);
imagesc(heatmap, 'xdata', [min_xval, max_xval], 'ydata', [min_yval, max_yval]);
set(gca,'YDir','normal')

end

