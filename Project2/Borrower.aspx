

<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Borrower.aspx.cs" Inherits="Borrower" ClientIDMode="Static" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
<!-- Name            Date        Message
     Aaron Smith     4/22/19     Fixed Data view insert, update and delete-->

    <h2>Borrowers</h2>
            <!--Gridview for displaying data -->
            <asp:GridView ID="grdBorrower" runat="server" SelectedIndex="0"
                            AutoGenerateColumns="False" DataKeyNames="borrower_id" 
                            DataSourceID="SqlDataSource1" AllowPaging="True" 
                            CssClass="table table-bordered table-striped table-condensed">
                            <Columns>
                                <asp:BoundField DataField="borrower_ID" HeaderText="ID" 
                                    ReadOnly="True">
                                    <ItemStyle CssClass="col-xs-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="fName" HeaderText="First Name">
                                    <ItemStyle CssClass="col-xs-5" />
                                </asp:BoundField>
                                <asp:BoundField DataField="lName" HeaderText="Last Name"> 
                                    <ItemStyle CssClass="col-xs-3" />
                                </asp:BoundField>
                                <asp:BoundField DataField="phoneNumber" HeaderText="Phone Number"> 
                                    <ItemStyle CssClass="col-xs-4" />
                                </asp:BoundField>
                                <asp:CommandField ButtonType="Link" ShowSelectButton="true"> 
                                    <ItemStyle CssClass="col-xs-1" />
                                </asp:CommandField>
                            </Columns>
                            <PagerSettings Mode="NumericFirstLast" />
                            <PagerStyle CssClass="pagerStyle" 
                                BackColor="#8c8c8c" HorizontalAlign="Center" />
                            <SelectedRowStyle CssClass="warning" />
                        </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:diskInvConnection2 %>" SelectCommand="SELECT * FROM [borrower]"></asp:SqlDataSource>
            <!--Details view for editing data -->
                <asp:DetailsView ID="dvDisk" runat="server" AutoGenerateRows="False" DataKeyNames="borrower_id" DataSourceID="SqlDataSource2" Height="50px" Width="251px" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="borrower_id" HeaderText="borrower_id" InsertVisible="False" ReadOnly="True" SortExpression="borrower_id" />
                        <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
                        <asp:BoundField DataField="lname" HeaderText="lname" SortExpression="lname" />
                        <asp:BoundField DataField="phoneNumber" HeaderText="phoneNumber" SortExpression="phoneNumber" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:diskInvConnection2 %>" SelectCommand="SELECT * FROM [borrower] WHERE ([borrower_id] = @borrower_id)" DeleteCommand="EXEC sp_borrowerdelete @borrower_id" InsertCommand="EXEC sp_borrowerinsert @fname, @lname, @phoneNumber" UpdateCommand="EXEC sp_borrowerUpdate @borrower_id, @fname, @lname, @phoneNumber ">
        <DeleteParameters>
            <asp:Parameter Name="borrower_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="fname" Type="String" />
            <asp:Parameter Name="lname" Type="String" />
            <asp:Parameter Name="phoneNumber" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="grdBorrower" Name="borrower_id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="borrower_id" Type="Int32" />
            <asp:Parameter Name="fname" Type="String" />
            <asp:Parameter Name="lname" Type="String" />
            <asp:Parameter Name="phoneNumber" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" Runat="Server">
</asp:Content>

