using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Artist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void grdArtist_PreRender(object sender, EventArgs e)
    {
        grdArtist.HeaderRow.TableSection = TableRowSection.TableHeader;
    }

    private string DatabaseErrorMessage(string errorMsg)
    {
        return $"<b>A database error has occurred:</b> {errorMsg}";
    }

    protected void dvArtist_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = DatabaseErrorMessage(e.Exception.Message);
            e.ExceptionHandled = true;
        }
        else
        {
            grdArtist.DataSourceID = "SqlDataSource1";
        }

    }

    protected void dvArtist_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        grdArtist.DataSourceID = "SqlDataSource1";
    }

    protected void dvArtist_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        grdArtist.DataSourceID = "SqlDataSource1";
    }
}