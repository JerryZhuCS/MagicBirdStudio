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
    
    public partial class roleinfo
    {
        public roleinfo()
        {
            this.groupmanager = new HashSet<groupmanager>();
        }
    
        public int RoleID { get; set; }
        public string RoleName { get; set; }
        public string RoleDescription { get; set; }
    
        public virtual ICollection<groupmanager> groupmanager { get; set; }
        public virtual permissioninfo permissioninfo { get; set; }
    }
}
