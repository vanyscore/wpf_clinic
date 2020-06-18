using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Clinic.Models.Stubs
{
    public class ScheduleDateWrapper
    {
        private readonly DateTime _dt;

        public string DayNumber => _dt.ToString("dd");

        public string DayName => _dt
            .ToString("dddd", CultureInfo.CreateSpecificCulture("ru-RU")).ToUpper();

        public ScheduleDateWrapper(DateTime dt)
        {
            _dt = dt;
        }
    }
}
