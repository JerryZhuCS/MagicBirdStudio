//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace KO_ERP_INVENTORY.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class componentinformation
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public componentinformation()
        {
            this.batchinformations = new HashSet<batchinformation>();
        }
    
        public string ComponentID { get; set; }
        public string ComponentTypeName { get; set; }
        public string ComponentTypeAb { get; set; }
        public string ComponentSpec { get; set; }
        public string PinPackage { get; set; }
        public string ComponentRemarks { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<batchinformation> batchinformations { get; set; }
        public virtual vendorinformation vendorinformation { get; set; }
    }
}