axis([0 1000 0 1000]);            % Twindow size
DELAY=0.5;
DELAY1=0.45;
[x1,y1] = ginput(2);              % input
line(x1,y1,'color','black');      % line1
hold on ; 
[x2,y2] = ginput(2);              % line2_input
line(x2,y2,'color','black');      % output_lines
rnd_speed1=randi([10,20],1,1);
dist_first_line=sqrt((x1(2)-x1(1))^2+(y1(2)-y1(1))^2);     
speed_new1=round(dist_first_line/rnd_speed1);               
rnd_speed2=randi([10,20],1,1);
dist_second_line=sqrt((x2(2)-x2(1))^2+(y2(2)-y2(1))^2);     
speed_new2=round(dist_first_line/rnd_speed1);               
point1=linspace(x1(1),x1(2),speed_new1);  % Random speed 
point2=linspace(y1(1),y1(2),speed_new1);
point3=linspace(x2(1),x2(2),speed_new2);
point4=linspace(y2(1),y2(2),speed_new2);
first_vehicle=plot(point1,point2,'s','MarkerFaceColor','red');   % Plot v1
second_vehicle=plot(point3,point4,'o','MarkerFaceColor','blue'); % Plotv2
title('V2V connectivity simulation');                           
for i=1:1000
    
    for k = 1:speed_new1                   %all lins values
         first_vehicle.XData = point1(k);  
         first_vehicle.YData = point2(k);  
         second_vehicle.XData = point3(k); 
         second_vehicle.YData = point4(k); 
         plot(point1(k),point2(k),point3(k),point4(k));
         vehicle_dist=[point1(k),point2(k);point3(k),point4(k)]; %Euclidian distance between two vehicle's positions reference 7, thesis.docx
         distance1= pdist(vehicle_dist,'euclidean'); 
          if distance1<=100                
            line1=plot([point1(k),point3(k)],[point2(k),point4(k)],'--','color','green');  
            pause(0.3);                 
            set(line1,'Visible','off');     
          end
          pause(DELAY1);                    
         
    end
        set(first_vehicle,'Visible','off'); 
        set(second_vehicle,'Visible','off'); 
   
end

hold off;

