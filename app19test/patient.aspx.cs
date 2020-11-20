using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

namespace app19test
{
    public partial class patient : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
                BindCountry();
                ddl_state.Enabled = false;
                ddl_state.Items.Insert(0, new ListItem("--Select--", "0"));
                ddl_city.Enabled = false;
                ddl_city.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }
        public void BindCountry()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tbl_country", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddl_country.DataValueField = "country_id";
            ddl_country.DataTextField = "country_name";
            ddl_country.DataSource = dt;
            ddl_country.DataBind();
            ddl_country.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void BindState()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tbl_state where countryID='" + ddl_country.SelectedValue + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddl_state.Enabled = true;
            ddl_state.DataValueField = "state_id";
            ddl_state.DataTextField = "state_name";
            ddl_state.DataSource = dt;
            ddl_state.DataBind();
            ddl_state.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void BindCity()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tbl_city where stateID='" + ddl_state.SelectedValue + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddl_city.Enabled = true;
            ddl_city.DataValueField = "city_id";
            ddl_city.DataTextField = "city_name";
            ddl_city.DataSource = dt;
            ddl_city.DataBind();
            ddl_city.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void BindGrid()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_patient_join", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                gv_patient.DataSource = dt;
                gv_patient.DataBind();
            }
            else
            {
                gv_patient.DataSource = null;
                gv_patient.DataBind();
                lbl_msg.Text = "No record available!!";
                lbl_msg.ForeColor = Color.Red;
            }

        }
        public void clear()
        {
            txt_age.Text = "";
            txt_name.Text = "";
            rbl_gender.ClearSelection();
            cbl_symptoms.ClearSelection();
            ddl_country.SelectedValue = "0";
            ddl_state.SelectedValue = "0";
            ddl_city.SelectedValue = "0";
            btn_save.Text = "Save";
        }
        protected void ddl_country_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_country.SelectedValue == "0")
            {
                ddl_state.SelectedValue = "0";
                ddl_state.Enabled = false;
                ddl_city.SelectedValue = "0";
                ddl_city.Enabled = false;
            }
            else
            {
                BindState();
            }

        }

        protected void ddl_state_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_state.SelectedValue == "0")
            {
                ddl_city.SelectedValue = "0";
                ddl_city.Enabled = false;
            }
            else
            {
                BindCity();
            }

        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            string bx = "";
            for (int i = 0; i < cbl_symptoms.Items.Count; i++)
            {
                if (cbl_symptoms.Items[i].Selected == true)
                {
                    bx += cbl_symptoms.Items[i].Text + ',';
                }
            }
            bx = bx.TrimEnd(',');
            if (btn_save.Text == "Save")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_patient_insert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@patient_name", txt_name.Text);
                cmd.Parameters.AddWithValue("@patient_age", txt_age.Text);
                cmd.Parameters.AddWithValue("@patient_gender", rbl_gender.SelectedValue);
                cmd.Parameters.AddWithValue("@patient_symptoms", bx);
                cmd.Parameters.AddWithValue("@patient_country", ddl_country.SelectedValue);
                cmd.Parameters.AddWithValue("@patient_state", ddl_state.SelectedValue);
                cmd.Parameters.AddWithValue("@patient_city", ddl_city.SelectedValue);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {
                    lbl_msg.Text = "Record Saved!!!";
                    lbl_msg.ForeColor = Color.Blue;
                }
                else
                {
                    lbl_msg.Text = "Record not Saved!!!";
                    lbl_msg.ForeColor = Color.Red;
                }
            }
            else if (btn_save.Text == "Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_sp_patient_update", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@patient_id", ViewState["id"]);
                cmd.Parameters.AddWithValue("@patient_name", txt_name.Text);
                cmd.Parameters.AddWithValue("@patient_age", txt_age.Text);
                cmd.Parameters.AddWithValue("@patient_gender", rbl_gender.SelectedValue);
                cmd.Parameters.AddWithValue("@patient_symptoms", bx);
                cmd.Parameters.AddWithValue("@patient_country", ddl_country.SelectedValue);
                cmd.Parameters.AddWithValue("@patient_state", ddl_state.SelectedValue);
                cmd.Parameters.AddWithValue("@patient_city", ddl_city.SelectedValue);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {
                    lbl_msg.Text = "Record updated!!!";
                    lbl_msg.ForeColor = Color.Blue;
                }
                else
                {
                    lbl_msg.Text = "Record not updated!!!";
                    lbl_msg.ForeColor = Color.Red;
                }
            }
            BindGrid();
            clear();
        }

        protected void gv_patient_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "del")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_patient_delete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@patient_id", e.CommandArgument);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {
                    lbl_msg.Text = "Record Deleted!!!";
                    lbl_msg.ForeColor = Color.Blue;
                }
                else
                {
                    lbl_msg.Text = "Record not Deleted!!!";
                    lbl_msg.ForeColor = Color.Red;
                }
                BindGrid();
            }
            else if (e.CommandName == "edt")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_patient_edit", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@patient_id", e.CommandArgument);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                txt_name.Text = dt.Rows[0]["patient_name"].ToString();
                txt_age.Text = dt.Rows[0]["patient_age"].ToString();
                rbl_gender.SelectedValue = dt.Rows[0]["patient_gender"].ToString();
                cbl_symptoms.ClearSelection();
                string[] arr = dt.Rows[0]["patient_symptoms"].ToString().Split(',');
                for (int i = 0; i < cbl_symptoms.Items.Count; i++)
                {
                    for (int j = 0; j < arr.Length; j++)
                    {
                        if (cbl_symptoms.Items[i].Text == arr[j])
                        {
                            cbl_symptoms.Items[i].Selected = true;
                            break;
                        }
                    }
                }
                ddl_country.SelectedValue = dt.Rows[0]["patient_country"].ToString();
                BindState();
                ddl_state.SelectedValue = dt.Rows[0]["patient_state"].ToString();
                BindCity();
                ddl_city.SelectedValue = dt.Rows[0]["patient_city"].ToString();
                btn_save.Text = "Update";
                ViewState["id"] = e.CommandArgument;
            }
        }
    }
}