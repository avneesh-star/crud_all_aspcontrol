<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="patient.aspx.cs" Inherits="app19test.patient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="validation.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Name:</td>
                    <td>
                        <asp:TextBox ID="txt_name" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Age:</td>
                    <td>
                        <asp:TextBox ID="txt_age" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td>
                        <asp:RadioButtonList ID="rbl_gender" runat="server" RepeatColumns="3">
                            <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="3"></asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td>Symptoms:</td>
                    <td>
                        <asp:CheckBoxList ID="cbl_symptoms" runat="server" RepeatColumns="3">
                            <asp:ListItem Text="Fever" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Cough" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Breating difficulty" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Muscle Pain" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Headaches" Value="5"></asp:ListItem>
                        </asp:CheckBoxList></td>
                </tr>
                <tr>
                    <td>Country:</td>
                    <td>
                        <asp:DropDownList ID="ddl_country" runat="server" OnSelectedIndexChanged="ddl_country_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>State:</td>
                    <td>
                        <asp:DropDownList ID="ddl_state" runat="server" OnSelectedIndexChanged="ddl_state_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>City:</td>
                    <td>
                        <asp:DropDownList ID="ddl_city" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btn_save" runat="server" Text="Save" OnClientClick="return validation()" OnClick="btn_save_Click" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="lbl_msg" runat="server" Font-Bold="true"></asp:Label></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:GridView ID="gv_patient" runat="server" AutoGenerateColumns="False" OnRowCommand="gv_patient_RowCommand" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                        <%#Eval("patient_id") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <%#Eval("patient_name") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Age">
                                    <ItemTemplate>
                                        <%#Eval("patient_age") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Gender">
                                    <ItemTemplate>
                                        <%#Eval("patient_gender").ToString()=="1"?"Male":Eval("patient_gender").ToString()=="2"?"Female":"Other" %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Symptoms">
                                    <ItemTemplate>
                                        <%#Eval("patient_symptoms") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Country">
                                    <ItemTemplate>
                                        <%#Eval("country_name") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="State">
                                    <ItemTemplate>
                                        <%#Eval("state_name") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="City">
                                    <ItemTemplate>
                                        <%#Eval("city_name") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Added ON">
                                    <ItemTemplate>
                                        <%#Eval("inserted_date") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:Button ID="btn_delete" Text="Delete" runat="server" OnClientClick="return confirm('Do you want to delete record!!!')" CommandName="del" CommandArgument='<%#Eval("patient_id") %>' />
                                        <asp:Button ID="btn_edit" Text="Edit" runat="server" CommandName="edt" CommandArgument='<%#Eval("patient_id") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F7DE" />
                            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FBFBF2" />
                            <SortedAscendingHeaderStyle BackColor="#848384" />
                            <SortedDescendingCellStyle BackColor="#EAEAD3" />
                            <SortedDescendingHeaderStyle BackColor="#575357" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
