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
    
    public partial class stockerrorinformation
    {
        public int ID { get; set; }
        public string BatchID { get; set; }
        public int ErrorAmount { get; set; }
        public string UserID { get; set; }
        public string ErrorStep { get; set; }
        public string Remark { get; set; }
        public System.DateTime AddTime { get; set; }
    
        public virtual batchinformation batchinformation { get; set; }
        public virtual usermanagement usermanagement { get; set; }
    }
}
