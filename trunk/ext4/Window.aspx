﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Window.aspx.cs" Inherits="ext4.Window" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
    Ext.onReady(function () {
        Ext.create('Ext.Window', {
            title: 'Ext.Window',
            width: 300,
            height: 200,
            model: true,
            plain: true,
            renderTo: 'window_a'
        }).show();

        Ext.create('Ext.Window', {
            title: 'Ext.Window',
            x: 100,
            y:280,
            height: 300,
            width: 400,
            layout: 'fit',
            items: {
                xtype: 'grid',
                border: false,
                columns: [{ header: 'Hello'}],
                store: Ext.create('Ext.data.ArrayStore', {})
            },
            renderTo: 'window_b'
        }).show();

    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="window_a"></div>
<div id="window_b"></div>
</asp:Content>
