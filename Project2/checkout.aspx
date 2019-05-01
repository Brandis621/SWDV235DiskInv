<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="Checkout" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <%--Name           Date         Log 
    Aaron Smith    4/27/19      Initial page creation--%>
    <h2>Check out a Disk</h2>

     <%--labels to direct users--%>
    
    <div class="row">
        <div class="pl-3">
            <asp:Label ID="lblBorrower" runat="server" Text="Select a borrower" AssociatedControlID="ddlBorrower"></asp:Label>
        </div>
        <div class="pl-3 ml-3 pr-5 mr-5">
            <asp:Label ID="lblDisk" runat="server" Text="Select a Disk" AssociatedControlID="ddlDisk"></asp:Label>
        </div>
        <div class="pl-4 ml-5">
            <asp:Label ID="lblDate" runat="server" Text="Select a Checkout Date" AssociatedControlID="txtDate"></asp:Label>
        </div>
    </div>
       
    <%--Controls to collect user data--%>
    <div class="row">
            <div class="pl-3">
                <asp:DropDownList ID="ddlBorrower" runat="server" DataSourceID="DropDownBorrower" DataTextField="Name" DataValueField="borrower_id"></asp:DropDownList>
            </div>
            <div class="pl-1">
                <asp:DropDownList ID="ddlDisk" runat="server" DataSourceID="DropDownDisk" DataTextField="disk_name" DataValueField="disk_id"></asp:DropDownList>
            </div>
            <div class="pl-1">
                <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>
            </div>
    </div>
    <div class="row">
        <br />
        <asp:Label ID="lblCheckOut" runat="server" Text=""></asp:Label>
    </div>
    <div class="row">
        <br />
        <div class="pl-3">
            <asp:Button ID="Button1" runat="server" CausesValidation="False" OnClick="Button1_Click" PostBackUrl="checkout.aspx" Text="Check Out" />
        </div>
    </div>
    <br />
    <br />
    
   

    <%--Show disks out on loan--%>
    <asp:Label ID='lblCheckOutList' runat="server" Text="Disks Checked Out"></asp:Label>
    

    <asp:GridView ID="gvCheckedOut" runat="server" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnLoad="gvCheckedOut_Load">
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>

    <br />

    <%--Data Sources--%>
    <asp:SqlDataSource ID="DropDownBorrower" runat="server" ConnectionString="<%$ ConnectionStrings:diskInvConnection2 %>" SelectCommand="SELECT borrower_id, 'Name'=[fName]+' '+[lName]FROM [borrower]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DropDownDisk" runat="server" ConnectionString="<%$ ConnectionStrings:diskInvConnection2 %>" SelectCommand="SELECT [disk_id], [disk_name] FROM [disk]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="CheckedOutList" runat="server" ConnectionString="<%$ ConnectionStrings:diskInvConnection2 %>" SelectCommand="select 'Name'= B.fName + ' ' + B.lName, 'Disk'= D.disk_name, 'Checkout Date'= FORMAT(DhB.borrowed_date, 'MM/dd/yyy')
        from borrower as B
        join diskhasborrower as DhB on DhB.borrower_id = B.borrower_id
        join disk as D on DhB.disk_id = D.disk_id
        where returned_date is NULL">
    </asp:SqlDataSource>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" Runat="Server">
    <p>
    <br />
</p>
</asp:Content>

