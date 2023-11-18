﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial_2
{
    public partial class GestionArchivos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarGrillaArchivos();
        }

        public void CargarGrillaArchivos()
        {
            if (this.Session["username"] != null)
            {
                string path = $"{Server.MapPath(".")}/{this.Session["username"].ToString()}";

                if (Directory.Exists(path))
                {
                    string[] archivos = Directory.GetFiles(path);
                    List<Archivo> listaArchivos = new List<Archivo>();
                    foreach (var archivo in archivos)
                    {
                        var nuevoArchivo = new Archivo(Path.GetFileName(archivo), archivo);
                        listaArchivos.Add(nuevoArchivo);
                    }
                    GridView1.DataSource = listaArchivos;
                    GridView1.DataBind();
                }
            }
            else
            {
                Button1.Enabled = false;
                Label2.Text = "Ud no está registrado, por favor complete el formulario de Registración";
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string path = $"{Server.MapPath(".")}/{this.Session["username"]}"; 
            string result = string.Empty ;

            if (Directory.Exists(path))
            {
                foreach (HttpPostedFile archivo in FileUpload1.PostedFiles)
                {
                    if (File.Exists($"{path}/{archivo.FileName}"))
                    {
                        result += $"El archivo {archivo.FileName} ya existe - ";
                    }
                    else
                    {
                        FileUpload1.SaveAs($"{path}/{archivo.FileName}");
                        result += $" Se subió el archivo {archivo.FileName} - ";
                    }
                }
                
                Label2.Text = result ;
                CargarGrillaArchivos();
            }
            else
            {
                Directory.CreateDirectory(path);

                foreach (HttpPostedFile archivo in FileUpload1.PostedFiles)
                {
                    FileUpload1.SaveAs($"{path}/{archivo.FileName}");

                    result += $" Se subió el archivo {archivo.FileName} - ";
                }
                Label2.Text = result ;
                CargarGrillaArchivos();

            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName =="Descargar")
            {
                GridViewRow registro = GridView1.Rows[Convert.ToInt32(e.CommandArgument)];
                string filePath = registro.Cells[2].Text;

                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
                Response.TransmitFile(filePath);
                Response.End();
            }
        }
    }
}