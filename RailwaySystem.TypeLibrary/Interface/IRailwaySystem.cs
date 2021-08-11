using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using RailwaySystem.TypeLibrary.Model;
using RailwaySystem.TypeLibrary.ViewModel;

namespace RailwaySystem.TypeLibrary.Interface
{
    public interface IRailwaySystem
    {
        #region Selects
        List<SpSelectScheduleForStation> SelectStationSchedule(int StationID);
        List<SpSelectTodaysBookings> SelectBookings();
        #endregion

        #region Inserts,Updates and Deletes
        bool AddBooking(InsertBooking booking);
        bool UpdateBooking(UpdateBooking booking);
        bool DeleteBooking(DeleteBooking booking);
        #endregion
    }
}
