using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.ReportSource;
using System.Collections.Generic;
using RealERPLIB;
using RealERPRPT;
using RealEntity;
namespace RealERPWEB.F_81_Hrm.F_92_Mgt
{

    public partial class MGTDeptWiseSpecialPerSetup : System.Web.UI.Page
    {
        ProcessAccess purData = new ProcessAccess();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (!ASTUtility.PagePermission(HttpContext.Current.Request.Url.AbsoluteUri.ToString(), (DataSet)Session["tblusrlog"]))
                //    Response.Redirect("../AcceessError.aspx");
                //DataRow[] dr1 = ASTUtility.PagePermission1(HttpContext.Current.Request.Url.AbsoluteUri.ToString(), (DataSet)Session["tblusrlog"]);
                //((Label)this.Master.FindControl("lblTitle")).Text = dr1[0]["dscrption"].ToString();

                //this.Master.Page.Title = dr1[0]["dscrption"].ToString();
                //((LinkButton)this.Master.FindControl("lnkPrint")).Enabled = (Convert.ToBoolean(dr1[0]["printable"]));            

                ((Label)this.Master.FindControl("lblmsg")).Visible = false;
                this.GetDepartment();         
       
                this.GetEmployeeName();
          
            }

        }
        protected void Page_PreInit(object sender, EventArgs e)
        {            
           // ((LinkButton)this.Master.FindControl("lnkPrint")).Click += new EventHandler(lnkPrint_Click);
            //((Panel)this.Master.FindControl("pnlTitle")).Visible = true;

        }
        public void GetEmployeeName()
        {
            string comcod = GetCompCode(); 

            DataSet ds1 = purData.GetTransInfo(comcod, "dbo_hrm.SP_ENTRY_EMPLOYEE", "GETEMPLIST", "%", "%", "%", "", "", "", "", "", "");
            this.ddlEmployee.DataTextField = "empname";
            this.ddlEmployee.DataValueField = "empid";
            this.ddlEmployee.DataSource = ds1.Tables[0];
            this.ddlEmployee.DataBind();

        }

        protected void lbtnAdd_Click(object sender, EventArgs e)
        {


            if (lbtnOkOrNew.Text == "Ok")
            {
                lbtnOkOrNew.Text = "New";
                this.ddlEmployee.Enabled = false;
                this.BindGrid();
            }


            else
            {
                lbtnOkOrNew.Text = "Ok";
                this.ddlEmployee.Enabled = true;
            }



        }

        protected void BindGrid()
        {





        }





        private string GetCompCode()
        {
            Hashtable hst = (Hashtable)Session["tblLogin"];
            return (hst["comcod"].ToString());


        }
        private void GetDepartment()
        {

            string comcod = GetCompCode();
            string txtCompanyname = "94%";
            string txtSearchDept = "%%";
            DataSet ds1 = purData.GetTransInfo(comcod, "dbo_hrm.SP_ENTRY_EMPLOYEE01", "GETALLDEPT", txtCompanyname, txtSearchDept, "", "", "", "", "", "", "");
            this.ddldpt.DataTextField = "actdesc";
            this.ddldpt.DataValueField = "actcode";
            this.ddldpt.DataSource = ds1.Tables[0];
            this.ddldpt.DataBind();         

            ViewState["tblAllDpt"] = ds1.Tables[0];
            ds1.Dispose();
        }



        public class ListItemInfo
        {
            public string Value { get; set; }
            public string Text { get; set; }
        }

        protected void Select_Click(object sender, EventArgs e)
        {
    
            //string comcod = GetCompCode();
            //string roletype = this.ddlTypeRole.SelectedValue.ToString();        

            //List<ListItemInfo> centridList = new List<ListItemInfo>();
            //List<ListItemInfo> centridList2 = new List<ListItemInfo>();
            //foreach (ListItem litem in ddldpt.Items)
            //{

            //    if (litem.Selected)
            //    {
            //        centridList.Add(new ListItemInfo
            //        {
            //            Value = litem.Value,
            //            Text = litem.Text
            //        });
            //    }

            //}

            //DataTable UserInfoTable = (DataTable)ViewState["UserInfoTable"];
            //if (centridList.Count!=0)
            //{
            //    DataRow[] dr = UserInfoTable.Select("usrid='" + usrid + "'");
            //    int rowCount= gvProLinkInfo.Rows.Count + 1;
            //    for (int j=0;j< centridList.Count; j++)
            //    {
            //        ListItemInfo item = centridList[j];
            //        int flag = 0;
            //        for (int i = 0; i < dr.Length; i++)
            //        {
                       
            //            if (dr[i]["centrid"].ToString() == item.Value.ToString())
            //            {
            //                flag = 1;
            //                centridList2.Add(item);
            //                string Messaged = "Already Added !! " + item.Text + " for " + dr[i]["usrsname"];
            //                ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "showContentFail('" + Messaged + "');", true);
            //            }
            //        }
            //        if (flag == 0)
            //        {
            //            DataRow dr1 = UserInfoTable.NewRow();
                    
            //            dr1["centrid"] = item.Value;
            //            dr1["actdesc"] = item.Text;
            //            dr1["roletype"] = roletype;
            //            dr1["comcod"] = comcod;
            //            dr1["slno"] = rowCount;
            //            UserInfoTable.Rows.Add(dr1);
            //            rowCount++;
            //        }
            //    }

            //}


            //ViewState["UserInfoTable"] = UserInfoTable;
            //gvProLinkInfo_DataBind();
        }     


        protected void gvPermissionList_DataBind()
        {
            DataTable UserInfoTable = (DataTable)ViewState["UserInfoTable"];

            this.gvPermissionList.DataSource = UserInfoTable;
            this.gvPermissionList.DataBind();

        }
        protected void lbtnUpdate_Click(object sender, EventArgs e)
        {
            string Messaged = "";
            string typrole = "";// this.ddlTypeRole.SelectedValue.ToString();
            //string dpt = this.ddldpt.SelectedValue.ToString();
            string comcod = GetCompCode(); ;
            List<string> centridList = new List<string>();
            foreach (ListItem item in ddldpt.Items)
            {

                if (item.Selected)
                {
                    centridList.Add(item.Value);
                }

            }          

            DataTable UserInfoTable = (DataTable)ViewState["UserInfoTable"];
            if (centridList.Count!=0)
            {
             
                string dptName = string.Join(",", centridList);
                bool result = false;
                result = purData.UpdateTransInfo(comcod, "SP_ENTRY_MGT", "DELALLLEAVEAPP", dptName, typrole, "", "", "", "", "", "", "", "", "", "", "");

                for (int i = 0; i < UserInfoTable.Rows.Count; i++)
                {

                    //string userid = UserInfoTable.Rows[i]["usrid"].ToString();
                    dptName = ((Label)gvPermissionList.Rows[i].FindControl("lblcentrid")).Text;
                    typrole = ((Label)gvPermissionList.Rows[i].FindControl("lbltyprole")).Text;
                    string userid = ((Label)gvPermissionList.Rows[i].FindControl("userid")).Text;
                    string slNum = ((TextBox)gvPermissionList.Rows[i].FindControl("slno")).Text;
                    result = purData.UpdateTransInfo(comcod, "SP_ENTRY_MGT", "INSERTLEAVEAPP", slNum, userid, dptName, typrole, "", "", "", "", "", "", "", "", "", "", "");


                }
                if (!result)
                {
                    Messaged = "Update Failed !!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "showContentFail('" + Messaged + "');", true);
                    return;
                }
            }
            else
            {
                bool result = false;              

                for (int i = 0; i < UserInfoTable.Rows.Count; i++)
                {

                    string dpt = ((Label)gvPermissionList.Rows[i].FindControl("lblcentrid")).Text;
                    typrole = ((Label)gvPermissionList.Rows[i].FindControl("lbltyprole")).Text;
                    string userid = ((Label)gvPermissionList.Rows[i].FindControl("userid")).Text;
                    string slNum = ((TextBox)gvPermissionList.Rows[i].FindControl("slno")).Text;

                    result = purData.UpdateTransInfo(comcod, "SP_ENTRY_MGT", "INSERTLEAVEAPP", slNum, userid, dpt, typrole, "", "", "", "", "", "", "", "", "", "", "");


                }
                if (!result)
                {
                    Messaged = "Update Failed !!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "showContentFail('" + Messaged + "');", true);

                    return;
                }
            }
            Messaged = "Data Updated successfully  !!";
            ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "showContent('" + Messaged + "');", true);

        }

        public bool IsUnique(DataTable UserInfoTable, string str, int index)
        {

            for (int i = 0; i < UserInfoTable.Rows.Count; i++)
            {
                string temp = ((TextBox)gvPermissionList.Rows[i].FindControl("slno")).Text;
                if (str == temp && index != i)
                    return false;
            }

            return true;
        }

        public bool HasDup(DataTable UserInfoTable)
        {
            for (int i = 0; i < UserInfoTable.Rows.Count; i++)
            {
                string temp = ((TextBox)gvPermissionList.Rows[i].FindControl("slno")).Text;
                if (!IsUnique(UserInfoTable, temp, i))
                    return true;
            }
            return false;
        }


        protected void gvProLinkInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            string comcod = this.GetCompCode();
            //string centrid = this.ddldpt.SelectedValue.ToString();
            string typrole = "";//this.ddlTypeRole.SelectedValue.ToString();

            DataTable dt = (DataTable)ViewState["UserInfoTable"];
            string userid = ((Label)this.gvPermissionList.Rows[e.RowIndex].FindControl("userid")).Text.Trim();
            string centrid = ((Label)this.gvPermissionList.Rows[e.RowIndex].FindControl("lblcentrid")).Text.Trim();
            bool result = purData.UpdateTransInfo(comcod, "SP_ENTRY_MGT", "DELLEAVEAPP", userid, centrid, typrole, "", "", "", "", "", "", "", "", "", "", "", "");

            if (result == true)
            {
                int rowindex = (this.gvPermissionList.PageSize) * (this.gvPermissionList.PageIndex) + e.RowIndex;
                dt.Rows[rowindex].Delete();
                ViewState["UserInfoTable"] = dt;
             
            }
            BindGrid();
        }



        protected void gvPermissionList_RowDeleting(object sender, EventArgs e)
        { 
        
        
        
        }

        protected void lbtnDeleteAll_Click(object sender, EventArgs e)
        {
            string comcod = this.GetCompCode();
            DataTable dt = (DataTable)ViewState["UserInfoTable"];

            List<string> centridList = new List<string>();
            foreach (ListItem item in ddldpt.Items)
            {

                if (item.Selected)
                {
                    centridList.Add(item.Value);
                }

            }
            string centridddd = string.Join(",", centridList);
            string typrole = "";//this.ddlTypeRole.SelectedValue.ToString();

            bool result = purData.UpdateTransInfo(comcod, "SP_ENTRY_MGT", "DELALLLEAVEAPP", centridddd, typrole, "", "", "", "", "", "", "", "", "", "", "", "", "");
            BindGrid();
        }


        protected void GetcntresByNam(object sender, EventArgs e)
        {        
          //  lbtnOkOrNew.Visible = true;
        }
      
        
      

    }
}