using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RailwaySystem.TypeLibrary.Model
{
    public class InsertBooking
    {
        public string CoachType { get; set; }
        public int SeatNumber { get; set; }
        public int ScheduleID { get; set; }
        public int FromStation { get; set; }
        public int ToStation { get; set; }
        public string PassengerName { get; set; }
    }
}
