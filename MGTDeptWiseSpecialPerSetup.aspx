<%@ Page Title="" Language="C#" MasterPageFile="~/ASITNEW.Master" AutoEventWireup="true" CodeBehind="MGTDeptWiseSpecialPerSetup.aspx.cs" Inherits="RealERPWEB.F_81_Hrm.F_92_Mgt.MGTDeptWiseSpecialPerSetup" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<style>
		.dropdown-toggle {
			white-space: nowrap;
			text-overflow: ellipsis;
			overflow: hidden;
		}

		.btn-group, .btn-group-vertical {
			position: relative;
			display: flex;
			vertical-align: middle;
		}

		.overflow-hidden {
			overflow-y: auto;
		}

		.multiselect {
			width: 100% !important;
			border: 1px solid;
			height: 29px;
			line-height: 17px;
			border-color: #cfd1d4;
		}

		.multiselect-container {
			overflow: scroll;
			max-height: 300px !important;
		}

		.caret {
			display: none !important;
		}

		.chzn-single {
			border-radius: 3px !important;
			height: 29px !important;
		}

		.chzn-container-single .chzn-single {
			height: 35px;
			line-height: 30px;
		}

		.chzn-container-single .chzn-drop {
			width: 100% !important;
		}

		.chzn-container {
			width: 100% !important;
		}
	</style>
	<script type="text/javascript" language="javascript">
		$(document).ready(function () {
			$('.chzn-select').chosen({ search_contains: true });

		});


	</script>



	<style>
		.card-header {
			border-radius: 0.5rem;
			box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
		}

		.badge {
			font-size: 1.2rem;
			text-transform: uppercase;
			letter-spacing: 1px;
			margin: 0 5px; /* Space between badges */
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
			<div class="card-fluid container-data  mt-2">


				<asp:Panel runat="server" ID="pnlLeave">
					<div class="row">
						<div class="col-12 col-lg-12 col-xl-4">
							<section class="card card-fluid" style="height: 650px">
								<!-- .card-body -->
								<div class="card">
									<div class="card">
										<header class="card-header text-white text-center py-4" ">
											<h2 class="font-weight-bold mb-0">
												<span class="badge badge-success p-2">Department Wise Special MGT Permission</span>
											</h2>
										</header>
									</div>




<div class="card-body">
    <div class="row align-items-end mb-3">
        <div class="col-md-10">
            <asp:Label ID="Label12" runat="server" CssClass="form-label">Special Permission Employee</asp:Label>
            <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="form-control form-control-sm chzn-select"></asp:DropDownList>
        </div>
        <div class="col-md-2">
            <asp:LinkButton ID="lbtnOkOrNew" runat="server" CssClass="btn btn-primary btn-sm float-right okBtn" OnClick="lbtnAdd_Click">Ok</asp:LinkButton>
        </div>
    </div>

    <div class="row align-items-end">
        <div class="col-md-10">
            <asp:Label ID="Label1" runat="server" CssClass="form-label">Department / Section Head</asp:Label>
            <asp:DropDownList ID="ddldpt" runat="server" CssClass="form-control form-control-sm chzn-select"></asp:DropDownList>
        </div>
        <div class="col-md-2">
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-primary btn-sm float-right okBtn" OnClick="lbtnAdd_Click">Add</asp:LinkButton>
        </div>
    </div>
</div>

							</section>
						</div>
						<div class="col-12 col-lg-12 col-xl-8">
							<section class="card card-fluid mb-0" style="height: 650px; flex-grow: 1; overflow: auto;">
								<!-- .card-body -->
								<header class="card-header">Details</header>

								<div class="card-body card card-fluid mb-0">
									<div class="row" style="height: 180px; flex-grow: 1; overflow: auto;">
										<asp:GridView ID="gvPermissionList" runat="server" CssClass="table-striped table-hover table-bordered grvContentarea"
											AutoGenerateColumns="False" ShowFooter="True"
										>
											<PagerSettings Visible="False" />
											<RowStyle />
											<Columns>
												<asp:TemplateField HeaderText="SL">
													<ItemTemplate>
														<asp:Label ID="lblgvSlNo0" runat="server"
															Style="text-align: right"
															Text='<%# Convert.ToString(Container.DataItemIndex+1)+"." %>' Width="35px"></asp:Label>
													</ItemTemplate>
												</asp:TemplateField>
												<asp:CommandField ShowDeleteButton="True" DeleteText='<i class="fa fa-trash "></i>' />											

												<asp:TemplateField HeaderText="Employee ID" Visible="true">
													<ItemTemplate>
															<asp:Label ID="lblempid" runat="server"
															Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "empid")) %>'
															Width="100px"></asp:Label>
													</ItemTemplate>
													<FooterTemplate>
														<asp:LinkButton ID="lbtnDeleteAll" runat="server" Font-Bold="True"
															Font-Size="13px" Height="16px" OnClick="lbtnDeleteAll_Click"
															Width="100px">Delete All</asp:LinkButton>
													</FooterTemplate>
													<ItemStyle HorizontalAlign="Right" />

												</asp:TemplateField>


												<asp:TemplateField HeaderText="Employee Name">

													<ItemTemplate>
														<asp:Label ID="lblempname" runat="server"
															Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "empname")) %>'
															Width="100px"></asp:Label>
													</ItemTemplate>



													<FooterTemplate>
														<asp:LinkButton ID="lbtnUpdate" runat="server" Font-Bold="True"
															Font-Size="13px" OnClick="lbtnUpdate_Click"
															Style="text-align: center; height: 15px;" Width="150px">Final Update</asp:LinkButton>
													</FooterTemplate>
													<FooterStyle HorizontalAlign="Left" />
													<HeaderStyle HorizontalAlign="Left" />
												</asp:TemplateField>

												<asp:TemplateField HeaderText="Department">
													<ItemTemplate>
														<asp:Label ID="lblgvSuplDesc2" runat="server"
															Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "actdesc")) %>'
															Width="150px"></asp:Label>
													</ItemTemplate>


													<FooterStyle HorizontalAlign="left" />
													<HeaderStyle HorizontalAlign="Left" />
												</asp:TemplateField>
											</Columns>
											<EditRowStyle />
											<AlternatingRowStyle />
										</asp:GridView>
									</div>

								</div>
							</section>
						</div>
					</div>
				</asp:Panel>

			</div>


			<script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
				type="text/javascript"></script>
		</ContentTemplate>
	</asp:UpdatePanel>
</asp:Content>
