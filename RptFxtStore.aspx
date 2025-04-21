<%@ Page Title="" Language="C#" MasterPageFile="~/ASITNEW.Master" AutoEventWireup="true" CodeBehind="RptFxtStore.aspx.cs" Inherits="RealERPWEB.F_29_Fxt.RptFxtStore" %>

<%@ Register Assembly="DropCheck" Namespace="xMilk" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc11" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">




     <script type="text/javascript">
         $(document).ready(function () {
             //For navigating using left and right arrow of the keyboard
             Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(pageLoaded);
            

        });
      function pageLoaded() {

          $("input, select").bind("keydown", function (event) {
              var k1 = new KeyPress();
              k1.textBoxHandler(event);
          });
          var gvCenStorewlsd = $('#<%=this.gvCenStorewlsd.ClientID %>');
          var gvMatSAbasis = $('#<%=this.gvMatSAbasis.ClientID %>');

          gvCenStorewlsd.Scrollable();
          gvMatSAbasis.Scrollable();

         };

         function Openmrrqty() {

             $('#mrrstatus').modal('toggle');
         }
         function ClosePOamt() {
             $('#mrrstatus').modal('hide');
         }

     </script>

        <style>

         body {    
             font-family: "Garamond" !important;

        }

        .grvContentarea {}

        .btn-blue {
            background-color: #007bff;
            color: white;
            border: 1px solid #007bff;
        }
    </style>

     <style>   

/*
        
        .multiselect {
            width: 270px !important;
            text-wrap: initial !important;
            border: 1px solid;
            height: 29px;
            border-color: #cfd1d4;
            font-family: sans-serif;
        }

        .caret {
            display: none !important;
        }

        .multiselect-text {
            width: 200px !important;
        }

        .multiselect-container {
            width: 300px !important;
            overflow-y: scroll !important;
        }

        span.multiselect-selected-text {
            width: 200px !important;
        }
*/


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




