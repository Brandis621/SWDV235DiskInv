<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Disk.aspx.cs" Inherits="Disk" ClientIDMode="Static" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">

    <h2>Disk Inventory</h2>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="* means that the field is required" CssClass="text-danger" />

            <asp:GridView ID="grdDisk" runat="server" SelectedIndex="0"
                            AutoGenerateColumns="False" DataKeyNames="disk_id" 
                            DataSourceID="SqlDataSource1" AllowPaging="True" 
                            CssClass="table table-bordered table-striped table-condensed" Width="923px">
                            <Columns>
                                <asp:BoundField DataField="disk_id" HeaderText="Disk ID" 
                                    ReadOnly="True" InsertVisible="False" SortExpression="disk_id">
                                </asp:BoundField>
                                <asp:BoundField DataField="disk_name" HeaderText="Disk Name" SortExpression="disk_name">
                                </asp:BoundField>
                                <asp:BoundField DataField="release_date" HeaderText="Release Date" SortExpression="release_date"> 
                                </asp:BoundField>
                                <asp:BoundField DataField="status_id" HeaderText="Status ID" SortExpression="status_id"> 
                                </asp:BoundField>
                                <asp:BoundField DataField="genre_id" HeaderText="Genre ID" SortExpression="genre_id" />
                                <asp:BoundField DataField="disk_type_id" HeaderText="Disk Type ID" SortExpression="disk_type_id" />
                                 <asp:CommandField ButtonType="Link" ShowSelectButton="true">
                                </asp:CommandField>
                            </Columns>
                            <PagerSettings Mode="NumericFirstLast" />
                            <PagerStyle CssClass="pagerStyle" 
                                BackColor="#8c8c8c" HorizontalAlign="Center" />
                            <SelectedRowStyle CssClass="warning" />
                        </asp:GridView>
            
                <asp:DetailsView ID="dvDisk" runat="server" AutoGenerateRows="False" DataKeyNames="disk_id" DataSourceID="SqlDataSource2" Height="50px" Width="346px" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="disk_id" HeaderText="Disk ID" InsertVisible="False" ReadOnly="True" SortExpression="disk_id" />
                        <asp:BoundField DataField="disk_name" HeaderText="Disk Name" SortExpression="disk_name" />
                        <asp:BoundField DataField="release_date" HeaderText="Release Date" SortExpression="release_date" />
                        <asp:BoundField DataField="status_id" HeaderText="Status ID" SortExpression="status_id" />
                        <asp:BoundField DataField="genre_id" HeaderText="Genre ID" SortExpression="genre_id" />
                        <asp:BoundField DataField="disk_type_id" HeaderText="Disk Type ID" SortExpression="disk_type_id" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:diskInvConnection2 %>" SelectCommand="SELECT * FROM [disk]"></asp:SqlDataSource>
            
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:diskInvConnection2 %>" SelectCommand="SELECT * FROM [disk] WHERE ([disk_id] = @disk_id)" DeleteCommand="sp_DiskDelete" DeleteCommandType="StoredProcedure" InsertCommand="sp_DiskInsert" InsertCommandType="StoredProcedure" UpdateCommand="sp_DiskUpdate" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="DiskID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DiskName" Type="String" />
            <asp:Parameter Name="Release_Date" Type="DateTime" />
            <asp:Parameter Name="Status_ID" Type="Int32" />
            <asp:Parameter Name="Genre_ID" Type="Int32" />
            <asp:Parameter Name="Disk_Type_ID" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="grdDisk" Name="disk_id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="DiskID" Type="Int32" />
            <asp:Parameter Name="DiskName" Type="String" />
            <asp:Parameter Name="Release_Date" Type="DateTime" />
            <asp:Parameter Name="Status_ID" Type="Int32" />
            <asp:Parameter Name="Genre_ID" Type="Int32" />
            <asp:Parameter Name="Disk_Type_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" Runat="Server">
</asp:Content>

