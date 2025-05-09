﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ASITNEW.Master" AutoEventWireup="true" CodeBehind="HREmpEntry.aspx.cs" Inherits="RealERPWEB.F_81_Hrm.F_82_App.HREmpEntry" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <script language="javascript" type="text/javascript" src="../../Scripts/jquery-1.4.1.min.js"></script>
    <%--    <script language="javascript" type="text/javascript" src="../../Scripts/ScrollableGridPlugin.js"></script>
    <script type="text/javascript" language="javascript" src="../../Scripts/KeyPress.js"></script>--%>

    <script type="text/javascript" language="javascript">
        function openChildEmpModal() {
            $('#ChildEmpAddModal').modal('toggle');
        }
        function CloseChildEmpModal() {
            $('#ChildEmpAddModal').modal('hide');
        }

        function SelectAllCheckboxes(gridName, chk) {

            switch (gridName) {

                case "GvChildEmpModal":
                    $('#<%=GvChildEmpModal.ClientID %>').find("input:checkbox").each(function () {
                        if ((this).disabled == false) {
                            if (this != chk) {
                                this.checked = chk.checked;
                            }
                        }
                    });
                    break;

            }


        }

        $(document).ready(function () {

            Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(pageLoaded);


            $('.chzn-select').chosen({ search_contains: true });

            Visibility();


        });
        function pageLoaded() {
            $(function () {
                $('[id*=ListSalesRole]').multiselect({
                    includeSelectAllOption: true,
                    enableFiltering: true,
                    enableCaseInsensitiveFiltering: true,
                    includeFilterClearBtn: true
                })
            });


            //$("input, select").bind("keydown", fuEmp.Namenction(event) {
            //    var k1 = new KeyPress();
            //    k1.textBoxHandler(event);


            //});

            var gridview = $('#<%=this.gvSalAdd.ClientID %>');
            $.keynavigation(gridview);

            $('.chzn-select').chosen({ search_contains: true });

        }
        function Visibility() {
            var comcod = '<%= this.GetCompCode()%>';

            if (comcod == "4101" || comcod == "4330") {

                $('#<%=this.lbltEduQua.ClientID%>').css({ "display": "none" });
                $('#<%=this.lblEduQua.ClientID%>').css({ "display": "none" });
                $('#<%=this.ddlEduQua.ClientID%>').css({ "display": "none" });
                $('#<%=this.lbltEduQua.ClientID%>').css({ "display": "none" });
                $('#<%=this.lbltEduPass.ClientID%>').css({ "display": "none" });
                $('#<%=this.txtEduPass.ClientID%>').css({ "display": "none" });
                $('#<%=this.lblholidayrate.ClientID%>').css({ "display": "none" });
                $('#<%=this.rbtholiday.ClientID%>').css({ "display": "none" });
                $('#<%=this.lbltOverTime.ClientID%>').css({ "display": "none" });
                $('#<%=this.rbtnOverTime.ClientID%>').css({ "display": "none" });
                $('#<%=this.lblfiexedRate.ClientID%>').css({ "display": "none" });
                $('#<%=this.txtfixedRate.ClientID%>').css({ "display": "none" });
            }



        }

    </script>

    <%--    <style>
        .padymentType .chkBoxControl input[type="checkbox"], .chkBoxControl input[type="radio"], .chkBoxControl label {
            margin: 0;
        }

        .pnlTimesslot {
            /* position:absolute;
            top:0;
            left:0;
            z-index:999;*/
        }

        .multiselect-search {
            height: 34px !important;
        }

        .multiselect-native-select .nsl {
            display: inline-block;
            padding: 3px 8px;
        }
    </style>
    --%>



    <style>
        .form-control, .chzn-select, .multiselect-native-select .nsl, .multiselect-search {
            border-radius: 3px !important;
            border: 1px solid #ccc;
            padding-left: 10px;
        }


        .multiselect-native-select .nsl {
            border-radius: 5px !important;
            padding: 5px 10px;
        }


            .form-control:focus, .chzn-select:focus, .multiselect-native-select .nsl:focus {
                outline: none;
                box-shadow: 0 0 5px rgba(0, 0, 255, 0.5);
            }


        .multiselect-search {
            height: 34px !important;
            border-radius: 5px !important;
        }


        .padymentType .chkBoxControl input[type="checkbox"], .chkBoxControl input[type="radio"], .chkBoxControl label {
            margin: 0;
        }

        .chzn-select {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            background-image: url('data:image/svg+xml;charset=utf-8,%3Csvg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 16 16"%3E%3Cpath fill="%23666" d="M8 12l4-4H4l4 4z"/%3E%3C/svg%3E');
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 12px;
        }
    </style>
    <style>
        .small-textbox {
            height: 30px;
            width: 80px;
            font-size: 12px;
            padding: 3px 6px;
            text-align: right;
            font-weight: bold;
        }

        .small-textbox1 {
            height: 30px;
            width: 141px;
            font-size: 15px;
            padding: 3px 6px;
        }

        .custom-col {
            width: 6.5%; /* 1.5/12 = 0.125, which is 12.5% of the container width */
        }




        .bodylblfontsize {
            font-size: 15px;
        }
    </style>
  



      
    <div class="RealProgressbar">
        <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="30">
            <ProgressTemplate>
                <div id="loader">
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="lading"></div>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>

    <div class="card mt-3">
        <div class="contentPart">
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="Services" runat="server">
                    <asp:HiddenField ID="hiddnempname1" runat="server" />
                    <asp:HiddenField ID="hiddnCardId" runat="server" />

                    <fieldset class="scheduler-border fieldset_A" style="background-color: white;">


                        <div class="card-header">

                            <div class="row ">


                                <div class="col-md-1 d-flex align-items-center">
                                    <asp:Label ID="Label2" runat="server" Font-Bold="true" Font-Size="Medium" class="col-form-label">Company</asp:Label>
                                </div>

                                <div class="col-md-1 d-flex align-items-center gap-2" style="flex: 0 0 8.0%; max-width: 9.5%;">
                                    <asp:TextBox ID="txtSrcCompanyAgg" runat="server" CssClass="form-control small-textbox"></asp:TextBox>
                                    <asp:LinkButton ID="ibtnFindCompanyAgg" runat="server" CssClass="btn btn-primary btn-sm ml-1" OnClick="ibtnFindCompanyAgg_Click"><i class="fas fa-search"></i></asp:LinkButton>
                                </div>

                                <div class="col-md-4 ">
                                    <asp:DropDownList ID="ddlCompanyAgg" OnSelectedIndexChanged="ddlCompanyAgg_SelectedIndexChanged" runat="server" CssClass="form-control inputTxt chzn-select" AutoPostBack="true" TabIndex="10">
                                    </asp:DropDownList>
                                    <asp:Label ID="lblCompanyNameAgg" runat="server" Style="border: none; line-height: 1.5" CssClass="form-control dataLblview" Height="22" Visible="false"></asp:Label>
                                </div>



                                <div class="colMid">
                                    <asp:LinkButton ID="lnkbtnSerOk" Style="margin-left: 20px" runat="server" CssClass="btn btn-primary okBtn btn-sm" OnClick="lnkbtnSerOk_Click">Ok</asp:LinkButton>
                                </div>
                                <div class="col-md-3">


                                    <asp:CheckBox ID="chknewEmp" runat="server" AutoPostBack="True"
                                        OnCheckedChanged="chknewEmp_CheckedChanged"
                                        TabIndex="13" Text="New Emp" CssClass="btn btn-primary checkBox btn-sm" />

                                    <asp:CheckBox ID="chkEdit" runat="server" AutoPostBack="True"
                                        OnCheckedChanged="chkEdit_CheckedChanged"
                                        TabIndex="13" Text="Edit Employee" CssClass="btn btn-primary btn-sm checkBox" Visible="false" />

                                    <asp:CheckBox ID="ChkImportSupervisation" runat="server" AutoPostBack="True"
                                        OnCheckedChanged="ChkImportSupervisation_CheckedChanged"
                                        TabIndex="13" CssClass="btn btn-primary btn-sm checkBox" Text="<span class='fa fa-download'></span>Supervisation" Visible="false" />
                                </div>



                                <div class="col-md-2 pull-right">
                                    <a href="#" class="btn btn-info btn-sm margin5px" onclick="history.go(-1)">Back</a>
                                    <asp:LinkButton ID="lnkNextbtn" runat="server" CssClass="btn  btn-success primaryBtn btn-sm" Style="margin: 0 5px;" OnClick="lnkNextbtn_Click"><span class="flaticon-add118"></span> Next</asp:LinkButton>

                                    <%--  <a class="btn btn-info primaryBtn margin5px" href="<%=this.ResolveUrl("~/F_81_Hrm/F_82_App/ImgUpload.aspx")%>">Next</a>--%>
                                </div>

                            </div>

                            <div class="row">

                                <div class="col-md-1 d-flex align-items-center">
                                    <asp:Label ID="lbldeptnameagg" runat="server" Font-Bold="true" Font-Size="Medium" class="col-form-label">Department</asp:Label>
                                </div>

                                <div class="col-md-1 d-flex align-items-center gap-2" style="flex: 0 0 8.0%; max-width: 9.5%;">
                                    <asp:TextBox ID="txtsrchdeptagg" runat="server" CssClass="form-control small-textbox"></asp:TextBox>

                                    <asp:LinkButton ID="lbtndeptagg" runat="server" CssClass="btn btn-primary btn-sm ml-1" OnClick="lbtndeptagg_Click">
                                    <i class="fas fa-search"></i>
                                    </asp:LinkButton>
                                </div>



                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddldepartmentagg" OnSelectedIndexChanged="ddldepartmentagg_SelectedIndexChanged" runat="server" CssClass="form-control inputTxt chzn-select" AutoPostBack="true" TabIndex="0">
                                    </asp:DropDownList>
                                    <asp:Label ID="lblvaldeptagg" runat="server" CssClass="form-control dataLblview" Height="22" Style="border: none; line-height: 1.5" Visible="false"></asp:Label>
                                </div>



                            </div>

                            <div class="row">

                                <div class="col-md-1 d-flex align-items-center">

                                    <asp:Label ID="lblsection" runat="server" Font-Bold="true" Font-Size="Medium" class="col-form-label">Section</asp:Label>
                                </div>

                                <div class="col-md-1 d-flex align-items-center gap-2" style="flex: 0 0 8.0%; max-width: 9.5%;">
                                    <asp:TextBox ID="txtSrcPro" runat="server" CssClass="form-control small-textbox "></asp:TextBox>
                                    <asp:LinkButton ID="ibtnFindProject" runat="server" CssClass="btn btn-primary btn-sm ml-1" OnClick="ibtnFindProject_Click"><i class="fas fa-search"></i></asp:LinkButton>

                                </div>


                                <div class="col-md-4">
                                    <%--Style="margin-left: 30px;""--%>
                                    <asp:DropDownList ID="ddlProjectName" OnSelectedIndexChanged="ddlProjectName_SelectedIndexChanged" runat="server" CssClass="form-control inputTxt chzn-select" AutoPostBack="true" TabIndex="0">
                                    </asp:DropDownList>
                                    <asp:Label ID="lblProjectdesc" runat="server" CssClass="form-control dataLblview" Height="22" Style="border: none; line-height: 1.5" Visible="false"></asp:Label>
                               
                                   </div>




                                <div class="col-md-4">
                                    <asp:LinkButton ID="lbtnDeletelink" runat="server" OnClick="lbtnDeletelink_Click" CssClass="btn btn-primary primaryBtn btn-sm" Style="margin-left: 400px">Unlink</asp:LinkButton>
                                </div>



                            </div>

                            <div class="row">


                                <div class="col-md-1 d-flex align-items-center">
                                    <asp:Label ID="lblEmp" runat="server" Font-Bold="true" Font-Size="Medium" class="col-form-label">Emp.  Name</asp:Label>

                                </div>

                                <div class="col-md-1 d-flex align-items-center gap-2" style="flex: 0 0 8.0%; max-width: 9.5%;">
                                    <asp:TextBox ID="txtSrcEmp" runat="server" CssClass="form-control small-textbox"></asp:TextBox>
                                    <asp:LinkButton ID="ibtnFindEmp" runat="server" CssClass="btn btn-primary btn-sm ml-1" OnClick="ibtnFindEmp_Click"><i class="fas fa-search"></i></asp:LinkButton>
                                </div>




                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlPEmpName" OnSelectedIndexChanged="ddlPEmpName_SelectedIndexChanged" runat="server" CssClass="chzn-select form-control inputTxt" AutoPostBack="true" TabIndex="0">
                                    </asp:DropDownList>
                                    <asp:Label ID="lblPEmpName" runat="server" CssClass="form-control dataLblview" Height="22" Style="border: none; line-height: 1.5" Visible="false"></asp:Label>
                                </div>

                            </div>

                            <div class="row">


                                <div class="col-md-1 d-flex align-items-center">
                                    <asp:Label ID="lblnewEmp" runat="server" CssClass="lblTxt lblName" Font-Bold="true" Font-Size="Medium" Visible="false">Emp.Name:</asp:Label>
                                </div>


                                <div class="col-md-1 d-flex align-items-center gap-2" style="flex: 0 0 8.0%; max-width: 9.5%;">
                                    <asp:TextBox ID="txtNSrcEmp" runat="server" CssClass="form-control small-textbox" Visible="false"></asp:TextBox>

                                    <asp:LinkButton ID="ibtnNFindEmp" Visible="false" runat="server" CssClass="btn btn-primary btn-sm ml-1" OnClick="ibtnNFindEmp_Click"><i class="fas fa-search"></i></asp:LinkButton>
                                </div>


                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlNPEmpName" Visible="false" runat="server" AutoPostBack="True" CssClass="chzn-select form-control inputTxt" TabIndex="0">
                                    </asp:DropDownList>
                                </div>


                            </div>

                        </div>
                    </fieldset>

                    <asp:Panel ID="pnlGenInfo" runat="server" Visible="False">

                        <fieldset class="scheduler-border fieldset_A">

                            <div class="card-body">

                                <div class="row d-flex align-items-center">


                                    <!-- Joining Date -->
                                    <div class="col-md-1 d-flex align-items-center">
                                        <asp:Label ID="lbljoindate" runat="server" CssClass="lblTxt lblName bodylblfontsize"  Font-Bold="true" >Joining Date:</asp:Label>
                                     </div>
                                      

                                     <div class="custom-col d-flex align-items-center" style="width: 150px;"  >     
                                        <asp:Label ID="lblvaljoindate" runat="server" ReadOnly="true"   Width="118" CssClass="form-control small-textbox1" Font-Bold="true" style="text-align: center; font-size: 14px;" ></asp:Label>
                                    </div>



                                    <!-- PF Starting Date -->
                                    <div class="col-md-1.5 d-flex align-items-center">
                                        <asp:Label ID="lblpfstdate" runat="server" CssClass="lblTxt lblName bodylblfontsize" Font-Bold="true">PF Starting Date:</asp:Label>
                                     </div>

                                  <div class="custom-col d-flex align-items-center" style="width: 150px;"  >                                      
                                       <asp:TextBox ID="txtPf" runat="server" CssClass="form-control small-textbox1" Font-Bold="true" width="118"  style="text-align: center; font-size: 14px; margin-left: 0.8rem;" ></asp:TextBox>
                                        <cc1:CalendarExtender ID="txtPf_CalendarExtender" runat="server" Enabled="True" Format="dd-MMM-yyyy" TargetControlID="txtPf"></cc1:CalendarExtender>
                                    </div>




                                    <!-- End Date -->
                                    <div class="custom-col d-flex align-items-center" style="width: 100px;"  >
                                        <asp:Label ID="lblpfenddate" runat="server" CssClass="lblTxt lblName bodylblfontsize" Font-Bold="true">End Date:</asp:Label>
                                 </div>

                                   <div class="custom-col d-flex align-items-center" style="width: 140px;"  >
                                        <asp:TextBox ID="txtpfend" runat="server" CssClass="form-control small-textbox"  width="120" ></asp:TextBox>
                                        <cc1:CalendarExtender ID="txtpfend_CalendarExtender" runat="server" Enabled="True" Format="dd-MMM-yyyy" TargetControlID="txtpfend"></cc1:CalendarExtender>
                                    </div>



                                    <!-- Designation -->
                                     <div class="custom-col d-flex align-items-center" style="width: 110px;" >
                                        <asp:Label ID="lbltDesignation" runat="server" CssClass="lblTxt lblName bodylblfontsize" Font-Bold="true">Designation:</asp:Label>
                                        <asp:Label ID="lblDesgination" runat="server" ReadOnly="true" visible="false" CssClass="form-control small-textbox1"></asp:Label>
                                 
                                    </div>

                                    <!-- Designation Dropdown -->
                                    <div class="custom-col d-flex align-items-center" sstyle="width: 130px;" >
                                        <asp:DropDownList ID="ddlDesignation" AutoPostBack="true" Width="150" Height="30px" OnSelectedIndexChanged="ddlDesignation_SelectedIndexChanged" runat="server" Font-Bold="true" CssClass="chzn-select form-control inputTxt"></asp:DropDownList>
                                    </div>

                              

                                </div>

                                <div class="row">
                                    <!-- Office InTime -->
                                   <div class="col-md-1 d-flex align-items-center">
                                        <asp:Label ID="lbltOfftime" runat="server" CssClass="lblTxt lblName" Font-Bold="true">Office InTime:</asp:Label>   
                                      </div>


                                    <div class="custom-col d-flex align-items-center" style="width: 150px;"  >     
                                        <asp:Label ID="lbloffintime" runat="server" ReadOnly="true" Visible="false" CssClass="form-control small-textbox1"></asp:Label>
                                        <asp:DropDownList ID="ddlOffintime" AutoPostBack="true" Width="118" Height="30px" Font-Bold="true" OnSelectedIndexChanged="ddlOffintime_SelectedIndexChanged"  style="text-align: center; font-size: 14px;" runat="server" CssClass="form-control inputTxt" TabIndex="16"></asp:DropDownList>
                                    </div>
                                   



                                    <!-- Office OutTime -->
                                    <div class="col-md-1.5 d-flex align-items-center">
                                        <asp:Label ID="lbltOfftime0" runat="server" CssClass="lblTxt lblName "  Font-Bold="true">Office OutTime:</asp:Label>
                                        <asp:Label ID="lbloffouttime" runat="server" ReadOnly="true" Width="98" visible="false"  CssClass="form-control small-textbox"></asp:Label>
                                    </div>


                                     <div class="custom-col d-flex align-items-center" style="width: 160px;" >
                                        <asp:DropDownList ID="ddlOffouttime" AutoPostBack="true"  Width="118" height="30px" Font-Bold="true" OnSelectedIndexChanged="ddlOffouttime_SelectedIndexChanged" runat="server" Style="text-align: center" CssClass="form-control inputTxt ml-4" TabIndex="0"></asp:DropDownList>
                                    </div>



                                    <!-- Lunch InTime -->


                                    <div class="col-md-1.5 d-flex align-items-center">
                                        <asp:Label ID="lbltLantime" runat="server" CssClass="lblTxt lblName bodylblfontsize" Font-Bold="true">Lunch InTime:</asp:Label>
                                        <asp:Label ID="lbllanintime" runat="server" Width="98" visible="false" ReadOnly="true" CssClass="form-control small-textbox"></asp:Label>
                                    </div>

                                     <div class="custom-col d-flex align-items-center" style="width: 155px;"  >
                                        <asp:DropDownList ID="ddlLanintime" AutoPostBack="true" Width="118" height="30px" Font-Bold="true" OnSelectedIndexChanged="ddlLanintime_SelectedIndexChanged" runat="server" CssClass="form-control inputTxt" style="margin-left: 1.0rem;" ></asp:DropDownList>
                                    </div>




                                    <!-- Lunch OutTime -->
                                     <div class="custom-col d-flex align-items-center" style="width: 100px;"  >
                                        <asp:Label ID="lbltLantime0" runat="server" CssClass="lblTxt lblName bodylblfontsize"  Font-Bold="true">Lunch OutTime:</asp:Label>
                                        <asp:Label ID="lbllanouttime" runat="server" Width="98" visible="false" ReadOnly="true" CssClass="form-control small-textbox"></asp:Label>
                                    </div>



                                   <div class="col-md-2 d-flex align-items-center ">
                                        <asp:DropDownList ID="ddlLanouttime" AutoPostBack="true" OnSelectedIndexChanged="ddlLanouttime_SelectedIndexChanged" Font-Bold="true"  height="30px" Width="110" Style="text-size-adjust: auto;" runat="server" CssClass="form-control inputTxt" TabIndex="18"></asp:DropDownList>
                                    </div>

                                </div>

                                <div class="row ">
                                    <!-- Last Degree Label and Value -->


                                     <div class="col-md-1 d-flex align-items-center">
                                        <asp:Label ID="lbltEduQua" runat="server" CssClass="lblTxt lblName bodylblfontsize" Font-Bold="true">Last Degree:</asp:Label>
                                    </div>

                                      <div class="custom-col d-flex align-items-center" style="width: 150px;"  >     
                                        <asp:Label ID="lblEduQua" runat="server" visible="false" CssClass="form-control small-textbox1"></asp:Label>
                                          <asp:DropDownList ID="ddlEduQua" AutoPostBack="true" OnSelectedIndexChanged="ddlEduQua_SelectedIndexChanged" runat="server" Font-Bold="true" Width="118" Height="30px" CssClass="form-control inputTxt" TabIndex="10"></asp:DropDownList>
                                    </div>
                   



                                    <!-- Passing Year -->
                                     <div class="custom-col d-flex align-items-center" style="width: 90.30px;"  >
                                        <asp:Label ID="lbltEduPass" runat="server"  CssClass="lblTxt lblName bodylblfontsize" Font-Bold="true">Passing Year:</asp:Label>
                                     </div>




                                  <div class="custom-col d-flex align-items-center"   style="width: 160px;" >
                                        <asp:TextBox ID="txtEduPass" runat="server" Width="118" Font-Bold="true" CssClass="form-control small-textbox1" style="margin-left: 1.6rem;"></asp:TextBox>
                                    </div>





                                    <!-- Agreement Type -->
                                    <div class="col-md-1.5 d-flex align-items-center">
                                        <asp:Label ID="lbltAtype" runat="server" CssClass="lblTxt lblName" Font-Bold="true">Agreement Type:</asp:Label>
                                        <asp:TextBox ID="lblAtype" runat="server" Width="110" ReadOnly="true" visible ="false" CssClass="form-control small-textbox1"></asp:TextBox>
                                    </div>



                                    <!-- Agreement Dropdown -->
                                    <div class="custom-col d-flex align-items-center"  style="width: 90.30px;"  >
                                        <asp:DropDownList ID="ddlAggrement" AutoPostBack="true" OnSelectedIndexChanged="ddlProQua_SelectedIndexChanged" runat="server" CssClass="form-control inputTxt ml-1" Width="120" height="30px" Font-Bold="true"></asp:DropDownList>
                                    </div>


                                                   <!-- Sales Role -->
                                  
                             


                                </div>

                                       <div class="row ">

                                          <div class="col-md-1 d-flex align-items-center" >
                                        <asp:Label ID="lblsale" runat="server" CssClass="lblTxt lblName fontsize "  Font-Bold="true" >Sales Role:</asp:Label>
                                       </div>

                                      <div class="custom-col d-flex align-items-center" style="width: 150px;"  >     
                                    <asp:ListBox ID="ListSalesRole" runat="server" Width="150" Font-Bold="true" CssClass="form-control form-control-sm small-textbox1" SelectionMode="Multiple"></asp:ListBox>
                                    </div>


                                           </div>

                                <div class="form-group">
                                    <div class="col-md-2 padymentType mt-3" style="width: 240px">
                                        <asp:Label ID="lbltAtype2" runat="server" CssClass="lblTxt lblName" Font-Bold="true">Payment Type:</asp:Label>
                                        <asp:RadioButtonList ID="rbtPaymentType" runat="server" AutoPostBack="True"
                                            CssClass="rbtnList1 chkBoxControl margin5px"
                                            Font-Size="12px" ForeColor="Black"
                                            OnSelectedIndexChanged="rbtPaymentType_SelectedIndexChanged"
                                            RepeatColumns="6" RepeatDirection="Horizontal" TabIndex="23">
                                            <asp:ListItem Value="Cash">Cash</asp:ListItem>
                                            <asp:ListItem Value="Bank">Bank</asp:ListItem>
                                            <asp:ListItem Value="Cheque">Cheque</asp:ListItem>

                                        </asp:RadioButtonList>



                                    </div>
                                    <div class="col-md-12">
                                        <asp:Panel ID="pnlPaymenttype" runat="server" Visible="false">



                                            <div class="row mt-2">
                                                <div class="d-flex align-items-center">
                                                    <div class="ml-1">
                                                        <asp:Label ID="lbltBankName1" runat="server" CssClass="smLbl text" Font-Bold="true">Bank01:</asp:Label>
                                                        <asp:DropDownList ID="ddlBankName1" runat="server" Font-Bold="True"
                                                            Font-Size="12px" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlBankName_SelectedIndexChanged"
                                                            Width="140px"  height="30px" TabIndex="24">
                                                        </asp:DropDownList>
                                                    </div>

                                                    <div class="ml-1">
                                                        <asp:Label ID="lblAcNo1" runat="server" CssClass=" smLbl" Font-Bold="true">A/CNo01:</asp:Label>
                                                        <asp:TextBox ID="txtAcNo1" runat="server" TabIndex="25" CssClass="form-control small-textbox1"></asp:TextBox>
                                                    </div>


                                                    <div class="ml-1">
                                                        <asp:Label ID="lblroute" runat="server" CssClass=" smLbl" Font-Bold="true">Routing01:</asp:Label>
                                                        <asp:TextBox ID="txtroute" runat="server" TabIndex="25" CssClass="form-control small-textbox1"></asp:TextBox>
                                                    </div>


                                                    <div class="ml-1">
                                                        <asp:Label ID="lbltBankName2" runat="server" CssClass="smLbl" Font-Bold="true">Bank02:</asp:Label>

                                                        <asp:DropDownList ID="ddlBankName2" runat="server" Font-Bold="True"
                                                            Font-Size="12px" CssClass="form-control ddlPage62" AutoPostBack="true" OnSelectedIndexChanged="ddlBankName2_SelectedIndexChanged"
                                                            Width="120px"  height="30px" TabIndex="26">
                                                        </asp:DropDownList>

                                                    </div>

                                                </div>
                                            </div>



                                            <div class="row mt-2">

                                                <div class="d-flex align-items-center">

                                                    <div class="ml-1">
                                                        <asp:Label ID="lblAcNo2" runat="server" CssClass="smLbl text" Font-Bold="true">A/CNo02:</asp:Label>
                                                        <asp:TextBox ID="txtAcNo2" runat="server" TabIndex="27" CssClass="form-control small-textbox1"></asp:TextBox>
                                                    </div>


                                                    <div class="ml-1">
                                                        <asp:Label ID="lblroute2" runat="server" CssClass=" smLbl" Font-Bold="true">Routing02:</asp:Label>
                                                        <asp:TextBox ID="txtroute2" runat="server" TabIndex="25" CssClass="form-control small-textbox1"></asp:TextBox>
                                                    </div>

                                                    <div class="ml-1">

                                                        <asp:Label ID="lblbankamt" runat="server" CssClass="smLbl text-right " Font-Bold="true">BankAmt.</asp:Label>
                                                        <asp:TextBox ID="txtBankamt02" runat="server" TabIndex="32" CssClass="form-control small-textbox"></asp:TextBox>

                                                    </div>

                                                    <div class="ml-1">
                                                        <asp:Label ID="lblCahsamt" runat="server" CssClass=" smLbl" Font-Bold="true">Amt</asp:Label>
                                                        <asp:TextBox ID="txtCashAmt" runat="server" Width="80px" TabIndex="0" CssClass="form-control small-textbox1"></asp:TextBox>
                                                    </div>

                                                    <asp:CheckBox ID="chkcash0bank1" runat="server" ClientIDMode="Static" ToolTip="Checked for Bank" Text="C/B" CssClass=" checkBox ml-2" AutoPostBack="true" OnCheckedChanged="chkcash0bank1_CheckedChanged" />
                                                </div>

                                            </div>




                                        </asp:Panel>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-6 pading5px ">
                                        <asp:Label ID="lblholidayrate" runat="server" CssClass="lblTxt lblName" Font-Bold="true">Holiday Rate:</asp:Label>

                                        <asp:RadioButtonList ID="rbtholiday" runat="server"
                                            Font-Bold="True" CssClass="rbtnList1 chkBoxControl margin5px "
                                            Font-Size="12px" Height="14px" RepeatColumns="6"
                                            RepeatDirection="Horizontal" ForeColor="Black"
                                            AutoPostBack="True" Width="70%"
                                            OnSelectedIndexChanged="rbtholiday_SelectedIndexChanged" TabIndex="28">
                                            <asp:ListItem>Not Applicable</asp:ListItem>
                                            <asp:ListItem>Scaled Based</asp:ListItem>
                                            <asp:ListItem>Fixed Allowance</asp:ListItem>

                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col-md-3 pading5px asitCol3">
                                        <asp:Label ID="lblholidayallowance" runat="server" Visible="False" CssClass="lblTxt lblName" Font-Bold="true">Amount</asp:Label>
                                        <asp:TextBox ID="txtholidayallowance" runat="server" Visible="False" CssClass="form-control small-textbox"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-7">
                                            
                                                <asp:Label ID="lbltOverTime" runat="server" CssClass="lblTxt lblName" Font-Bold="true">Over Time:</asp:Label>
                                                <asp:RadioButtonList ID="rbtnOverTime" runat="server" AutoPostBack="True"
                                                    Font-Bold="True"
                                                    Font-Size="12px" ForeColor="Black" Height="14px" CssClass="rbtnList1 chkBoxControl margin5px "
                                                    OnSelectedIndexChanged="rbtnOverTime_SelectedIndexChanged" RepeatColumns="6"
                                                    RepeatDirection="Horizontal" TabIndex="30" Width="70%">
                                                    <asp:ListItem>Fixed</asp:ListItem>
                                                    <asp:ListItem>Fixed(Hourly)</asp:ListItem>
                                                    <asp:ListItem>For.(Hourly)</asp:ListItem>
                                                    <asp:ListItem>Ceiling</asp:ListItem>
                                                    <asp:ListItem>Times slot </asp:ListItem>
                                                </asp:RadioButtonList>
                                             

                                           
                                            <div class="col-md-6">
                                                <asp:Panel ID="PnlMultiply" runat="server" Visible="false">   

                                                    <div class="d-flex align-items-center"
                                                        <asp:Label ID="lbldivided" runat="server" CssClass="lblTxt lblName" Font-Bold="true">Divided :</asp:Label>
                                                        <asp:TextBox ID="txtdevided" runat="server" CssClass="form-control small-textbox" Text="238"></asp:TextBox>
                                                        <asp:Label ID="lblforrate" runat="server" CssClass="smLbl_to"></asp:Label>
                                                  </div>


                                                </asp:Panel>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <asp:Panel ID="Panel6" runat="server">
                                            <div class="col-md-12">
                                                <div class="d-flex align-items-center">
                                                <asp:Label ID="lblfiexedRate" runat="server" CssClass="lblTxt lblName" Font-Bold="true">Rate:</asp:Label>
                                                <asp:TextBox ID="txtfixedRate" runat="server" TabIndex="32" CssClass="form-control small-textbox"></asp:TextBox>

                                                <asp:Label ID="lblhourlyRate" runat="server" CssClass=" lblTxt lblName" Font-Bold="true">Hourly Rate :</asp:Label>
                                                <asp:TextBox ID="txthourlyRate" runat="server" TabIndex="32" CssClass="form-control small-textbox"></asp:TextBox>

                                                <asp:Label ID="lblCeilingRate1" runat="server" CssClass="smLbl_to" Font-Bold="true">Ceiling(7PM-10PM)</asp:Label>
                                                <asp:TextBox ID="txtceilingRate1" runat="server" TabIndex="33" CssClass="form-control small-textbox"></asp:TextBox>

                                                <asp:Label ID="lblCeilingRate2" runat="server" CssClass="smLbl_to" Font-Bold="true">Ceiling(10:1PM-2AM)</asp:Label>
                                                <asp:TextBox ID="txtceilingRate2" runat="server" TabIndex="34" CssClass="form-control small-textbox"></asp:TextBox>

                                                <asp:Label ID="lblCeilingRate3" runat="server" CssClass="smLbl_to" Font-Bold="true">Ceiling(2:1AM-6PM)</asp:Label>
                                                <asp:TextBox ID="txtceilingRate3" runat="server" TabIndex="35" CssClass="form-control small-textbox"></asp:TextBox>
                                           </div>
                                                    
                                                </div>
                                        </asp:Panel>


                                    </div>
                                </div>


                                <%-- Night Allowance --%>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-6">
                                           
                                                <asp:Label ID="Label7" runat="server" CssClass="lblTxt lblName" Font-Bold="true">Night Allow.</asp:Label>

                                                <asp:RadioButtonList ID="rbtnNightAllowType" runat="server" AutoPostBack="True"
                                                    Font-Bold="True"
                                                    Font-Size="12px" ForeColor="Black" Height="14px" CssClass="rbtnList1 chkBoxControl margin5px "
                                                    OnSelectedIndexChanged="rbtnNightAllowType_SelectedIndexChanged" RepeatColumns="6"
                                                    RepeatDirection="Horizontal" TabIndex="30" Width="50%">
                                                    <asp:ListItem>Not Applicable</asp:ListItem>
                                                    <asp:ListItem>Fixed</asp:ListItem>
                                                    <asp:ListItem>Ceiling</asp:ListItem>
                                                </asp:RadioButtonList>


                                        </div>
                                    </div>
                                    <div class="row">
                                        <asp:Panel ID="pnlNightAllowRate" runat="server">
                                            <div class="d-flex align-items-center">
                                                <asp:Label ID="lblnfixedrate" runat="server" Visible="true" CssClass=" lblTxt lblName" Font-Bold="true">Rate</asp:Label>
                                                <asp:TextBox ID="txtnfixedrate" runat="server" Visible="true" TabIndex="32" CssClass="form-control small-textbox"></asp:TextBox>

                                                <asp:Label ID="lblncelling1" runat="server" CssClass="smLbl_to" Font-Bold="true">Ceiling(9PM-12:30AM)</asp:Label>
                                                <asp:TextBox ID="txtncelling1" runat="server" TabIndex="33" CssClass="form-control small-textbox"></asp:TextBox>

                                                <asp:Label ID="lblncelling2" runat="server" CssClass="smLbl_to" Font-Bold="true">Ceiling(12:30AM-ABOVE)</asp:Label>
                                                <asp:TextBox ID="txtncelling2" runat="server" TabIndex="34" CssClass="form-control small-textbox"></asp:TextBox>

                                            </div>
                                        </asp:Panel>


                                    </div>
                                </div>

                            </div>
                        </fieldset>
                    </asp:Panel>

                    <div class="row d-flex align-items-center gap-2">
                        <!-- Present Salary Label and Textbox -->
                        <div class="col-md-5 d-flex align-items-center">
                            <asp:Label ID="lblhSalary" runat="server" Text="Present Salary:" Style="padding: 0 12px" Font-Size="16px" Width="70%" Visible="False" CssClass="btn btn-sm btn-success btn-block"></asp:Label>
                            <asp:TextBox ID="txtgrossal" runat="server" Visible="False" BackColor="Yellow" CssClass="form-control small-textbox" TabIndex="38"></asp:TextBox>
                        </div>


                        <div class="col-md-2"></div>

                        <!-- Message Label -->
                        <div class="col-md-6 d-flex align-items-center">
                            <asp:Label ID="lblmsg1" runat="server" CssClass="btn btn-danger primaryBtn" Visible="false"></asp:Label>
                        </div>
                    </div>

                    <div class="row">
                        <asp:Panel ID="Panel5" runat="server">
                            <div class="form-group">
                                <div class="col-md-7 pading5px">
                                    <asp:RadioButtonList ID="rbtGross" runat="server" Font-Bold="True" CssClass="rbtnList1 chkBoxControl margin5px flotLeft"
                                        Font-Size="14px" Height="16px" RepeatColumns="8" RepeatDirection="Horizontal" Visible="false"
                                        TabIndex="37" Width="58%">
                                        <asp:ListItem>Gross1</asp:ListItem>
                                        <asp:ListItem>Gross2</asp:ListItem>
                                        <asp:ListItem>Gross3</asp:ListItem>
                                        <asp:ListItem>Basic</asp:ListItem>
                                        <asp:ListItem>GLG</asp:ListItem>
                                        <asp:ListItem>Alliance</asp:ListItem>
                                        <asp:ListItem>Tropical</asp:ListItem>
                                        <asp:ListItem>CPDL</asp:ListItem>
                                        <asp:ListItem>Angan</asp:ListItem>
                                        <asp:ListItem>Rupayan</asp:ListItem>


                                        <%--<asp:ListItem>PEB</asp:ListItem>--%>
                                    </asp:RadioButtonList>
                                </div>

                            </div>
                        </asp:Panel>
                    </div>

                    <div class="row">
                        <div class="col-md-5 col-sm-5">
                            <asp:Label ID="lblhSalaryAdd" runat="server" Visible="false" CssClass="">Addition: </asp:Label>

                            <asp:GridView ID="gvSalAdd" runat="server" AutoGenerateColumns="False" Style="background-color: whitesmoke" CssClass="table-striped table-hover table-bordered grvContentarea"
                                ShowFooter="True">
                                <RowStyle />
                                <Columns>
                                    <asp:TemplateField HeaderText="Sl.No.">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvSlNo1" runat="server" Font-Bold="True" Height="16px"
                                                Style="text-align: right"
                                                Text='<%# Convert.ToString(Container.DataItemIndex+1)+"." %>' Width="30px"></asp:Label>
                                        </ItemTemplate>

                                        <FooterStyle ForeColor="White" HorizontalAlign="Right" />

                                        <HeaderStyle  HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Code">
                                        <FooterTemplate>
                                            <asp:LinkButton ID="lbtnCalculation" runat="server" Font-Bold="True"
                                                Font-Size="12px" ForeColor="#000" OnClick="lbtnCalculation_Click"   Style="color: white;">CalCulation</asp:LinkButton>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvItmCodesaladd" runat="server" Height="16px"
                                                Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "gcod")) %>'
                                                Width="49px"></asp:Label>
                                        </ItemTemplate>
                                        <FooterStyle  Font-Bold="True" HorizontalAlign="Left" />
                                        <HeaderStyle  HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description">
                                        <ItemTemplate>
                                            <asp:Label ID="lgcResDesc2" runat="server"
                                                Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "gdesc")) %>'
                                                Width="150px"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:LinkButton ID="lbtnTSalAdd" runat="server" Font-Bold="True"
                                                Font-Size="12px" OnClick="lbtnTSalAdd_Click" ForeColor="White"
                                                Style="text-decaration: none; color: white;">Total</asp:LinkButton>
                                        </FooterTemplate>
                                        <FooterStyle CssClass="bg-primary text-white" Font-Bold="True" HorizontalAlign="Left" />
                                        <HeaderStyle CssClass="bg-primary text-white" HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="%">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtgvgperadd" runat="server" BackColor="Transparent"
                                                Height="20px" Font-Size="11px"
                                                Style="text-align: right"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "percnt")).ToString("#,##0.00; (#,##0.00); ") %>'
                                                Width="35px" BorderStyle="None"></asp:TextBox>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <FooterStyle  Font-Bold="True" HorizontalAlign="right" />
                                        <HeaderStyle  HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Type" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lgvgtype" runat="server"
                                                Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "gtype")) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtgvSaladd" runat="server" BackColor="Transparent"
                                                Height="20px" BorderStyle="None" Font-Size="11px"
                                                Style="text-align: right"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "gval")).ToString("#,##0.00;(#,##0.00); ") %>'
                                                Width="80px"></asp:TextBox>
                                        </ItemTemplate>

                                        <ItemStyle Font-Size="14px" Font-Bold="true" HorizontalAlign="Right" />
                                        <HeaderStyle  HorizontalAlign="Center" VerticalAlign="Top" />

                                        <FooterTemplate>
                                            <asp:Label ID="lgvFSalAdd" runat="server" Font-Bold="True" Font-Size="14px"
                                                Style="text-align: right" Width="80px"></asp:Label>
                                        </FooterTemplate>

                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle CssClass="grvFooterNew" />
                                <EditRowStyle />
                                <AlternatingRowStyle />
                                <PagerStyle CssClass="gvPagination" />
                                <HeaderStyle CssClass="grvHeaderNew" />
                            </asp:GridView>
                        </div>
                        <div class="col-sm-4 col-md-4 ">

                            <asp:Label ID="lblhSalaryDed" runat="server" Text="Deduction" Visible="False"></asp:Label>

                            <asp:GridView ID="gvSalSub" runat="server" AutoGenerateColumns="False" CssClass="table-striped table-hover table-bordered grvContentarea"
                                ShowFooter="True">
                                <RowStyle />
                                <Columns>
                                    <asp:TemplateField HeaderText="Sl.No.">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvSlNo2" runat="server" Font-Bold="True" Height="16px"
                                                Style="text-align: right"
                                                Text='<%# Convert.ToString(Container.DataItemIndex+1)+"." %>' Width="50px"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle  HorizontalAlign="Center" VerticalAlign="Top" />

                                        <FooterStyle  ForeColor="White" HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Code">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvItmCodesalsub" runat="server" Height="16px"
                                                Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "gcod")) %>'
                                                Width="49px"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        <FooterStyle  Font-Bold="True" HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description">
                                        <ItemTemplate>
                                            <asp:Label ID="lgcResDesc3" runat="server"
                                                Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "gdesc")) %>'
                                                Width="200px"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:LinkButton ID="lbtnTSalSub" runat="server" Font-Bold="True"
                                                Font-Size="12px" ForeColor="#000" OnClick="lbtnTSalSub_Click"
                                                Style="text-decaration: none; color: white;">Total</asp:LinkButton>
                                        </FooterTemplate>
                                        <FooterStyle  Font-Bold="True" HorizontalAlign="Left" />
                                        <HeaderStyle  HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Type" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lgvgtype0" runat="server"
                                                Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "gtype")) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="%">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtgvgpersub" runat="server" BackColor="Transparent"
                                                Height="20px" BorderStyle="None" Font-Size="11px"
                                                Style="text-align: right"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "percnt")).ToString("#,##0.00; (#,##0.00); ") %>' Width="35px"></asp:TextBox>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />

                                        <FooterStyle  Font-Bold="True" HorizontalAlign="right" />
                                        <HeaderStyle  HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtgvSalSub" runat="server" BackColor="Transparent"
                                                Height="20px" BorderStyle="None"
                                                Style="text-align: right"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "gval")).ToString("#,##0.00;(#,##0.00); ") %>'
                                                Width="80px"></asp:TextBox>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lgvFSalSub" runat="server" Font-Bold="True" Font-Size="12px"
                                                 Style="text-align: right" Width="80px"></asp:Label>
                                        </FooterTemplate>
                                        <HeaderStyle  HorizontalAlign="Center" VerticalAlign="Top" />
                                        <ItemStyle Font-Size="14px" Font-Bold="true" HorizontalAlign="Right" />


                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle CssClass="grvFooterNew" />
                                <EditRowStyle />
                                <AlternatingRowStyle />
                                <PagerStyle CssClass="gvPagination" />
                                <HeaderStyle CssClass="grvHeaderNew" />
                            </asp:GridView>


                        </div>


                        <asp:Panel ID="pnlTimesslot" CssClass="pnlTimesslot col-md-3 col-sm-3" runat="server" Visible="false">
                            <div style="background-color: whitesmoke; paddint-top: 5px;">
                                <h4 class="text-center">Times slot Entry</h4>
                                <div class="col-md-12 d-flex align-items-center">
                                    
                                    <asp:Label ID="Label1" runat="server" Width="50px" CssClass="lblTxt lblName text-left">Hour</asp:Label>
                                    <asp:TextBox ID="txtHourTimeSlot" runat="server" TextMode="Number" TabIndex="32" CssClass="form-control small-textbox" Style="width: 100px;"></asp:TextBox>

                                 
                                    <asp:Label ID="Label3" runat="server" Width="50px" CssClass="lblTxt lblName">Rate</asp:Label>
                                    <asp:TextBox ID="txtRateTimeSlot" runat="server" TextMode="Number" TabIndex="32" CssClass="form-control small-textbox" Style="width: 100px;"></asp:TextBox>

                                    <!-- Add Button -->
                                    <asp:LinkButton ID="lnkAdd" runat="server" CssClass="btn btn-sm btn-success" Style="padding: 2px 5px; margin-left: 5px" OnClick="lnkAdd_Click">Add</asp:LinkButton>
                                </div>



                                <hr />
                                <div class="col-md-12" id="GVsLOTdIV">
                                    <asp:GridView ID="gvTimsSlot" runat="server" AutoGenerateColumns="False" CssClass="table-striped table-hover table-bordered grvContentarea"
                                        ShowFooter="false">
                                        <RowStyle />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Sl.No.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblgvTimsSlotSlNo2" runat="server" Font-Bold="True" Height="16px"
                                                        Style="text-align: right"
                                                        Text='<%# Convert.ToString(Container.DataItemIndex+1)+"." %>' Width="50px"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="TImeSlotlnkDelete" runat="server" CssClass="btn btn-sm btn-danger" Style="padding: 2px" OnClick="TImeSlotlnkDelete_Click"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>

                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Hour">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtgvslothour" runat="server" BackColor="Transparent"
                                                        Height="20px" BorderStyle="None" Font-Size="11px"
                                                        Style="text-align: right"
                                                        Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "slothour")).ToString("#,##0.00;(#,##0.00); ") %>'
                                                        Width="80px"></asp:TextBox>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Amount">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtgvotrate" runat="server" BackColor="Transparent"
                                                        Height="20px" BorderStyle="None" Font-Size="11px"
                                                        Style="text-align: right"
                                                        Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "otrate")).ToString("#,##0.00;(#,##0.00); ") %>'
                                                        Width="80px"></asp:TextBox>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                                <ItemStyle HorizontalAlign="right" />
                                                <FooterStyle HorizontalAlign="right" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle CssClass="grvFooter" />
                                        <EditRowStyle />
                                        <AlternatingRowStyle />
                                        <PagerStyle CssClass="gvPagination" />
                                        <HeaderStyle CssClass="grvHeader" />
                                    </asp:GridView>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </asp:Panel>

                        <asp:Panel ID="PnlSupervisationImport" CssClass="col-md-3 col-sm-3" runat="server" Visible="false">

                            <div class="" style="width: 80%; float: left;">
                                <asp:DropDownList ID="DdlSupervisor" runat="server" CssClass="chzn-select form-control form-control-sm" TabIndex="2">
                                </asp:DropDownList>
                            </div>
                            <div class="" style="width: 18%; float: left;">
                                <asp:LinkButton ID="ViewEmployee" runat="server" OnClick="ViewEmployee_Click" CssClass="btn btn-sm btn-success">View</asp:LinkButton>
                            </div>

                            <asp:GridView ID="GvChildEmp" runat="server" AutoGenerateColumns="False" CssClass="table-striped table-hover table-bordered grvContentarea"
                                ShowFooter="True">
                                <RowStyle />
                                <Columns>
                                    <asp:TemplateField HeaderText="Sl.No.">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvSlNo1" runat="server" Font-Bold="True" Height="16px"
                                                Style="text-align: right"
                                                Text='<%# Convert.ToString(Container.DataItemIndex+1)+"." %>' Width="30px"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Id Card">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvChildEmpIdCard" runat="server" Height="16px"
                                                Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "idcard")) %>'
                                                Width="50px"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvChildEmp" runat="server" Height="16px"
                                                Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "empname")) %>'
                                                Width="120px"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Designation">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvChildEmpDesig" runat="server" Height="16px"
                                                Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "desig")) %>'
                                                Width="70px"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:TemplateField>

                                </Columns>
                                <FooterStyle CssClass="grvFooter" />
                                <EditRowStyle />
                                <AlternatingRowStyle />
                                <PagerStyle CssClass="gvPagination" />
                                <HeaderStyle CssClass="grvHeader" />
                            </asp:GridView>
                        </asp:Panel>

                    </div>

                    <div class="row">

                        <div class="col-md-3 ">
                            <asp:Label ID="lbltxtTotalSal" runat="server" CssClass="lblTxt lblName" Visible="false">Net Salary:</asp:Label>
                            <asp:Label ID="lbltotalsal" runat="server" CssClass="smLbl_to"></asp:Label>
                        </div>
                        <asp:Label ID="lblAllowance" runat="server" Font-Bold="true" Text="Allowance" Visible="False"></asp:Label>
                        <div class="clearfix"></div>


                        <div class="col-md-6">
                            <asp:Label ID="lblhAllowAdd" runat="server" Font-Bold="true" Text="Addition" Visible="False"></asp:Label>

                            <asp:GridView ID="gvAllowAdd" runat="server" AutoGenerateColumns="False" CssClass="table-striped table-hover table-bordered grvContentarea"
                                ShowFooter="True">
                                <RowStyle />
                                <Columns>
                                    <asp:TemplateField HeaderText="Sl.No.">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvSlNo3" runat="server" Font-Bold="True" Height="16px"
                                                Style="text-align: right"
                                                Text='<%# Convert.ToString(Container.DataItemIndex+1)+"." %>' Width="50px"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Code">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvItmCode" runat="server" Height="16px"
                                                Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "gcod")) %>'
                                                Width="49px"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description">
                                        <ItemTemplate>
                                            <asp:Label ID="lgcResDesc" runat="server"
                                                Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "gdesc")) %>'
                                                Width="200px"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:LinkButton ID="lbtnTAllowAdd" runat="server" Font-Bold="True"
                                                Font-Size="12px" ForeColor="#000" OnClick="lbtnTAllowAdd_Click"
                                                Style="text-decaration: none;">Total</asp:LinkButton>
                                        </FooterTemplate>
                                        <FooterStyle Font-Bold="True" HorizontalAlign="Left" />
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Unit">
                                        <ItemTemplate>
                                            <asp:Label ID="lgvUnit" runat="server"
                                                Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "unit")) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Type" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lgvgvtype" runat="server"
                                                Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "gtype")) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Rate">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtgvAllowAdd" runat="server" BackColor="Transparent" Height="20px"
                                                Style="text-align: right"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "rate")).ToString("#,##0;(#,##0); ") %>'
                                                Width="70px" BorderStyle="None"></asp:TextBox>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lgvFAllowAdd" runat="server" Font-Bold="True" Font-Size="12px"
                                                ForeColor="#000" Style="text-align: right" Width="80px"></asp:Label>
                                        </FooterTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        <ItemStyle HorizontalAlign="right" />
                                        <FooterStyle HorizontalAlign="right" />



                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle CssClass="grvFooter" />
                                <EditRowStyle />
                                <AlternatingRowStyle />
                                <PagerStyle CssClass="gvPagination" />
                                <HeaderStyle CssClass="grvHeader" />
                            </asp:GridView>
                        </div>
                        <div class="col-md-5 pull-right">
                            <asp:Label ID="lblhAllowDed" runat="server" Font-Bold="true" Text="Deduction" Visible="False"></asp:Label>

                            <asp:GridView ID="gvAllowSub" runat="server" AutoGenerateColumns="False" CssClass="table-striped table-hover table-bordered grvContentarea"
                                ShowFooter="True" Width="400px">
                                <RowStyle />
                                <Columns>
                                    <asp:TemplateField HeaderText="Sl.No.">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvSlNo4" runat="server" Font-Bold="True" Height="16px"
                                                Style="text-align: right"
                                                Text='<%# Convert.ToString(Container.DataItemIndex+1)+"." %>' Width="50px"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Code">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvItmCode2" runat="server" Height="16px"
                                                Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "gcod")) %>'
                                                Width="49px"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description">
                                        <ItemTemplate>
                                            <asp:Label ID="lgcResDesc4" runat="server"
                                                Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "gdesc")) %>'
                                                Width="200px"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:LinkButton ID="lbtnTAllowSub" runat="server" Font-Bold="True"
                                                Font-Size="12px" ForeColor="#000" OnClick="lbtnTAllowSub_Click"
                                                Style="text-decaration: none;">Total</asp:LinkButton>
                                        </FooterTemplate>
                                        <FooterStyle Font-Bold="True" HorizontalAlign="Left" />
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Unit">
                                        <ItemTemplate>
                                            <asp:Label ID="lgvUnit0" runat="server"
                                                Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "unit")) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Type" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lgvgvtype2" runat="server"
                                                Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "gtype")) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Rate">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtgvAllowSub" runat="server" BackColor="Transparent" Height="20px"
                                                Style="text-align: right"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "rate")).ToString("#,##0;(#,##0); ") %>'
                                                Width="80px" BorderStyle="None"></asp:TextBox>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lgvFAllowSub" runat="server" Font-Bold="True" Font-Size="12px"
                                                ForeColor="#000" Style="text-align: right" Width="80px"></asp:Label>
                                        </FooterTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        <ItemStyle HorizontalAlign="right" />
                                        <FooterStyle HorizontalAlign="right" />
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle CssClass="grvFooter" />
                                <EditRowStyle />
                                <AlternatingRowStyle />
                                <PagerStyle CssClass="gvPagination" />
                                <HeaderStyle CssClass="grvHeader" />


                            </asp:GridView>
                        </div>



                        <div class="col-md-8 d-flex justify-content-center align-items-center" style="height: 100px;">
                            <asp:LinkButton ID="lnkbtnFinalSWUpdate" runat="server" Width="100px" CssClass="btn btn-success btn-sm text-center text-white"
                                OnClick="lnkbtnFinalSWUpdate_Click" Visible="False" TabIndex="39">Final Update</asp:LinkButton>

                            <asp:LinkButton ID="lnkUserGenerate" runat="server" CssClass="btn btn-warning btn-sm text-center text-white"
                                Visible="false" OnClick="lnkUserGenerate_Click" TabIndex="39">User Generate</asp:LinkButton>
                        </div>


                    </div>

                </asp:View>

                <asp:View ID="EmpOfftimeSetup" runat="server">
                    <div class="row">
                        <fieldset class="scheduler-border fieldset_A">
                            <div class="form-horizontal">
                                <asp:Panel ID="pnlDepartment" runat="server">
                                    <div class="form-group">
                                        <div class="col-md-3 pading5px asitCol3">
                                            <asp:Label ID="Label4" runat="server" CssClass="lblTxt lblName">Company</asp:Label>
                                            <asp:TextBox ID="txtSrcCompany" runat="server" CssClass="inputTxt inputName inpPixedWidth"></asp:TextBox>
                                            <asp:LinkButton ID="imgbtnCompany" runat="server" CssClass="btn btn-primary srearchBtn colMdbtn" OnClick="imgbtnCompany_Click"><span class="glyphicon glyphicon-search asitGlyp"> </span></asp:LinkButton>
                                        </div>
                                        <div class="col-md-4 pading5px">
                                            <asp:DropDownList ID="ddlCompany" OnClick="ddlCompany_SelectedIndexChanged" runat="server" CssClass="form-control inputTxt" AutoPostBack="true" TabIndex="2">
                                            </asp:DropDownList>
                                            <asp:Label ID="Label5" runat="server" CssClass="form-control dataLblview" Height="22" Style="line-height: 1.5" Visible="false"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-3 pading5px asitCol3">
                                            <asp:Label ID="Label6" runat="server" CssClass="lblTxt lblName">Department</asp:Label>
                                            <asp:TextBox ID="txtSrcDepartment" runat="server" CssClass="inputTxt inputName inpPixedWidth"></asp:TextBox>
                                            <asp:LinkButton ID="imgbtnDeptSrch" runat="server" CssClass="btn btn-primary srearchBtn colMdbtn" OnClick="imgbtnDeptSrch_Click"><span class="glyphicon glyphicon-search asitGlyp"> </span></asp:LinkButton>
                                        </div>
                                        <div class="col-md-4 pading5px">
                                            <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control inputTxt" TabIndex="2">
                                            </asp:DropDownList>
                                            <asp:Label ID="lblDeptDesc" runat="server" CssClass="form-control dataLblview" Height="22" Style="line-height: 1.5" Visible="false"></asp:Label>
                                        </div>
                                        <div class="col-md-1 pading5px">
                                            <asp:LinkButton ID="lnkbtnShow" runat="server" CssClass="btn btn-primary okBtn" OnClick="lnkbtnShow_Click"
                                                TabIndex="47">Ok</asp:LinkButton>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </div>
                        </fieldset>
                        <asp:Panel ID="pnlOfftime" runat="server" Visible="False">
                            <fieldset class="scheduler-border fieldset_A">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <div class="col-md-3 pading5px asitCol3">
                                            <asp:Label ID="lblfrmdate" runat="server" CssClass="lblTxt lblName" Visible="false">Date</asp:Label>
                                            <asp:TextBox ID="txtfromdate" runat="server" CssClass=" inputtextbox" Visible="false" Style="width: 85px;"></asp:TextBox>
                                            <cc1:CalendarExtender ID="txtfromdate_CalendarExtender" runat="server"
                                                Enabled="True" Format="dd-MMM-yyyy" TargetControlID="txtfromdate"></cc1:CalendarExtender>

                                        </div>
                                        <div class="col-md-3 pading5px asitCol3">
                                            <asp:Label ID="lbltodate" runat="server" CssClass="lblTxt lblName" Visible="false">To</asp:Label>
                                            <asp:TextBox ID="txttodate" runat="server" CssClass=" inputtextbox " Visible="false" Style="width: 85px;"></asp:TextBox>
                                            <cc1:CalendarExtender ID="txttodate_CalendarExtender" runat="server" Format="dd-MMM-yyyy" TargetControlID="txttodate"></cc1:CalendarExtender>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-md-3  asitCol3">
                                            <asp:Label ID="lbltOfftime1" runat="server" CssClass="lblTxt lblName">Office InTime</asp:Label>
                                            <asp:DropDownList ID="ddlOffintimedw" runat="server" CssClass="   ddlPage" TabIndex="2">
                                            </asp:DropDownList>
                                        </div>

                                        <div class="col-md-3 asitCol3">
                                            <asp:Label ID="lbltOfftime2" runat="server" CssClass="lblTxt lblName">Office OutTime</asp:Label>
                                            <asp:DropDownList ID="ddlOffouttimedw" runat="server" CssClass=" ddlPage" TabIndex="2">
                                            </asp:DropDownList>
                                        </div>

                                        <div class="col-md-3  asitCol3">
                                            <asp:Label ID="lblmsg2" runat="server" CssClass="btn btn-danger primaryBtn"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-3 asitCol3">
                                            <asp:Label ID="lbltLantime1" runat="server" CssClass="lblTxt lblName">Lunch InTime</asp:Label>
                                            <asp:DropDownList ID="ddlLanintimedw" runat="server" CssClass=" ddlPage" TabIndex="2">
                                            </asp:DropDownList>
                                        </div>

                                        <div class="col-md-3">
                                            <asp:Label ID="lbltLantime2" runat="server" CssClass="lblTxt lblName">Lunch OutTime:</asp:Label>
                                            <asp:DropDownList ID="ddlLanouttimedw" runat="server" CssClass="form-control small-textbox" TabIndex="0">
                                            </asp:DropDownList>
                                        </div>

                                        <div class="col-md-3 asitCol3">
                                            <asp:LinkButton ID="lnkbtnUpdateOfftime" runat="server" CssClass="btn btn-danger primaryBtn"
                                                OnClick="lnkbtnUpdateOfftime_Click"
                                                TabIndex="52">Update</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>

                        </asp:Panel>
                    </div>

                </asp:View>


            </asp:MultiView>
        </div>
    </div>

    <%-- Modal Start--%>
    <div class="modal fade " id="ChildEmpAddModal" role="dialog">
        <div class="modal-dialog  modal-lg ">
            <div class="modal-content ">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title text-center">Select Desire Employee</h3>
                </div>
                <div class="modal-body">
                    <asp:GridView ID="GvChildEmpModal" runat="server" AutoGenerateColumns="False" CssClass="table-striped table-hover table-bordered grvContentarea"
                        ShowFooter="True">
                        <RowStyle />
                        <Columns>
                            <asp:TemplateField HeaderText="Sl.No.">
                                <ItemTemplate>
                                    <asp:Label ID="lblgvSlNo1" runat="server" Font-Bold="True" Height="16px"
                                        Style="text-align: right"
                                        Text='<%# Convert.ToString(Container.DataItemIndex+1)+"." %>' Width="30px"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Id Card">
                                <ItemTemplate>
                                    <asp:Label ID="lblgvChildEmpIdCard" runat="server" Height="16px"
                                        Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "idcard")) %>'
                                        Width="50px"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblgvChildEmp" runat="server" Height="16px"
                                        Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "empname")) %>'
                                        Width="120px"></asp:Label>
                                    <asp:Label ID="lblgvChildEmpId" runat="server" Height="16px"
                                        Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "empid")) %>'
                                        Width="120px"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Designation">
                                <ItemTemplate>
                                    <asp:Label ID="lblgvChildEmpDesig" runat="server" Height="16px"
                                        Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "desig")) %>'
                                        Width="70px"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="ChkAll" ClientIDMode="Static" runat="server" onclick="javascript:SelectAllCheckboxes('GvChildEmpModal', this);" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkack" ClientIDMode="Static" runat="server" CssClass="chkack"
                                        Width="20px" />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                                <FooterStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle CssClass="grvFooter" />
                        <EditRowStyle />
                        <AlternatingRowStyle />
                        <PagerStyle CssClass="gvPagination" />
                        <HeaderStyle CssClass="grvHeader" />
                    </asp:GridView>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="lbtnUpdateSupervision" OnClick="lbtnUpdateSupervision_Click" runat="server" class="btn btn-success" aria-hidden="true" OnClientClick="CloseChildEmpModal();">Update</asp:LinkButton>
                    <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                </div>
            </div>
        </div>
    </div>
    <%--Modal End--%>
</asp:Content>



