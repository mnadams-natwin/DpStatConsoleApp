using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DpStatConsoleApp.Repository;
using DpStatConsoleApp.Models;
using System.Configuration;

namespace DpStatConsoleApp
{
    class Program
    {
        private static string RESTNWhubUri = ConfigurationManager.AppSettings["RESTNWhubUri"].ToString() ?? "";
        private static int AgreedDateOffset = Convert.ToInt32(ConfigurationManager.AppSettings["AgreedDateOffset"]);
        private static string DaysLimit = ConfigurationManager.AppSettings["DaysLimit"].ToString() ?? "";
        
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        static void Main(string[] args)
        {
            log.Info(System.Reflection.MethodBase.GetCurrentMethod().ToString());
            int rowsAffected = 0;
            InputFetchAvailableAppointmentDateRepo inputFetchAvailableAppointmentDateRepo = new InputFetchAvailableAppointmentDateRepo();
            AvailableAppointmentDatesRepo availableAppointmentDatesRepo = new AvailableAppointmentDatesRepo();
            RESTMethods rMethod = new RESTMethods();
            string strAgreedDate = ((DateTime.Today).AddDays(AgreedDateOffset)).ToString("yyyy-MM-dd");
            string strDaysLimit = DaysLimit.ToString();
            RESTResponseModel.RESTResponseLogin rrLogin = RESTMethods.LoginRestMethod(RESTNWhubUri);
            if (rrLogin != null)
            {
                //Testing input method
                IList<InputFetchAvailableAppointmentDateModel> inputFetchAvailableAppointmentDateModelList = inputFetchAvailableAppointmentDateRepo.GetInputFetchAvailableAppointmentDate();

                foreach (InputFetchAvailableAppointmentDateModel iFAADate in inputFetchAvailableAppointmentDateModelList)
                {

                    //Set AgreedDate in the object iFAADate before use
                    iFAADate.AgreedDate = strAgreedDate;
                    iFAADate.DaysLimit = DaysLimit;

                    RESTResponseModel.RESTResponseAvailableDates availableAppointmentDates = rMethod.fetchAvailableAppointmentDatesMethod(RESTNWhubUri, rrLogin.sessionid, iFAADate);
                    if (availableAppointmentDates != null)
                    {

                        //insert available dates to availableAppointmentDates table in the database
                        log.Info(availableAppointmentDates.message);
                        if (availableAppointmentDates.data != null)
                        {
                            //insertavailable dates into availableAppointmentDates tables.
                            if (availableAppointmentDates.data.Availability != null)
                            {
                                foreach (String StrDates in availableAppointmentDates.data.Availability)
                                {
                                    System.DateTime dtDateAvailable = System.DateTime.ParseExact(StrDates, "yyyy-MM-dd", null);
                                    rowsAffected = availableAppointmentDatesRepo.uspInsertAvailableAppointmentDates((DateTime.Today).AddDays(AgreedDateOffset), iFAADate.WorkBranch, iFAADate.BNNo, iFAADate.LocationType, dtDateAvailable, iFAADate.ADAS, iFAADate.WorkType);
                                }
                            }
                            else
                            {
                                log.Error(System.Reflection.MethodBase.GetCurrentMethod().ToString() + ": availableAppointmentDates.data.Availability is NULL");
                            }
                        }
                        else
                        {
                            log.Error(System.Reflection.MethodBase.GetCurrentMethod().ToString() + ": availableAppointmentDates.data is NULL");
                        }
                    }
                    else
                    {
                        log.Error(System.Reflection.MethodBase.GetCurrentMethod().ToString() + ": availableAppointmentDates is NULL");
                    }
                    /*Testing insert dates and properties from AvailableAppointmentDates
                     * Testing rowsAffected = availableAppointmentDatesRepo.uspInsertAvailableAppointmentDates((DateTime.Today).AddDays(1), "9900", "Fleet", "M", (DateTime.Today).AddDays(6));
                     */

                }

            }
            else
            {
                log.Error(System.Reflection.MethodBase.GetCurrentMethod().ToString() + ": Failed to Login to " + RESTNWhubUri + "- rrLogin is NULL");
            }

            

        }
    }
}
