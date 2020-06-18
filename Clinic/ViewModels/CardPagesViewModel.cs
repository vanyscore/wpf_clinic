using Clinic.Commands;
using Clinic.Models;
using Clinic.Windows;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace Clinic.ViewModels
{
    public class CardPagesViewModel : BaseViewModel
    {
        public PatientCard PatientCard { get; set; }
        public int CurrentPageIndex
        {
            get
            {
                return _currentPageIndex + 1;
            }
            set { }
        }
        public int PageCount { get; set; }

        private List<CardPage> _pages;
        private CardPage _currentPage;
        private int _currentPageIndex;

        public CardPage CurrentPage
        {
            get
            {
                return _currentPage;
            }
            set
            {
                _currentPage = value;

                OnPropertyChanged();
            }
        }

        public ICommand NextPage => new CustomCommand(o =>
        {
            _currentPageIndex++;

            CurrentPage = _pages[_currentPageIndex];

            OnPropertyChanged("CurrentPageIndex");
        }, o =>
        {
            return _currentPageIndex + 1 < PageCount;
        });

        public ICommand PreviousPage => new CustomCommand(o =>
        {
            _currentPageIndex--;

            CurrentPage = _pages[_currentPageIndex];

            OnPropertyChanged("CurrentPageIndex");
        }, o =>
        {
            return _currentPageIndex - 1 >= 0;
        });

        public ICommand OpenDoctorInfo => new CustomCommand(o =>
        {
            var dialog = new DoctorInfoWindow(CurrentPage.Doctor);

            dialog.ShowDialog();
        });

        public CardPagesViewModel(PatientCard card)
        {
            PatientCard = card;

            using (ClinicModelContainer container = new ClinicModelContainer())
            {
                _pages = container.CardPages.Where(p => p.PatientCardId == card.PatientCardId)
                    .ToList();
                _pages.ForEach(p =>
                {
                    p.PatientCard = PatientCard;
                    p.Doctor = p.Doctor;
                    p.Doctor.Category = p.Doctor.Category;
                    p.Doctor.Special = p.Doctor.Special;
                });
            }

            _currentPageIndex = 0;
            PageCount = _pages.Count;

            CurrentPage = _pages[_currentPageIndex];
        }
    }
}
