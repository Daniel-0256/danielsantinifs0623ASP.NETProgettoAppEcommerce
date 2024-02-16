<%@ Page Title="" Language="C#" MasterPageFile="~/Template/TemplateMaster.Master" AutoEventWireup="true" CodeBehind="Carrello.aspx.cs" Inherits="AppEcommerce.Carrello" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <h1>Carrello</h1>
                <asp:Repeater ID="RepeaterCarrello" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4">
                            <div class="card mb-4 shadow-sm">
                                <img class="card-img-top" src='<%# Eval("Immagine") %>' alt='<%# Eval("Nome") %>'>
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("Nome") %></h5>
                                    <p class="card-text"><%# Eval("Descrizione") %></p>
                                    <p class="card-text">Prezzo: <%# string.Format("{0:C}", Eval("Prezzo")) %></p>
                                    <asp:Button ID="btnRimuoviDalCarrello" runat="server" Text="Rimuovi dal carrello" CommandName="Remove" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-danger" OnCommand="btnRimuoviDalCarrello_Command" />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
</asp:Content>