</asp:Content>
 

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

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

      <div class="card card-fluid mb-0 mt-0">
        <div class="card-body">
            <div class="row">


                   <div class="col-md-3" runat="server" visible="false">
                    <div class="form-group" runat="server" visible="false">
                         <asp:Label ID="lblProjectname" CssClass="lblTxt lblName" runat="server" Text="Store"></asp:Label>
                                        <asp:TextBox ID="txtSearch" runat="server" CssClass=" inputtextbox"></asp:TextBox>
                                        <asp:LinkButton ID="ImgbtnFindProj" runat="server" CssClass="btn btn-primary srearchBtn" OnClick="ImgbtnFindProj_Click" TabIndex="12"><span class="glyphicon glyphicon-search asitGlyp"> </span></asp:LinkButton>


                         <asp:Label ID="Label3" CssClass="lblTxt lblName" runat="server" Text="Branch Name"></asp:Label>
                                        <asp:TextBox ID="txtseachbranch" runat="server" CssClass=" inputtextbox"></asp:TextBox>
                                        <asp:LinkButton ID="ImgbtnFindBrach" runat="server" CssClass="btn btn-primary srearchBtn" OnClick="ImgbtnFindBrach_Click" TabIndex="12"><span class="glyphicon glyphicon-search asitGlyp"> </span></asp:LinkButton>


                        </div>
                          </div>



                   <div class="col-lg-3 col-md-3 col-sm-4">
                    <div class="form-group">
                        <asp:Label ID="Label2" runat="server" CssClass="control-label" Text="Store" Visible="true"></asp:Label>                     
                        <asp:DropDownList ID="ddlAccProject" runat="server" CssClass="form-control chzn-select" OnSelectedIndexChanged="ddlAccProject_SelectedIndexChanged" TabIndex="18" AutoPostBack="True" Visible="true"></asp:DropDownList>
                    </div>
                </div>

                  <div class="col-lg-2 col-md-5 col-sm-4 ml-2">
                  <div class="form-group">
                        <asp:Label ID="Label4" runat="server" CssClass="control-label" Text="Branch Name" Visible="true"></asp:Label>                     
                        <%--   <cc1:DropCheck ID="DropCheck1" runat="server" TabIndex="8" TransitionalMode="True"  >
                           </cc1:DropCheck>--%>
                            <asp:ListBox ID="ddldropcheck" runat="server" CssClass="form-control form-control-sm" SelectionMode="Multiple"></asp:ListBox>
                    </div>
                </div>

                <div class="custom-col d-flex " style="width: 120px;">
                <div class="form-group">
                        <asp:Label ID="lblFromDate" runat="server" CssClass="control-label" Text="From Date"></asp:Label>
                        <asp:TextBox ID="txtDatefrom" runat="server" AutoCompleteType="Disabled" CssClass="form-control inputDateBox"></asp:TextBox>
                        <cc1:CalendarExtender ID="CalenderExtenderFromDate" runat="server" Enabled="true" Format="dd-MMM-yyyy" TargetControlID="txtDatefrom"></cc1:CalendarExtender>

                    </div>
                </div>




                <div class="custom-col d-flex " style="width: 120px;">
                    <div class="form-group">
                        <asp:Label ID="lblToDate" runat="server" CssClass="control-label" Text="To Date"></asp:Label>

                        <asp:TextBox ID="txtDateto" runat="server" AutoCompleteType="Disabled" CssClass="form-control inputDateBox"></asp:TextBox>
                        <cc1:CalendarExtender ID="CalenderExtenderToDate" runat="server"
                            Enabled="True" Format="dd-MMM-yyyy" TargetControlID="txtDateto"></cc1:CalendarExtender>
                    </div>
                </div>



                <div class="col-lg-1 col-md-6 col-sm-4">
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" CssClass="control-label" Text="Page" Visible="true"></asp:Label>
                        <asp:DropDownList ID="ddlpagesize" runat="server" AutoPostBack="True" CssClass="form-control chzn-select"  OnSelectedIndexChanged="ddlpagesize_SelectedIndexChanged" TabIndex="10" Visible="true">
                            <asp:ListItem Value="10">10</asp:ListItem>
                            <asp:ListItem Value="15">15</asp:ListItem>
                            <asp:ListItem Value="20">20</asp:ListItem>
                            <asp:ListItem Value="30">30</asp:ListItem>
                            <asp:ListItem Value="50">50</asp:ListItem>
                            <asp:ListItem Value="100">100</asp:ListItem>
                            <asp:ListItem Value="150">150</asp:ListItem>
                            <asp:ListItem Value="200">200</asp:ListItem>
                            <asp:ListItem Value="300">300</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>



                  <div class="col-lg-1 col-md-3 col-sm-4">                                    
                  <asp:CheckBox id="checkaccbased" runat="server" class="form-check-input ml-2 mt-4"  AutoPostBack="true" Text="&nbsp&nbsp Account Wise" />
                </div>


             
                <div class="col-lg-1 col-md-3 col-sm-4">
                      <div class="form-group">
                           <asp:LinkButton ID="lbtnOk" runat="server" CssClass="btn btn-blue okBtn btn-sm mt-4" OnClick="lbtnOk_Click">Ok</asp:LinkButton>
                      </div>
                </div>

                      <div class="col-lg-1 col-md-6 col-sm-4" runat="server" visible="false">
                    <div class="form-group">
                          <asp:Label ID="Label8" runat="server" CssClass="lblName lblTxt" Text="Bill No:" Visible="false"></asp:Label>
                          <asp:Label ID="lblBillNo" runat="server" CssClass="inputtextbox" Visible="false" ></asp:Label>
                    </div>
                </div>



            </div>

         

      <%--    grid--%>
              <asp:MultiView ID="MultiView1" runat="server" >
                        <asp:View ID="ViewMStorewlsd" runat="server">
                            <div  class="row table-responsive">
                            <asp:GridView ID="gvCenStorewlsd" runat="server" AllowPaging="True"
                                AutoGenerateColumns="False" CssClass=" table-striped table-hover table-bordered grvContentarea"
                                OnPageIndexChanging="gvCenStorewlsd_PageIndexChanging" ShowFooter="True" OnRowDataBound="gvCenStorewlsd_RowDataBound"
                                Width="628px">
                                <RowStyle />
                                <Columns>
                                    <asp:TemplateField HeaderText="Sl.">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvSlNo1" runat="server" Style="text-align: right"
                                                Text='<%# Convert.ToString(Container.DataItemIndex+1)+"." %>' Width="30px"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="pactcode" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvPactcode" runat="server"
                                                Text='<%# DataBinder.Eval(Container.DataItem, "pactcode").ToString() %>'
                                                Width="80px" Font-Bold="true"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="center" VerticalAlign="top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Store Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvProjectNameqb" runat="server"
                                                Text='<%# DataBinder.Eval(Container.DataItem, "pactdesc").ToString() %>'
                                                Width="180px" Font-Bold="true"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="center" VerticalAlign="top" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="rsircode" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvrsircode" runat="server"
                                                Text='<%# DataBinder.Eval(Container.DataItem, "rsircode").ToString() %>'
                                                Width="80px" Font-Bold="true"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="center" VerticalAlign="top" />
                                    </asp:TemplateField>
                                    

                                    <asp:TemplateField HeaderText="Materials Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvMatdescryptionlsd" runat="server"
                                                Text='<%# "<B>" + Convert.ToString(DataBinder.Eval(Container.DataItem, "rsirdesc")) + "</B>" +
                                                                         (DataBinder.Eval(Container.DataItem, "spcfdesc").ToString().Trim().Length>0 ? 
                                                                         (Convert.ToString(DataBinder.Eval(Container.DataItem, "rsirdesc")).Trim().Length>0 ? "<br>" : "") + 
                                                                         "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + 
                                                                         Convert.ToString(DataBinder.Eval(Container.DataItem, "spcfdesc")).Trim(): "")   %>'
                                                Width="180px">
                                                    
                                                    
                                            </asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Unit">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvUnitlsd" runat="server"
                                                Text='<%# DataBinder.Eval(Container.DataItem, "rsirunit").ToString() %>'
                                                Width="30px"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="center" VerticalAlign="top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Opening">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvOpQtylsd" runat="server"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "opnqty")).ToString("#,##0.00;(#,##0.00); ") %>'
                                                Width="70px"></asp:Label>
                                        </ItemTemplate>
                                        <FooterStyle HorizontalAlign="Right" />
                                        <ItemStyle HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="center" VerticalAlign="top" />
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Purchase">
                                        <ItemTemplate>
                                       <asp:LinkButton ID="lblgvReQtylsd" runat="server" Height="16px" Style="text-align: right" OnClick="Purchaseqty_Click"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "recqty")).ToString("#,##0.00;(#,##0.00); ") %>'
                                                Width="70px" />

                                         <%--   <asp:Label ID="lblgvReQtylsd" runat="server"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "recqty")).ToString("#,##0.00;(#,##0.00); ") %>'
                                                Width="70px"></asp:Label>--%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="center" VerticalAlign="top" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Transfer In">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvTrninqty" runat="server"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "tinqty")).ToString("#,##0.00;(#,##0.00); ") %>'
                                                Width="70px"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="center" VerticalAlign="top" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Issue">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvissueqty" runat="server"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "issueqty")).ToString("#,##0.00;(#,##0.00); ") %>'
                                                Width="70px"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="center" VerticalAlign="top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Transfer Out">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvTrnoutqty" runat="server"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "toutqty")).ToString("#,##0.00;(#,##0.00); ") %>'
                                                Width="70px"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="center" VerticalAlign="top" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Lost ">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvlostqty" runat="server"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "lqty")).ToString("#,##0.00;(#,##0.00); ") %>'
                                                Width="70px"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="center" VerticalAlign="top" />
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Sold ">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvsoldqty" runat="server"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "sqty")).ToString("#,##0.00;(#,##0.00); ") %>'
                                                Width="70px"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="center" VerticalAlign="top" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Destroyed ">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvdesqty" runat="server"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "dqty")).ToString("#,##0.00;(#,##0.00); ") %>'
                                                Width="70px"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="center" VerticalAlign="top" />
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Closing Balance">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvStQty0" runat="server"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "stkqty")).ToString("#,##0.00;(#,##0.00); ") %>'
                                                Width="70px"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="center" VerticalAlign="top" />
                                    </asp:TemplateField>

                                </Columns>
                                <FooterStyle CssClass="grvFooterNew" />
                                <EditRowStyle />
                                <AlternatingRowStyle />
                                <PagerStyle CssClass="gvPagination" />
                                <HeaderStyle CssClass="grvHeaderNew" />
                            </asp:GridView>
                                </div>
                        </asp:View>
                        <asp:View ID="ViewStkAmount" runat="server">
                            <div class="row table-responsive">
                            <asp:GridView ID="gvMatSAbasis" runat="server" AllowPaging="True"
                                AutoGenerateColumns="False"
                                CssClass="  table-responsive table-striped table-hover table-bordered grvContentarea"
                                OnPageIndexChanging="gvMatSAbasis_PageIndexChanging" ShowFooter="True" OnRowDataBound="gvMatSAbasis_RowDataBound"
                                Width="628px">
                                <RowStyle />
                                <Columns>
                                    <asp:TemplateField HeaderText="Sl.">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvSlNo2" runat="server" Style="text-align: right"
                                                Text='<%# Convert.ToString(Container.DataItemIndex+1)+"." %>' Width="30px"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Store Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvProjectNameab" runat="server"
                                                Text='<%# DataBinder.Eval(Container.DataItem, "pactdesc").ToString() %>'
                                                Width="180px" Font-Bold="true"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="center" VerticalAlign="top" />
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Materials Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvMatdescryptionab" runat="server"
                                                Text='<%# "<B>" + Convert.ToString(DataBinder.Eval(Container.DataItem, "rsirdesc")) + "</B>" +
                                                                         (DataBinder.Eval(Container.DataItem, "spcfdesc").ToString().Trim().Length>0 ? 
                                                                         (Convert.ToString(DataBinder.Eval(Container.DataItem, "rsirdesc")).Trim().Length>0 ? "<br>" : "") + 
                                                                         "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + 
                                                                         Convert.ToString(DataBinder.Eval(Container.DataItem, "spcfdesc")).Trim(): "")   %>'
                                                Width="180px">
                                                    
                                                    
                                            </asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Unit">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvUnitab" runat="server"
                                                Text='<%# DataBinder.Eval(Container.DataItem, "rsirunit").ToString() %>'
                                                Width="30px"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="center" VerticalAlign="top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Opening">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvOpnamab" runat="server"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "opnam")).ToString("#,##0;(#,##0); ") %>'
                                                Width="70px"></asp:Label>
                                        </ItemTemplate>

                                        <FooterTemplate>
                                            <asp:Label ID="lgvFOpnAmtab" runat="server" Font-Bold="True" Font-Size="12px"
                                                ForeColor="black" Width="70px"></asp:Label>
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" />
                                        <ItemStyle HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="center" VerticalAlign="top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Purchase">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvpuramab" runat="server"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "recam")).ToString("#,##0;(#,##0); ") %>'
                                                Width="70px"></asp:Label>
                                        </ItemTemplate>

                                        <FooterTemplate>
                                            <asp:Label ID="lgvFpuramab" runat="server" Font-Bold="True" Font-Size="12px"
                                                ForeColor="black" Width="70px"></asp:Label>
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" />

                                        <ItemStyle HorizontalAlign="Right" />

                                        <HeaderStyle HorizontalAlign="center" VerticalAlign="top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Transfer In">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvtinamab" runat="server"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "tinam")).ToString("#,##0;(#,##0); ") %>'
                                                Width="70px"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lgvFtinamab" runat="server" Font-Bold="True" Font-Size="12px"
                                                ForeColor="black" Width="70px"></asp:Label>
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" />

                                        <ItemStyle HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="center" VerticalAlign="top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Issue">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvissueamab" runat="server"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "issueam")).ToString("#,##0;(#,##0); ") %>'
                                                Width="70px"></asp:Label>
                                        </ItemTemplate>

                                        <FooterTemplate>
                                            <asp:Label ID="lgvFissueamab" runat="server" Font-Bold="True" Font-Size="12px"
                                                ForeColor="black" Width="70px"></asp:Label>
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" />

                                        <ItemStyle HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="center" VerticalAlign="top" />
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Transfer Out">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvtrnoutam" runat="server"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "toutam")).ToString("#,##0;(#,##0); ") %>'
                                                Width="70px"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lgvFtrnoutam" runat="server" Font-Bold="True" Font-Size="12px"
                                                ForeColor="black" Width="70px"></asp:Label>
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" />
                                        <ItemStyle HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="center" VerticalAlign="top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Lost ">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvlostam" runat="server"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "lam")).ToString("#,##0;(#,##0); ") %>'
                                                Width="70px"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lgvFlostam" runat="server" Font-Bold="True" Font-Size="12px"
                                                ForeColor="black" Width="70px"></asp:Label>
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" />


                                        <ItemStyle HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="center" VerticalAlign="top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sold ">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvsoldam" runat="server"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "sam")).ToString("#,##0;(#,##0); ") %>'
                                                Width="70px"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lgvFsoldam" runat="server" Font-Bold="True" Font-Size="12px"
                                                ForeColor="black" Width="70px"></asp:Label>
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" />


                                        <ItemStyle HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="center" VerticalAlign="top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Destroyed ">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvdesam" runat="server"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "dam")).ToString("#,##0;(#,##0.00); ") %>'
                                                Width="70px"></asp:Label>
                                        </ItemTemplate>

                                        <FooterTemplate>
                                            <asp:Label ID="lgvFdesam" runat="server" Font-Bold="True" Font-Size="12px"
                                                ForeColor="black" Width="70px"></asp:Label>
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" />


                                        <ItemStyle HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="center" VerticalAlign="top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Closing Balance">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvstkamab" runat="server"
                                                Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "stkam")).ToString("#,##0;(#,##0); ") %>'
                                                Width="70px"></asp:Label>
                                        </ItemTemplate>

                                        <FooterTemplate>
                                            <asp:Label ID="lgvFstkamab" runat="server" Font-Bold="True" Font-Size="12px"
                                                ForeColor="black" Width="70px"></asp:Label>
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" />
                                        <ItemStyle HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="center" VerticalAlign="top" />
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle CssClass="grvFooterNew" />
                                <EditRowStyle />
                                <AlternatingRowStyle />
                                <PagerStyle CssClass="gvPagination" />
                                <HeaderStyle CssClass="grvHeaderNew" />
                            </asp:GridView>
                            </div>
                        </asp:View>
                    </asp:MultiView>


            
        </div>
    </div>
         
            
            <div class="modal fade" id="mrrstatus" data-bs-backdrop="static"  data-bs-keyboard="false" tabindex="-1" aria-labelledby="mstatus" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                   <div class="modal-content">
                      
                           <div class="modal-header">
                            <h4 class="modal-title">
                                <button type="button" class="btn btn-xs pull-right" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i></button>
                                <i class="fa fa-hand-point-right"></i>Purchase Quantity Details Info </h4>                         
                            
                        </div>  
                         
                                <div class="modal-body">                                
                                    <asp:GridView ID="gvqtydetails" runat="server" AutoGenerateColumns="False" CssClass=" table-striped table-hover table-bordered grvContentarea" ShowFooter="True">
                                        <PagerSettings Position="Top" />
                                        <RowStyle />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Sl#">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblgvSlNopo" runat="server" Font-Bold="True" Height="16px"
                                                        Style="text-align: center"
                                                        Text='<%# Convert.ToString(Container.DataItemIndex+1)+"." %>' Width="20px"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>

                                              <asp:TemplateField HeaderText="Group">
                                                <ItemTemplate>                                              
                                                    <asp:Label ID="lgvgrpdesc" runat="server" Height="16px" Style="text-align: left"
                                                        Text='<%# "<B>" + Convert.ToString(DataBinder.Eval(Container.DataItem, "grpdesc"))+ "</B>" %>'
                                                        Width="70px"></asp:Label>
                                                </ItemTemplate>                                                 
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField> 

                                            <asp:TemplateField HeaderText="Mrr No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lgvpono" runat="server" Height="16px" Style="text-align: left"
                                                        Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "mrrno1")) %>'
                                                        Width="70px"></asp:Label>
                                                </ItemTemplate>                                                 
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>                                            
                                            <asp:TemplateField HeaderText="Mrr Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lgvmrrdate" runat="server" Height="16px" Style="text-align: left"
                                                                Text='<%# (Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "mrrdat")).Year==1900? "" :
                                                            Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "mrrdat")).ToString("dd-MMM-yyyy")) %>'
                                                     
                                                        Width="70px"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bill No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lgvbillno" runat="server" Height="16px" Style="text-align: left"
                                                        Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "billno1")) %>'
                                                        Width="70px"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="bill Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lgvporate" runat="server" Height="16px" Style="text-align: left"
                                                        Text='<%# (Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "billdat")).Year==1900? "" :
                                                            Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "billdat")).ToString("dd-MMM-yyyy")) %>'
                                                       
                                                        Width="70px"></asp:Label>
                                                </ItemTemplate>
                                               
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Matrials Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lgvponame" runat="server" Height="16px" Style="text-align: left"
                                                        Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "rsirdesc")) %>'
                                                        Width="120px"></asp:Label>
                                                </ItemTemplate>                                                 
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>                                            
                                            <asp:TemplateField HeaderText="Specification">
                                                <ItemTemplate>
                                                    <asp:Label ID="lgvspecific" runat="server" Height="16px" Style="text-align: left"
                                                        Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "spcfdesc")) %>'
                                                        Width="90px"></asp:Label>
                                                </ItemTemplate>
                                                   <FooterTemplate>
                                                   <asp:Label ID="fgvordtotal" runat="server" Font-Bold="True"
                                                Font-Size="12px" ForeColor="Black" Style="text-align: right">Total :</asp:Label>
                                                  </FooterTemplate>
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            
                                            <asp:TemplateField HeaderText="Qty">
                                                <ItemTemplate>
                                                    <asp:Label ID="lgvmrrqty" runat="server" Height="16px" Style="text-align: right"
                                                        Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "mrrqty")).ToString("#,##0.00;(#,##0.00); ") %>'
                                                        Width="60px"></asp:Label>
                                                </ItemTemplate>
                                                   <FooterTemplate>
                                                  <asp:Label ID="lgvFmrrqty" runat="server" Font-Bold="True"
                                                Font-Size="12px" ForeColor="Black" Style="text-align: right"></asp:Label>
                                                  </FooterTemplate>
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>


                                            <asp:TemplateField HeaderText="Voucher No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lgvpoamt" runat="server" Height="16px" Style="text-align: left"
                                                        Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "vounum1")) %>'
                                                        Width="65px"></asp:Label>
                                                </ItemTemplate>
                                               
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>

                                                  <asp:TemplateField HeaderText="Voucher Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lgvpoamt" runat="server" Height="16px" Style="text-align: left"
                                  
                                                     Text='<%# (Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "voudat")).Year==1900? "" :Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "voudat")).ToString("dd-MMM-yyyy")) %>'
                                                        Width="70px"></asp:Label>
                                                </ItemTemplate>
                                              
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            
                                             

                                        </Columns>
                                        <FooterStyle CssClass="grvFooter" HorizontalAlign="Right" />
                                        <EditRowStyle />
                                        <AlternatingRowStyle />
                                        <PagerStyle CssClass="gvPagination" />
                                        <HeaderStyle CssClass="grvHeader" />
                                    </asp:GridView>                                                                                                  
                        </div>
                        <div class="modal-footer">
                             <button class="btn btn-primary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>









        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


