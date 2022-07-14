using Model.Entity;
using Model.Neg;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebFacturaMvc.Controllers
{
    public class InicioController : Controller
    {
        // GET: Inicio
        public ActionResult Index()
        {
            VentaNeg objVentaNeg = new VentaNeg();
            List<Venta> lista = objVentaNeg.findAll();
            return View(lista);
        }
        public ActionResult Inicio()
        {
            return View();
        }
        public ActionResult Nosotros()
        {
            return View();
        }

        public ActionResult Jonthan()
        {
            return View();
        }

        public ActionResult Axel()
        {
            return View();
        }
        public ActionResult Criss()
        {
            return View();
        }
        public ActionResult Ken()
        {
            return View();
        }
        public ActionResult Lupita()
        {
            return View();
        }
        public ActionResult Servicios()
        {
            return View();
        }
    }
}