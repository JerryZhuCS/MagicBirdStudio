//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MagicBirdStudio.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class menuinfo
    {
        public int MenuID { get; set; }
        public string MenuName { get; set; }
        public string WebPath { get; set; }
        public string MenuICON { get; set; }
        public string Description { get; set; }
        public Nullable<int> ParentMenu { get; set; }
        public int MenuSort { get; set; }
        public bool isEffective { get; set; }
    
        public virtual permissioninfo permissioninfo { get; set; }
    }
}
