﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace DAO
{
    public class DAO_DATABASE
    {
        public static SqlConnection OpenConnect()
        {
            string ChuoiKetNoi = @"Data Source=PHANDUY-PC\PHANDUY;Initial Catalog=QuanLyBanHang;Integrated Security=True";
            SqlConnection con = new SqlConnection(ChuoiKetNoi);
            con.Open();
            return con;

        }
        public static void CloseConnect(SqlConnection con)
        {
            con.Close();
        }
        public static DataTable GetDataTable(SqlCommand cmd)
        {
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            sda.Fill(dt);
            return dt;
        }
        public static void Thucthi(string sTruyVan, SqlConnection con)
        {
            SqlCommand com = new SqlCommand(sTruyVan, con);
            com.CommandType = CommandType.StoredProcedure;
            com.ExecuteNonQuery();
        }

    }
}
