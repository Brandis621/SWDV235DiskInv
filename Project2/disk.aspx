

<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Disk.aspx.cs" Inherits="Disk" ClientIDMode="Static" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
<!-- Name            Date        Message
     Aaron Smith     4/22/19     Fixed Data view insert, update and delete-->
    
    <h2>Disk Inventory</h2>
    <!--Gridview for displaying data -->
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
            <!--Details view for editing data -->
                <asp:DetailsView ID="dvDisk" runat="server" AutoGenerateRows="False" DataKeyNames="disk_id" DataSourceID="SqlDataSource2" Height="50px" Width="251px" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:TemplateField HeaderText="disk_id" InsertVisible="False" SortExpression="disk_id">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("disk_id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("disk_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="disk_name" SortExpression="disk_name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("disk_name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("disk_name") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("disk_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="release_date" SortExpression="release_date">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("release_date") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("release_date") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("release_date") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="status_id" SortExpression="status_id">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("status_id") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("status_id") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("status_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="genre_id" SortExpression="genre_id">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("genre_id") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("genre_id") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("genre_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="disk_type_id" SortExpression="disk_type_id">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("disk_type_id") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("disk_type_id") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("disk_type_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
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
</asp:Content>

