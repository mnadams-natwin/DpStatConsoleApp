using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DpStatConsoleApp.Models
{
    public class RESTResponseModel
    {
        /// <summary>
        /// Used by login response.
        /// </summary>
        public class RESTResponseAvailableDates
        {
            public Lastcall lastCall { get; set; }
            public object sessionid { get; set; }
            public int status { get; set; }
            public int substatus { get; set; }
            public string message { get; set; }
            public object rowid { get; set; }
            public Data data { get; set; }
        }

        /// <summary>
        /// Used by RESTResponseAvailableDates.
        /// </summary>
        public class Data
        {
            public string[] Availability { get; set; }
            public bool isNWSubContractor { get; set; }
        }


        /// <summary>
        /// Used by login response.
        /// </summary>
        public class RESTResponseLogin
        {
            public Lastcall lastCall { get; set; }
            public string sessionid { get; set; }
            public int status { get; set; }
            public int substatus { get; set; }
            public string message { get; set; }
            public object rowid { get; set; }
            public object data { get; set; }
        }


        /// <summary>
        /// Used by all classes above.
        /// </summary>
        public class Lastcall
        {
            public string control { get; set; }
            public object args { get; set; }
        }




    }
}
