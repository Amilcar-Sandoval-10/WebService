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
    
    public partial class factura
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public factura()
        {
            this.detalleVenta = new HashSet<detalleVenta>();
        }
    
        public decimal numFactura { get; set; }
        public System.DateTime fecha { get; set; }
        public float IVA { get; set; }
        public float total { get; set; }
        public int numPago { get; set; }
        public Nullable<decimal> descuento { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<detalleVenta> detalleVenta { get; set; }
        public virtual modoPago modoPago { get; set; }
    }
}
