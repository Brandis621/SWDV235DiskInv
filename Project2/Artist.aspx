<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Artist.aspx.cs" Inherits="Artist" ClientIDMode="Static" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <!-- Name            Date        Message
     Aaron Smith     4/22/19     Fixed Data view insert, update and delete
     Aaron Smith     5/1/2019    Added validation, made gridview update when data is changed-->

    <h2>Artist Library</h2>
            <!--Gridview for displaying data -->
            <asp:GridView ID="grdArtist" runat="server" SelectedIndex="0"
                            AutoGenerateColumns="False" DataKeyNames="artist_id" 
                            DataSourceID="SqlDataSource1" AllowPaging="True" 
                            CssClass="table table-bordered table-striped table-condensed" Width="923px"
                            OnPreRender ="grdArtist_PreRender" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
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
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle CssClass="pagerStyle" 
                                BackColor="#2461BF" HorizontalAlign="Center" ForeColor="White" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle CssClass="warning" BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
            
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:diskInvConnection2 %>" SelectCommand="SELECT * FROM [artist]"></asp:SqlDataSource>
            <!--Details view for editing data -->
                <asp:ValidationSummary ID="vsArtist" runat="server" HeaderText="* means that the field is required" ValidationGroup="vsArtist" CssClass="text-danger"/>
                <asp:DetailsView ID="dvArtist" runat="server" AutoGenerateRows="False" DataKeyNames="artist_id" DataSourceID="SqlDataSource2" Height="50px" Width="325px" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemInserted="dvArtist_ItemInserted" OnItemUpdated="dvArtist_ItemUpdated" OnItemDeleted="dvArtist_ItemDeleted">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:TemplateField HeaderText="Artist ID" InsertVisible="False" SortExpression="artist_id">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("artist_id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("artist_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="First Name" SortExpression="fname">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditFName" runat="server" Text='<%# Bind("fname") %>' CssClass="float-left"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEditFName" runat="server" text="*" ValidationGroup="vsArtist" ErrorMessage="First Name (or group name) is Required" ControlToValidate="txtEditFName" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtInsertFName" runat="server" Text='<%# Bind("fname") %>' CssClass="float-left"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvInsertFName" runat="server" text="*" ValidationGroup="vsArtist" ErrorMessage="First Name (or group name) is Required" ControlToValidate="txtInsertFName" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("fname") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Name" SortExpression="lname">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditLName" runat="server" Text='<%# Bind("lname") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtInsertLName" runat="server" Text='<%# Bind("lname") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("lname") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Artist Type" SortExpression="artist_type">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditArtistType" runat="server" Text='<%# Bind("artist_type") %>' CssClass="float-left"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEditArtistType" runat="server" text="*" ValidationGroup="vsArtist" ErrorMessage="Artist Type must be a 1(Group) or 2 (Solo)." ControlToValidate="txtEditArtistType" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvEditArtistType1" runat="server" ErrorMessage="Artist Type must be a number: 1.)Group 2.)Solo" Text="*" ValidationGroup="vsArtist" Operator="GreaterThanEqual" Type="Integer" ControlToValidate="txtEditArtistType" ValueToCompare="1">
                                </asp:CompareValidator>
                                <asp:CompareValidator ID="cvEditArtistType2" runat="server" ErrorMessage="Artist Type must be a number: 1.)Group 2.)Solo" Text="*" ValidationGroup="vsArtist" Operator="LessThanEqual" Type="Integer" ControlToValidate="txtEditArtistType" ValueToCompare="2">
                                </asp:CompareValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtInsertArtistType" runat="server" Text='<%# Bind("artist_type") %>' CssClass="float-left"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvInsertArtistType" runat="server" text="*" ValidationGroup="vsArtist" ErrorMessage="Artist Type is required." ControlToValidate="txtInsertArtistType" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvInsertArtistType1" runat="server" ErrorMessage="Artist Type must be a number: 1.)Group 2.)Solo" Text="*" ValidationGroup="vsArtist" Operator="GreaterThanEqual" Type="Integer" ControlToValidate="txtInsertArtistType" ValueToCompare="1">
                                </asp:CompareValidator>
                                <asp:CompareValidator ID="cvInsertArtistType2" runat="server" ErrorMessage="Artist Type must be a number: 1.)Group 2.)Solo" Text="*" ValidationGroup="vsArtist" Operator="LessThanEqual" Type="Integer" ControlToValidate="txtInsertArtistType" ValueToCompare="2">
                                </asp:CompareValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("artist_type") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" ValidationGroup="vsArtist" />
                    </Fields>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                </asp:DetailsView>
            
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:diskInvConnection2 %>" SelectCommand="SELECT * FROM [artist] WHERE ([artist_id] = @artist_id)" 
                DeleteCommand="EXEC sp_artistdelete @artist_id" 
                InsertCommand="EXEC sp_artistinsert @fname, @lname, @artist_type"
                UpdateCommand="EXEC sp_artistUpdate @fname, @lname,  @artist_type, @artist_id">
                <DeleteParameters>
                    <asp:Parameter Name="artist_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="fname" Type="String" />
                    <asp:Parameter Name="lname" Type="String" />
                    <asp:Parameter Name="artist_type" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="grdArtist" Name="artist_id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="fname" Type="String" />
                    <asp:Parameter Name="lname" Type="String" />
                    <asp:Parameter Name="artist_type" Type="Int32" />
                    <asp:Parameter Name="artist_id" Type="Int32" />
                </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Label ID="lblError" runat="server"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" Runat="Server">
    <p>
    <br />
</p>
</asp:Content>

