#region Mouse Look
image_angle = point_direction(x, y, mouse_x, mouse_y);
#endregion
speed_of = 2.5;
target = instance_find(obj_player, 0);
shoot(mouse_x, mouse_y, mb_left);
reload(mb_right);
followTarget(target);
