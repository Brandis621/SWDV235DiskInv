

<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Borrower.aspx.cs" Inherits="Borrower" ClientIDMode="Static" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <!-- Name            Date        Message
     Aaron Smith     4/22/19     Fixed Data view insert, update and delete
     Aaron Smith     5/1/2019    Added validation, made gridview update when data is changed-->

    <h2>Borrowers</h2>
            <!--Gridview for displaying data -->
            <asp:GridView ID="grdBorrower" runat="server" SelectedIndex="0"
                            AutoGenerateColumns="False" DataKeyNames="borrower_id" 
                            DataSourceID="SqlDataSource1" AllowPaging="True" 
                            CssClass="table table-bordered table-striped table-condensed" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:diskInvConnection2 %>" SelectCommand="SELECT * FROM [borrower]"></asp:SqlDataSource>
            <!--Details view for editing data -->
                <asp:ValidationSummary ID="vsBorrower" runat="server" HeaderText="* means that the field is required" ValidationGroup="vsBorrower" CssClass="text-danger"/>

                <asp:DetailsView ID="dvDisk" runat="server" AutoGenerateRows="False" DataKeyNames="borrower_id" DataSourceID="SqlDataSource2" Height="50px" Width="318px" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemInserted="dvDisk_ItemInserted" OnItemUpdated="dvDisk_ItemUpdated" OnItemDeleted="dvDisk_ItemDeleted">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:TemplateField HeaderText="Borrower ID" InsertVisible="False" SortExpression="borrower_id">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("borrower_id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("borrower_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="First Name" SortExpression="fname">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditFName" runat="server" Text='<%# Bind("fname") %>' CssClass="float-left"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEditFName" runat="server" text="*" ValidationGroup="vsBorrower" ErrorMessage="First Name is Required" ControlToValidate="txtEditFName" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtInsertFName" runat="server" Text='<%# Bind("fname") %>' CssClass="float-left"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvInsertFName" runat="server" text="*" ValidationGroup="vsBorrower" ErrorMessage="First Name is Required" ControlToValidate="txtInsertFName" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("fname") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Name" SortExpression="lname">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditLName" runat="server" Text='<%# Bind("lname") %>' CssClass="float-left"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEditLName" runat="server" text="*" ValidationGroup="vsBorrower" ErrorMessage="Last Name is Required" ControlToValidate="txtEditLName" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtInsertLName" runat="server" Text='<%# Bind("lname") %>' CssClass="float-left"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvInsertLName" runat="server" text="*" ValidationGroup="vsBorrower" ErrorMessage="Last Name is Required" ControlToValidate="txtInsertLName" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("lname") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone Number" SortExpression="phoneNumber">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditPhone" runat="server" Text='<%# Bind("phoneNumber") %>' CssClass="float-left"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEditPhone" runat="server" ValidationGroup="vsBorrower"
                                    ControlToValidate="txtEditPhone" text="*" ErrorMessage="Phone Number is required" CssClass="text-danger" Display="Dynamic">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revEditPhone" runat="server" ValidationGroup="vsBorrower"
                                    ControlToValidate="txtEditPhone" Text="*" ErrorMessage="Use this format: 999-999-9999"
                                    Display="Dynamic" CssClass="text-danger" 
                                    ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">
                                </asp:RegularExpressionValidator>   
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtInsertPhone" runat="server" Text='<%# Bind("phoneNumber") %>' CssClass="float-left"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvInsertPhone" runat="server" ValidationGroup="vsBorrower"
                                    ControlToValidate="txtInsertPhone" text="*" ErrorMessage="Phone Number is required" CssClass="text-danger" Display="Dynamic">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revEditPhone" runat="server" ValidationGroup="vsBorrower"
                                    ControlToValidate="txtInsertPhone" Text="*" ErrorMessage="Use this format: 999-999-9999"
                                    Display="Dynamic" CssClass="text-danger" 
                                    ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">
                                </asp:RegularExpressionValidator>   
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("phoneNumber") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" ValidationGroup="vsBorrower" />
                    </Fields>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
    <br />
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
    <p>
    <br />
</p>
</asp:Content>

