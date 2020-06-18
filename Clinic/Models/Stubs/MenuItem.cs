using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Clinic.Models.Stubs
{
    public class MenuItem
    {
        public string Title { get; set; }
        public string Icon { get; set; }
        public Uri UriDestination { get; set; }

        public string ImagePath
        {
            get
            {
                return App.ImagePath + Icon;
            }
        }
    }
}
