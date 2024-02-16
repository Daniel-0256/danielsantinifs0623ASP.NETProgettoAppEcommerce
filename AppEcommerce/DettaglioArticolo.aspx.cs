using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppEcommerce
{
    public partial class DettaglioArticolo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["ID"] != null)
                {
                    int articoloId = Convert.ToInt32(Request.QueryString["ID"]);
                    MostraDettagliArticolo(articoloId);
                }
            }
        }

        private void MostraDettagliArticolo(int articoloId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            string query = "SELECT Nome, Descrizione, Prezzo, Immagine FROM Articoli WHERE ID = @ID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@ID", articoloId);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    DataTable dt = new DataTable();
                    dt.Load(reader);
                    RepeaterDettagli.DataSource = dt;
                    RepeaterDettagli.DataBind();
                }

                reader.Close();
            }
        }

        protected void btnAggiungiCarrello_Click(object sender, EventArgs e)
        {
            int idArticolo = Convert.ToInt32(Request.QueryString["ID"]);

            AggiungiAlCarrello(idArticolo);

            Response.Redirect("Carrello.aspx");
        }

        private void AggiungiAlCarrello(int articoloId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            string query = "SELECT Nome, Descrizione, Prezzo, Immagine FROM Articoli WHERE ID = @ID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@ID", articoloId);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    if (Session["Carrello"] == null)
                    {
                        DataTable carrello = new DataTable();
                        carrello.Columns.Add("ID", typeof(int));
                        carrello.Columns.Add("Nome", typeof(string));
                        carrello.Columns.Add("Descrizione", typeof(string));
                        carrello.Columns.Add("Prezzo", typeof(decimal));
                        carrello.Columns.Add("Immagine", typeof(string));
                        Session["Carrello"] = carrello;
                    }

                    DataTable dtCarrello = (DataTable)Session["Carrello"];

                    bool articoloPresente = false;
                    foreach (DataRow row in dtCarrello.Rows)
                    {
                        if (Convert.ToInt32(row["ID"]) == articoloId)
                        {
                            articoloPresente = true;
                            break;
                        }
                    }

                    if (!articoloPresente)
                    {
                        DataRow carrelloRow = dtCarrello.NewRow();
                        carrelloRow["ID"] = articoloId;
                        carrelloRow["Nome"] = reader["Nome"].ToString();
                        carrelloRow["Descrizione"] = reader["Descrizione"].ToString();
                        carrelloRow["Prezzo"] = Convert.ToDecimal(reader["Prezzo"]);
                        carrelloRow["Immagine"] = reader["Immagine"].ToString();
                        dtCarrello.Rows.Add(carrelloRow);
                        Session["Carrello"] = dtCarrello;
                    }
                }

                reader.Close();
            }
        }
    }
}