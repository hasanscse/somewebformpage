<%@ Page Title="" Language="C#" MasterPageFile="~/ASITNEW.Master" AutoEventWireup="true" CodeBehind="EmployeesGrossSalaryDeductionSetup.aspx.cs" Inherits="RealERPWEB.F_81_Hrm.F_92_Mgt.EmployeesGrossSalaryDeductionSetup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <style>   

        .mt20 {
            margin-top: 20px;
        }
        .chzn-container {
            width: 100% !important;
        }

        .chzn-drop {
            width: 100% !important;
        }
        .chzn-container-single .chzn-single {
            height: 35px !important;
            line-height: 35px !important;
        }
        .card-body {
            min-height: 400px !important;
        }
        .pd4 {
            padding: 4px !important;
        }
    </style>


    <script language="javascript" type="text/javascript">   
      
        $(document).ready(function () {
            
            Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(pageLoaded);

        });
        function pageLoaded() {

            $("input, select").bind("keydown", function (event) {
                var k1 = new KeyPress();
                k1.textBoxHandler(event);
            });
       
            $('.chzn-select').chosen({ search_contains: true });

        };
    </script>   


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
                <div class="contentPart">
                    <div class="card-header">

                        <fieldset class="scheduler-border fieldset_A">
                            <div class="form-horizontal">
                                <div class="row">
                                  

                                     <div class="col-lg-2 col-md-3 col-sm-4 ">
                                        <div class="form-group">
                                            <asp:Label ID="lblCompanyName" runat="server" CssClass="dataLblview">Company Name</asp:Label>
                                            <asp:DropDownList ID="ddlCompanyName" runat="server" CssClass="form-control inputTxt chzn-select pull-left" OnSelectedIndexChanged="ddlCompanyName_SelectedIndexChanged" AutoPostBack="true" TabIndex="2">
                                            </asp:DropDownList>

                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-3 col-sm-4 ">
                                        <div class="form-group">
                                            <asp:Label ID="lblDeptDesc" CssClass="dataLblview" runat="server">Department</asp:Label>
                                            <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control inputTxt chzn-select" TabIndex="7" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged" AutoPostBack="True">
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="col-lg-2 col-md-4 col-sm-4 ">
                                        <div class="form-group">
                                            <asp:Label ID="Label10" runat="server"  CssClass="lblTxt lblName">Section</asp:Label>
                                            <asp:DropDownList ID="ddlSection" runat="server" OnSelectedIndexChanged="ddlSection_SelectedIndexChanged" CssClass="form-control inputTxt chzn-select" AutoPostBack="True" TabIndex="6">
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                      <div class="col-lg-1 col-md-2 col-sm-3">
                                      
                                             <asp:Label ID="lblddlYaermonth" runat="server" CssClass="dataLblview">Year Month</asp:Label>
                                            <asp:DropDownList ID="ddlYearMonth" runat="server" CssClass="form-control inputTxt chzn-select pull-left" OnSelectedIndexChanged="ddlCompanyName_SelectedIndexChanged" AutoPostBack="true" TabIndex="2">
                                            </asp:DropDownList>

                                    </div>



                                    <div class="col-lg-1 col-md-4 col-sm-4 ">
                                        <div class="form-group">
                                            <asp:Label ID="lblPage" runat="server" CssClass="lblTxt lblName">Page Size</asp:Label>
                                            <asp:DropDownList ID="ddlpagesize" runat="server" AutoPostBack="True" CssClass="form-control chzn-select" OnSelectedIndexChanged="ddlpagesize_SelectedIndexChanged">
                                                <asp:ListItem Selected="True">10</asp:ListItem>
                                                <asp:ListItem>15</asp:ListItem>
                                                <asp:ListItem>20</asp:ListItem>
                                                <asp:ListItem>30</asp:ListItem>
                                                <asp:ListItem>50</asp:ListItem>
                                                <asp:ListItem>100</asp:ListItem>                                                                                       
                                                <asp:ListItem >500</asp:ListItem>                                           
                                                <asp:ListItem>1000</asp:ListItem>                                                                                   
                                                <asp:ListItem>3000</asp:ListItem>
                                                <asp:ListItem>4000</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                    </div>




                                    <div class="col-lg-2 col-md-4 col-sm-4 mt-4">
                                        <div class="form-group">
                                            <div class="pull-left">
                                                <asp:LinkButton ID="lnkbtnShow" runat="server" CssClass="btn btn-primary btn-sm pull-left" OnClick="lnkbtnShow_Click" Text="Ok"></asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                                <div class="row" runat="server" id="lblsecrow">

                                       
                                    <div class="col-lg-2 col-md-4 col-sm-4 ">
                                        <div class="form-group">
                                            <asp:Label ID="lblEmployee" runat="server" CssClass="lblTxt lblName">Employee Name</asp:Label>
                                            <asp:DropDownList ID="ddlemployee" runat="server" CssClass="form-control inputTxt chzn-select" TabIndex="6">
                                            </asp:DropDownList>
                                        </div>
                                    </div>



                                    <div class="col-lg-2 col-md-4 col-sm-4 mt-4">
                                        <div class="form-group">
                                            <div class="pull-left">
                                                <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn btn-success btn-xs" OnClick="lnkbtnAdd_Click" Text="Add"></asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                    </div>
                    </fieldset>
                </div>

                <div class="card-body">

                    <asp:GridView ID="gvSalaryDedgross" runat="server" AllowPaging="True"
                        AutoGenerateColumns="False" CssClass="table-striped table-hover table-bordered grvContentarea"
                        OnPageIndexChanging="gvSalaryDedgross_PageIndexChanging" ShowFooter="True" OnRowCommand="gvSalaryDedgross_RowCommand"
                        OnRowDeleting="gvSalaryDedgross_RowDeleting">
                        <RowStyle />
                        <Columns>
                            <%--1--%>
                            <asp:TemplateField HeaderText="Sl">
                                <ItemTemplate>
                                    <asp:Label ID="lblgvSlNo1" runat="server" Font-Bold="True"
                                        Style="text-align: right"
                                        Text='<%# Convert.ToString(Container.DataItemIndex+1)+"." %>' Width="30px"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                            </asp:TemplateField>


                            <asp:CommandField ShowDeleteButton="True" ControlStyle-ForeColor="Red"  DeleteText="<span class='fa fa-trash'></span>" />
                            <%--2--%>
                            <asp:TemplateField HeaderText="Section">
                               
                                <ItemTemplate>
                                    <asp:Label ID="lgvSection" runat="server"
                                        Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "sectionname")) %>'
                                        Width="180px" Font-Bold="True" Font-Size="11px"></asp:Label>
                                </ItemTemplate>                             


                                <FooterStyle Font-Bold="True" HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                            </asp:TemplateField>




                            <%--3--%>
                            <asp:TemplateField HeaderText="Card #">
                                <ItemTemplate>
                                    <asp:Label ID="lblgvCardno" runat="server"
                                        Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "idcard")) %>'
                                        Width="100px"></asp:Label>

                                    <asp:Label ID="lblempid" runat="server" Visible="false"
                                        Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "empid")) %>'
                                        Width="100px"></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                  <%--  <asp:LinkButton ID="lTotal" runat="server" OnClick="lTotal_Click" CssClass="btn btn-primary btn-xs">Total</asp:LinkButton>--%>
                                </FooterTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                            </asp:TemplateField>



                            <%--4--%>
                            <asp:TemplateField HeaderText="Employee Name">

                                <ItemTemplate>
                                   <asp:Label ID="lgvempname1" runat="server"
                                        Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "empname")) %>'
                                        Width="180px" Font-Bold="True" Font-Size="11px"></asp:Label>
                                </ItemTemplate>

                                <FooterTemplate>
                                    <asp:LinkButton ID="lUpdate" runat="server" OnClick="lUpdate_Click" CssClass="btn btn-success btn-xs">Update</asp:LinkButton>
                                </FooterTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                            </asp:TemplateField>
                          
                                 <%--5--%>


                            <asp:TemplateField HeaderText="Designation">
                                <ItemTemplate>
                                      <asp:Label ID="lgvdesignation" runat="server"
                                        Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "desig")) %>'
                                        Width="180px" Font-Bold="True" Font-Size="11px"></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                               
                                </FooterTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                            </asp:TemplateField>


                                 <%--5--%>
                            <asp:TemplateField HeaderText="Month Id" Visible ="false">
                                <ItemTemplate>
                                      <asp:Label ID="lgvMonthId" runat="server"
                                        Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "monthid")) %>'
                                        Width="180px" Font-Bold="True" Font-Size="11px"></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                               
                                </FooterTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                            </asp:TemplateField>

                         


                        </Columns>
                        <FooterStyle CssClass="grvFooter" />
                        <EditRowStyle />
                        <AlternatingRowStyle />
                        <PagerStyle CssClass="gvPagination" />
                        <HeaderStyle CssClass="grvHeader" />


                    </asp:GridView>


                </div>
            </div>
            </div>     

        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
