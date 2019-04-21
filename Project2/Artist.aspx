<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Artist.aspx.cs" Inherits="Artist" ClientIDMode="Static" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <h2>Artist Library</h2>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="* means that the field is required" CssClass="text-danger" />

            <asp:GridView ID="grdArtist" runat="server" SelectedIndex="0"
                            AutoGenerateColumns="False" DataKeyNames="artist_id" 
                            DataSourceID="SqlDataSource1" AllowPaging="True" 
                            CssClass="table table-bordered table-striped table-condensed" Width="923px">
                            <Columns>
                                <asp:BoundField DataField="artist_id" HeaderText="Artist ID" 
                                    ReadOnly="True" InsertVisible="False" SortExpression="artist_id">
                                </asp:BoundField>
                                <asp:BoundField DataField="fname" HeaderText="First Name" SortExpression="fname">
                                </asp:BoundField>
                                <asp:BoundField DataField="lname" HeaderText="Last Name" SortExpression="lname"> 
                                </asp:BoundField>
                                <asp:BoundField DataField="artist_type" HeaderText="Artist Type" SortExpression="artist_type"> 
                                </asp:BoundField>
                                <asp:CommandField ButtonType="Link" ShowSelectButton="true">
                                </asp:CommandField>
                            </Columns>
                            <PagerSettings Mode="NumericFirstLast" />
                            <PagerStyle CssClass="pagerStyle" 
                                BackColor="#8c8c8c" HorizontalAlign="Center" />
                            <SelectedRowStyle CssClass="warning" />
                        </asp:GridView>
            
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:diskInvConnection2 %>" SelectCommand="SELECT * FROM [artist]"></asp:SqlDataSource>
            
                <asp:DetailsView ID="dvArtist" runat="server" AutoGenerateRows="False" DataKeyNames="artist_id" DataSourceID="SqlDataSource2" Height="50px" Width="251px" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="artist_id" HeaderText="Artist ID" InsertVisible="False" ReadOnly="True" SortExpression="artist_id" />
                        <asp:BoundField DataField="fname" HeaderText="First Name" SortExpression="fname" />
                        <asp:BoundField DataField="lname" HeaderText="Last Name" SortExpression="lname" />
                        <asp:BoundField DataField="artist_type" HeaderText="Artist Type" SortExpression="artist_type" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:diskInvConnection2 %>" SelectCommand="SELECT * FROM [artist] WHERE ([artist_id] = @artist_id)" DeleteCommand="sp_ArtistDelete" DeleteCommandType="StoredProcedure" InsertCommand="sp_ArtistInsert" InsertCommandType="StoredProcedure" UpdateCommand="sp_ArtistUpdate" UpdateCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="ArtistID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ArtistFName" Type="String" />
                    <asp:Parameter Name="ArtistLName" Type="String" />
                    <asp:Parameter Name="TypeofArtist" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="grdArtist" Name="artist_id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ArtistFName" Type="String" />
                    <asp:Parameter Name="ArtistLName" Type="String" />
                    <asp:Parameter Name="ArtistID" Type="Int32" />
                </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" Runat="Server">
</asp:Content>

