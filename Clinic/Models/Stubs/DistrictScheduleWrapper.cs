using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Clinic.Models.Stubs
{
    public class DistrictScheduleWrapper
    {
        private readonly DistrictSchedule _schedule;

        public string Time => _schedule.ReceiptDate.ToString("HH:mm");
        public string Doctor => _schedule.Doctor.Fullname;
        public int Surgery => _schedule.Surgery.Number;

        public DistrictScheduleWrapper(DistrictSchedule schedule)
        {
            _schedule = schedule;
        }
    }
}
