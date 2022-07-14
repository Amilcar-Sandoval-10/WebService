using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebFacturaMvc.Models.ViewModels;
using WebFacturaMvc.Models;
using System.Security.Cryptography;
using System.Text;





namespace WebFacturaMvc.Controllers
{
    public class TableController : Controller
    {
        private object manager;

        // GET: Table
        public ActionResult Usuario()
        {
            
            List<ListTablaViewModel> lst;
            using (ventasEntities2 db = new ventasEntities2())
            {
                lst = (from d in db.usuario
                       select new ListTablaViewModel
                       {
                           id_usuario = d.id_usuario,
                           nombre = d.nombre,
                           email = d.email,
                           password=d.password,
                           fecha = d.fecha,
                           id_rol = d.id_rol,
                           

                       }).ToList();
            }

            return View(lst);
        }



        public ActionResult Nuevo()
        {

            return View();
        }

        [HttpPost]
        public ActionResult Nuevo(TablaViewModel model)
        {
           
            try
            {
                if (ModelState.IsValid)
                {

                   
                    //var cadenaEncriptada = new Encrypt
                    using (ventasEntities2 db = new ventasEntities2())
                    {
                        
                        var oTabla = new usuario();                        
                        oTabla.nombre = model.Nombre;
                        oTabla.email = model.Email;
                        oTabla.password = model.password;

                        oTabla.fecha = model.Fecha;
                        oTabla.id_rol = model.id_rol;
                        

                        db.usuario.Add(oTabla);
                        db.SaveChanges();
                    }

                    return Redirect("Usuario");
                }

                return View(model);


            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public ActionResult Editar(string email)
        {
            TablaViewModel model = new TablaViewModel();
            using (ventasEntities2 db = new ventasEntities2())
            {
                var oTabla = db.usuario.Find(email);

                model.id_usuario = oTabla.id_usuario;
                model.Nombre = oTabla.nombre;
                model.Email = oTabla.email;
                model.password = oTabla.password;
                model.Fecha = oTabla.fecha;
                model.id_rol = oTabla.id_rol;
            }
            return View(model);
        }

        [HttpPost]
        public ActionResult Editar(TablaViewModel model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    using (ventasEntities2 db = new ventasEntities2())
                    {
                        var oTabla = db.usuario.Find(model.id_usuario);
                        oTabla.id_usuario = oTabla.id_usuario;
                        oTabla.nombre = oTabla.nombre;
                        oTabla.email = oTabla.email;
                        oTabla.password = oTabla.password;
                        oTabla.fecha = oTabla.fecha;
                        oTabla.id_rol = oTabla.id_rol;


                        db.Entry(oTabla).State = System.Data.Entity.EntityState.Modified;
                        db.SaveChanges();
                    }

                    return Redirect("Usuario");
                }

                return View(model);


            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }


        [HttpGet]
        public ActionResult Eliminar(int id_usuario)
        {
            using (ventasEntities2 db = new ventasEntities2())
            {

                var oTabla = db.usuario.Find(id_usuario);
                db.usuario.Remove(oTabla);
                db.SaveChanges();
            }
            return Redirect("Usuario");
        }

    }
}