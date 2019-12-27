<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="DanhSachLoaiSanPham.aspx.cs" Inherits="DoAnVegeFoody.admin.DanhSachLoaiSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_container" runat="server">
    <div>
        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Danh sách loại sản phẩm</h1>
        <div runat="server" id="txtResult"></div>
        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Danh sách loại sản phẩm</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Tên loại</th>
                                <th>Hình ảnh</th>
                                <th>Trạng thái</th>
                                <th>Vị trí</th>
                                <th>Người thêm</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Tên loại</th>
                                <th>Hình ảnh</th>
                                <th>Trạng thái</th>
                                <th>Vị trí</th>
                                <th>Người thêm</th>
                                <th></th>
                            </tr>

                        </tfoot>
                        <tbody>
                            <asp:Repeater ID="Repeater_Foodtype" OnItemCommand="Repeater_Foodtype_ItemCommand" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("type_name") %></td>
                                        <td>
                                            <img src="img/<%#Eval("type_img") %>" style="width: 100px; height: 100px" alt="Không có ảnh" />
                                        </td>
                                        <td><%# Eval("status") %></td>
                                        <td><%# Eval("type_pos") %></td>
                                        <td><%# Eval("username") %></td>
                                        <td>
                                            <asp:LinkButton ID="linkbtn_Sua" runat="server" CommandName="sua" CommandArgument='<%# Eval("type_id") %>'>Sửa</asp:LinkButton>
                                            <asp:LinkButton ID="linkbtn_Xoa" runat="server" CommandName="xoa" CommandArgument='<%# Eval("type_id")%>'>Xoá</asp:LinkButton>
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
