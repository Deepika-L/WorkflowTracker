//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WorkflowTracker
{
    using System;
    using System.Collections.Generic;
    
    public partial class StepStatusChangeJustification
    {
        public int JId { get; set; }
        public int StepId { get; set; }
        public int ChangedByUserId { get; set; }
        public System.DateTime ChangedAt { get; set; }
        public string BeforeChange { get; set; }
        public string AfterChange { get; set; }
    
        public virtual Step Steps { get; set; }
        public virtual User User { get; set; }
    }
}
