using RealERPLIB;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealERPWEB.F_81_Hrm.F_92_Mgt
{
    public partial class EmployeesGrossSalaryDeductionSetup : System.Web.UI.Page
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
                ((Label)this.Master.FindControl("lblmsg")).Visible = false;
                this.YearBind();
                this.GetCompName();
                this.lblsecrow.Visible = false;
            }

        }

        private void YearBind()
        {
            List<YearMonth> objlistYearMonth = new List<YearMonth>();

            for (int i = -5; i < 12; i++)
            {
                YearMonth objYearMonth = new YearMonth();
                var month = DateTime.Now.AddMonths(i);
                string monthString = month.ToString("MMM-yyyy", CultureInfo.InvariantCulture);
                objYearMonth.monthString = monthString;
                DateTime date = DateTime.ParseExact(monthString, "MMM-yyyy", CultureInfo.InvariantCulture);
                string yearmonthid = date.ToString("yyyyMM");
                objYearMonth.yearmonthid = Convert.ToInt32(yearmonthid);
                objlistYearMonth.Add(objYearMonth);


            }
            this.ddlYearMonth.DataSource = objlistYearMonth;
            this.ddlYearMonth.DataTextField = "monthString";
            this.ddlYearMonth.DataValueField = "yearmonthid";
            this.ddlYearMonth.DataBind();


        }
        public class YearMonth
        {
            public int yearmonthid { get; set; }
            public string monthString { get; set; }
        }
        private void GetDepartment()
        {
            if (this.ddlCompanyName.Items.Count == 0)
                return;
            string comcod = this.GetComeCode();
            int hrcomln = Convert.ToInt32((((DataTable)Session["tblcompany"]).Select("actcode='" + this.ddlCompanyName.SelectedValue.ToString() + "'"))[0]["hrcomln"]);
            string nozero = (hrcomln == 4) ? "0000" : "00";
            string txtCompanyname = (this.ddlCompanyName.SelectedValue.Substring(0, hrcomln).ToString() == nozero) ? "%" : this.ddlCompanyName.SelectedValue.Substring(0, hrcomln).ToString() + "%";

            // string txtCompanyname =(this.ddlCompanyName.SelectedValue.ToString().Substring(0, 2) =="00")?"%":this.ddlCompanyName.SelectedValue.ToString().Substring(0, 2) + "%";
            string txtSearchDept = "%";

            DataSet ds1 = HRData.GetTransInfo(comcod, "dbo_hrm.SP_ENTRY_EMPLOYEE01", "GETDEPARTMENT", txtCompanyname, txtSearchDept, "", "", "", "", "", "", "");
            this.ddlDepartment.DataTextField = "actdesc";
            this.ddlDepartment.DataValueField = "actcode";
            this.ddlDepartment.DataSource = ds1.Tables[0];
            this.ddlDepartment.DataBind();
            this.ddlDepartment_SelectedIndexChanged(null, null);
        }
        private string GetComeCode()
        {
            Hashtable hst = (Hashtable)Session["tblLogin"];
            return (hst["comcod"].ToString());

        }
        protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.SectionName();
        }

        private void SectionName()
        {

            string comcod = this.GetComeCode();
            string projectcode = this.ddlDepartment.SelectedValue.ToString();
            string txtSSec = "%";
            DataSet ds2 = HRData.GetTransInfo(comcod, "dbo_hrm.SP_REPORT_PAYROLL", "SECTIONNAME", projectcode, txtSSec, "", "", "", "", "", "", "");
            this.ddlSection.DataTextField = "sectionname";
            this.ddlSection.DataValueField = "section";
            this.ddlSection.DataSource = ds2.Tables[0];
            this.ddlSection.DataBind();


            this.GetEmpName();

        }
        private void GetCompName()
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
        protected void ddlCompanyName_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.GetDepartment();
        }



        protected void ddlSection_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.GetEmpName();
        }




        protected void Page_PreInit(object sender, EventArgs e)
        {
          //  ((LinkButton)this.Master.FindControl("lnkPrint")).Click += new EventHandler(lbtnPrint_Click);

        }
        protected void lnkbtnShow_Click(Object sender, EventArgs args)
        {
            try
            {
                if (this.lnkbtnShow.Text == "Ok")
                {
                    this.lnkbtnShow.Text = "New";
                   
                    this.ddlCompanyName.Enabled = false;
                    this.ddlDepartment.Enabled = false;
                    this.ddlSection.Enabled = false;
                    this.ddlemployee.Enabled = false;
                    this.ddlYearMonth.Enabled = false;
                    this.ddlemployee.Enabled = true;
                    this.lblsecrow.Visible = true;

                    string comcod = this.GetComeCode();

                    string empid = this.ddlemployee.SelectedValue.ToString();
                    string monthyearid = this.ddlYearMonth.SelectedValue.ToString();
                    DataSet ds = HRData.GetTransInfo(comcod, "dbo_hrm.SP_ENTRY_EMPLOYEE01", "GETDATAFORGROSSDEDUCTION", monthyearid, empid, "", "", "", "", "");

                    if (ds is null)
                    {
                        return;

                    }
                    ViewState["tblempgrossded"] = ds.Tables[0];
                }

                else
                {

                    this.lnkbtnShow.Text = "Ok";                  
                    this.ddlCompanyName.Enabled = true;
                    this.ddlDepartment.Enabled = true;
                    this.ddlSection.Enabled = true;
                    this.lblsecrow.Visible = false;
                    ViewState["tblempgrossded"] = null;




                }
                this.loadExistdata();
            }

            catch (Exception ex) { }

        }

        protected void lDelete_Click(Object sender, EventArgs args)
        {
            try 
            {
            



            
            
            }
            catch (Exception ex)
            { 
            
            
            
            }
        
        
        
        }




        protected void lnkbtnAdd_Click(Object sender, EventArgs args)
        {
            try {
                string comcod = this.GetComeCode();
                string empid = this.ddlemployee.SelectedValue.ToString();               
                DataSet ds = HRData.GetTransInfo(comcod, "dbo_hrm.SP_ENTRY_EMPLOYEE01", "GETDATAFORGROSSDEDUCTIONINDIVIDUALINFO", empid, "", "", "", "", "");


                string empname = ds.Tables[0].Rows[0]["empname"].ToString();
                string sectionname = ds.Tables[0].Rows[0]["sectionname"].ToString();
                string desigid = ds.Tables[0].Rows[0]["desigid"].ToString();
                string idcard = ds.Tables[0].Rows[0]["idcard"].ToString();
                string desig = ds.Tables[0].Rows[0]["desig"].ToString();
               

                DataTable dt = (DataTable)ViewState["tblempgrossded"];

                bool isDuplicate = dt.AsEnumerable().Any(row => row["empid"].ToString() == empid);

                if (isDuplicate)
                {
                    msg = "Already Exist!!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "showContent('" + msg + "');", true);
                    return;
                }
                

                if (dt == null)
                {                   
                    dt = new DataTable();                   
                    dt.Columns.Add("comcod");
                    dt.Columns.Add("monthid");
                    dt.Columns.Add("empid");
                    dt.Columns.Add("grosssal");
                    dt.Columns.Add("secid");
                    dt.Columns.Add("desigid");     

                    dt.Columns.Add("sectionname");
                    dt.Columns.Add("idcard");
                    dt.Columns.Add("empname");
                    dt.Columns.Add("desig");


                }
                
                DataRow newRow = dt.NewRow();

                newRow["comcod"] = comcod;
                newRow["monthid"] = this.ddlYearMonth.SelectedValue.ToString();
                newRow["empid"] = this.ddlemployee.SelectedValue.ToString();
                newRow["grosssal"] = true;
                newRow["secid"] = this.ddlSection.SelectedValue.ToString();
                newRow["desigid"] = desigid;
                newRow["sectionname"] = sectionname;
                newRow["idcard"] = idcard;
                newRow["empname"] = empname;
                newRow["desig"] = desig;
              


                dt.Rows.Add(newRow); 
                ViewState["tblempgrossded"] = dt;

                this.loadExistdata();

            }
            catch (Exception ex) {
            
            }
        
        
        
        }


        private void loadExistdata()
        {

            try
            {
                DataTable dt = (DataTable)ViewState["tblempgrossded"];
                this.gvSalaryDedgross.PageSize = Convert.ToInt32(ddlpagesize.SelectedValue.ToString());
                this.gvSalaryDedgross.DataSource = dt;
                this.gvSalaryDedgross.DataBind();



            }

            catch (Exception ex) { }

        }      



        protected void lUpdate_Click(Object sender, EventArgs args)
        {

            ((Label)this.Master.FindControl("lblmsg")).Visible = true;
          
            DataTable dt = (DataTable)ViewState["tblempgrossded"];
            string comcod = this.GetComeCode();           

            bool result = false;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string empid = dt.Rows[i]["empid"].ToString();
                string yearmonth = dt.Rows[i]["monthid"].ToString();


                result = HRData.UpdateTransInfo(comcod, "dbo_hrm.SP_ENTRY_EMPLOYEE01", "UPDATEDATAFORGROSSDEDUCTION", empid, yearmonth, "", "", "", "");

                if (!result)
                {

                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "showContentFail('" + HRData.ErrorObject["Msg"] + "');", true);
                    return;

                }

            }


            msg = "Updated Successfully";
            ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "showContent('" + msg + "');", true);



        }


        protected void ddlpagesize_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.loadExistdata();
        }

        protected void gvSalaryDedgross_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        }

        protected void gvSalaryDedgross_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void gvSalaryDedgross_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            this.gvSalaryDedgross.PageIndex = e.NewPageIndex;

            this.loadExistdata();


        }
        private void GetEmpName()
        {
            string comcod = this.GetComeCode();
            string ProjectCode = "";

            string txtSProject = (this.ddlSection.SelectedValue.ToString() == "000000000000") ? "%" : this.ddlSection.SelectedValue.ToString() + "%";        



            DataSet ds5 = HRData.GetTransInfo(comcod, "dbo_hrm.SP_ENTRY_EMPLOYEE01", "GETPREMPNAME", ProjectCode, txtSProject, "", "", "", "", "", "");
            this.ddlemployee.DataTextField = "empname";
            this.ddlemployee.DataValueField = "empid";
            this.ddlemployee.DataSource = ds5.Tables[0];
            this.ddlemployee.DataBind();
            ViewState["tblemp"] = ds5.Tables[0];

        }

    }
}