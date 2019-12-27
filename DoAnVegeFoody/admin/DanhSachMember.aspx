<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="DanhSachMember.aspx.cs" Inherits="DoAnVegeFoody.admin.DanhSachMember" %>

<asp:Content ID="Content1" ContentPlaceHolderID="css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_container" runat="server">
    <div>
        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Danh sách thành viên</h1>
        <div  runat="server" id="txtResult"></div>
        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Danh sách thành viên</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Tài khoản</th>
                                <th>Tên thành viên</th>
                                <th>Số điện thoại</th>
                                <th>Email</th>
                                <th>Quyền</th>
                                <th>Trạng thái</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Tài khoản</th>
                                <th>Tên thành viên</th>
                                <th>Số điện thoại</th>
                                <th>Email</th>
                                <th>Quyền</th>
                                <th>Trạng thái</th>
                                <th></th>
                            </tr>

                        </tfoot>
                        <tbody>
                            <asp:Repeater ID="Repeater_Member" OnItemCommand="Repeater_Member_ItemCommand" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("username") %></td>
                                        <td><%# Eval("name") %></td>
                                        <td><%# Eval("phone") %></td>
                                        <td><%# Eval("email") %></td>
                                        <td><%# Eval("role") %></td>
                                        <td><%# Eval("status") %></td>
                                        <td>
                                            <asp:LinkButton ID="linkbtn_Sua" runat="server" CommandName="sua" CommandArgument='<%# Eval("id") %>'>Sửa</asp:LinkButton>
                                            <asp:LinkButton ID="linkbtn_Xoa" runat="server" CommandName="xoa" CommandArgument='<%# Eval("id") %>'>Xoá</asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
