

<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Disk.aspx.cs" Inherits="Disk" ClientIDMode="Static" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <!-- Name            Date        Message
     Aaron Smith     4/22/19     Fixed Data view insert, update and delete
     Aaron Smith     5/1/2019    Added validation, made gridview update when data is changed-->
    
    <h2>Disk Inventory</h2>
    <!--Gridview for displaying data -->
            <asp:GridView ID="grdDisk" runat="server" SelectedIndex="0"
                            AutoGenerateColumns="False" DataKeyNames="disk_id" 
                            DataSourceID="SqlDataSource1" AllowPaging="True" 
                            CssClass="table table-bordered table-striped table-condensed" Width="923px" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
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
            <!--Details view for editing data -->
                 <asp:ValidationSummary ID="vsDisk" runat="server" HeaderText="* means that the field is required" ValidationGroup="vsDisk" CssClass="text-danger"/>

                <asp:DetailsView ID="dvDisk" runat="server" AutoGenerateRows="False" DataKeyNames="disk_id" DataSourceID="SqlDataSource2" Height="50px" Width="336px" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemInserted="dvDisk_ItemInserted" OnItemUpdated="dvDisk_ItemUpdated" OnItemDeleted="dvDisk_ItemDeleted">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:TemplateField HeaderText="Disk ID" InsertVisible="False" SortExpression="disk_id">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("disk_id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("disk_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Disk Name" SortExpression="disk_name">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditDiskName" runat="server" Text='<%# Bind("disk_name") %>' CssClass="float-left"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEditDiskName" runat="server" text="*" ValidationGroup="vsDisk" ErrorMessage="Disk Name is Required" ControlToValidate="txtEditDiskName" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtInsertDiskName" runat="server" Text='<%# Bind("disk_name") %>' CssClass="float-left"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvInsertDiskName" runat="server" text="*" ValidationGroup="vsDisk" ErrorMessage="Disk Name is Required" ControlToValidate="txtInsertDiskName" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("disk_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Release Date" SortExpression="release_date">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditRelease" runat="server" Text='<%# Bind("release_date") %>' CssClass="float-left" TextMode="Date"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEditRelease" runat="server" text="*" ValidationGroup="vsDisk" ErrorMessage="Release Date is Required" ControlToValidate="txtEditRelease" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtInsertRelease" runat="server" Text='<%# Bind("release_date") %>' CssClass="float-left" TextMode="Date"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvInsertRelease" runat="server" text="*" ValidationGroup="vsDisk" ErrorMessage="Release Date is Required" ControlToValidate="txtInsertRelease" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("release_date") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status ID" SortExpression="status_id">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditStatus" runat="server" Text='<%# Bind("status_id") %>' CssClass="float-left"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEditStatus" runat="server" text="*" ValidationGroup="vsDisk" ErrorMessage="Status is Required" ControlToValidate="txtEditStatus" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvEditStatus1" runat="server" ErrorMessage="Status ID must be a number: 1.)In stock 2.)On loan 3.)Damaged 4.)Unavailable" Text="*" ValidationGroup="vsDisk" Operator="GreaterThanEqual" Type="Integer" ControlToValidate="txtEditStatus" ValueToCompare="1">
                                </asp:CompareValidator>
                                <asp:CompareValidator ID="cvEditStatus2" runat="server" ErrorMessage="Status ID must be a number: 1.)In stock 2.)On loan 3.)Damaged 4.)Unavailable" Text="*" ValidationGroup="vsDisk" Operator="LessThanEqual" Type="Integer" ControlToValidate="txtEditStatus" ValueToCompare="4">
                                </asp:CompareValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtEditStatus" runat="server" Text='<%# Bind("status_id") %>' CssClass="float-left"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvInsertStatus" runat="server" text="*" ValidationGroup="vsDisk" ErrorMessage="Status is Required" ControlToValidate="txtEditStatus" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvInsertStatus1" runat="server" ErrorMessage="Status ID must be a number: 1.)In stock 2.)On loan 3.)Damaged 4.)Unavailable" Text="*" ValidationGroup="vsDisk" Operator="GreaterThanEqual" Type="Integer" ControlToValidate="txtInsertStatus" ValueToCompare="1">
                                </asp:CompareValidator>
                                <asp:CompareValidator ID="cvInsertStatus2" runat="server" ErrorMessage="Status ID must be a number: 1.)In stock 2.)On loan 3.)Damaged 4.)Unavailable" Text="*" ValidationGroup="vsDisk" Operator="LessThanEqual" Type="Integer" ControlToValidate="txtInsertStatus" ValueToCompare="4">
                                </asp:CompareValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("status_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Genre ID" SortExpression="genre_id">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditGenre" runat="server" Text='<%# Bind("genre_id") %>' CssClass="float-left"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEditGenre" runat="server" text="*" ValidationGroup="vsDisk" ErrorMessage="Status is Required" ControlToValidate="txtEditGenre" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvEditGenre1" runat="server" ErrorMessage="Genre ID must be a number: 1.)Rock 2.)Metal 3.)Pop 4.)Country 5.)Rap 6.)R&B 7.)Classic 8.)Punk 9.)Reggae" Text="*" ValidationGroup="vsDisk" Operator="GreaterThanEqual" Type="Integer" ControlToValidate="txtEditGenre" ValueToCompare="1">
                                </asp:CompareValidator>
                                <asp:CompareValidator ID="cvEditGenre2" runat="server" ErrorMessage="Genre ID must be a number: 1.)Rock 2.)Metal 3.)Pop 4.)Country 5.)Rap 6.)R&B 7.)Classic 8.)Punk 9.)Reggae" Text="*" ValidationGroup="vsDisk" Operator="LessThanEqual" Type="Integer" ControlToValidate="txtEditGenre" ValueToCompare="9">
                                </asp:CompareValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtInsertGenre" runat="server" Text='<%# Bind("genre_id") %>' CssClass="float-left"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvInsertGenre" runat="server" text="*" ValidationGroup="vsDisk" ErrorMessage="Status is Required" ControlToValidate="txtInsertGenre" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvInsertGenre1" runat="server" ErrorMessage="Genre ID must be a number: 1.)Rock 2.)Metal 3.)Pop 4.)Country 5.)Rap 6.)R&B 7.)Classic 8.)Punk 9.)Reggae" Text="*" ValidationGroup="vsDisk" Operator="GreaterThanEqual" Type="Integer" ControlToValidate="txtInsertGenre" ValueToCompare="1">
                                </asp:CompareValidator>
                                <asp:CompareValidator ID="cvInsertGenre2" runat="server" ErrorMessage="Genre ID must be a number: 1.)Rock 2.)Metal 3.)Pop 4.)Country 5.)Rap 6.)R&B 7.)Classic 8.)Punk 9.)Reggae" Text="*" ValidationGroup="vsDisk" Operator="LessThanEqual" Type="Integer" ControlToValidate="txtInsertGenre" ValueToCompare="9">
                                </asp:CompareValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("genre_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Disk Type ID" SortExpression="disk_type_id">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditDiskType" runat="server" Text='<%# Bind("disk_type_id") %>' CssClass="float-left"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEditDiskType" runat="server" text="*" ValidationGroup="vsDisk" ErrorMessage="Status is Required" ControlToValidate="txtEditDiskType" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvEditDiskType1" runat="server" ErrorMessage="Disk Type ID must be a number: 1.)CD 2.)Cassette 3.)Record" Text="*" ValidationGroup="vsDisk" Operator="GreaterThanEqual" Type="Integer" ControlToValidate="txtEditDiskType" ValueToCompare="1">
                                </asp:CompareValidator>
                                <asp:CompareValidator ID="cvEditDiskType2" runat="server" ErrorMessage="Disk Type ID must be a number: 1.)CD 2.)Cassette 3.)Record" Text="*" ValidationGroup="vsDisk" Operator="LessThanEqual" Type="Integer" ControlToValidate="txtEditDiskType" ValueToCompare="3">
                                </asp:CompareValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtInsertDiskType" runat="server" Text='<%# Bind("disk_type_id") %>' CssClass="float-left"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvInsertDiskType" runat="server" text="*" ValidationGroup="vsDisk" ErrorMessage="Status is Required" ControlToValidate="txtInsertDiskType" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvInsertDiskType1" runat="server" ErrorMessage="Disk Type ID must be a number: 1.)CD 2.)Cassette 3.)Record" Text="*" ValidationGroup="vsDisk" Operator="GreaterThanEqual" Type="Integer" ControlToValidate="txtInsertDiskType" ValueToCompare="1">
                                </asp:CompareValidator>
                                <asp:CompareValidator ID="cvInsertDiskType2" runat="server" ErrorMessage="Disk Type ID must be a number: 1.)CD 2.)Cassette 3.)Record" Text="*" ValidationGroup="vsDisk" Operator="LessThanEqual" Type="Integer" ControlToValidate="txtInsertDiskType" ValueToCompare="3">
                                </asp:CompareValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("disk_type_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" ValidationGroup="vsDisk"/>
                    </Fields>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:diskInvConnection2 %>" SelectCommand="SELECT * FROM [disk]"></asp:SqlDataSource>
            
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:diskInvConnection2 %>" SelectCommand="SELECT * FROM [disk] WHERE ([disk_id] = @disk_id)" DeleteCommand="EXEC sp_diskdelete @disk_id" InsertCommand="EXEC sp_diskinsert @disk_name, @release_date, @status_id, @genre_id, @disk_type_id" UpdateCommand="EXEC sp_diskupdate @disk_id, @disk_name, @release_date, @status_id, @genre_id, @disk_type_id">
        <DeleteParameters>
            <asp:Parameter Name="disk_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="disk_name" Type="String" />
            <asp:Parameter Name="release_date" Type="DateTime" />
            <asp:Parameter Name="status_id" Type="Int32" />
            <asp:Parameter Name="genre_id" Type="Int32" />
            <asp:Parameter Name="disk_type_id" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="grdDisk" Name="disk_id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="disk_id" Type="Int32" />
            <asp:Parameter Name="disk_name" Type="String" />
            <asp:Parameter Name="release_date" Type="DateTime" />
            <asp:Parameter Name="status_id" Type="Int32" />
            <asp:Parameter Name="genre_id" Type="Int32" />
            <asp:Parameter Name="disk_type_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" Runat="Server">
    <p>
    <br />
</p>
<p>
</p>
</asp:Content>

