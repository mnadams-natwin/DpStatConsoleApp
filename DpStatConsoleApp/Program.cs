using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DpStatConsoleApp.Repository;
using DpStatConsoleApp.Models;

namespace DpStatConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            int rowsAffected = 0;
            InputFetchAvailableAppointmentDateRepo inputFetchAvailableAppointmentDateRepo = new InputFetchAvailableAppointmentDateRepo();
            AvailableAppointmentDatesRepo availableAppointmentDatesRepo = new AvailableAppointmentDatesRepo();

            //Testing input method
            IList<InputFetchAvailableAppointmentDateModel> inputFetchAvailableAppointmentDateModelList = inputFetchAvailableAppointmentDateRepo.GetInputFetchAvailableAppointmentDate();

            //Testing insert
            rowsAffected = availableAppointmentDatesRepo.uspInsertAvailableAppointmentDates((DateTime.Today).AddDays(1), "9900", "Fleet", "M", (DateTime.Today).AddDays(6) ); 


        }
    }
}
