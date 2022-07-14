using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebFacturaMvc.Controllers
{
    public class AccesoController : Controller
    {
        // GET: Acceso
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string User, string Pass)
        {
            try
            {
                using (Models.ventasEntities2 db = new Models.ventasEntities2())
                {
                    var oUser = (from d in db.usuario
                                 where d.email == User.Trim() && d.password == Pass.Trim()
                                 select d).FirstOrDefault();
                    if (oUser == null)
                    {
                        ViewBag.Error = "Usuario o contraseña invalida";
                        return View();
                    }

                    Session["User"] = oUser;

                }
                return RedirectToAction("Index", "Inicio");



            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View();
            }

        }

        [HttpPost]
        public ActionResult LoginAdmi(string User , string Pass)
        {
            try
            {
                using (Models.ventasEntities2 db = new Models.ventasEntities2())
                {
                    var oUser = (from d in db.usuario
                                 where d.email == User.Trim() && d.password == Pass.Trim() && d.id_rol == 1
                                 select d).FirstOrDefault();
                    if (oUser == null)
                    {
                        ViewBag.Error = "Usuario o contraseña invalida";
                        return View();
                    }

                    Session["User"] = oUser;

                }

                return RedirectToAction("Usuario", "Table");
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View();
            }


        }

    }
}