using WebFacturaMvc.Controllers;
using WebFacturaMvc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebFacturaMvc.Filters
{

    public class VerificaSession : ActionFilterAttribute
    {
        private usuario oUsuario;
        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            try
            {
                base.OnActionExecuted(filterContext);

                oUsuario = (usuario)HttpContext.Current.Session["User"];
                if (oUsuario == null)
                {
                    if (filterContext.Controller is AccesoController == false)
                    {
                        filterContext.HttpContext.Response.Redirect("~/Acceso/Login");
                    }
                }
            }
            catch (Exception)
            {
                filterContext.Result = new RedirectResult("~/Acceso/Login");
            }

        }
    }
}