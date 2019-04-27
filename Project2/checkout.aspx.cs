using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Checkout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //define parameter variables
        DateTime date = Convert.ToDateTime(txtDate.Text);
        int borrowerID = Convert.ToInt32(ddlBorrower.SelectedValue);
        int diskID = Convert.ToInt32(ddlDisk.SelectedValue);

        //create checkout sql command using sp_checkout
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["diskInvConnection2"].ConnectionString);
        SqlCommand Cmd = new SqlCommand("sp_checkout", connection);
        Cmd.CommandType = CommandType.StoredProcedure;
        Cmd.Parameters.Add("@Disk", SqlDbType.Int).Value = diskID;
        Cmd.Parameters.Add("@Borrower", SqlDbType.Int).Value = borrowerID;
        Cmd.Parameters.Add("@CheckoutDate", SqlDbType.DateTime).Value = date;

        //execute checkout SP
        connection.Open();
        Cmd.ExecuteNonQuery();
        connection.Close();
        connection.Dispose();

        //refresh checked out grid view
        gvCheckedOut.DataSourceID = "CheckedOutList";

        lblCheckOut.Text = ddlBorrower.SelectedItem.Text + " has checked out " + ddlDisk.SelectedItem.Text + " successfully";
    }
    
    protected void gvCheckedOut_Load(object sender, EventArgs e)
    {
        //add initial data source to checked out grid view
        gvCheckedOut.DataSourceID = "CheckedOutList";
    }
}