using System;
using System.Drawing;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace Proyecto
{
    public partial class Create : Form
    {
        public Create()
        {
            InitializeComponent();
        }

        private void pictureBox10_Click(object sender, EventArgs e)
        {
           this.Hide();
        }

        private void pictureBox9_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }
        
        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();

        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private extern static void SendMessage(System.IntPtr hWnd, int wMsg, int wParam, int lParam);

        private void panel1_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void textBox1_Enter(object sender, EventArgs e)
        {
            if (textBox1.Text == "Numero de DUI...")
            {
                textBox1.Text = "";
                textBox1.ForeColor = Color.Black;
                
                
            }
        }

        private void textBox1_Leave_1(object sender, EventArgs e)
        {
            if (textBox1.Text == "")
            {
                textBox1.Text = "Numero de DUI...";
                textBox1.ForeColor = Color.Black;
                
                
            }
        }

        private void textBox2_Enter(object sender, EventArgs e)
        {
            if (textBox2.Text == "Nombre completo...")
            {
                textBox2.Text = "";
                textBox2.ForeColor = Color.Black;
                
                
            }
        }

        private void textBox2_Leave(object sender, EventArgs e)
        {
            if (textBox2.Text == "")
            {
                textBox2.Text = "Nombre completo...";
                textBox2.ForeColor = Color.Black;
                
                
            }
        }

        private void textBox3_Enter(object sender, EventArgs e)
        {
            if (textBox3.Text == "Dirección...")
            {
                textBox3.Text = "";
                textBox3.ForeColor = Color.Black;
               
                
            }
        }

        private void textBox3_Leave(object sender, EventArgs e)
        {
            if (textBox3.Text == "")
            {
                textBox3.Text = "Dirección...";
                textBox3.ForeColor = Color.Black;
              
                
            }
        }

        private void textBox4_Enter(object sender, EventArgs e)
        {
            if (textBox4.Text == "Numero de teléfono...")
            {
                textBox4.Text = "";
                textBox4.ForeColor = Color.Black;
               
                
            }
        }

        private void textBox4_Leave(object sender, EventArgs e)
        {
            if (textBox4.Text == "")
            {
                textBox4.Text = "Numero de teléfono...";
                textBox4.ForeColor = Color.Black;
                
                
            }
        }

        private void textBox5_Enter(object sender, EventArgs e)
        {
            if (textBox5.Text == "Correo electronico...")
            {
                textBox5.Text = "";
                textBox5.ForeColor = Color.Black;

            }
        }

        private void textBox5_Leave(object sender, EventArgs e)
        {
            if (textBox5.Text == "")
            {
                textBox5.Text = "Correo electronico...";
                textBox5.ForeColor = Color.Black;
                
                
            }
        }

        private void textBox6_Enter(object sender, EventArgs e)
        {
            if (textBox6.Text == "Enfermedades crónicas...")
            {
                textBox6.Text = "";
                textBox6.ForeColor = Color.Black;

            }        }

        private void textBox6_Leave(object sender, EventArgs e)
        {
            if (textBox6.Text == "")
            {
                textBox6.Text = "Enfermedades crónicas...";
                textBox6.ForeColor = Color.Black;
                
                
            }        }

        private void button1_Click(object sender, EventArgs e)
        {
            Date date = new Date();
            date.Show();
            this.Hide();
            
        }
    }
}