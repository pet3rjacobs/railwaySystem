using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RailwaySystem.TypeLibrary.ViewModel
{
    public class SpSelectScheduleForStation
    {
        public int ScheduleID { get; set; }
        public string StationName { get; set; }
        public int TrainID { get; set; }
        public TimeSpan TimeOut { get; set; }
        public int Sequence { get; set; }
    }
}
