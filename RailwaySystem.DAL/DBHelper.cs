using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace RailwaySystem.DAL
{
    internal class DBHelper
    {
        //Configuration Manager
        //Default connString Name
        private static string connString = ConfigurationManager.ConnectionStrings["RailwaySystem.Con"].ConnectionString;

        #region NonQuery

        internal static bool NonQuery(string cmdName, CommandType cmdType, SqlParameter[] pars)
        {
            int result = 0;

            using (SqlConnection con = new SqlConnection(connString))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    //SqlCommand Parsed Values
                    cmd.CommandType = cmdType;      //eg Stored Procedure
                    cmd.CommandText = cmdName;      //eg usp_SelectEmp
                    cmd.Parameters.AddRange(pars);  //eg int empID, etc...

                    if (con.State != ConnectionState.Open)
                    {
                        //Open connection!
                        con.Open();
                        //Assign value to integer
                        result = cmd.ExecuteNonQuery();
                    }
                }
            }
            //Return value for NonQuery (either 0 or 1)
            return result > 0;
        }

        #endregion NonQuery

        #region Select

        public static DataTable Select(string cmdName, CommandType cmdType)
        {
            DataTable table = null;

            using (SqlConnection con = new SqlConnection(connString))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    //SqlCommand Parsed Values
                    cmd.CommandType = cmdType;      //eg Stored Procedure
                    cmd.CommandText = cmdName;      //eg usp_SelectEmp

                    try
                    {
                        if (con.State != ConnectionState.Open)
                        {
                            //Open connection
                            con.Open();
                        }
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            //Create and fill DataTable
                            table = new DataTable();
                            da.Fill(table);
                        }
                    }
                    catch (SqlException ex)
                    {
                        throw ex;// new System.Exception("Not available at this time!");
                    }
                }
            }
            return table;
        }

        #endregion Select

        #region ParamSelect

        internal static DataTable ParamSelect(string cmdName, CommandType cmdType, SqlParameter[] pars)
        {
            DataTable table = new DataTable();
            using (SqlConnection con = new SqlConnection(connString))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    //SqlCommand Parsed Values
                    cmd.CommandType = cmdType;      //eg Stored Procedure
                    cmd.CommandText = cmdName;      //eg usp_SelectEmp
                    cmd.Parameters.AddRange(pars);  //eg int empID, etc...

                    try
                    {
                        if (con.State != ConnectionState.Open)
                        {
                            //Open SqlConnection if closed!
                            con.Open();
                        }
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            //Populate collection
                            da.Fill(table);
                        }
                    }
                    catch
                    {
                        throw;
                    }
                }
            }
            return table;
        }

        #endregion ParamSelect
    }
}
