using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using RailwaySystem.DAL;
using RailwaySystem.TypeLibrary.Model;
using RailwaySystem.TypeLibrary.ViewModel;
using RailwaySystem.TypeLibrary.Interface;

namespace RailwaySystem.BLL
{
    public class BusinessLogicLayer : IRailwaySystem
    {
        //Allow access to interface for the DBAccess - implementation of interface ICarServiceSolution
        private readonly IRailwaySystem dbAccess;

        //Constructor for DBHandler
        public BusinessLogicLayer(IRailwaySystem db)
        {
            this.dbAccess = db;
        }

        #region InsertStatements
        public bool AddBooking(InsertBooking booking)
        {
            return dbAccess.AddBooking(booking);
        }
        #endregion

        #region UpdateStatments

        #endregion
        public bool UpdateBooking(UpdateBooking booking)
        {
            return dbAccess.UpdateBooking(booking);
        }
        #region DeleteStatements
        public bool DeleteBooking(DeleteBooking booking)
        {
            return dbAccess.DeleteBooking(booking);
        }
        #endregion
        #region Selects With Parameters
        public List<SpSelectScheduleForStation> SelectStationSchedule(int stationID)
        {
            return dbAccess.SelectStationSchedule(stationID);
        }

        public List<SpSelectTodaysBookings> SelectBookings()
        {
            return dbAccess.SelectBookings();
        }
        #endregion
    }
}
