using System;
using System.Collections.Generic;

using RailwaySystem.TypeLibrary.Model;
using RailwaySystem.TypeLibrary.ViewModel;
using RailwaySystem.TypeLibrary.Interface;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

namespace RailwaySystem.DAL
{
    public class DBAccess: IRailwaySystem
    {
        #region InsertStatments
        public bool AddBooking(InsertBooking booking)
        {
            List<SqlParameter> param = new List<SqlParameter>();
            foreach (var prop in booking.GetType().GetProperties())
            {
                if (prop.GetValue(booking) != null)
                {
                    param.Add(new SqlParameter("@" + prop.Name.ToString(), prop.GetValue(booking)));
                }
            }
            return DBHelper.NonQuery("sp_InsertBooking", CommandType.StoredProcedure, param.ToArray());
        }
        #endregion

        #region UpdateStatements

        #endregion
        public bool UpdateBooking(UpdateBooking booking)
        {
            List<SqlParameter> param = new List<SqlParameter>();
            foreach (var prop in booking.GetType().GetProperties())
            {
                if (prop.GetValue(booking) != null)
                {
                    param.Add(new SqlParameter("@" + prop.Name.ToString(), prop.GetValue(booking)));
                }
            }
            return DBHelper.NonQuery("sp_UpdateBooking", CommandType.StoredProcedure, param.ToArray());
        }
        #region Delete Statements
        public bool DeleteBooking(DeleteBooking booking)
        {
            List<SqlParameter> param = new List<SqlParameter>();
            foreach (var prop in booking.GetType().GetProperties())
            {
                if (prop.GetValue(booking) != null)
                {
                    param.Add(new SqlParameter("@" + prop.Name.ToString(), prop.GetValue(booking)));
                }
            }
            return DBHelper.NonQuery("sp_DeleteBooking", CommandType.StoredProcedure, param.ToArray());
        }
        #endregion
        #region SelectStatements
        public List<SpSelectScheduleForStation> SelectStationSchedule(int stationID)
        {
            List<SpSelectScheduleForStation> scheduleList = new List<SpSelectScheduleForStation>();
            SpSelectScheduleForStation schedule;

            SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("FromStation",stationID)
            };

            using (DataTable table = DBHelper.ParamSelect("sp_SelectScheduleForStation", CommandType.StoredProcedure,parameter))
            {
                if (table.Rows.Count > 0)
                {
                    foreach (DataRow row in table.Rows)
                    {
                        schedule = new SpSelectScheduleForStation
                        {
                            ScheduleID = Convert.ToInt32(row["Schedule"]),
                            StationName = Convert.ToString(row["From Station"]),
                            TrainID = Convert.ToInt32(row["Train"]),
                            TimeOut = (TimeSpan)(row["Departure"]),
                            Sequence = Convert.ToInt32(row["Sequence"])
                        };
                        scheduleList.Add(schedule);
                    }
                }
            }
            return scheduleList;
        }//End SelectStationSchedule(int stationID)

        public List<SpSelectTodaysBookings> SelectBookings()
        {
            List<SpSelectTodaysBookings> bookingsList = new List<SpSelectTodaysBookings>();
            SpSelectTodaysBookings booking;

            using (DataTable table = DBHelper.Select("sp_SelectTodaysBookings", CommandType.StoredProcedure))
            {
                if (table.Rows.Count > 0)
                {
                    foreach (DataRow row in table.Rows)
                    {
                        booking = new SpSelectTodaysBookings
                        {
                            BookingID = Convert.ToInt32(row["Booking ID"]),
                            PassengerName = Convert.ToString(row["Passenger Name"]),
                            Date = Convert.ToDateTime(row["Date"]),
                            FromStation = Convert.ToString(row["From Station"]),
                            ToStation = Convert.ToInt32(row["Destination"])
                        };
                        bookingsList.Add(booking);
                    }
                }
            }
            return bookingsList;
        }//End SelectBookings()
        #endregion

    }
}
