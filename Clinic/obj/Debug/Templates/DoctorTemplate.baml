   M S B A M L   `   `   `  ����A  =Clinic, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:Clinic.TemplatesClinic.Templates  5      !    Clinic.Templates.DoctorCard   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      U QMaterialDesignThemes.Wpf, Version=3.0.1.920, Culture=neutral, PublicKeyToken=null@material1http://materialdesigninxaml.net/winfx/xaml/themes  5      *localclr-namespace:Clinic.Templates  5        � 	Resources  5       	  Image �� 	UriSource��%7   &	        �� 5   
   $ ../Images/lor_1.jpg?�6$   5      .��5      #  MaterialDesignThemes.Wpf.Card  $��1q�5   	     	red_light#��[ 5   	   .��5   
   �  � RowDefinitions 5      �� 5      $��0.15* �6    �� 5      $��0.85* �6    .+�5        #��[ 6   .��5      ��  �� Padding$ 20q�6   ._�5      ��  �� Orientation$ 
Horizontal=�6!   .+�5      �� $��ФИО:��6$   
�������$��Center=�5       $��20 0 0 0q�5       $��20(�5       $��Medium"�5       �� 5       
�������$��Center=�5!       $��20 0 0 0q�5"       $��20(�5#       �� 5$      �6   �� *	Surname+ �� FallbackValue$ Иванов�� �� 5%      �6   �� *Name+$ Иван�� �� 5&      �6   �� *
Patrynum+$ Иванович��5'      5(      5)      5*      � 5,      $��1��6    � ColumnDefinitions 5-      �� 5.      $
��0.3* �6'   �� 5/      $
��0.7* �6'   .+�52        $��20q�6    .��53      �� $��Uniform=�54      ��53      �� *	ImagePath+# [  54      55        57      $��1��6    $��20q�60   .��58      �� $ Vertical=�6!   .+�59      �� $ 
Horizontal=�6%   $��
20 20 20 0q�6>   .+�5:      �� $!��Специальность:��6(   $��Medium"�5;   (   
���   �$��24(�5=   (   �� 5>      
���   �$��24(�5@   (   $��20 0 0 0q�5A   (   ��5>   (   ��  �� Path$ Special.Description�$ Хирург��5A   (   5B      �� 5C      $ Vertical=�6%   $��
20 20 20 0q�6<   .+�5D      �� $��Категория:��6(   $��Medium"�5E   (   
���   �$��24(�5G   (   �� 5H      
���   �$��24(�5K   (   $��WrapWithOverflow=�5L   (   ��5H   (   �� $ Category.Description�$ Первая��5L   (   5M      �� 5N      $ 
Horizontal=�6%   $��
20 20 20 0q�6>   .+�5O      �� $��Стаж работы:��6(   $��Medium"�5P   (   
���   �$��24(�5R   (   �� 5S      
���   �$��24(�5T   (   $��20 0 0 0q�5U   (   �� 5V   "   �6&   �� $ 
Expirience�$ 20�� �� 5W   "   $�лет��6&   5X      5Y      �� 5Z      $ 
Horizontal=�6%   $��20 20 20 20q�6>   .+�5[      �� $ ��Дата рождения:��6(   $��Medium"�5\   (   
���   �$��24(�5^   (   �� 5_      
���   �$��24(�5a   (   $��20 0 0 0q�5b   (   ��5_   (   �� $ 	BirthDate�$
 1972��5b   (   5c      5d      5e      5f      5g      5h      5i      