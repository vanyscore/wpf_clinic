using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Clinic.Models
{
    public partial class Doctor
    {
        public string ImagePath => App.ImagePath + Icon;

        public string Fullname
        {
            get
            {
                return Name + " " + Surname + " " + Patrynum;
            }
            set { }
        }
    }

    public partial class PatientCard
    {
        public string ImagePath => App.ImagePath + Icon;

        public Visibility HasPages
        {
            get
            {
                try
                {
                    return CardPages.Count > 0 ? Visibility.Visible : Visibility.Hidden;
                } 
                catch
                {
                    return Visibility.Hidden;
                }
            }
        }

        public string LastReception =>
            HasPages != Visibility.Hidden ? CardPages.Last().Date.ToString() : null;
    }
}
