using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.ReportSource;
using RealERPLIB;
using RealERPRPT;
namespace RealERPWEB.F_81_Hrm.F_83_Att
{
    public partial class HREmpAbsentDel : System.Web.UI.Page
    {
        ProcessAccess HRData = new ProcessAccess();
        Common compUtility = new Common();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!ASTUtility.PagePermission(HttpContext.Current.Request.Url.AbsoluteUri.ToString(), (DataSet)Session["tblusrlog"]))
                    Response.Redirect("../../AcceessError.aspx");

                DataRow[] dr1 = ASTUtility.PagePermission1(HttpContext.Current.Request.Url.AbsoluteUri.ToString(), (DataSet)Session["tblusrlog"]);
                ((Label)this.Master.FindControl("lblTitle")).Text = dr1[0]["dscrption"].ToString();
                this.Master.Page.Title = dr1[0]["dscrption"].ToString();

                ((Label)this.Master.FindControl("lblmsg")).Visible = false;
                getinfo();
                GetDepartment();

            }
        }
        private void getinfo()
        {
            // this.txtCurDate.Text = System.DateTime.Today.ToString("dd-MMM-yyyy");

            this.txtCurDate.Text = System.DateTime.Today.AddMonths(-1).ToString("dd-MMM-yyyy");
            this.txtCurDate.Text = "01" + this.txtCurDate.Text.Trim().Substring(2);
            this.txttodate.Text = Convert.ToDateTime(this.txtCurDate.Text).AddMonths(1).AddDays(-1).ToString("dd-MMM-yyyy");


        }


        private void GetDepartment()
        {
            string comcod = this.GetComCode();
            string Company = "94%";


            string txtSProject = "%%";
            DataSet ds4 = HRData.GetTransInfo(comcod, "dbo_hrm.SP_ENTRY_EMPLOYEE", "GETDEPTNAMENEW", Company, txtSProject, "", "", "", "", "", "", "");

            this.ddldepartmentagg.DataTextField = "deptdesc";
            this.ddldepartmentagg.DataValueField = "deptcode";
            this.ddldepartmentagg.DataSource = ds4.Tables[0];
            this.ddldepartmentagg.DataBind();
            this.GetSectionName();

        }

        private void GetSectionName()
        {
            string comcod = this.GetComCode();
            string deptcode = this.ddldepartmentagg.SelectedValue.ToString();
            string txtSProject = "%%";
            DataSet ds4 = HRData.GetTransInfo(comcod, "dbo_hrm.SP_ENTRY_EMPLOYEE", "GETPROJECTNAMENEW", deptcode, txtSProject, "", "", "", "", "", "", "");
            this.ddlSectionName.DataTextField = "actdesc";
            this.ddlSectionName.DataValueField = "actcode";
            this.ddlSectionName.DataSource = ds4.Tables[0];
            this.ddlSectionName.DataBind();
            // this.GetEmpName();
        }


        protected void ddldepartmentagg_SelectedIndexChanged(object sender, EventArgs e)
        {
            //this.GetDepartment();
            this.GetSectionName();
        }
        protected void ddlSectionName_SelectedIndexChanged(object sender, EventArgs e)
        {
            //this.GetEmpName();
            //this.ddlMonth_SelectedIndexChanged(null, null);

            this.LoadGrid();


        }
        protected void Page_PreInit(object sender, EventArgs e)
        {
            //  ((LinkButton)this.Master.FindControl("lnkPrint")).Click += new EventHandler(lbtnPrint_Click);
        }
        private string GetComCode()
        {
            Hashtable hst = (Hashtable)Session["tblLogin"];
            return (hst["comcod"].ToString());

        }
        protected void lbtnOk_Click(object sender, EventArgs e)
        {

            if (lbtnOk.Text == "Ok")
            {
                Session.Remove("tblAbsDaysf");
                string comcod = this.GetComCode();
                // string datetime = System.DateTime.Now.ToString("dd-MMM-yyyy hh:mm:ss tt");          
                // string monthid = Convert.ToDateTime(txttodate.Text).ToString("yyyyMM").ToString();
                string section = this.ddlSectionName.SelectedValue.ToString();
                if (section == "000000000000")
                {
                    section = this.ddldepartmentagg.SelectedValue.ToString().Substring(0, 4);
                }

                string fromdatetime = txtCurDate.Text;
                string todatetime = txttodate.Text;

                DataSet ds4 = HRData.GetTransInfo(comcod, "dbo_hrm.SP_ENTRY_EMPABSENT", "SHOWEMPABSENTDAY", fromdatetime, todatetime, section, "");
                if (ds4 == null)
                {
                    this.gvAbsDays.DataSource = null;
                    this.gvAbsDays.DataBind();
                    return;
                }

                ViewState["tblAbsDaysf"] = ds4.Tables[0];
                this.LoadGrid();
                lbtnOk.Text = "New";
                txtCurDate.Enabled = false;
                txttodate.Enabled = false;
                ddldepartmentagg.Enabled = false;
                ddlSectionName.Enabled = false;

            }
            else
            {

                lbtnOk.Text = "Ok";
                txtCurDate.Enabled = true;
                txttodate.Enabled = true;
                ddldepartmentagg.Enabled = true;
                ddlSectionName.Enabled = true;
                Response.Redirect(Request.RawUrl);

            }

        }
        protected void ddlpagesize_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.LoadGrid();
        }
        private void LoadGrid()
        {
            DataTable dt = (DataTable)ViewState["tblAbsDaysf"];
            this.gvAbsDays.PageSize = Convert.ToInt32(ddlpagesize.SelectedValue.ToString());
            this.MultiView1.ActiveViewIndex = 0;

            this.gvAbsDays.DataSource = dt;
            this.gvAbsDays.DataBind();

        }

        protected void gvAbsDays_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.gvAbsDays.PageIndex = e.NewPageIndex;
            this.LoadGrid();

        }


        protected void chkallView_CheckedChanged(Object sender, EventArgs args)
        {
            DataTable dt = (DataTable)ViewState["tblAbsDaysf"];
            int i, index;
            if (((CheckBox)this.gvAbsDays.HeaderRow.FindControl("chkallView")).Checked)
            {

                for (i = 0; i < this.gvAbsDays.Rows.Count; i++)
                {
                    ((CheckBox)this.gvAbsDays.Rows[i].FindControl("chkidvalue")).Checked = true;
                    index = (this.gvAbsDays.PageSize) * (this.gvAbsDays.PageIndex) + i;
                    dt.Rows[index]["chkvalue"] = "True";


                }


            }

            else
            {
                for (i = 0; i < this.gvAbsDays.Rows.Count; i++)
                {
                    ((CheckBox)this.gvAbsDays.Rows[i].FindControl("chkidvalue")).Checked = false;
                    index = (this.gvAbsDays.PageSize) * (this.gvAbsDays.PageIndex) + i;
                    dt.Rows[index]["chkvalue"] = "False";


                }

            }

            ViewState["tblAbsDaysf"] = dt;

        }

        private void TableUpdate()
        {
            DataTable dt = (DataTable)ViewState["tblAbsDaysf"];

            int index;
            for (int i = 0; i < this.gvAbsDays.Rows.Count; i++)
            {
                string chkvalue = (((CheckBox)gvAbsDays.Rows[i].FindControl("chkidvalue")).Checked) ? "True" : "False";


                index = (this.gvAbsDays.PageSize) * (this.gvAbsDays.PageIndex) + i;
                dt.Rows[index]["chkvalue"] = chkvalue;

            }
            ViewState["tblAbsDaysf"] = dt;
        }


        protected void lbtnAllChkDelete_Click(Object sender, EventArgs args)
        {

            bool result = false;
            string comcod = this.GetComCode();
            this.TableUpdate();
            string datetime = txtCurDate.Text;
            DataTable dt = (DataTable)ViewState["tblAbsDaysf"];
            DataTable updatedDt = dt.Clone();

            foreach (DataRow row in dt.Rows)
            {

                string empId = row["empid"].ToString();
                string absdatid = row["absdatid"].ToString();
                bool chkvalue = Convert.ToBoolean(row["chkvalue"]);

                if (chkvalue == true)
                {
                    result = HRData.UpdateTransInfo(comcod, "dbo_hrm.SP_ENTRY_EMPABSENT", "DELETEINDIVIDUALABBS", absdatid, empId, "", "");
                }
                else
                {              

                    updatedDt.ImportRow(row);

                }
            }

            ViewState["tblAbsDaysf"] = updatedDt;

            if (!result)
            {
                string msg = "Data delete not successfully ";
                ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "showContent('" + msg + "');", true);

                return;
            }
            else
            {
                string msg = "Data deleted successfully ";
                ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "showContent('" + msg + "');", true);

            }


            if (result == true)
            {             
                this.LoadGrid();

            }



        }
        protected void lbtnAllDelete_Click(Object sender, EventArgs args)
        {
            bool result;
            Session.Remove("tblAbsDaysf");
            string comcod = this.GetComCode();
            // string datetime = System.DateTime.Now.ToString("dd-MMM-yyyy hh:mm:ss tt");          
            // string monthid = Convert.ToDateTime(txttodate.Text).ToString("yyyyMM").ToString();
            string fromdatetime = txtCurDate.Text;
            string todatetime = txttodate.Text;


            string section = this.ddlSectionName.SelectedValue.ToString();
            if (section == "000000000000")
            {
                section = this.ddldepartmentagg.SelectedValue.ToString().Substring(0, 4);
            }

            result = HRData.UpdateTransInfo(comcod, "dbo_hrm.SP_ENTRY_EMPABSENT", "DELETEALLABBS", fromdatetime, todatetime, section, "", "", "");

            if (!result)
            {
                string msg = "Data delete not successfully ";
                ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "showContent('" + msg + "');", true);

                return;
            }
            else
            {
                ViewState["tblAbsDaysf"] = null;
                this.LoadGrid();
                string msg = "Data deleted successfully ";
                ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "showContent('" + msg + "');", true);
            }


        }
        protected void lnkDel_Click(object sender, EventArgs e)
        {

            bool result;
            string comcod = this.GetComCode();
            GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer;
            int index = row.RowIndex;

            int i = Convert.ToInt32(row.RowIndex);
            string empId = (gvAbsDays.Rows[i].FindControl("lgvempid") as Label).Text;
            string absdateid = (gvAbsDays.Rows[i].FindControl("lgvempabsdateid") as Label).Text;

            string datetime = txtCurDate.Text;
            DataTable dt = (DataTable)ViewState["tblAbsDaysf"];

            int ins = this.gvAbsDays.PageSize * this.gvAbsDays.PageIndex + index;
            dt.Rows[ins].Delete();
            ViewState.Remove("tblAbsDaysf");
            DataView dv = dt.DefaultView;
            ViewState["tblAbsDaysf"] = dv.ToTable();

            result = HRData.UpdateTransInfo(comcod, "dbo_hrm.SP_ENTRY_EMPABSENT", "DELETEINDIVIDUALABBS", datetime, empId, "", "");

            if (!result)
            {
                string msg = "Data delete not successfully ";
                ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "showContent('" + msg + "');", true);

                return;
            }
            else
            {
                this.LoadGrid();
                string msg = "Data deleted successfully ";
                ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "showContent('" + msg + "');", true);
            }


        }
        protected void lnkbtnShow_Click(object sender, EventArgs e)
        {

        }


    }
}

