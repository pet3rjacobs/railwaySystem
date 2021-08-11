using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using RailwaySystem.BLL;
using RailwaySystem.DAL;
using RailwaySystem.TypeLibrary.Model;
using RailwaySystem.TypeLibrary.ViewModel;
using RailwaySystem.TypeLibrary.Interface;

namespace RailwaySystem.UI
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Title = "Railway System - By PeterJacobs";
            //Connect to database through interface IRailwaySystem

            IRailwaySystem db = new DBAccess();
            BusinessLogicLayer dbHandler = new BusinessLogicLayer(db);

            int option;

            do
            {
                //Menu
                Console.WriteLine("  Railway System - Main Menu");
                Console.WriteLine("  -------------------");
                Console.WriteLine();
                Console.WriteLine("  1 - View Schedules");
                Console.WriteLine("  2 - Create Booking");
                Console.WriteLine("  3 - Update Booking");
                Console.WriteLine("  4 - Delete Booking");
                Console.WriteLine();
                Console.Write("  Choose Option:\t");


                option = int.Parse(Console.ReadLine());
                Console.WriteLine();

                //Switch case containing all code for option selected

                switch (option)
                {
                    case 1:
                        try
                        {
                            Console.WriteLine("  Stations");
                            Console.WriteLine("  --------");
                            Console.WriteLine();
                            Console.WriteLine("  1 - Uitenhage\n  2 - Despatch\n  3 - North End\n  4 - Port Elizabeth");
                            Console.WriteLine("  -------------------");
                            Console.Write("  Enter current station: ");
                            int stationID = int.Parse(Console.ReadLine());//User selects station 

                            //Pass station ID to retrieve schedules for said station
                            List<SpSelectScheduleForStation> scheduleList = dbHandler.SelectStationSchedule(stationID);

                            //Table header
                            Console.WriteLine();
                            Console.WriteLine("  *Please note: Trains begin route either from Uitenhage or Port Elizabeth.\n  Sequences starting at 1.");
                            Console.WriteLine();
                            Console.WriteLine("  Train Schedules");
                            Console.WriteLine("  ======================================================================");
                            Console.WriteLine("  Schedule\tStation\t\tTrain\t\tDeparture\tSequence");
                            Console.WriteLine("  ======================================================================");
                            foreach (SpSelectScheduleForStation schedule in scheduleList)
                            {
                                Console.WriteLine("  " + schedule.ScheduleID + "\t\t" + schedule.StationName + "\t" + schedule.TrainID + "\t\t" + schedule.TimeOut + "\t" +schedule.Sequence);
                            }
                        }
                        catch (System.Exception exc)
                        {
                            Console.WriteLine("ERROR: {0}", exc.Message);
                        }
                        Console.ReadLine();
                        break;
                    case 2:
                        try
                        {
                            Console.WriteLine("  Stations");
                            Console.WriteLine("  --------");
                            Console.WriteLine();
                            Console.WriteLine("  1 - Uitenhage\n  2 - Despatch\n  3 - North End\n  4 - Port Elizabeth");
                            Console.WriteLine("  -------------------");
                            Console.WriteLine();
                            Console.WriteLine();
                            Console.WriteLine("  New Booking");
                            Console.WriteLine("  -----------");
                            Console.WriteLine();

                            InsertBooking booking = new InsertBooking();//New booking object

                            Console.Write("  Enter Passenger Name: ");
                            booking.PassengerName = Console.ReadLine();
                            Console.Write("  Enter Coach Type:  ");
                            booking.CoachType = Console.ReadLine();
                            Console.Write("  Enter Seat Number: ");
                            booking.SeatNumber = int.Parse(Console.ReadLine());
                            Console.Write("  Enter Schedule ID: ");
                            booking.ScheduleID = int.Parse(Console.ReadLine());
                            Console.Write("  Enter Current Station: ");
                            booking.FromStation = int.Parse(Console.ReadLine());
                            Console.Write("  Enter Destination: ");
                            booking.ToStation = int.Parse(Console.ReadLine());

                            bool status = dbHandler.AddBooking(booking);

                            if (status)
                            {
                                Console.WriteLine("  Success! Booking added for {0}",booking.PassengerName.ToString());
                            }
                            
                        }catch(System.Exception exc)
                        {
                            Console.WriteLine("  ERROR: {0}", exc.Message);
                        }
                        Console.ReadLine();
                        break;
                    case 3:
                        try
                        {
                            Console.WriteLine("  Stations");
                            Console.WriteLine("  --------");
                            Console.WriteLine();
                            Console.WriteLine("  1 - Uitenhage\n  2 - Despatch\n  3 - North End\n  4 - Port Elizabeth");
                            Console.WriteLine("  -------------------");
                            Console.WriteLine();
                            Console.WriteLine();

                            //First retrieve all bookings for TODAY's date
                            List<SpSelectTodaysBookings> bookingsList = dbHandler.SelectBookings();

                            //Table header
                            Console.WriteLine();
                            Console.WriteLine("  *Please note: Bookings listed are only from the today's date.");
                            Console.WriteLine();
                            Console.WriteLine("  Bookings");
                            Console.WriteLine("  =========================================================================================");
                            Console.WriteLine("  Booking ID\tPassenger Name\t\tDate\t\tFrom Station\t\tDestination");
                            Console.WriteLine("  =========================================================================================");
                            foreach (SpSelectTodaysBookings booking in bookingsList)
                            {
                                Console.WriteLine("  " + booking.BookingID + "\t\t" + booking.PassengerName + "\t\t\t" + booking.Date.ToShortDateString() + "\t" + booking.FromStation + "\t\t" + booking.ToStation);
                            }

                            Console.WriteLine();
                            Console.WriteLine();
                            Console.Write("  Enter Booking ID to Update: ");

                            UpdateBooking updateBooking = new UpdateBooking();
                            updateBooking.BookingID = int.Parse(Console.ReadLine());

                            Console.Write("  Edit Destination: ");
                            updateBooking.ToStation = int.Parse(Console.ReadLine());

                            bool status = dbHandler.UpdateBooking(updateBooking);

                            if (status)
                            {
                                Console.WriteLine("  Success! Booking Updated.");
                            }

                        }
                        catch(System.Exception exc)
                        {
                            Console.WriteLine("  ERROR: {0}", exc.Message);
                        }
                        Console.ReadLine();
                        break;
                    case 4:
                        try
                        {
                            Console.WriteLine("  Delete Booking");
                            Console.WriteLine("  --------------");
                            Console.WriteLine();

                            //First retrieve all bookings for TODAY's date
                            List<SpSelectTodaysBookings> bookingsList = dbHandler.SelectBookings();

                            //Table header
                            Console.WriteLine();
                            Console.WriteLine("  *Please note: Bookings listed are only from the today's date.");
                            Console.WriteLine();
                            Console.WriteLine("  Bookings");
                            Console.WriteLine("  =========================================================================================");
                            Console.WriteLine("  Booking ID\tPassenger Name\t\tDate\t\tFrom Station\t\tDestination");
                            Console.WriteLine("  =========================================================================================");

                            foreach (SpSelectTodaysBookings booking in bookingsList)
                            {
                                Console.WriteLine("  " + booking.BookingID + "\t\t" + booking.PassengerName + "\t\t\t" + booking.Date.ToShortDateString() + "\t" + booking.FromStation + "\t\t" + booking.ToStation);
                            }

                            Console.WriteLine();
                            Console.WriteLine();
                            Console.Write("  Enter Booking ID to Delete: ");
                            DeleteBooking delBooking = new DeleteBooking
                            {
                                BookingID = int.Parse(Console.ReadLine())
                            }; //Get booking ID to delete

                            bool status = dbHandler.DeleteBooking(delBooking);

                            if (status)
                            {
                                Console.WriteLine("  Success! Booking Deleted.");
                            }
                        }
                        catch (System.Exception exc)
                        {
                            Console.WriteLine("  ERROR: {0}", exc.Message);
                        }
                        Console.ReadLine();
                        break;
                }
                Console.Clear();
            } while (option != 9);
            Console.ReadLine();
        }
    }
}
