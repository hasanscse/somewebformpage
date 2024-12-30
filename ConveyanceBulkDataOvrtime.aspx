<%@ Page Title="" Language="C#" MasterPageFile="~/ASITNEW.Master" AutoEventWireup="true" CodeBehind="ConveyanceBulkDataOvrtime.aspx.cs" Inherits="RealERPWEB.F_81_Hrm.F_86_All.ConveyanceBulkDataOvrtime" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     <script type="text/javascript" language="javascript">
         $(document).ready(function () {
             Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(pageLoaded);


         });
         function pageLoaded() {
             var gvConveyance = $('#<%=this.gvConveyance.ClientID %>');

             // gvConveyance.Scrollable();

             $("input, select").bind("keydown", function (event) {
                 var k1 = new KeyPress();
                 k1.textBoxHandler(event);
             });
             //  gvConveyance.Scrollable();



             $('.chzn-select').chosen({ search_contains: true });
         }


     </script>
    

         <style type="text/css">
        .margin5px {
        }
     
        .chzn-container {
            width: 100% !important;
        }

        .chzn-container-single .chzn-single {
            height: 28px !important;
            line-height: 28px !important;
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
                <div class="contentPart">
                    <div class="card-header">                       
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
                                            <asp:Label ID="Label10" runat="server" CssClass="lblTxt lblName">Section</asp:Label>
                                            <asp:DropDownList ID="ddlSection" runat="server" CssClass="form-control inputTxt chzn-select" TabIndex="6">
                                            </asp:DropDownList>


                                        </div>

                                    </div>
                                    <div class="col-lg-2 col-md-4 col-sm-4 ">
                                        <div class="form-group">
                                            <asp:Label ID="lblPage" runat="server" CssClass="lblTxt lblName">Page Size</asp:Label>
                                            <asp:DropDownList ID="ddlpagesize" runat="server" AutoPostBack="True" CssClass="form-control chzn-select" OnSelectedIndexChanged="ddlpagesize_SelectedIndexChanged">
                                                <asp:ListItem>10</asp:ListItem>
                                                <asp:ListItem>15</asp:ListItem>
                                                <asp:ListItem>20</asp:ListItem>
                                                <asp:ListItem>30</asp:ListItem>
                                                <asp:ListItem>50</asp:ListItem>
                                                <asp:ListItem>100</asp:ListItem>
                                                <asp:ListItem>150</asp:ListItem>
                                                <asp:ListItem>200</asp:ListItem>
                                                <asp:ListItem Selected="True">300</asp:ListItem>
                                                <asp:ListItem>600</asp:ListItem>
                                                <asp:ListItem>1000</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                    </div>
                                    <div class="col-lg-1 col-md-4 col-sm-4 ">
                                        <div class="form-group">
                                            <asp:Label ID="Label3" runat="server" CssClass=" smLbl">IdCard
                                          <asp:LinkButton ID="imgbtnSearchEmployee" runat="server" OnClick="imgbtnSearchEmployee_Click"><span class="fas fa-search"> </span></asp:LinkButton>
                                            </asp:Label>
                                            <asp:TextBox ID="txtSrcEmployee" runat="server" CssClass="form-control inpPixedWidth"></asp:TextBox>


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

                                <div class="row">
                                    <div class="col-lg-3 col-md-5 col-sm-6">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <asp:FileUpload ID="fileuploadExcel" runat="server" class="form-control btn" onchange="submitform();" />
                                                <span class="input-group-addon bg-primary" style="background: #069e91 !important" id="basic-addons1">
                                                    <asp:LinkButton ID="lbtnuploadExcelAdjust" runat="server" CssClass="btn" ForeColor="White" ToolTip=" Conveyance Upload" OnClick="lbtnuploadExcelAdjust_Click">
                                            <i class="fas fa-file-excel"></i>&nbsp;&nbsp;Upload</asp:LinkButton>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                        
                             </div>

                       </div>                         
                    </div>                  
                </div>
              


               <div class="card-body">   
                   

                      <asp:GridView ID="gvConveyance" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                OnPageIndexChanging="gvConveyance_PageIndexChanging" ShowFooter="True" Width="700px" CssClass="table-striped table-hover table-bordered grvContentarea"
                                Height="200px">
                                <Columns>
                                    <asp:TemplateField HeaderText="Sl">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvSlNosred" runat="server" Font-Bold="True" Height="16px" Style="text-align: center"
                                                Text='<%# Convert.ToString(Container.DataItemIndex+1)+"." %>' Width="40px"></asp:Label>
                                        </ItemTemplate>
                                     <FooterStyle CssClass="bg-primary text-white" Font-Bold="True" HorizontalAlign="Left" />
                                         <HeaderStyle CssClass="bg-primary text-white" HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Department">
                                        <ItemTemplate>
                                            <asp:Label ID="lgProNamesred" runat="server" Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "deptname")) %>'
                                                Width="140px" Font-Bold="True"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>                                     
                                        </FooterTemplate>                                        
                                        <FooterStyle CssClass="bg-primary text-white" Font-Bold="True" HorizontalAlign="Left" />
                                       <HeaderStyle CssClass="bg-success text-white" HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Section">
                                       
                                        <ItemTemplate>
                                            <asp:Label ID="lgvSectionsred" runat="server" Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "section")) %>'
                                                Width="150px"></asp:Label>
                                        </ItemTemplate>


                                         <HeaderStyle CssClass="bg-primary  text-white" HorizontalAlign="Center" VerticalAlign="Top" />
                                         <FooterStyle CssClass="bg-primary text-white" Font-Bold="True" HorizontalAlign="Left" />
                                     
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Name &amp; Designation">
                                    
                                        <ItemTemplate>
                                            <asp:Label ID="lgvndesigsred" runat="server" Text='<%#"<b>"+Convert.ToString(DataBinder.Eval(Container.DataItem, "empname"))+"</b>"+"<br>"+Convert.ToString(DataBinder.Eval(Container.DataItem, "desig")) %>'
                                                Width="160px"></asp:Label>
                                        </ItemTemplate>


                                          <FooterTemplate>
                                            <asp:LinkButton ID="lbntCalculation" runat="server" CssClass="btn btn-success primaryBtn btn-sm" OnClick="lbntCalculation_Click">Total</asp:LinkButton>
                                        </FooterTemplate>



                                        <ItemStyle HorizontalAlign="left" />
                                         <FooterStyle CssClass="bg-secondary text-white"   Font-Bold="True" HorizontalAlign="Left" />                                         
                                       <HeaderStyle CssClass="bg-primary text-white" HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Card #">
                                        <ItemTemplate>
                                            <asp:Label ID="lgvCardNosred" runat="server" Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "idcardno")) %>'
                                                Width="90px"></asp:Label>
                                        </ItemTemplate>

                                        
                                          <FooterTemplate>
                                            <asp:LinkButton ID="lbntUpdate" runat="server" CssClass="btn btn-success primaryBtn btn-sm" OnClick="lbntUpdate_Click">Update</asp:LinkButton>
                                        </FooterTemplate>

                                               <FooterStyle CssClass="bg-secondary text-white" HorizontalAlign="Center" />                                       
                                        <HeaderStyle CssClass="bg-primary text-white" HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Gross Salary">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvgross" runat="server" Style="text-align: right; border-style: none;" Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "grossal")).ToString("#,##0;(#,##0); ") %>'
                                                Width="70px"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lgvgosssalt" runat="server" Font-Bold="True" Font-Size="12px" ForeColor="#000"
                                                Style="text-align: right"></asp:Label>
                                        </FooterTemplate>

                                          <FooterStyle BackColor="#4CAF50" ForeColor="White" HorizontalAlign="Right" />                               
                                                                        
                                         <HeaderStyle CssClass="bg-primary text-white" HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:TemplateField>

                                 
                                    <asp:TemplateField HeaderText="Conveyance">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtgvconvamt" runat="server" Font-Size="11px" BackColor="Transparent" BorderColor="#660033"
                                                BorderStyle="Solid" BorderWidth="0px" Style="text-align: right"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "convamt")).ToString("#,##0;(#,##0); ") %>'
                                                Width="100px"></asp:TextBox>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lgvFreconamt" runat="server" Font-Bold="True" Font-Size="12px" ForeColor="#000"
                                                Style="text-align: right"></asp:Label>
                                        </FooterTemplate>
                                        <FooterStyle BackColor="#4CAF50" ForeColor="White" HorizontalAlign="Right" />                                      
                                      <HeaderStyle CssClass="bg-success text-white" HorizontalAlign="Center" VerticalAlign="Top" />
                                        <ItemStyle HorizontalAlign="Right" />
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
        </ContentTemplate>

    </asp:UpdatePanel>

</asp:Content>
