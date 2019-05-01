using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Disk : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void dvDisk_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        grdDisk.DataSourceID = "SqlDataSource1";
    }

    protected void dvDisk_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        grdDisk.DataSourceID = "SqlDataSource1";
    }

    protected void dvDisk_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        grdDisk.DataSourceID = "SqlDataSource1";
    }
}