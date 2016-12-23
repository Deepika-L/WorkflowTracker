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
    
    public partial class Step
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Step()
        {
            this.StepChangeJustification = new HashSet<StepStatusChangeJustification>();
            this.StepComments = new HashSet<StepComment>();
        }
    
        public int StepId { get; set; }
        public int ProjId { get; set; }
        public System.DateTime EStart { get; set; }
        public System.DateTime EEnd { get; set; }
        public System.DateTime AStart { get; set; }
        public System.DateTime AEnd { get; set; }
        public string StepStatus { get; set; }
        public int StepType { get; set; }
    
        public virtual Project Project { get; set; }
        public virtual StepTemplate StepTemplates { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StepStatusChangeJustification> StepChangeJustification { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StepComment> StepComments { get; set; }
    }
}