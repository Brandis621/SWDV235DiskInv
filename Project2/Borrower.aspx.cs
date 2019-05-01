using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Borrower : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void dvDisk_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        grdBorrower.DataSourceID = "SqlDataSource1";
    }

    protected void dvDisk_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        grdBorrower.DataSourceID = "SqlDataSource1";
    }

    protected void dvDisk_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        grdBorrower.DataSourceID = "SqlDataSource1";
    }
}