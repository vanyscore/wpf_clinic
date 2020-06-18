using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using System.IO;

namespace Clinic
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static readonly string RootPath =
            new DirectoryInfo(".").Parent.Parent.FullName;
        public static readonly string ImagePath = RootPath + $"/Images/";
    }
}
