using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RailwaySystem.TypeLibrary.ViewModel
{
    public class SpSelectTodaysBookings
    {
        public int BookingID { get; set; }
        public string PassengerName { get; set; }
        public DateTime Date { get; set; }
        public string FromStation { get; set; }
        public int ToStation { get; set; }
    }
}
