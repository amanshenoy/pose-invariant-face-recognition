function showboxes(im, boxes, posemap)

% showboxes(im, boxes)
% Draw boxes on top of image.

imagesc(im);
hold on;
axis image;
axis off;
a.x=(boxes.xy(:,1)+boxes.xy(:,3))/2;
a.y=(boxes.xy(:,2)+boxes.xy(:,4))/2;

for b = boxes,
    partsize = b.xy(1,3)-b.xy(1,1)+1;
    %tx = (min(b.xy(:,1)) + max(b.xy(:,3)))/2;
    %ty = min(b.xy(:,2)) - partsize/2;
    %text(tx,ty, num2str(posemap(b.c)),'fontsize',18,'color','c');
    for i = size(b.xy,1):-1:1;
        x1 = b.xy(i,1);
        y1 = b.xy(i,2);
        x2 = b.xy(i,3);
        y2 = b.xy(i,4);
        %x=[x;(x1+x2)/2];
        %line([x1 x1 x2 x2 x1]', [y1 y2 y2 y1 y1]', 'color', 'b', 'linewidth', 1);
        plot((x1+x2)/2,(y1+y2)/2,'r.','markersize',15);
    end
end
triplot(delaunayTriangulation(a.x,a.y));
drawnow;
