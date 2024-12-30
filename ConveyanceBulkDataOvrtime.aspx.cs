using RealERPLIB;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Globalization;

namespace RealERPWEB.F_81_Hrm.F_86_All
{
    public partial class ConveyanceBulkDataOvrtime : System.Web.UI.Page
    {

        ProcessAccess HRData = new ProcessAccess();
        string msg = "";



        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                if (!ASTUtility.PagePermission(HttpContext.Current.Request.Url.AbsoluteUri.ToString(), (DataSet)Session["tblusrlog"]))
                    Response.Redirect("../../AcceessError.aspx");
                DataRow[] dr1 = ASTUtility.PagePermission1(HttpContext.Current.Request.Url.AbsoluteUri.ToString(), (DataSet)Session["tblusrlog"]);
                ((Label)this.Master.FindControl("lblTitle")).Text = dr1[0]["dscrption"].ToString();
                this.Master.Page.Title = dr1[0]["dscrption"].ToString();
                ((LinkButton)this.Master.FindControl("lnkPrint")).Enabled = (Convert.ToBoolean(dr1[0]["printable"]));


                this.GetCompName();

                ////((Label)this.Master.FindControl("lblmsg")).Visible = false;

                // this.ddlyearmon.Text = System.DateTime.Today.ToString("yyyyMM");
                //this.lbldate.Text = "Month Id:";

            }

