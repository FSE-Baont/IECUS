using System;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Net;
using System.Windows.Forms;

namespace GIN_IECUS.Form
{
    public partial class frmSetting : DevExpress.XtraEditors.XtraForm
    {
        private string serverName="";
        public frmSetting()
        {
            InitializeComponent();
        }

        private void btnCheckConnection_Click(object sender, EventArgs e)
        {
            try
            {
                int countIntance = 0;
                serverName = txtServerName.Text;
                if (serverName.ToUpper() == "LOCALHOST" || serverName.ToUpper() == "." || serverName.ToUpper() == ".\\")
                {
                    serverName = Environment.MachineName;
                }
                else
                {
                    if (ValidateIPv4(serverName))
                    {
                        IPHostEntry hostEntry = Dns.GetHostEntry(serverName);
                        serverName = hostEntry.HostName;
                    }
                }
                DataTable dt = SqlDataSourceEnumerator.Instance.GetDataSources();
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["ServerName"].ToString() == serverName)
                    {
                        cboInstance.Properties.Items.Add(dr["ServerName"].ToString() + "\\" + dr["InstanceName"].ToString());
                        countIntance++;
                    }
                }
                if (countIntance > 0)
                {
                    cboInstance.SelectedIndex = 0;
                    chkWindows.Checked = true;
                    showDB();
                }
                else
                {
                    MessageBox.Show("Connect server name fail!");
                }
            }catch(Exception ex)
            {
                MessageBox.Show("Connect server name fail! Error: "+ex.Message);
            }
        }
        public static bool ValidateIPv4(string ipString)
        {            
            IPAddress address;
            return IPAddress.TryParse(ipString, out address);
        }

        private void chkWindows_CheckedChanged(object sender, EventArgs e)
        {
            cboDatabase.Properties.Items.Clear();
            if (chkWindows.Checked)
            {
                chkSQL.Checked = false;
                txtUserName.Enabled = false;
                txtPassword.Enabled = false;
                showDB();
            }
            else
            {
                chkSQL.Checked = true;
                txtUserName.Enabled = true;
                txtPassword.Enabled = true;
            }
        }

        private void chkSQL_CheckedChanged(object sender, EventArgs e)
        {
            cboDatabase.Properties.Items.Clear();
            if (chkSQL.Checked)
            {
                chkWindows.Checked = false;
                txtUserName.Enabled = true;
                txtPassword.Enabled = true;
            }
            else
            {
                chkWindows.Checked = true;
                txtUserName.Enabled = false;
                txtPassword.Enabled = false;
                showDB();
            }
        }
        private void showDB()
        {
            try
            {
                int countDB = 0;
                string connectionString = "";
                if (chkWindows.Checked)
                    connectionString = "Data Source=" + cboInstance.SelectedItem.ToString() + "; Integrated Security=True;";
                else
                    connectionString = "server=" + cboInstance.SelectedItem.ToString() + ";uid=" + txtUserName.Text + ";pwd=" + txtPassword.Text;

                using (var connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    var command = new SqlCommand();
                    command.Connection = connection;
                    command.CommandType = CommandType.Text;
                    command.CommandText = "SELECT name FROM master.sys.databases";

                    var adapter = new SqlDataAdapter(command);
                    var dataset = new DataSet();
                    adapter.Fill(dataset);
                    DataTable dt = dataset.Tables[0];
                    foreach (DataRow dr in dt.Rows)
                    {
                        cboDatabase.Properties.Items.Add(dr[0].ToString());
                        countDB++;
                    }
                    if (countDB > 1)
                        cboDatabase.SelectedIndex = 0;

                    connection.Close();
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show("Connect database server fail! Error: "+ex.Message);
            }
        }

        private void cboInstance_SelectedIndexChanged(object sender, EventArgs e)
        {
            chkWindows.Checked = true;
            showDB();
        }

        private void txtUserName_Leave(object sender, EventArgs e)
        {
            if (txtUserName.Text != "" && txtPassword.Text != "")
                showDB();
        }

        private void txtPassword_Leave(object sender, EventArgs e)
        {
            if (txtUserName.Text != "" && txtPassword.Text != "")
                showDB();
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnTestConnect_Click(object sender, EventArgs e)
        {
            try
            {
                string connectionString = "";
                if (chkWindows.Checked)
                    connectionString = "Data Source=" + cboInstance.SelectedItem.ToString() + "; Integrated Security=True;Initial Catalog="+cboDatabase.SelectedItem.ToString()+";";
                else
                    connectionString = "server=" + cboInstance.SelectedItem.ToString() + ";uid=" + txtUserName.Text + ";pwd=" + txtPassword.Text+ ";Initial Catalog=" + cboDatabase.SelectedItem.ToString() + ";";

                using (var connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    MessageBox.Show("Test connection successful!");
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show("Connect database server fail! Error: " + ex.Message);
            }
        }

        private void btnCreateDB_Click(object sender, EventArgs e)
        {

        }
    }
}