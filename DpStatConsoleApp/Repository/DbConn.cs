using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;
using Dapper;
using System.Data;


namespace DpStatConsoleApp.Repository
{
    public partial class DbConn
    {
        internal SqlConnection con;
        //To Handle connection related activities    
        internal void conHandle()
        {
            
            if (ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString() != null)
            {
                string tmpConString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString().Replace("XXXHidenPasswordXXX", "G3tM31n");

                con = new SqlConnection(tmpConString);
            }
            
        }

    }
}
