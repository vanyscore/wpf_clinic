   M S B A M L   `   `   `  ����A  =Clinic, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:Clinic.TemplatesClinic.Templates  5      3clr-namespace:Clinic.TemplatesClinic.Templates  5      #    Clinic.Templates.SchedulePage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      0localclr-namespace:Clinic.Templates     5      U QMaterialDesignThemes.Wpf, Version=3.0.1.920, Culture=neutral, PublicKeyToken=nullA	materials1http://materialdesigninxaml.net/winfx/xaml/themes  5      .	templatesclr-namespace:Clinic.Templates  5        N� Title$  SchedulePage��5       � 	Resources 5         	ArrowLeft  
ArrowRight��%   &	        &	 5     �� 5   
   $!��../Images/ic_arrow_left.png��6"   �� 5   
   $"��../Images/ic_arrow_right.png��6#   5      .��5      �  � RowDefinitions 5   
   �� 5      $
��0.1* �6   �� 5      $
��0.1* �6   �� 5      $
��0.8* �6   .+�5   
   #  MaterialDesignThemes.Wpf.Card    	red_light#��[ 6   .��5      �  � ColumnDefinitions 5      �� 5      $
��0.1* �6'   �� 5      $��* �6'   �� 5      $
��0.1* �6'   .+�5      �� #��[  5       #��[ 5!      #��[ 5"      $
��Auto��5#      $
��Auto��5$      +  %MaterialDesignThemes.Wpf.ShadowAssist   ShadowDepth$ Depth0=�5&      ��5%      �� *SwitchPreviousMonth+5&      �� 5'      $��1��6   $��24(�5(      
�������$��Center=�5*      $��Center=�5+      $��Medium"�5,      ��5-      �� *CurrentMonth+ �� UpdateSourceTrigger$ PropertyChanged=� �� FallbackValue$ Март���� 5/      $ Depth0=�50      $��2��52      #��[ 53      #��[ 54      #��[ 55      $
��Auto��56      $
��Auto��57      ��51      �� *SwitchNextMonth+57      58      59        5:   
   $��1��6   #��[ 5;      .��5<      �� -   5         ��Name$ listBoxDays��5=      $
��Auto=�5A      $��Stretch=�5B      $��Stretch=�5C      ��5>      �� *CurrentDays+ �� SelectedItem 5?      �� *SelectedDay+$ PropertyChanged=�	 �� SelectedIndex	 5@      �� *SelectedDayIndex+$ PropertyChanged=���5D      �� 5E      .R�5F      *   $Clinic.Templates.ScheduleDayTemplate  5G      ��5I      �� 5J      .R�5K      A� 
 A� Rows$
 1��6&   5L      5N      5O      � 5P   
   $��2��6    5Q      �� 5R      $��0.15* �6#   �� 5S      .+�5U      �  5V      �� 5W      $
��0.1* �6$   �� 5X      $
��0.9* �6$   .+�5Z      �� $��Участки��6   $��Center=�5[      $��Center=�5\      
���   �$��24(�5^      $��Medium"�5_      �� 5`      $��1��6   $��Stretch=�5c      $��Stretch=�5d      $��10q�5e      ��5a      �� *Sites+ 5b      �� *SelectedSite+��5f      �� 5g      .R�5h        #��[ 5i   !   $��Stretch=�5j   !   .��5k   "   �� $��Center=�5m   %   $��Center=�5n   %   
�������$��Medium"�5p   %   $��15q�5q   %   $��18(�5r   %   ��5l   %   �� *Number+$ 1��5r   %   5s      5t      5v      5w      �� 5x      $��1��6   $��20q�5z      $��Stretch=�5{      $��Stretch=�5|      ��5y      �� *SelectedSchedules+��5}      �� 5~      .R�5      +   %Clinic.Templates.ScheduleItemTemplate  5�      ��5�      �� 5�      .R�5�      A� 5�      5�      5�      5�      5�      