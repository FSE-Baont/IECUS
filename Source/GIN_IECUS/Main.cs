using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraBars;
using System.Threading;

namespace GIN_IECUS
{
    public partial class Main : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public Main()
        {            
            InitializeComponent();
            //for(int i = 0;i<100; i++)
            //{
            //    Thread.Sleep(100);

            //}

        }

        private void Main_Load(object sender, EventArgs e)
        {
            Form.frmLogin frm = new Form.frmLogin();
            frm.ShowDialog();
        }

        private void btnContainerImport_ItemClick(object sender, ItemClickEventArgs e)
        {
            UserControl.Container.Import.Add uc = new UserControl.Container.Import.Add();
            ucMain.Controls.Add(uc);
            uc.Dock= DockStyle.Fill;
            //Controls.Add(uc);
        }

        private void btnLOCContainer_ItemClick(object sender, ItemClickEventArgs e)
        {
            Form.frmLocaltion frm = new Form.frmLocaltion();
            frm.ShowDialog();
        }
    }
}