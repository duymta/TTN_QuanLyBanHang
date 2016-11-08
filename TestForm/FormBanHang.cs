﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using DAO;
using DevExpress.XtraPrinting;
using DevExpress.XtraReports.UI;
using DevExpress.XtraPrinting.Preview;
using DevExpress.XtraEditors;
using Microsoft.ApplicationBlocks.Data;
using BUS;
namespace TestForm
{
    public partial class FormBanHang : Form
    {
        public SqlConnection con;
        public FormBanHang()
        {
            InitializeComponent();

            // This line of code is generated by Data Source Configuration Wizard
            // Fill a SqlDataSource
           // sqlDataSource1.Fill();
            // This line of code is generated by Data Source Configuration Wizard
            // Fill a SqlDataSource
            sqlDataSource1.Fill();
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void barButtonItem6_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            DataRow rowBH = grdBanHang.GetDataRow(grdBanHang.FocusedRowHandle);
            string s = grdBanHang.GetRowCellValue(grdBanHang.FocusedRowHandle, "MaPhieu").ToString();

            if (s != null)
            {
                
               DataTable dt = new DataTable();
            con = DAO_DATABASE.OpenConnect();
            dt = SqlHelper.ExecuteDataset(con, "PR_HOADON_IN", s).Tables[0];
            DAO_DATABASE.CloseConnect(con);
            XtraReport1 report = new XtraReport1();
            report.DataSource = dt;
            report.DataMember = "Table";
            ReportPrintTool print = new ReportPrintTool(report);
            print.ShowPreviewDialog(); 
            }
            else
            {
                MessageBox.Show("Bạn phải click vào Hoa Don muốn xem Hoa Don");
            } 
        }

        private void gridControl1_Click(object sender, EventArgs e)
        {

        }

        private void navBarControl1_Click(object sender, EventArgs e)
        {

        }

       
        public string nextMa(string s)
        {
            string sub1 = s.Substring(0, 2);
            string sub2 = s.Substring(2).Trim();
            int ma = Convert.ToInt32(sub2) + 1;
            string sub = "";
            for (int i = 0; i < sub2.Length - ma.ToString().Length; i++)
            sub+="0";
                sub += ma.ToString();
                sub1 += sub;

            
            return sub1;
        }
            
        private void barButtonItem7_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            DialogResult dr = MessageBox.Show("Ban co muon them hoa don", "thong bao", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
                if (dr==DialogResult.OK)
                {
                    con=DAO_DATABASE.OpenConnect();
                    string S = SqlHelper.ExecuteScalar(con, CommandType.StoredProcedure, "PR_HOADON_HIENTHI_MA_MAX").ToString();
                    string MaPhieu = nextMa(S);
                    SqlHelper.ExecuteNonQuery(con, "PR_HOADON_THEM", MaPhieu,DateTime.Now);
                    DAO_DATABASE.CloseConnect(con);
   
                    grcBanHang.DataSource = BUS_HOADON.HienThi_HoaDon();
                   
                }

        }

        private void barButtonItem3_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            try
            {
                DialogResult dr = MessageBox.Show("Ban co muon xoa hoa don", "thong bao", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
                if (dr == DialogResult.OK)
                {
                    string s = grdBanHang.GetRowCellValue(grdBanHang.FocusedRowHandle, "MaPhieu").ToString();
                    con = DAO_DATABASE.OpenConnect();
                    SqlHelper.ExecuteNonQuery(con, "PR_HOADON_XOA", s);
                    DAO_DATABASE.CloseConnect(con);

                    grcBanHang.DataSource = BUS_HOADON.HienThi_HoaDon();

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Loi"+ex);
            }
        }

        private void grcBanHang_Click(object sender, EventArgs e)
        {

        }

        private void barButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            string s = grdBanHang.GetRowCellValue(grdBanHang.FocusedRowHandle, "MaPhieu").ToString();
            if (s != null)
            {
                // string a = (string)rowBH[0]; //ma de tai
                FormHoaDonChiTiet frm = new FormHoaDonChiTiet(s);
                frm.ShowDialog();
            }
            else
            {
                MessageBox.Show("Bạn phải click vào Hoa Don muốn xem Hoa Don");
            }
        }
    }
}