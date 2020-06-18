using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Clinic.Data.Helpers;
using Clinic.Models.Stubs;

namespace Clinic.ViewModels
{
    public class MenuViewModel : BaseViewModel
    {
        public ObservableCollection<MenuItem> MenuItems { get; set; }

        private MenuItem _selectedItem;

        public MenuItem SelectedItem
        {
            get
            {
                return _selectedItem;
            }
            set
            {
                _selectedItem = value;

                OnPropertyChanged();
            }
        }

        public MenuViewModel()
        {
            DataFiller.InitData();

            MenuItems = new ObservableCollection<MenuItem>()
            {
                new MenuItem()
                {
                    Title = "Врачи",
                    Icon = "ic_doctor_white.png",
                    UriDestination = new Uri("DoctorsPage.xaml",
                        UriKind.Relative)
                },
                new MenuItem()
                {
                    Title = "Пациенты",
                    Icon = "ic_card_white.png",
                    UriDestination = new Uri("PatientCardsPage.xaml",
                        UriKind.Relative)
                },
                //new MenuItem()
                //{
                //    Title = "Посещения",
                //    Icon = "ic_health_white.png",
                //    UriDestination = new Uri("DoctorsPage.xaml",
                //        UriKind.Relative)
                //},
                new MenuItem()
                {
                    Title = "Расписание",
                    Icon = "ic_schedule_white.png",
                    UriDestination = new Uri("SchedulePage.xaml",
                        UriKind.Relative)
                }
            };
            SelectedItem = MenuItems[0];
        }
    }
}
