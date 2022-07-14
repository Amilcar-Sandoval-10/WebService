using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebFacturaMvc.Models.ViewModels
{
    public class ListTablaViewModel
    {
        public int id_usuario { get; set; }
    
        public string nombre { get; set; }

        public string email { get; set;}

        public string password { get; set; }

        public string fecha { get; set;}
        
        public int id_rol { get; set;  }

    }
}