using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebFacturaMvc.Models.ViewModels
{
    public class TablaViewModel
    {

        public int id_usuario { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name = "Nombre")]
        public string Nombre { get; set; }

        [Required]
        [StringLength(50)]
        [EmailAddress]
        [Display(Name = "Correo electrónico")]
        public string Email { get; set; }

        //
       
        [Required]
        [StringLength(0, ErrorMessage = "The ThumbnailPhotoFileName value cannot exceed 4 characters. ")]

        //public int MinimumLength { get; set; }
        //[ScaffoldColumn(true)]
        //[StringLength(4,  ErrorMessage = "The ThumbnailPhotoFileName value cannot exceed 4 characters. ")]
        //public object ThumbnailPhotoFileName;


        //[ScaffoldColumn(true)]
        //[StringLength(4, ErrorMessage = "The {0} value cannot exceed {1} characters. ")]
        //public object PhotoFileName;

        [Display(Name = "Contraseña")]
        public string password { get; set; }
   


    [Required]
        [StringLength(50)]
        [Display(Name = "Fecha")]
        public string Fecha { get; set; }

        public int id_rol { get; set; }

    }
}