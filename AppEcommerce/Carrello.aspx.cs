using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace AppEcommerce
{
    public partial class Carrello : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCarrello();
            }
        }

        private void BindCarrello()
        {
            if (Session["Carrello"] != null)
            {
                DataTable dtCarrello = (DataTable)Session["Carrello"];
                RepeaterCarrello.DataSource = dtCarrello;
                RepeaterCarrello.DataBind();
            }
        }

        protected void btnRimuoviDalCarrello_Command(object sender, CommandEventArgs e)
        {
            if (Session["Carrello"] != null)
            {
                DataTable dtCarrello = (DataTable)Session["Carrello"];
                int articoloId = Convert.ToInt32(e.CommandArgument);

                DataRow[] rows = dtCarrello.Select("ID = " + articoloId);
                foreach (DataRow row in rows)
                {
                    dtCarrello.Rows.Remove(row);
                }

                Session["Carrello"] = dtCarrello;

                BindCarrello();
            }
        }
    }
}