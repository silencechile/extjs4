﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ComboBox.aspx.cs" Inherits="ext4.ComboBox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
    Ext.onReady(function () {
        Ext.define('State', {
            extend: 'Ext.data.Model',
            fields: [{
                type: 'string', name: 'abbr'
            }, {
                type: 'string', name: 'name'
            }, {
                type: 'string', name: 'slogan'
            }]
        });


        var states = [
            { "abbr": "AL", "name": "Alabama", "slogan": "The Heart of Dixie" },
            { "abbr": "AK", "name": "Alaska", "slogan": "The Land of the Midnight Sun" },
            { "abbr": "AZ", "name": "Arizona", "slogan": "The Grand Canyon State" },
            { "abbr": "AR", "name": "Arkansas", "slogan": "The Natural State" },
            { "abbr": "CA", "name": "California", "slogan": "The Golden State" },
            { "abbr": "CO", "name": "Colorado", "slogan": "The Mountain State" },
            { "abbr": "CT", "name": "Connecticut", "slogan": "The Constitution State" },
            { "abbr": "DE", "name": "Delaware", "slogan": "The First State" },
            { "abbr": "DC", "name": "District of Columbia", "slogan": "The Nation's Capital" },
            { "abbr": "FL", "name": "Florida", "slogan": "The Sunshine State" },
            { "abbr": "GA", "name": "Georgia", "slogan": "The Peach State" },
            { "abbr": "HI", "name": "Hawaii", "slogan": "The Aloha State" },
            { "abbr": "ID", "name": "Idaho", "slogan": "Famous Potatoes" },
            { "abbr": "IL", "name": "Illinois", "slogan": "The Prairie State" },
            { "abbr": "IN", "name": "Indiana", "slogan": "The Hospitality State" },
            { "abbr": "IA", "name": "Iowa", "slogan": "The Corn State" },
            { "abbr": "KS", "name": "Kansas", "slogan": "The Sunflower State" },
            { "abbr": "KY", "name": "Kentucky", "slogan": "The Bluegrass State" },
            { "abbr": "LA", "name": "Louisiana", "slogan": "The Bayou State" },
            { "abbr": "ME", "name": "Maine", "slogan": "The Pine Tree State" },
            { "abbr": "MD", "name": "Maryland", "slogan": "Chesapeake State" },
            { "abbr": "MA", "name": "Massachusetts", "slogan": "The Spirit of America" },
            { "abbr": "MI", "name": "Michigan", "slogan": "Great Lakes State" },
            { "abbr": "MN", "name": "Minnesota", "slogan": "North Star State" },
            { "abbr": "MS", "name": "Mississippi", "slogan": "Magnolia State" },
            { "abbr": "MO", "name": "Missouri", "slogan": "Show Me State" },
            { "abbr": "MT", "name": "Montana", "slogan": "Big Sky Country" },
            { "abbr": "NE", "name": "Nebraska", "slogan": "Beef State" },
            { "abbr": "NV", "name": "Nevada", "slogan": "Silver State" },
            { "abbr": "NH", "name": "New Hampshire", "slogan": "Granite State" },
            { "abbr": "NJ", "name": "New Jersey", "slogan": "Garden State" },
            { "abbr": "NM", "name": "New Mexico", "slogan": "Land of Enchantment" },
            { "abbr": "NY", "name": "New York", "slogan": "Empire State" },
            { "abbr": "NC", "name": "North Carolina", "slogan": "First in Freedom" },
            { "abbr": "ND", "name": "North Dakota", "slogan": "Peace Garden State" },
            { "abbr": "OH", "name": "Ohio", "slogan": "The Heart of it All" },
            { "abbr": "OK", "name": "Oklahoma", "slogan": "Oklahoma is OK" },
            { "abbr": "OR", "name": "Oregon", "slogan": "Pacific Wonderland" },
            { "abbr": "PA", "name": "Pennsylvania", "slogan": "Keystone State" },
            { "abbr": "RI", "name": "Rhode Island", "slogan": "Ocean State" },
            { "abbr": "SC", "name": "South Carolina", "slogan": "Nothing Could be Finer" },
            { "abbr": "SD", "name": "South Dakota", "slogan": "Great Faces, Great Places" },
            { "abbr": "TN", "name": "Tennessee", "slogan": "Volunteer State" },
            { "abbr": "TX", "name": "Texas", "slogan": "Lone Star State" },
            { "abbr": "UT", "name": "Utah", "slogan": "Salt Lake State" },
            { "abbr": "VT", "name": "Vermont", "slogan": "Green Mountain State" },
            { "abbr": "VA", "name": "Virginia", "slogan": "Mother of States" },
            { "abbr": "WA", "name": "Washington", "slogan": "Green Tree State" },
            { "abbr": "WV", "name": "West Virginia", "slogan": "Mountain State" },
            { "abbr": "WI", "name": "Wisconsin", "slogan": "America's Dairyland" },
            { "abbr": "WY", "name": "Wyoming", "slogan": "Like No Place on Earth" }
        ];

        var store = Ext.create('Ext.data.Store', {
            model: 'State',
            data: states
        });

        var simpleCombo = Ext.create('Ext.form.field.ComboBox', {
            fieldLabel: 'Select a single state',
            renderTo: 'simpleCombo',
            displayField: 'name',
            width: 320,
            labelWidth: 130,
            store: store,
            queryMode: 'local',
            typeAhead: true
        });


        var customTplCombo = Ext.create('Ext.form.field.ComboBox', {
            fieldLabel: 'Select a single state',
            renderTo: 'customCombo',
            displayField: 'name',
            width: 320,
            labelWidth: 130,
            store: store,
            queryMode: 'local',
            listConfig: {
                getInnerTpl: function () {
                    return '<div data-qtip="{name}. {slogan}">{name} ({abbr})</div>';
                }
            }
        })

        var multiCombo = Ext.create('Ext.form.field.ComboBox', {
            fieldLabel: 'Select a single state',
            displayField:'name',
            renderTo: 'multiCombo',
            width:320,
            labelWidth: 130,
            store:store,
            queryMode:'local',
            multiSelect:true
        });

    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="simpleCombo"></div>
<div id="customCombo"></div>
<div id="multiCombo"></div>
</asp:Content>
