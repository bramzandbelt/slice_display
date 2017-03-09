function Y_rgb = sd_slice_to_rgb(Y, layer, settings)
% SD_SLICE_TO_RGB Converts 2D slice data to 3D RGB color coding
%  
% DESCRIPTION
% This function uses the pr_scaletocmap function, which is part of SPM's
% slover toolbox, to convert image data to RGB color using the color coding
% scheme specified in the layer's colormap.
%  
% SYNTAX 
% Y_rgb = SD_SLICE_TO_RGB(Y, layer, settings)
%
% Y             - NxM double, containing slice data
% layer         - layer struct of current layer
% settings      - settings struct
%
% Y_rgb         - NxMx3 double, containing RGB values
% 
% ......................................................................... 
% Bram Zandbelt (bramzandbelt@gmail.com), Radboud University

% Panel dimenstions
pandims             = settings.slice.pandims;

% Use slover to scale slice to color map indices
Y_map_i             = pr_scaletocmap(Y, ...
                                     layer.color.range(1), ...
                                     layer.color.range(2), ...
                                     layer.color.map, ...
                                     [0 256 0]);

% Convert to RGB
Y_rgb                       = reshape(layer.color.map(Y_map_i(:),:),....
                                      pandims);
Y_rgb(Y_rgb > 1)            = 1;                                     