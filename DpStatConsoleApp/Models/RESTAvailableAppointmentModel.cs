using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DpStatConsoleApp.Models
{
    public class RESTAvailableAppointmentModel
    {
        public string postcode { get; set; }
        public string[] worktype { get; set; }
        public string workbranch { get; set; }
        public int adas { get; set; }
        public string locationtype { get; set; }
        public string agreeddate { get; set; }
        public string bnno { get; set; }
        public int dayslimit { get; set; }
    }
}
