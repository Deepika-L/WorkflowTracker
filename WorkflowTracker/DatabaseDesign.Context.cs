﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class MyDesignContainer : DbContext
    {
        public MyDesignContainer()
            : base("name=MyDesignContainer")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<UserLogin> UserLogins { get; set; }
        public virtual DbSet<UserRole> UserRoles { get; set; }
        public virtual DbSet<Project> Projects { get; set; }
        public virtual DbSet<Step> Steps { get; set; }
        public virtual DbSet<StepTemplate> StepTemplates { get; set; }
        public virtual DbSet<StepStatusChangeJustification> StepStatusChangeJustifications { get; set; }
        public virtual DbSet<StepComment> StepComments { get; set; }
        public virtual DbSet<AccessList> AccessLists { get; set; }
    }
}
