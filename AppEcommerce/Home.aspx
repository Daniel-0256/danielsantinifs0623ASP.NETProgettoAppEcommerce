<%@ Page Title="" Language="C#" MasterPageFile="~/Template/TemplateMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="AppEcommerce.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <asp:Repeater ID="RepeaterArticoli" runat="server">
                    <ItemTemplate>
                        <div class="col-md-3">
                            <div class="card ogniCard">
                                <img class="card-img-top" src='<%# Eval("Immagine") %>' alt='<%# Eval("Nome") %>'>
                                <div class="card-body p-0">
                                    <h5 class="card-title"><%# Eval("Nome") %></h5>
                                    <p class="ogniCard-description"><%# Eval("Descrizione") %></p>
                                    <div class="card-footer">
                                        <p class="card-text">Prezzo: <%# string.Format("{0:C}", Eval("Prezzo")) %></p>
                                        <asp:HyperLink ID="lnkDettaglio" runat="server" NavigateUrl='<%# Eval("ID", "~/DettaglioArticolo.aspx?ID={0}") %>' Text="Visualizza dettagli" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
</asp:Content>
