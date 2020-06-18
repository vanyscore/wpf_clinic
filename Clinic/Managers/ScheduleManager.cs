using Clinic.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Clinic.Managers
{
    public class ScheduleManager
    {
        public void UpdateScheduleIfNeeded()
        {
            using (ClinicModelContainer container = new ClinicModelContainer())
            {
                var schedules = container.DistrictSchedules.ToList();
                var currentMonth = DateTime.Now.Month;

                if (schedules.Count() == 0
                    || currentMonth - schedules.Last().ReceiptDate.Month >= 1)
                {
                    var surgeries = container.Surgeries.ToList();
                    var sites = container.Sites.ToList();

                    sites.ForEach(site =>
                    {
                        var doctors = site.SiteDoctors;

                        for (int i = DateTime.Now.Day;
                            i < DateTime.DaysInMonth(DateTime.Now.Year,
                                DateTime.Now.Month); i++)
                        {
                            for (int k = 9; k <= 15; k++)
                            {
                                var reciepeDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month,
                                    i, k, 0, 0);
                                var doctor = doctors.First();
                                var surgey = surgeries[site.SiteId - 1];

                                schedules.Add(new DistrictSchedule()
                                {
                                    SurgeryId = surgey.SurgeryId,
                                    Surgery = surgey,
                                    DoctorId = doctor.Doctor.DoctorId,
                                    Doctor = doctor.Doctor,
                                    ReceiptDate = reciepeDate,
                                });
                            }
                        }
                    });

                    container.DistrictSchedules.AddRange(schedules);
                    container.SaveChanges();
                }
            }
        }

        public List<DistrictSchedule> GetSchedule()
        {
            using (ClinicModelContainer container = new ClinicModelContainer())
            {
                return container.DistrictSchedules.ToList();
            }
        }
    }
}
