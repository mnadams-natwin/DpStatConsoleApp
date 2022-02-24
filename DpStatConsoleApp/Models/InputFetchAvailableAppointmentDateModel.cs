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
    public class InputFetchAvailableAppointmentDateModel
    {
        public int ID { get; set; }
        public string BNNo { get; set; }
        public string LocationType { get; set; }
        public string ADAS { get; set; }
        public string WorkBranch { get; set; }
        public string WorkType { get; set; }
        public string Postcode { get; set; }
    }
}
