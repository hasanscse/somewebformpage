using RealERPLIB;
using RealERPRDLC;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WinForms;
using RealERPRPT;

namespace RealERPWEB.F_81_Hrm.F_83_Att
{
    public partial class EmployeesBirthday : System.Web.UI.Page
    {
        ProcessAccess HRData = new ProcessAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!ASTUtility.PagePermission(HttpContext.Current.Request.Url.AbsoluteUri.ToString(), (DataSet)Session["tblusrlog"]))
                    Response.Redirect("../../AcceessError.aspx");

                DataRow[] dr1 = ASTUtility.PagePermission1(HttpContext.Current.Request.Url.AbsoluteUri.ToString(), (DataSet)Session["tblusrlog"]);
              ((Label)this.Master.FindControl("lblTitle")).Text = dr1[0]["dscrption"].ToString();
                //  this.Master.Page.Title = dr1[0]["dscrption"].ToString();

                ((Label)this.Master.FindControl("lblmsg")).Visible = false;
                this.getinfo();
                this.lbtnOk_Click(null, null);
            }

        }
        protected void Page_PreInit(object sender, EventArgs e)
        {
            ((LinkButton)this.Master.FindControl("lnkPrint")).Click += new EventHandler(lbtnPrint_Click);
        }


        private void getinfo()
        {          
            this.txtFromdate.Text = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1).ToString("dd-MMM-yyyy");         
            this.txttodate.Text = new DateTime(DateTime.Today.Year, DateTime.Today.Month, DateTime.DaysInMonth(DateTime.Today.Year, DateTime.Today.Month)).ToString("dd-MMM-yyyy");

        }

        private string GetComCode()
        {
            Hashtable hst = (Hashtable)Session["tblLogin"];
            return (hst["comcod"].ToString());

        }
        protected void lbtnOk_Click(object sender, EventArgs args)
        {
            try
            {
                string comcod = this.GetComCode();
                DateTime fromdate = Convert.ToDateTime(this.txtFromdate.Text);
                DateTime todate = Convert.ToDateTime(this.txttodate.Text);


                if (fromdate > todate || fromdate.Year != todate.Year)
                {
                    string msg = "The date range you provided is not acceptable.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "showContent('" + msg + "');", true);
                    return;
                
                }



                string fromdate1 = fromdate.ToString();
                string todate1 = todate.ToString();


                DataSet ds = HRData.GetTransInfo(comcod, "dbo_hrm.SP_REPORT_HR_ATTENDENCE", "EMPLOYEES_BIRTHDAY_SEARCH", fromdate1, todate1, "", "", "", "", "", "", "");

                if (ds == null)
                {
                    return;

                }

                ViewState["employeesBirthday"] = ds.Tables[0];
                this.bindGrid();

            }

            catch { }
        }

        private void bindGrid()
        {

            try
            {
                DataTable dt = (DataTable)ViewState["employeesBirthday"];
                Repeater1.DataSource = dt;
                Repeater1.DataBind();

            }

            catch (Exception ex)
            { }


        } 


        protected void lbtnPrint_Click(Object sender, EventArgs args)
        {

            try
            {
                DataTable dt = (DataTable)ViewState["employeesBirthday"];
                Hashtable hst = (Hashtable)Session["tblLogin"];
                string comname = hst["comnam"].ToString();
                string compname = hst["compname"].ToString();
                string comadd = hst["comadd1"].ToString();
                string username = hst["username"].ToString();
                string comcod = hst["comcod"].ToString();
                string session = hst["session"].ToString();

                string comLogo = new Uri(Server.MapPath(@"~\Image\LOGO" + comcod + ".jpg")).AbsoluteUri;

                string fromdate = this.txtFromdate.Text;
                string todate = this.txttodate.Text;
                string daterange = string.Concat("from ", fromdate, " to ", todate);

                string printdate = System.DateTime.Now.ToString("dd.MM.yyyy hh:mm:ss tt");
                string printFooter = "Printed from Computer Address :" + compname + " ,Session: " + session + " ,User: " + username + " ,Time: " + printdate;

                var lst = dt.DataTableToList<RealEntity.C_81_Hrm.C_83_Att.EClassAttendance.Rptwhoneverlate>();

                LocalReport Rpt1 = new LocalReport();
                Rpt1 = RptSetupClass1.GetLocalReport("R_81_Hrm.R_83_Att.Rptwhoneverlate", lst, null, null);
                Rpt1.EnableExternalImages = true;
                Rpt1.SetParameters(new ReportParameter("compname", comname));
                Rpt1.SetParameters(new ReportParameter("comLogo", comLogo));
                Rpt1.SetParameters(new ReportParameter("rpttittle", "Employee Birthday List"));
                Rpt1.SetParameters(new ReportParameter("daterange", daterange));
                Rpt1.SetParameters(new ReportParameter("printFooter", printFooter));

                Session["Report1"] = Rpt1;
                ((Label)this.Master.FindControl("lblprintstk")).Text = @"<script>window.open('../../RDLCViewer.aspx?PrintOpt=" +
                  ((DropDownList)this.Master.FindControl("DDPrintOpt")).SelectedValue.Trim().ToString() + "', target='_blank');</script>";



            }
            catch (Exception ex)
            { }
        }



    }
}