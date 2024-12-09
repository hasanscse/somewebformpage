<%@ Page Title="" Language="C#" MasterPageFile="~/ASITNEW.Master" AutoEventWireup="true" CodeBehind="EmployeesBirthday.aspx.cs" Inherits="RealERPWEB.F_81_Hrm.F_83_Att.EmployeesBirthday" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">   

    
    <style>
        /* Title Styling */
        .title {
            font-size: 2rem;
            font-weight: bold;
            text-align: center;
            color: #333;
            margin-top: 20px;
        }

        /* Centering the Title */
        .name-wrapper {
            position: absolute;
            top: 30%;
            left: 50%;
            transform: translateX(-50%);
            z-index: 10;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <!-- Include jQuery --> 
    <link href="../../Content/Datatablecs/datatables.min.css" rel="stylesheet" />
    <script src="../../Scripts/datatablejs/datatables.min.js"></script> 
<script src="../../Scripts/datatablejs/dataTables.buttons.min.js.js"></script>
<script src="../../Scripts/datatablejs/jszip.min.js"></script>
<script src="../../Scripts/datatablejs/pdfmake.min.js"></script>
<script src="../../Scripts/datatablejs/vfs_fonts.js"></script>
<script src="../../Scripts/datatablejs/buttons.print.min.js"></script>







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
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            background-color: #007BFF;
            color: white;
            padding: 20px 0;
            text-align: center;
        }

            header h2 {
                margin: 0;
                font-size: 2em;
            }

        .container {
            width: 90%;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        td {
            background-color: #f9f9f9;
        }

        tr:nth-child(even) td {
            background-color: #f1f1f1;
        }

        Responsive design
        @media screen and (max-width: 768px) {
            th, td

        {
            font-size: 14px;
            padding: 8px;
        }

        }

        .dataTables_wrapper {
            padding: 20px;
        }
    </style>
    <style>
        .dt-buttons {
            float: right;
            margin-bottom: 10px;
        }
    </style>

       <script type="text/javascript" language="javascript">         

           $(document).ready(function () {

               funtionInitialize();
               Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(pageLoaded);


           });
           function pageLoaded() {

               funtionInitialize();

           }
           function funtionInitialize() {

               if ($.fn.DataTable.isDataTable('#birthdayemployeelist')) {
                   $('#birthdayemployeelist').DataTable().destroy();
               }
               $('#birthdayemployeelist').DataTable({
                 
                   paging: true,           // Enable pagination
                   searching: true,        // Enable search functionality
                   ordering: true,         // Enable column sorting
                   info: true,             // Show table information
                   responsive: true,       // Make the table responsive                  
                   pageLength: 5,
                   lengthMenu: [
                       [5, 50, 100, 500, 1500, 3000],
                       ['5', '50', '100', '500', '1500', '3000']
                   ],
                   language: {
                       sLengthMenu: 'Show: _MENU_ entries', // Change "Entries per page" text
                       sInfo: 'Showing _START_ to _END_ of _TOTAL_ entries',
                       sInfoEmpty: 'Showing 0 to 0 of 0 entries',
                       sInfoFiltered: '(filtered from _MAX_ total entries)'
                   },
                  
                   dom: '<"row"<"col-md-6"l><"col-md-6"B>>frtip',  // Define where buttons will be located
                   buttons: [
                       {
                           extend: 'print',
                           text: '<i class="fa fa-print"></i> Print',
                           className: 'btn btn-primary btn-sm',
                           title: 'Employees Birthday List',
                           customize: function (win) {
                               $(win.document.body).css('font-size', '12px');
                           }
                       }
                   ]
               });
           }

       </script>


 
 <script type="text/javascript">       
     document.getElementById("lblTitle").style.color = "black";
</script>

    <contenttemplate>
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
            <div class="card-header">
                <div class="row">     
                    <div class="spinner-container">
                    <div class="spinner-grow text-muted"></div>
                    <div class="spinner-grow text-primary"></div>
                    <div class="spinner-grow text-success"></div>                 
                    <div class="spinner-grow text-info"></div>
                    <div class="spinner-grow text-warning"></div>
               <p class="h5 font-weight-bold">Employees Birthday <i class="fa fa-birthday-cake" aria-hidden="true"></i> <i class="fa fa-rocket"></i>
                   </p>
                    <div class="spinner-grow text-danger"></div>
                    <div class="spinner-grow text-secondary"></div>
                    <div class="spinner-grow text-dark"></div>
                    <div class="spinner-grow text-light"></div>
                    <div class="spinner-grow text-light"></div>
</div>
                </div>

                <div class="row">

                    <div class="col-lg-2 col-md-1 col-sm-6">
                        <asp:Label ID="lbldate" runat="server">From Date</asp:Label>
                        <asp:TextBox ID="txtFromdate" runat="server" CssClass="form-control"></asp:TextBox>
                        <cc1:CalendarExtender ID="txtFromdate_CalendarExtender" runat="server" Format="dd-MMM-yyyy" TargetControlID="txtFromdate"></cc1:CalendarExtender>
                    </div>
                    <div class="col-lg-2 col-md-1 col-sm-6">
                        <asp:Label ID="lbltodate" runat="server">To Date</asp:Label>
                        <asp:TextBox ID="txttodate" runat="server" CssClass="form-control"></asp:TextBox>
                        <cc1:CalendarExtender ID="txttodate_CalendarExtender" runat="server" Format="dd-MMM-yyyy" TargetControlID="txttodate"></cc1:CalendarExtender>
                    </div>
         
                    
                    <div class="col-md-1 col-lg-1 col-xs-12">
                        <asp:LinkButton ID="lbtnOk" runat="server" OnClick="lbtnOk_Click" CssClass="btn btn-success btn-sm" Style="margin-top: 20px;">Ok</asp:LinkButton>
                    </div>                

                </div>

            </div>       
    
  
                
 <div class="container" style="margin-left: 0">
        <table id="birthdayemployeelist" class="display" style="width:100%" cellspacing="0" border-collapse: collapse; font-size: 14px;">
            <thead >
                <tr>
                    <th style="width: 3%; text-align: left;">SL</th>
                    <th style="width: 10%; text-align: left;">Id Card</th>
                    <th style="width: 20%;">Employee Name</th>
                    <th style="width: 15%;">Designation</th>
                    <th style="width: 20%;">Section</th>                 
                    <th style="width: 15%">Date of Birth</th>

                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <tr>

                            <td><%# Container.ItemIndex+1%></td>
                            <td><%# Eval("idcard") %></td>
                            <td><%# Eval("Name") %></td>
                            <td><%# Eval("designation") %></td>
                            <td><%# Eval("sectionname") %></td>                        
                           <td>
    <%# Eval("dateofbirth") != null && Convert.ToDateTime(Eval("dateofbirth")).ToString("yyyy-MM-dd HH:mm:ss") == "1900-01-01 00:00:00"? "" 
    : Convert.ToDateTime(Eval("dateofbirth")).ToString("dd-MMM-yyyy") %>
    </td>

                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>


            <script src="../../assets/js/bootstrap.bundle.min.js"></script>
    
        <script>
            const colors = ['text-muted', 'text-primary', 'text-success', 'text-info', 'text-warning', 'text-danger', 'text-secondary', 'text-dark', 'text-light'];

            const spinnerContainer = document.querySelector('.spinner-container');


            colors.forEach(color => {
                const spinner = document.createElement('div');
                spinner.classList.add('spinner-grow', color);
                spinnerContainer.appendChild(spinner);
            });

            // Optionally, add a delay to stagger animations for each spinner
            const spinners = document.querySelectorAll('.spinner-grow');
            spinners.forEach((spinner, index) => {
                spinner.style.animationDelay = `${index * 0.3}s`;
            });
            </script>




   </div>
























    </contenttemplate>
</asp:Content>
