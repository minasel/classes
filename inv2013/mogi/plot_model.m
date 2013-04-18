function plot_model(D)
%PLOT_MODEL plot an interferogram both as an unwrapped image and wrapped phase image

SAMPLE = 1100;
LINE = 980;
POSTING = 40.0;
%HALF_WAVE = 28.3;

xvec = [1:POSTING:SAMPLE*POSTING]/1000;
yvec = [1:POSTING:LINE*POSTING]/1000;

load data_mask
F1 = D.*data_mask;
F2 = wrap(D.*data_mask./10)./5.66.*4*pi;

iimagesc = 0;           % plot with imagesc (=1) or pcolor (=0)
nanclr = 0.6*[1 1 1];   % NaN color (imagesc=0 only)

figure; clims = [-30 30];
subplot(2,1,1);
if iimagesc==1
    imagesc(xvec,yvec,F1,clims);
else
    pcolor(xvec,yvec,F1); shading flat; set(gca,'ydir','reverse');
    caxis(clims);
    
    % silly Matlab commands to make sure that the colors that are shown in
    % the figure are actually printed to files
    set(gcf,'Color','white');
    set(gca,'Color',nanclr);
    set(gcf,'InvertHardCopy','off');
end
colorbar   
axis equal; axis tight
set(gca,'FontSize',12);
xlabel('Easting [km]','FontSize',14);
ylabel('Northing [km]','FontSize',14);
title('Line of Sight Motion [mm]','FontSize',14);

%---------------

subplot(2,1,2);
if iimagesc==1
    imagesc(xvec,yvec,F2);
else
    pcolor(xvec,yvec,F2); shading flat; set(gca,'ydir','reverse');
    set(gca,'Color',nanclr);
end
colorbar;
axis equal; axis tight
set(gca,'FontSize',12);
xlabel('Easting [km]','FontSize',14);
ylabel('Northing [km]','FontSize',14);
title('Interferogram phase [rad]','FontSize',14);