            if (fileuploadExcel.HasFile)
            {
                try
                {
                    Session.Remove("ExcelDataCon");
                    string connString = "";
                    string StrFileName = string.Empty;
                    if (fileuploadExcel.PostedFile != null && fileuploadExcel.PostedFile.FileName != "")
                    {
                        StrFileName = fileuploadExcel.PostedFile.FileName.Substring(fileuploadExcel.PostedFile.FileName.LastIndexOf("\\") + 1);
                        string StrFileType = fileuploadExcel.PostedFile.ContentType;
                        int IntFileSize = fileuploadExcel.PostedFile.ContentLength;
                        if (IntFileSize <= 0)
                        {
                            return;
                        }
                        else
                        {
                            string savelocation = Server.MapPath("~") + "\\ExcelFile\\";
                            string[] filePaths = Directory.GetFiles(savelocation);
                            foreach (string filePath in filePaths)
                                File.Delete(filePath);
                            fileuploadExcel.PostedFile.SaveAs(Server.MapPath("~") + "\\ExcelFile\\" + StrFileName);
                        }
                    }

                    string strFileType = Path.GetExtension(fileuploadExcel.FileName).ToLower();
                    string apppath = System.Web.Hosting.HostingEnvironment.ApplicationPhysicalPath.ToString();
                    string path = Server.MapPath("~") + ("\\ExcelFile\\" + StrFileName);


                    if (strFileType.Trim() == ".xls")
                    {
                        connString = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + path + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=2\"";
                    }
                    else if (strFileType.Trim() == ".xlsx")
                    {

                        connString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties='Excel 12.0 Xml;HDR=YES;'";
                    }

                    string query = "";
                    query = "SELECT * FROM [Sheet1$]";
                    OleDbConnection conn = new OleDbConnection(connString);
                    if (conn.State == ConnectionState.Closed)
                        conn.Open();
                    OleDbCommand cmd = new OleDbCommand(query, conn);
                    OleDbDataAdapter da = new OleDbDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);


                    DataView dv = ds.Tables[0].DefaultView;
                    Session["ExcelDataCon"] = dv.ToTable();
                    da.Dispose();
                    conn.Close();
                    conn.Dispose();
                    string msg = "Please Click Adjust Button";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "showContent('" + msg + "');", true);

                }
                catch (Exception ex)
                {

                    throw ex;
                }

            }

        }


        private void GetCompName()
        {

            try
            {
                Session.Remove("tblcompany");
                Hashtable hst = (Hashtable)Session["tblLogin"];
                string userid = hst["usrid"].ToString();
                string comcod = this.GetComeCode();
                string txtCompany = "%";
                DataSet ds1 = HRData.GetTransInfo(comcod, "dbo_hrm.SP_ENTRY_EMPLOYEE01", "GETCOMPANYNAME1", txtCompany, userid, "", "", "", "", "", "", "");
                this.ddlCompanyName.DataTextField = "actdesc";
                this.ddlCompanyName.DataValueField = "actcode";
                this.ddlCompanyName.DataSource = ds1.Tables[0];
                this.ddlCompanyName.DataBind();
                Session["tblcompany"] = ds1.Tables[0];
                this.ddlCompanyName_SelectedIndexChanged(null, null);
                ds1.Dispose();
            }
            catch (Exception ex)
            { }
        }
        protected void lnkbtnShow_Click(object sender, EventArgs e)
        {
            try
            {

                string comcod = this.GetComeCode();
                string deptname = (this.ddlDepartment.SelectedValue.ToString() == "000000000000") ? "%" : this.ddlDepartment.SelectedValue.ToString().Substring(0, 9) + "%";


                string section = (this.ddlSection.SelectedValue.ToString() == "000000000000") ? "%" : this.ddlSection.SelectedValue.ToString() + "%";
                string idcardno = "%" + this.txtSrcEmployee.Text.Trim() + "%";



                DataSet ds = HRData.GetTransInfo(GetComeCode(), "dbo_hrm.SP_ENTRY_EMPLOYEE01", "EMPCONVEYANCEGET", deptname, section, idcardno, "", "", "");

                if (ds is null)
                {
                    return;

                }

                Session["tblEmpConveData"] = ds.Tables[0];

                this.Data_Bind();


            }
            catch (Exception ex)
            { }


        }
        protected void ddlCompanyName_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.GetDepartment();
        }
        private void GetDepartment()
        {
            try
            {
                if (this.ddlCompanyName.Items.Count == 0)
                    return;
                string comcod = this.GetComeCode();
                int hrcomln = Convert.ToInt32((((DataTable)Session["tblcompany"]).Select("actcode='" + this.ddlCompanyName.SelectedValue.ToString() + "'"))[0]["hrcomln"]);
                string nozero = (hrcomln == 4) ? "0000" : "00";
                string txtCompanyname = (this.ddlCompanyName.SelectedValue.Substring(0, hrcomln).ToString() == nozero) ? "%" : this.ddlCompanyName.SelectedValue.Substring(0, hrcomln).ToString() + "%";

                string txtSearchDept = "%";

                DataSet ds1 = HRData.GetTransInfo(comcod, "dbo_hrm.SP_ENTRY_EMPLOYEE01", "GETDEPARTMENT", txtCompanyname, txtSearchDept, "", "", "", "", "", "", "");
                this.ddlDepartment.DataTextField = "actdesc";
                this.ddlDepartment.DataValueField = "actcode";
                this.ddlDepartment.DataSource = ds1.Tables[0];
                this.ddlDepartment.DataBind();
                this.ddlDepartment_SelectedIndexChanged(null, null);
            }
            catch (Exception ex)
            { }
        }
        protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.SectionName();
        }
        private void SectionName()
        {
            try
            {
                string comcod = this.GetComeCode();
                string projectcode = this.ddlDepartment.SelectedValue.ToString();
                string txtSSec = "%";
                DataSet ds2 = HRData.GetTransInfo(comcod, "dbo_hrm.SP_REPORT_PAYROLL", "SECTIONNAME", projectcode, txtSSec, "", "", "", "", "", "", "");
                this.ddlSection.DataTextField = "sectionname";
                this.ddlSection.DataValueField = "section";
                this.ddlSection.DataSource = ds2.Tables[0];
                this.ddlSection.DataBind();
            }
            catch (Exception ex)
            { }
        }
        protected void gvConveyance_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.gvConveyance.PageIndex = e.NewPageIndex;
            this.Data_Bind();
        }
        protected void lbtnuploadExcelAdjust_Click(object sender, EventArgs args)
        {
            try
            {

                string comcod = this.GetComeCode();

                bool isAllValid = true;
                DataTable dt = (DataTable)Session["ExcelDataCon"];
                int rowCount = 0;

                DataTable dt1 = (DataTable)Session["tblEmpConveData"];

                if (dt.Rows.Count == 0 || dt1.Rows.Count == 0)
                {
                    return;
                }

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string idcardno = dt.Rows[i]["idcardno"].ToString();


                }
                if (isAllValid)
                {

                    for (int i = 0; i < dt1.Rows.Count; i++)
                    {
                        DataRow[] rows = dt.Select("idcardno ='" + dt1.Rows[i]["idcardno"] + "'");

                        if (rows.Length > 0)
                        {
                            double convamt = 0.00;
                            convamt = Convert.ToDouble("0" + rows[0]["convamt"]);
                            dt1.Rows[i]["convamt"] = convamt;

                            dt1.AcceptChanges();

                        }
                    }
                }



                Session["tblEmpConveData"] = dt1;



                this.Data_Bind();






            }
            catch (Exception ex)
            { }
        }
        private string GetComeCode()
        {
            Hashtable hst = (Hashtable)Session["tblLogin"];
            return (hst["comcod"].ToString());

        }
        protected void ddlpagesize_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Data_Bind();
        }
        private void SaveValue()
        {
            try

            {

                DataTable dt = (DataTable)Session["ExcelDataCon"];
                if (dt.Rows.Count < 0)
                {
                    return;
                }
                int rowindex;
                for (int i = 0; i < this.gvConveyance.Rows.Count; i++)
                {
                    double convamt = Convert.ToDouble("0" + ((TextBox)this.gvConveyance.Rows[i].FindControl("txtgvconvamt")).Text.Trim());


                    rowindex = (this.gvConveyance.PageSize) * (this.gvConveyance.PageIndex) + i;
                    dt.Rows[rowindex]["convamt"] = convamt;

                }
                Session["ExcelDataCon"] = dt;



                this.Data_Bind();





            }
            catch (Exception ex) { }

        }
        private void Data_Bind()
        {
            try
            {
                DataTable dt = (DataTable)Session["tblEmpConveData"];
                this.gvConveyance.PageSize = Convert.ToInt32(this.ddlpagesize.SelectedValue.ToString());
                this.gvConveyance.DataSource = dt;
                this.gvConveyance.DataBind();



                this.FooterCalculation();

            }
            catch (Exception ex) { }

        }
        protected void imgbtnSearchEmployee_Click(object sender, EventArgs e)
        {

        }
        protected void lbntCalculation_Click(object sender, EventArgs e)
        {
            try
            {

                DataTable dt = (DataTable)Session["tblEmpConveData"];
                int rowindex;
                for (int i = 0; i < this.gvConveyance.Rows.Count; i++)
                {
                    double convamt = Convert.ToDouble("0" + ((TextBox)this.gvConveyance.Rows[i].FindControl("txtgvconvamt")).Text.Trim());


                    rowindex = (this.gvConveyance.PageSize) * (this.gvConveyance.PageIndex) + i;
                    dt.Rows[rowindex]["convamt"] = convamt;

                }
                Session["ExcelDataCon"] = dt;



                this.Data_Bind();





            }

            catch (Exception ex)
            { }




        }





        private void FooterCalculation()
        {
            DataTable dt = (DataTable)Session["tblEmpConveData"];
            if (dt.Rows.Count == 0)
                return;

            ((Label)this.gvConveyance.FooterRow.FindControl("lgvFreconamt")).Text = Convert.ToDouble((Convert.IsDBNull(dt.Compute("sum(convamt)", "")) ? 0.00
                          : dt.Compute("sum(convamt)", ""))).ToString("#,##0;(#,##0); ");


            ((Label)this.gvConveyance.FooterRow.FindControl("lgvgosssalt")).Text = Convert.ToDouble((Convert.IsDBNull(dt.Compute("sum(grossal)", "")) ? 0.00
                 : dt.Compute("sum(grossal)", ""))).ToString("#,##0;(#,##0); ");


        }




        protected void lbntUpdate_Click(object sender, EventArgs e)
        {
            try
            {

                this.SaveValue();
                DataTable dt = (DataTable)Session["tblEmpConveData"];
                string comcod = this.GetComeCode();

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string empid = dt.Rows[i]["empid"].ToString();
                    string convamt = Convert.ToDouble(dt.Rows[i]["convamt"]).ToString();


                    if (Convert.ToDouble(convamt) > 0)
                    {
                        bool result = HRData.UpdateTransInfo(comcod, "dbo_hrm.SP_ENTRY_EMPLOYEE01", "EMPCONVEYANCEUPDATE", empid, convamt, "", "", "", "", "", "", "", "", "", "", "");
                        if (!result)
                            return;

                    }
                }
                msg = "Updated Successfully";
                ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "showContent('" + msg + "');", true);


            }

            catch (Exception ex)
            { }




        }






    }
}
