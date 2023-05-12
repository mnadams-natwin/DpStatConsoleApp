using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;
using Dapper;
using System.Data;


namespace DpStatConsoleApp.Models
{
    public class AvailableAppointmentDatesModel
    {
                
        public Nullable<System.DateTime> AggreedDate { get; set; }
        public string BranchNo { get; set; }
        public string BNStyle { get; set; }
        public string LocationType { get; set; }
        public Nullable<System.DateTime> AvailableDate { get; set; }
        public string ADASType { get; set; }
        public string WorkType { get; set; }

    }
}
