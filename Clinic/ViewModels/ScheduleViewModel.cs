using Clinic.Commands;
using Clinic.Managers;
using Clinic.Models;
using Clinic.Models.Stubs;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace Clinic.ViewModels
{
    public class ScheduleViewModel : BaseViewModel
    {
        private ScheduleManager _scheduleManager;
        private ObservableCollection<DistrictSchedule> _schedules;

        private int _currentMonthNumber = DateTime.Now.Month;
        private ScheduleDateWrapper _selectedDay;
        private int _selectedDayIndex;
        private Site _selectedSite;

        public List<Site> Sites { get; set; }
        public Site SelectedSite 
        {
            get
            {
                return _selectedSite;
            }
            set
            {
                _selectedSite = value;

                SelectNewSchedules(_selectedSite.Number,
                    CurrentMonthNumber, int.Parse(SelectedDay.DayNumber));

                OnPropertyChanged();
            }
        }
        public ObservableCollection<DistrictScheduleWrapper> _selectedSchedules;

        public ObservableCollection<DistrictScheduleWrapper> SelectedSchedules
        {
            get
            {
                return _selectedSchedules;
            }
        }

        public int SelectedDayIndex
        {
            get
            {
                return _selectedDayIndex;
            }
            set
            {
                _selectedDayIndex = value;

                OnPropertyChanged();
            }
        }
        public ScheduleDateWrapper SelectedDay
        {
            get
            {
                return _selectedDay;
            }
            set
            {
                _selectedDay = value;

                if (_selectedDay != null)
                    SelectNewSchedules(SelectedSite.Number,
                        CurrentMonthNumber, int.Parse(_selectedDay.DayNumber));

                OnPropertyChanged();
            }
        }

        private int CurrentMonthNumber
        {
            get
            {
                return _currentMonthNumber;
            }
            set
            {
                _currentMonthNumber = value;

                UpdateCurrentDays(_currentMonthNumber);

                OnPropertyChanged("CurrentMonth");
            }
        }

        public ObservableCollection<ScheduleDateWrapper> CurrentDays { get; set; }

        public string CurrentMonth
        {
            get
            {
                return new DateTime(DateTime.Now.Year, _currentMonthNumber, DateTime.Now.Day)
                    .ToString("MMMM", CultureInfo.CreateSpecificCulture("ru-RU"));
            }
        }

        public ICommand SwitchPreviousMonth
        {
            get
            {
                return new CustomCommand(o =>
                {
                    CurrentMonthNumber--;
                }, o =>
                {
                    return CurrentMonthNumber - 1 > 0;
                });
            }
        }

        public ICommand SwitchNextMonth
        {
            get
            {
                return new CustomCommand(o =>
                {
                    CurrentMonthNumber++;
                }, o =>
                {
                    return CurrentMonthNumber + 1 <= 12;
                });
            }
        }

        public ScheduleViewModel()
        {
            _scheduleManager = new ScheduleManager();
            _scheduleManager.UpdateScheduleIfNeeded();

            using (ClinicModelContainer container = new ClinicModelContainer())
            {
                _schedules = new ObservableCollection<DistrictSchedule>(
                    container.DistrictSchedules);

                foreach (var sch in _schedules)
                {
                    sch.Doctor = sch.Doctor;
                    sch.Surgery = sch.Surgery;
                    sch.Doctor.SiteDoctors = sch.Doctor.SiteDoctors;
                    sch.Doctor.SiteDoctors.First().Site = sch.Doctor.SiteDoctors.First().Site;
                }

                Sites = container.Sites.ToList();
            }

            _currentMonthNumber = DateTime.Now.Month;

            UpdateCurrentDays(_currentMonthNumber);

            _selectedDay = CurrentDays.ToList()
                .Find(d => int.Parse(d.DayNumber) == DateTime.Now.Day);
            _selectedSite = Sites[0];
            _selectedDayIndex = CurrentDays.IndexOf(SelectedDay);

            SelectNewSchedules(_selectedSite.Number, _currentMonthNumber,
                int.Parse(_selectedDay.DayNumber));
        }

        private void UpdateCurrentDays(int month)
        {
            if (CurrentDays == null)
                CurrentDays = new ObservableCollection<ScheduleDateWrapper>();
            else
                CurrentDays.Clear();

            for (int i = 1; i < DateTime
                .DaysInMonth(DateTime.Now.Year, month); i++)
                CurrentDays.Add(new ScheduleDateWrapper
                    (new DateTime(DateTime.Now.Year, month, i)));
        }

        private void SelectNewSchedules(int siteNumber, int month, int day)
        {
            if (_selectedSchedules == null)
                _selectedSchedules =
                    new ObservableCollection<DistrictScheduleWrapper>();

            var newSchedules = _schedules.Where(sch =>
            {
                return sch.Doctor.SiteDoctors.First().Site.Number == siteNumber
                    && sch.ReceiptDate.Month == month && sch.ReceiptDate.Day == day;
            });

            _selectedSchedules.Clear();

            foreach (var sch in newSchedules)
                _selectedSchedules.Add(new DistrictScheduleWrapper(sch));
        }
    }
}
