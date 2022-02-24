using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;
using DpStatConsoleApp.Models;
using Dapper;
using System.Data;

namespace DpStatConsoleApp.Repository
{
    public class InputFetchAvailableAppointmentDateRepo:DbConn
    {
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        /// <summary>
        /// InputFetchAvailableAppointmentDate
        /// </summary>
        /// <returns></returns>
        public IList<InputFetchAvailableAppointmentDateModel> GetInputFetchAvailableAppointmentDate()
        {
            log.Debug(System.Reflection.MethodBase.GetCurrentMethod().ToString());
           

            conHandle();

            List<InputFetchAvailableAppointmentDateModel> inputFetchAvailableAppointmentDateModelList = new List<InputFetchAvailableAppointmentDateModel>();

            SqlCommand com = new SqlCommand("uspGetInputFetchAvailableAppointmentDate", con);
            com.CommandType = CommandType.StoredProcedure;


            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            con.Open();

            da.Fill(dt);
            con.Close();

            //Bind Model generic list using dataRow     
            foreach (DataRow dr in dt.Rows)
            {
                inputFetchAvailableAppointmentDateModelList.Add(
                    new InputFetchAvailableAppointmentDateModel
                    {
                        ID = Convert.ToInt32(Convert.IsDBNull(dr["ID"]) ? "0" : dr["ID"]),
                        BNNo = Convert.ToString(Convert.IsDBNull(dr["BNNo"]) ? "BNNo-Empty" : dr["BNNo"]),
                        LocationType = Convert.ToString(Convert.IsDBNull(dr["LocationType"]) ? "LocationType-Empty" : dr["LocationType"]),
                        ADAS = Convert.ToString(Convert.IsDBNull(dr["ADAS"]) ? "ADAS-Empty" : dr["ADAS"]),
                        WorkBranch = Convert.ToString(Convert.IsDBNull(dr["WorkBranch"]) ? "WorkBranch-Empty" : dr["WorkBranch"]),
                        WorkType = Convert.ToString(Convert.IsDBNull(dr["WorkType"]) ? "WorkType-Empty" : dr["WorkType"]),
                        Postcode = Convert.ToString(Convert.IsDBNull(dr["Postcode"]) ? "Postcode-Empty" : dr["Postcode"])
                    }
                );
            }
                                 

            return inputFetchAvailableAppointmentDateModelList;
        }
    }
}
