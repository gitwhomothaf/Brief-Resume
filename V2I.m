axis([0 1000 0 1000]);                            
DELAY=0.5;
DELAY1=0.45;
[a,b]=ginput(5);                                  % input
line(a,b,'color','black'); hold on;               % line1
rnd_speed=randi([10,20],1,1);                     % 
dist_whole=sqrt((a(2)-a(1))^2+(b(2)-b(1))^2);     % d. 2 pts
speed_new=round(dist_whole/rnd_speed);           
x=linspace(a(1),a(2),speed_new);                  
y=linspace(b(1),b(2),speed_new);
u=linspace(a(2),a(3),speed_new);
v=linspace(b(2),b(3),speed_new);
w=linspace(a(3),a(4),speed_new);
z=linspace(b(3),b(4),speed_new);
q=linspace(a(4),a(5),speed_new);
r=linspace(b(4),b(5),speed_new);
arr1=[x u w q];                                   
arr2=[y v z r];                                   
[xcord1,ycord1]=ginput(1);                       
text(xcord1,ycord1,'RSU 1 ','HorizontalAlignment','right');
[xcord2,ycord2]=ginput(1);                        patpath*
text(xcord2,ycord2,'RSU 2 ','HorizontalAlignment','right');
plot(xcord1,ycord1,'o','MarkerFaceColor','blue'); 
plot(xcord2,ycord2,'o','MarkerFaceColor','blue'); 
p=plot(x,y,'square','MarkerFaceColor','green','MarkerSize',5);   
title('V2I connectivity');                        
for i=1:1000
    for j=1:length(arr1)-1
     
           p.XData = arr1(j);               
           p.YData = arr2(j);               
           first_dist=[xcord1,ycord1;arr1(j),arr2(j)]; %  euclidian distance rsu1
           distance1=pdist(first_dist,'euclidean');
           second_dist=[xcord2,ycord2;arr1(j),arr2(j)]; %  euclidian distance rsu2
           distance2=pdist(second_dist,'euclidean');
           
           pause(DELAY1);
           if distance1<=100                           
                   line1=plot([xcord1,arr1(j)],[ycord1,arr2(j)],'--','color','green'); 
                   range1=plot([arr1(j),arr1(j+1)],[arr2(j),arr2(j+1)],'color','green');          
                   pause(0.3);                     
                   set(line1,'Visible','off');                 
                   set(range1,'Visible','on');                 
                
           elseif distance2<=100
                  line2=plot([xcord2,arr1(j)],[ycord2,arr2(j)],'--','color','green');
                  range1=plot([arr1(j),arr1(j+1)],[arr2(j),arr2(j+1)],'color','green');          
                  pause(0.3);                     
                  set(line2,'Visible','off');                 
                  set(range1,'Visible','on');                 
                
           else
                      first=plot([arr1(j),arr1(j+1)],[arr2(j),arr2(j+1)],'color','red');
                      set(first,'Visible','on');
           end
           
         
   end
end

hold off;
