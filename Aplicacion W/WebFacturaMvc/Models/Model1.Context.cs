﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class ventasEntities2 : DbContext
    {
        public ventasEntities2()
            : base("name=ventasEntities2")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<categoria> categoria { get; set; }
        public virtual DbSet<cliente> cliente { get; set; }
        public virtual DbSet<detalleVenta> detalleVenta { get; set; }
        public virtual DbSet<factura> factura { get; set; }
        public virtual DbSet<modoPago> modoPago { get; set; }
        public virtual DbSet<modulo> modulo { get; set; }
        public virtual DbSet<operaciones> operaciones { get; set; }
        public virtual DbSet<producto> producto { get; set; }
        public virtual DbSet<rol> rol { get; set; }
        public virtual DbSet<rol_operaciones> rol_operaciones { get; set; }
        public virtual DbSet<usuario> usuario { get; set; }
        public virtual DbSet<vendedor> vendedor { get; set; }
        public virtual DbSet<venta> venta { get; set; }
    
        public virtual int reporte_factura(string idPedido)
        {
            var idPedidoParameter = idPedido != null ?
                new ObjectParameter("idPedido", idPedido) :
                new ObjectParameter("idPedido", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("reporte_factura", idPedidoParameter);
        }
    
        public virtual ObjectResult<sp_lista_clientes_Result> sp_lista_clientes(Nullable<int> pageIndex, Nullable<int> pageSize, ObjectParameter pageCount)
        {
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("pageIndex", pageIndex) :
                new ObjectParameter("pageIndex", typeof(int));
    
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("pageSize", pageSize) :
                new ObjectParameter("pageSize", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_lista_clientes_Result>("sp_lista_clientes", pageIndexParameter, pageSizeParameter, pageCount);
        }
    
        public virtual ObjectResult<sp_producto_categoria_Result> sp_producto_categoria(string idCategoria)
        {
            var idCategoriaParameter = idCategoria != null ?
                new ObjectParameter("idCategoria", idCategoria) :
                new ObjectParameter("idCategoria", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_producto_categoria_Result>("sp_producto_categoria", idCategoriaParameter);
        }
    
        public virtual ObjectResult<sp_reporte_venta_Result> sp_reporte_venta(Nullable<decimal> idVenta)
        {
            var idVentaParameter = idVenta.HasValue ?
                new ObjectParameter("idVenta", idVenta) :
                new ObjectParameter("idVenta", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_reporte_venta_Result>("sp_reporte_venta", idVentaParameter);
        }
    }
}