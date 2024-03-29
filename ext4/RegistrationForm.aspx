﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="ext4.RegistrationForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
    Ext.onReady(function () {
        var formPanel = Ext.widget('form', {
            renderTo: 'div1',
            title: 'Account Registration',
            width: 350,
            frame: true,
            bodyPadding: 10,
            bodyBorder: true,
            defaults: {
                anachor: '100%'
            },
            fieldDefaults: {
                labelAlign: 'left',
                msgTarget: 'none',
                invalidCls: ''
            },
            listeners: {
                fieldvaliditychange: function () {
                    this.updateErrorState();
                },
                fielderrorchange: function () {
                    this.updateErrorState();
                }
            },
            updateErrorState: function () {
                var me = this, errorCmp, fields, errors;
                if (me.hasBeenDirty || me.getForm().isDirty()) {//判断表单数据是否改变
                    errorCmp = me.down('#formErrorState');
                    fields = me.getForm().getFields();
                    errors = [];
                    fields.each(function (field) {
                        Ext.Array.forEach(field.getErrors(), function (error) {
                            errors.push({ name: field.getFieldLabel(), error: error });
                        });
                    });
                    errorCmp.setErrors(errors);
                    me.hasBeenDirty = true;
                }
            },
            items: [{
                xtype: 'textfield',
                name: 'username',
                fieldLabel: 'User Name',
                allowBlank: false,
                minLength: 6
            }, {
                xtype: 'textfield',
                name: 'email',
                vtype: 'email',
                fieldLabel: 'Email Address',
                allowBlank: false
            }, {
                xtype: 'textfield',
                name: 'password1',
                fieldLabel: 'Password',
                inputType: 'password',
                style: 'margin-top:15px',
                allowBlank: false,
                minLength: 8
            }, {
                xtype: 'textfield',
                name: 'password2',
                inputType: 'password',
                fieldLabel: 'Repeat Password',
                allowBlank: false,
                validator: function (value) {
                    var password1 = this.previousSibling('[name=password1]');
                    return (value == password1.getValue()) ? true : 'Passwords do not match.';
                }
            }, {
                xtype: 'checkboxfield',
                name: 'acceptTerms',
                fieldLabel: 'Terms of Use',
                hideLabel: true,
                style: 'margin-top:15px',
                boxLabel: 'I have read and accept the <a href="http://www.sencha.com/legal/terms-of-use/" class="terms">Terms of Use</a>.',
                listeners: {
                    click: {
                        element: 'boxLabelEl',
                        fn: function (e) {
                            var target = e.getTarget('.terms'), win;
                            if (target) {
                                win = Ext.widget('window', {
                                    title: 'Terms of Use',
                                    modal: true,
                                    html: '<iframe src="' + target.href + '" width="950" height="500" style="border:0"></iframe>',
                                    buttons: [{
                                        text: 'Decline',
                                        handler: function () {
                                            this.up('window').close();
                                            formPanel.down('[name=acceptTerms]').setValue(false);
                                        }
                                    }, {
                                        text: 'Accept',
                                        handler: function () {
                                            this.up('window').close();
                                            formPanel.down('[name=acceptTerms]').setValue(true);
                                        }
                                    }]
                                });
                                win.show();
                                e.preventDefault();
                            }
                        }
                    }
                },
                getErrors: function () {
                    return this.getValue() ? [] : ['You must accept the Terms of Use']
                }
            }],
            dockedItems: [{
                xtype: 'container',
                dock: 'bottom',
                layout: {
                    type: 'hbox',
                    align: 'middle'
                },
                padding: '10 10 5',
                items: [{
                    xtype: 'component',
                    id: 'formErrorState',
                    baseCls: 'form-error-state',
                    flex: 1,
                    validText: 'Form is valid',
                    invalidText: 'Form has errors',
                    tipTpl: Ext.create('Ext.XTemplate', '<ul><tpl for="."><li><span class="field-name">{name}</span>: <span class="error">{error}</span></li></tpl></ul>'),

                    getTip: function () {
                        var tip = this.tip;
                        if (!tip) {
                            tip = this.tip = Ext.widget('tooltip', {
                                target: this.el,
                                title: 'Error Details',
                                autoHide: false,
                                anchor: 'top',
                                closable: true,
                                constrainPosition: false,
                                cls: 'errors-tip'
                            });
                            tip.show();
                        }
                        return tip;
                    },

                    setErrors: function (errors) {
                        var me = this,
                            baseCls = me.baseCls,
                            tip = me.getTip();

                        errors = Ext.Array.from(errors);

                        if (errors.length) {
                            me.addCls(baseCls + '-invalid');
                            me.removeCls(baseCls + '-valid');
                            me.update(me.invalidText);
                            tip.setDisabled(false);
                            tip.update(me.tipTpl.apply(errors));
                        } else {
                            me.addCls(baseCls + '-valid');
                            me.removeCls(baseCls + '-invalid');
                            me.update(me.validText);
                            tip.setDisabled(true);
                            tip.hide();
                        }
                    }

                }, {
                    xtype: 'button',
                    formBind: true,
                    disabled: true,
                    text: 'Submit Registration',
                    width: 140,
                    handler: function () {
                        var form = this.up('form').getForm();
                        form.submit({
                            clientValidation: true,
                            url: 'reg.aspx',
                            success: function (form, action) {

                            },
                            failure: function (form, action) {

                            }
                        });
                        if (form.isValid()) {
                            Ext.Msg.alert('Submitted Values', form.getValues(true));
                        }
                    }
                }]
            }]


        });
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="div1"></div>
</asp:Content>
