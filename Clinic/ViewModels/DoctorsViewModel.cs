using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using Clinic.Commands;
using Clinic.Models;

namespace Clinic.ViewModels
{
    public class DoctorsViewModel
    {
        public List<Special> Specials { get; set; }
        public List<Doctor> Doctors { get; set; }

        public ObservableCollection<Doctor> SelectedDoctors { get; set; }

        private Special _selectedSpecial;
        public Special SelectedSpecial
        {
            get
            {
                return _selectedSpecial;
            }
            set
            {
                _selectedSpecial = value;

                SelectedDoctors.Clear();
                foreach (var d in (Doctors
                        .Where(d => d.Special.SpecialId == SelectedSpecial.SpecialId)))
                    SelectedDoctors.Add(d);
            }
        }

        public ICommand ShowAllSpecials
        {
            get
            {
                return new CustomCommand(o =>
                {
                    SelectedDoctors.Clear();
                    foreach (var doctor in Doctors)
                        SelectedDoctors.Add(doctor);
                });
            }
        }

        public DoctorsViewModel()
        {
            using (ClinicModelContainer container = new ClinicModelContainer())
            {
                var specials = container.Specials.ToList();
                var doctors = container.Doctors.ToList();

                doctors.ForEach(doctor =>
                {
                    doctor.Category = doctor.Category;
                    doctor.Special = doctor.Special;
                });

                Specials = specials;
                Doctors = doctors;

                SelectedDoctors = new ObservableCollection<Doctor>(Doctors);
            }
        }
    }
}
