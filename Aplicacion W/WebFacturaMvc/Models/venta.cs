//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebFacturaMvc.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class venta
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public venta()
        {
            this.detalleVenta = new HashSet<detalleVenta>();
        }
    
        public decimal idVenta { get; set; }
        public float total { get; set; }
        public decimal idCliente { get; set; }
        public string idVendedor { get; set; }
        public System.DateTime fecha { get; set; }
        public decimal IVA { get; set; }
    
        public virtual cliente cliente { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<detalleVenta> detalleVenta { get; set; }
        public virtual vendedor vendedor { get; set; }
    }
}
