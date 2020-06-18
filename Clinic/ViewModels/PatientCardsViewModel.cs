using Clinic.Commands;
using Clinic.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Clinic.Windows;
using System.Windows;

namespace Clinic.ViewModels
{
    public class PatientCardsViewModel : BaseViewModel
    {
        public ObservableCollection<PatientCard> PatientCards { get; set; }

        private PatientCard _selectedCard;
        public PatientCard SelectedCard
        {
            get
            {
                return _selectedCard;
            }
            set
            {
                _selectedCard = value;

                OnPropertyChanged();
            }
        }

        public ICommand OpenCardDialog => new CustomCommand(o =>
        {
            new CardPageWindow(SelectedCard).ShowDialog();
        }, o =>
        {
            return _selectedCard != null && _selectedCard.CardPages.Count > 0;
        });

        public PatientCardsViewModel()
        {
            using (ClinicModelContainer container = new ClinicModelContainer())
            {
                var cards = container.PatientCards.ToList();
                cards.ForEach(card =>
                {
                    card.Sex = card.Sex;
                    card.CardPages = card.CardPages;
                    card.Address = card.Address;
                });

                PatientCards = new ObservableCollection<PatientCard>(cards);
            }
        }
    }
}
