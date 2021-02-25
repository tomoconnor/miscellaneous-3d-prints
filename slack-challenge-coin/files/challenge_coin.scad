
dc252 = "Collect Coins  Not Glitter";
star2 = "";
lv2 = "";
inner_top_text = "UK Cross-Gov Slack";
edgetext = " #chat #security #cats #dogs #random #covid-19";

radius = 23.75;
height = 4.5;

/*
turning on scaloped edges can be slow
*/
do_scaloped_edge = 0; //[1,0]
scalopradius = 5.1;
scalopcount = 50;

edge_extrude_depth = 1;
edge_fontsize = 3;
edge_font="Arial:style=Bold Italic";
edge_text_center_adjustment = -1.15;

top_fontsize = 4.5;
top_font="Arial:style=Bold Italic";
top_inset_depth = 1;
top_inset_ridge_thickness = 7.5;
top_text_center_adjustment = 1.1;


do_backside_image_emboss = 0;
filename_backside_image = "source_png/Gov.uk-square.png"; // [image_surface:256x256]
backside_image_scale = 0.07;
backside_image_zscale = .1;
backside_emboss_surface_adjust = 1.2;

filename_topside_image = "source_png/none.png"; // [image_surface:256x256]
topside_image_scale = .03;
topside_image_zscale = .9;
topside_image_rotate = 90;


union(){
     translate([0,0,(height/2) ])
        rotate([0,0,topside_image_rotate])
            scale([topside_image_scale, topside_image_scale, 0.02])
                surface(file = filename_topside_image, center = true, invert=true);
    difference(){
        edge_text(edgetext,edge_font,edge_fontsize, 360.0/len(edgetext));
        top_text(dc252,0,top_font,top_fontsize+1,13,top_text_center_adjustment-.2);
        top_text(lv2,175,top_font,top_fontsize,11.5,top_text_center_adjustment+.6);
        top_text(star2,40,top_font,top_fontsize,14,top_text_center_adjustment-1.2);
        top_text(star2,220,top_font,top_fontsize,14,top_text_center_adjustment-1.2);
        inner_top_text(inner_top_text,0,top_font,top_fontsize,16,top_text_center_adjustment-1.2);
    }
}

module inner_top_text(txt,rotate,font,fontsize,degrees,centeradj){
    rotate([0,0,rotate])
          for (a = [0:1:len(txt)]){
            rotate([0,0,-(a*degrees)])
                translate([0,radius-(top_inset_ridge_thickness+centeradj+5),(height/2)-(top_inset_depth*2)+.1])
                    linear_extrude(height=top_inset_depth)
                        text(txt[a],fontsize,font=font, halign="center");
        }
}

module top_text(txt,rotate,font,fontsize,degrees,centeradj){
    rotate([0,0,rotate])
          for (a = [0:1:len(txt)]){
            rotate([0,0,-(a*degrees)])
                translate([0,radius-top_inset_ridge_thickness+centeradj,(height/2)-top_inset_depth+.1])
                    linear_extrude(height=top_inset_depth)
                        text(txt[a],fontsize,font=font, halign="center");
        }
}

module edge_text(txt,font,fontsize,degrees){
    difference(){
        difference(){
          render()translate([0,0,-height/2]){
            $fn=100;
            cylinder(r=radius,h=height);
          }
           for (a = [0:1:len(txt)]){  
                rotate([0,0,a*degrees])
                  translate([0,(radius/2)-edge_extrude_depth,0])
                     translate([0,(radius/2)+.1,edge_text_center_adjustment])
                        rotate([90,0,180])
                            linear_extrude(height=edge_extrude_depth)
                                text(txt[a],fontsize,font=font, halign="center");
           }
           translate([0,0,((height/2)-top_inset_depth)]){
               $fn=100;   
               cylinder(r=radius-top_inset_ridge_thickness,h=height);
           }
        }
        
        if(do_backside_image_emboss){
            translate([0,0,-((height/2)-backside_emboss_surface_adjust)])
               intersection(){
                rotate([180,0,0])
                    scale([backside_image_scale, backside_image_scale, backside_image_zscale])
                        surface(file=filename_backside_image, center=true);
                   translate([0,0,-(height/2)]){
                    $fn=100;
                    cylinder(r=radius-2,(height/2));
                   }
               }
        }
       if(do_scaloped_edge){
          $fn=24; 
          render()for(scalopid = [0 : (360/scalopcount) : 360]){
             rotate([0,0,scalopid])
                translate([radius,0,height*2])
                   rotate([0,-45,0])
                     translate([0,0,-25])
                       cylinder(r=scalopradius,50);
                
            }
          render()for(scalopid = [0 : (360/scalopcount) : 360]){
             rotate([0,0,scalopid])
                translate([radius,0,-height*2])
                   rotate([0,45,0])
                     translate([0,0,-25])
                       cylinder(r=scalopradius,50);
                
            } 
        }
        
    }
}
