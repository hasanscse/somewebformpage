<%@ Page Title="" Language="C#" MasterPageFile="~/ASITNEW.Master" AutoEventWireup="true" CodeBehind="HREmpAbsentDel.aspx.cs" Inherits="RealERPWEB.F_81_Hrm.F_83_Att.HREmpAbsentDel" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

      <style type="text/css">
        .margin5px {
        }
        /*
        .dropdown-toggle:after {
            display: inline-block;
            margin-left: .255em;
            vertical-align: .255em;
            content: "";
            border-top: .3em solid;
            border-right: .3em solid transparent;
            border-bottom: 0;
            border-left: .3em solid transparent;
        }*/
        .chzn-container {
            width: 100% !important;
        }

        .chzn-container-single .chzn-single {
            height: 28px !important;
            line-height: 28px !important;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="../../../Scripts/gridviewScrollHaVertworow.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(pageLoaded);
        });

        function pageLoaded() {

            try {

                var gridViewScroll = new GridViewScroll({
                    elementID: "gvpayroll",
                    width: 1400,
                    height: 500,
                    freezeColumn: true,
                    freezeFooter: true,
                    freezeColumnCssClass: "GridViewScrollItemFreeze",
                    freezeFooterCssClass: "GridViewScrollFooterFreeze",
                    freezeHeaderRowCount: 1,
                    freezeColumnCount: 8,

                });

                //var gridViewScroll = new GridViewScroll({
                //    elementID: "gvBonus",
                //    width: 1000,
                //    height: 500,
                //    freezeColumn: true,
                //    freezeFooter: true,
                //    freezeColumnCssClass: "GridViewScrollItemFreeze",
                //    freezeFooterCssClass: "GridViewScrollFooterFreeze",
                //    freezeHeaderRowCount: 1,
                //    freezeColumnCount: 8,

                //});
                gridViewScroll.enhance();
                $('.chzn-select').chosen({ search_contains: true });
            }

            catch (e) {
                alert(e);
            }
        }

        function OpenDedModal() {
            $('#DeductinModal').modal('toggle');
        };

        function CloseDedModal() {
            $('#DeductinModal').modal('hide');
        }

    </script>
    <style>
        .GridViewScrollHeader TH, .GridViewScrollHeader TD {
            font-weight: normal;
            white-space: nowrap;
            border-right: 1px solid #e6e6e6;
            border-bottom: 1px solid #e6e6e6;
            background-color: #F4F4F4;
            color: #999999;
            text-align: left;
            vertical-align: bottom;
        }

        .GridViewScrollItem TD {
            white-space: nowrap;
            border-right: 1px solid #e6e6e6;
            border-bottom: 1px solid #e6e6e6;
            background-color: #FFFFFF;
            color: #444444;
        }

        .GridViewScrollItemFreeze TD {
            white-space: nowrap;
            border-right: 1px solid #e6e6e6;
            border-bottom: 1px solid #e6e6e6;
            background-color: #FAFAFA;
            color: #444444;
        }

        .GridViewScrollFooterFreeze TD {
            white-space: nowrap;
            border-right: 1px solid #e6e6e6;
            border-top: 1px solid #e6e6e6;
            border-bottom: 1px solid #e6e6e6;
            background-color: #F4F4F4;
            color: #444444;
        }

        .grvHeader {
            height: 58px !important;
        }

        .WrpTxt {
            white-space: normal !important;
            word-break: break-word !important;
        }

        .mt20 {
            margin-top: 20px;
        }
    </style>


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
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

          <div class="card mt-5">
                <div class="card-header">
                    <div class="row">


                        
                        <div class="col-lg-3">
                            <div class="form-group">
                                <asp:Label ID="lbldeptnameagg" runat="server">Department</asp:Label>

                                <asp:DropDownList ID="ddldepartmentagg" OnSelectedIndexChanged="ddldepartmentagg_SelectedIndexChanged" runat="server" CssClass="form-control chzn-select" AutoPostBack="true" Width="336px">
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="col-lg-3">
                            <div class="form-group">
                                <asp:Label ID="lblsection" runat="server">Section</asp:Label>


                                <asp:DropDownList ID="ddlSectionName" OnSelectedIndexChanged="ddlSectionName_SelectedIndexChanged" runat="server" CssClass="form-control  chzn-select" AutoPostBack="true" TabIndex="2" Width="336px">
                                </asp:DropDownList>
                            </div>
                        </div>



                        <div class="col-lg-2 col-md-1 col-sm-6">
                            <asp:Label ID="lbldate" runat="server">From Date</asp:Label>
                            <asp:TextBox ID="txtCurDate" runat="server" CssClass="form-control"></asp:TextBox>
                            <cc1:CalendarExtender ID="txtCurDate_CalendarExtender" runat="server" Format="dd-MMM-yyyy" TargetControlID="txtCurDate"></cc1:CalendarExtender>
                        </div>


                            <div class="col-lg-2 col-md-1 col-sm-6">
                            <asp:Label ID="lbltodate" runat="server">To Date</asp:Label>
                            <asp:TextBox ID="txttodate" runat="server" CssClass="form-control"></asp:TextBox>
                            <cc1:CalendarExtender ID="txttodate_CalendarExtender" runat="server" Format="dd-MMM-yyyy" TargetControlID="txttodate"></cc1:CalendarExtender>
                        </div>



                              <div class="col-lg-1 col-md-1 col-sm-6">
                            <asp:Label ID="Label14" runat="server">Page Size</asp:Label>
                            <asp:DropDownList ID="ddlpagesize" runat="server" AutoPostBack="True" CssClass="form-control form-control-sm" OnSelectedIndexChanged="ddlpagesize_SelectedIndexChanged">
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>15</asp:ListItem>
                                <asp:ListItem>20</asp:ListItem>
                                <asp:ListItem>30</asp:ListItem>
                                <asp:ListItem>50</asp:ListItem>
                                <asp:ListItem>100</asp:ListItem>
                                <asp:ListItem>150</asp:ListItem>
                                <asp:ListItem>200</asp:ListItem>
                                <asp:ListItem>300</asp:ListItem>
                                <asp:ListItem>600</asp:ListItem>
                                <asp:ListItem>1000</asp:ListItem>
                                <asp:ListItem>2000</asp:ListItem>
                                <asp:ListItem>3000</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="col-md-1 col-lg-1 col-xs-12">
                            <asp:LinkButton ID="lbtnOk" runat="server" OnClick="lbtnOk_Click" CssClass="btn btn-success btn-sm" Style="margin-top: 20px;">Ok</asp:LinkButton>
                        </div>
                    </div>

                </div>

                  <div class="card-body pt-0">

                     <asp:MultiView ID="MultiView1" runat="server">                      
                        <asp:View ID="gvewAbsDays" runat="server">
                            <asp:GridView ID="gvAbsDays" runat="server" AllowPaging="True" CssClass="table-striped table-hover table-bordered grvContentarea"
                                AutoGenerateColumns="False" OnPageIndexChanging="gvAbsDays_PageIndexChanging"
                                ShowFooter="True">
                                <PagerSettings Position="Top" />
                                <RowStyle />
                                 <Columns>
                                <asp:TemplateField HeaderText="#Sl">
                                    <ItemTemplate>
                                        <asp:Label ID="serialnoid0" runat="server" Style="text-align: center"
                                            Text='<%# Convert.ToString(Container.DataItemIndex+1)+"." %>' Width="30px"></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle Font-Bold="True" Font-Size="12px" ForeColor="#000" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Employee Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lgvempname" runat="server" Width="220px" CssClass="WrpTxt"
                                            Text='<%#Convert.ToString(DataBinder.Eval(Container.DataItem, "empname")) %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>


                                   <asp:TemplateField HeaderText="#Id Card">
                                    <ItemTemplate>
                                        <asp:Label ID="lgvidcard" runat="server" Width="100px" CssClass="WrpTxt"
                                            Text='<%#Convert.ToString(DataBinder.Eval(Container.DataItem, "idcard")) %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Emp ID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lgvempid" runat="server" Width="150px" CssClass="WrpTxt"
                                            Text='<%#Convert.ToString(DataBinder.Eval(Container.DataItem, "empid")) %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                      <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>


                                      <asp:TemplateField HeaderText="Designation">
                                                <ItemTemplate>
                                                    <asp:Label ID="lgvdesig" runat="server"
                                                        Text='<%#Convert.ToString(DataBinder.Eval(Container.DataItem, "desig")) %>'
                                                        Width="120px"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="left" />
                                            
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </asp:TemplateField>


                                     <asp:TemplateField HeaderText="#Absent Date">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtgvinstdate" runat="server" Style="text-align: left; font-size: 11px;"
                                            Text='<%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "absdat")).ToString("dd-MMM-yyyy") %>'
                                            Width="80px" BackColor="Transparent" BorderStyle="None"></asp:TextBox>
                                        <cc1:CalendarExtender ID="txtgvinstdate_CalendarExtender" runat="server"
                                            Enabled="True" Format="dd-MMM-yyyy" TargetControlID="txtgvinstdate"></cc1:CalendarExtender>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:LinkButton ID="lbtnAllDelete" runat="server" Font-Bold="True"
                                            CssClass="btn btn-danger btn-sm ml-1" OnClick="lbtnAllDelete_Click">Delete All</asp:LinkButton>                                   

                                    </FooterTemplate>
                                   <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>


                              

                                     
                                <asp:TemplateField HeaderText="Absent DateID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lgvempabsdateid" runat="server" Width="220px" CssClass="WrpTxt"
                                            Text='<%#Convert.ToString(DataBinder.Eval(Container.DataItem, "absdatid")) %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>








                                  <asp:TemplateField HeaderText="Approve Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lgvnstatus" runat="server" Width="100px" CssClass="WrpTxt"
                                            Text='<%#Convert.ToString(DataBinder.Eval(Container.DataItem, "status")) %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                     <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
 


                          <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkDel" Width="40px" runat="server" OnClientClick="return confirm('Are you sure to delete this item?');" OnClick="lnkDel_Click" Text="Delete"><i class="fa fa-trash"></i></asp:LinkButton>
                                    </ItemTemplate>

                                <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>



                                      <asp:TemplateField HeaderText="Check Box" Visible="true">
                                       <HeaderTemplate>
                                                <table style="width: 90px;">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label3" runat="server" Text="All"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:CheckBox ID="chkallView" runat="server" AutoPostBack="True"
                                                                OnCheckedChanged="chkallView_CheckedChanged" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkidvalue" runat="server"
                                                    Checked='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "chkvalue"))=="True" %>'
                                                    Width="50px" />
                                            </ItemTemplate>

                                            <FooterTemplate>
                                        <asp:LinkButton ID="lbtnAllChkDelete" runat="server" Font-Bold="True"
                                            CssClass="btn btn-danger btn-sm ml-1" OnClick="lbtnAllChkDelete_Click">Delete Chkd</asp:LinkButton>                                   

                                    </FooterTemplate>
                                            <FooterStyle Font-Bold="True" HorizontalAlign="Left" />
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>



                            </Columns>
                                <FooterStyle CssClass="grvFooter" />
                                <EditRowStyle />
                                <AlternatingRowStyle />
                                <PagerStyle CssClass="gvPagination" />
                                <HeaderStyle CssClass="grvHeader" />
                            </asp:GridView>
                        </asp:View>
                    </asp:MultiView>












                    </div>
               
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
