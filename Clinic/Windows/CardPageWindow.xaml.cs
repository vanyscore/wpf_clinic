using Clinic.Models;
using Clinic.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Clinic.Windows
{
    /// <summary>
    /// Interaction logic for CardPageWindow.xaml
    /// </summary>
    public partial class CardPageWindow : Window
    {
        public CardPageWindow()
        {
            InitializeComponent();
        }

        public CardPageWindow(PatientCard card) : this()
        {
            DataContext = new CardPagesViewModel(card);
        }
    }
}
