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
    public class AvailableAppointmentDatesRepo:DbConn
    {
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        /// <summary>
        /// uspInsertAvailableAppointmentDates insert the results from the API gateway 
        /// </summary>
        /// <param name="AgreedDate"></param>
        /// <param name="BranchNo"></param>
        /// <param name="BNStyle"></param>
        /// <param name="LocationType"></param>
        /// <param name="AvailableDate"></param>
        /// /// <param name="ADASType"></param>
        /// /// <param name="WorkType"></param>
        /// <returns></returns>
        public int uspInsertAvailableAppointmentDates(System.DateTime AgreedDate, string BranchNo, string BNNo, string LocationType, System.DateTime AvailableDate,  string ADASType, string WorkType)
        {
            log.Debug(System.Reflection.MethodBase.GetCurrentMethod().ToString());
            int rowsAffected = 0;
            try
            {
                conHandle();

                SqlCommand com = new SqlCommand("uspInsertAvailableAppointmentDates", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@AgreedDate", ((object)AgreedDate) ?? DBNull.Value);
                com.Parameters.AddWithValue("@BranchNo", ((object)BranchNo) ?? DBNull.Value);
                com.Parameters.AddWithValue("@BNNo", ((object)BNNo) ?? DBNull.Value);               
                com.Parameters.AddWithValue("@LocationType", ((object)LocationType) ?? DBNull.Value);
                com.Parameters.AddWithValue("@AvailableDate", ((object)AvailableDate) ?? DBNull.Value);
                com.Parameters.AddWithValue("@ADASType", ((object)ADASType) ?? DBNull.Value);
                com.Parameters.AddWithValue("@WorkType", ((object)WorkType) ?? DBNull.Value);

                con.Open();
                rowsAffected = com.ExecuteNonQuery();
                con.Close();

            }
            catch (Exception ex)
            {
                Console.WriteLine(System.Reflection.MethodBase.GetCurrentMethod().ToString() + "{0}", ex);
                log.Error(System.Reflection.MethodBase.GetCurrentMethod().ToString() + " " + ex);
            }
            return rowsAffected;
        }
    }
}
