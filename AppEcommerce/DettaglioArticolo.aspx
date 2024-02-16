<%@ Page Title="" Language="C#" MasterPageFile="~/Template/TemplateMaster.Master" AutoEventWireup="true" CodeBehind="DettaglioArticolo.aspx.cs" Inherits="AppEcommerce.DettaglioArticolo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <asp:Repeater ID="RepeaterDettagli" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4">
                            <div class="card">
                                <img class="card-img-top" src='<%# Eval("Immagine") %>' alt='<%# Eval("Nome") %>'>
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("Nome") %></h5>
                                    <p class="card-text"><%# Eval("Descrizione") %></p>
                                    <p class="card-text">Prezzo: <%# string.Format("{0:C}", Eval("Prezzo")) %></p>
                                    <asp:Button ID="btnAggiungiCarrello" runat="server" Text="Aggiungi al carrello" OnClick="btnAggiungiCarrello_Click" CssClass="btn btn-primary" />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
</asp:Content>
