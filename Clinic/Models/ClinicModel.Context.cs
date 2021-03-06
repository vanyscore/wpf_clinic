﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Clinic.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ClinicModelContainer : DbContext
    {
        public ClinicModelContainer()
            : base("name=ClinicModelContainer")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Doctor> Doctors { get; set; }
        public virtual DbSet<Special> Specials { get; set; }
        public virtual DbSet<PatientCard> PatientCards { get; set; }
        public virtual DbSet<Sex> SexSet { get; set; }
        public virtual DbSet<CardPage> CardPages { get; set; }
        public virtual DbSet<Site> Sites { get; set; }
        public virtual DbSet<SiteAddress> SiteAddresses { get; set; }
        public virtual DbSet<Address> AddressSet { get; set; }
        public virtual DbSet<Surgery> Surgeries { get; set; }
        public virtual DbSet<DistrictSchedule> DistrictSchedules { get; set; }
        public virtual DbSet<DoctorType> DoctorTypes { get; set; }
        public virtual DbSet<SiteDoctors> SiteDoctors { get; set; }
    }
}
