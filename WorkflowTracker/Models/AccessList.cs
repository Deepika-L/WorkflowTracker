//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WorkflowTracker.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class AccessList
    {
        public int ALId { get; set; }
        public int ProjId { get; set; }
        public int UserId { get; set; }
    
        public virtual Project Project { get; set; }
        public virtual User User { get; set; }
    }
}