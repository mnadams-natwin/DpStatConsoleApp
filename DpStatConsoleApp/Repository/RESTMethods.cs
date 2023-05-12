using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.IO;
using Newtonsoft.Json;
using RestSharp;
using DpStatConsoleApp.Models;
using System.Web;


namespace DpStatConsoleApp.Repository
{
    public class RESTMethods
    {
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        /// <summary>
        /// Get login session ID.
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        public static RESTResponseModel.RESTResponseLogin LoginRestMethod(string url)
        {
            RESTResponseModel.RESTResponseLogin rrLogin = null;
            log.Info(System.Reflection.MethodBase.GetCurrentMethod().ToString());
            try
            {
                var client = new RestClient(url + "/api/secure/login");
                //client.Encoding = Encoding.UTF8;
           
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12; //
           
                var request = new RestRequest(Method.POST);
                request.AddHeader("Content-Type", "application/x-www-form-urlencoded");
            
                //var body = @"username=Tamworth&password=eknc2645";

                request.AddParameter("username","Tamworth");
                request.AddParameter("password", "eknc2645");
                //request.AddParameter("application/x-www-form-urlencoded", body, ParameterType.RequestBody);
                IRestResponse response = client.Execute(request);
                Console.WriteLine(response.Content);
                rrLogin = JsonConvert.DeserializeObject<RESTResponseModel.RESTResponseLogin>(response.Content);
            }
            catch(Exception ex)
            {
                log.Error(System.Reflection.MethodBase.GetCurrentMethod().ToString() + ex.Message);

            }
            
            return rrLogin;           
        }

        /// <summary>
        /// fetchAvailableAppointmentDatesMethod get a list of available dates
        /// </summary>
        /// <param name="url"></param>
        /// <param name="sessionid"></param>
        /// <param name="FAADate"></param>
        /// <returns></returns>
        public RESTResponseModel.RESTResponseAvailableDates fetchAvailableAppointmentDatesMethod(string url, string sessionid, InputFetchAvailableAppointmentDateModel FAADate)
        {
            RESTResponseModel.RESTResponseAvailableDates rAvailableAppointment = null;
            log.Info(System.Reflection.MethodBase.GetCurrentMethod().ToString());
            Dictionary<string, Object> fetchParam = new Dictionary<string,object>();
            fetchParam.Add("postcode", @FAADate.Postcode.Trim());

            try 
            {
                var client = new RestClient(url + "/api/jobs/fetchAvailableAppointmentDates");
                client.Encoding = Encoding.UTF8;

                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12; //

                var request = new RestRequest(Method.POST);
                request.AddHeader("Content-Type", "application/x-www-form-urlencoded");
                request.AddCookie("APIGATEWAYSESSION", sessionid);
                
                string[] worktype = new string[1];
                worktype[0] = FAADate.WorkType.Trim();
                /* create the body of the message and then jason encode it, ad as a parameter*/
                var body = new { 
                                 postcode = @FAADate.Postcode.Trim(),
                                 worktype = @worktype,
                                 workbranch = @FAADate.WorkBranch.Trim(),
                                 adas = @FAADate.ADAS.Trim(),
                                 locationtype = @FAADate.LocationType.Trim(),
                                 agreeddate = @FAADate.AgreedDate.Trim(),
                                 bnno = @FAADate.BNNo.Trim(),
                                 dayslimit = @FAADate.DaysLimit.Trim()
                
                };                 
                var JsonBodyContent = JsonConvert.SerializeObject(body);
                

                request.AddParameter("data", JsonBodyContent);

                //jsonBody should look somthing like this.
                //request.AddParameter("data", "{\"postcode\":\"CV62GD\",\"worktype\":[\"0101\"],\"workbranch\":\"2903\",\"adas\":\"9\",\"locationtype\":\"B\",\"agreeddate\":\"2021-07-16\",\"bnno\":\"5722\",\"dayslimit\":\"31\"}");

                IRestResponse response = client.Execute(request);
                Console.WriteLine(response.Content);
                rAvailableAppointment = JsonConvert.DeserializeObject<RESTResponseModel.RESTResponseAvailableDates>(response.Content);
            }
            catch(Exception ex)
            {
                log.Error(System.Reflection.MethodBase.GetCurrentMethod().ToString() + ex.Message);
            }
            
            

            return rAvailableAppointment;
        }       
        
    }
}
