
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/03/2020 20:02:03
-- Generated from EDMX file: I:\Work\Projects\C# Projects\Курсовые\Курсовая 2 курс\Clinic\Clinic\Models\ClinicModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ClinicDatabase];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_DoctorCategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Doctors] DROP CONSTRAINT [FK_DoctorCategory];
GO
IF OBJECT_ID(N'[dbo].[FK_DoctorSpecial]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Doctors] DROP CONSTRAINT [FK_DoctorSpecial];
GO
IF OBJECT_ID(N'[dbo].[FK_SexPatientCard]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PatientCards] DROP CONSTRAINT [FK_SexPatientCard];
GO
IF OBJECT_ID(N'[dbo].[FK_PatientCardCardPage]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CardPages] DROP CONSTRAINT [FK_PatientCardCardPage];
GO
IF OBJECT_ID(N'[dbo].[FK_CardPageDoctor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CardPages] DROP CONSTRAINT [FK_CardPageDoctor];
GO
IF OBJECT_ID(N'[dbo].[FK_AddressSiteAdresses]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SiteAddresses] DROP CONSTRAINT [FK_AddressSiteAdresses];
GO
IF OBJECT_ID(N'[dbo].[FK_SiteSiteAdresses]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SiteAddresses] DROP CONSTRAINT [FK_SiteSiteAdresses];
GO
IF OBJECT_ID(N'[dbo].[FK_AddressPatientCard]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PatientCards] DROP CONSTRAINT [FK_AddressPatientCard];
GO
IF OBJECT_ID(N'[dbo].[FK_SurgeryDistrictSchedule]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DistrictSchedules] DROP CONSTRAINT [FK_SurgeryDistrictSchedule];
GO
IF OBJECT_ID(N'[dbo].[FK_DoctorDistrictSchedule]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DistrictSchedules] DROP CONSTRAINT [FK_DoctorDistrictSchedule];
GO
IF OBJECT_ID(N'[dbo].[FK_DoctorTypeDoctor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Doctors] DROP CONSTRAINT [FK_DoctorTypeDoctor];
GO
IF OBJECT_ID(N'[dbo].[FK_DoctorSiteDoctors]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DistrictDoctors] DROP CONSTRAINT [FK_DoctorSiteDoctors];
GO
IF OBJECT_ID(N'[dbo].[FK_SiteSiteDoctors]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DistrictDoctors] DROP CONSTRAINT [FK_SiteSiteDoctors];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categories];
GO
IF OBJECT_ID(N'[dbo].[Doctors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Doctors];
GO
IF OBJECT_ID(N'[dbo].[Specials]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Specials];
GO
IF OBJECT_ID(N'[dbo].[PatientCards]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PatientCards];
GO
IF OBJECT_ID(N'[dbo].[SexSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SexSet];
GO
IF OBJECT_ID(N'[dbo].[CardPages]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CardPages];
GO
IF OBJECT_ID(N'[dbo].[Sites]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Sites];
GO
IF OBJECT_ID(N'[dbo].[SiteAddresses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SiteAddresses];
GO
IF OBJECT_ID(N'[dbo].[AddressSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AddressSet];
GO
IF OBJECT_ID(N'[dbo].[Surgeries]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Surgeries];
GO
IF OBJECT_ID(N'[dbo].[DistrictSchedules]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DistrictSchedules];
GO
IF OBJECT_ID(N'[dbo].[DoctorTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DoctorTypes];
GO
IF OBJECT_ID(N'[dbo].[DistrictDoctors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DistrictDoctors];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [CategoryId] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Doctors'
CREATE TABLE [dbo].[Doctors] (
    [DoctorId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Surname] nvarchar(max)  NOT NULL,
    [Patrynum] nvarchar(max)  NOT NULL,
    [SpecialId] int  NOT NULL,
    [CategoryId] int  NOT NULL,
    [Expirience] int  NOT NULL,
    [BirthDate] datetime  NOT NULL,
    [Icon] nvarchar(max)  NOT NULL,
    [DoctorTypeId] int  NOT NULL,
    [Category_CategoryId] int  NOT NULL,
    [Special_SpecialId] int  NOT NULL,
    [DoctorType_DoctorTypeId] int  NOT NULL
);
GO

-- Creating table 'Specials'
CREATE TABLE [dbo].[Specials] (
    [SpecialId] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PatientCards'
CREATE TABLE [dbo].[PatientCards] (
    [PatientCardId] int IDENTITY(1,1) NOT NULL,
    [Number] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Surname] nvarchar(max)  NOT NULL,
    [Patrynum] nvarchar(max)  NOT NULL,
    [AddressId] int  NOT NULL,
    [SexId] int  NOT NULL,
    [Age] int  NOT NULL,
    [Icon] nvarchar(max)  NOT NULL,
    [Sex_SexId] int  NOT NULL,
    [Address_AddressId] int  NOT NULL
);
GO

-- Creating table 'SexSet'
CREATE TABLE [dbo].[SexSet] (
    [SexId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CardPages'
CREATE TABLE [dbo].[CardPages] (
    [CardPageId] int IDENTITY(1,1) NOT NULL,
    [PatientCardId] int  NOT NULL,
    [PageNumber] int  NOT NULL,
    [Date] datetime  NOT NULL,
    [Complaints] nvarchar(max)  NOT NULL,
    [Diagnosis] nvarchar(max)  NOT NULL,
    [Treatment] nvarchar(max)  NOT NULL,
    [DoctorId] int  NOT NULL,
    [PatientCard_PatientCardId] int  NOT NULL,
    [Doctor_DoctorId] int  NOT NULL
);
GO

-- Creating table 'Sites'
CREATE TABLE [dbo].[Sites] (
    [SiteId] int IDENTITY(1,1) NOT NULL,
    [Number] int  NOT NULL
);
GO

-- Creating table 'SiteAddresses'
CREATE TABLE [dbo].[SiteAddresses] (
    [SiteAddressId] int IDENTITY(1,1) NOT NULL,
    [SiteId] int  NOT NULL,
    [AddressId] int  NOT NULL,
    [Address_AddressId] int  NOT NULL,
    [Site_SiteId] int  NOT NULL
);
GO

-- Creating table 'AddressSet'
CREATE TABLE [dbo].[AddressSet] (
    [AddressId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Surgeries'
CREATE TABLE [dbo].[Surgeries] (
    [SurgeryId] int IDENTITY(1,1) NOT NULL,
    [Number] int  NOT NULL
);
GO

-- Creating table 'DistrictSchedules'
CREATE TABLE [dbo].[DistrictSchedules] (
    [DistrictScheduleId] int IDENTITY(1,1) NOT NULL,
    [SurgeryId] int  NOT NULL,
    [DoctorId] int  NOT NULL,
    [ReceiptDate] datetime  NOT NULL,
    [Surgery_SurgeryId] int  NOT NULL,
    [Doctor_DoctorId] int  NOT NULL
);
GO

-- Creating table 'DoctorTypes'
CREATE TABLE [dbo].[DoctorTypes] (
    [DoctorTypeId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SiteDoctors'
CREATE TABLE [dbo].[SiteDoctors] (
    [SiteDoctorId] int IDENTITY(1,1) NOT NULL,
    [DoctorId] int  NOT NULL,
    [SiteId] int  NOT NULL,
    [Doctor_DoctorId] int  NOT NULL,
    [Site_SiteId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CategoryId] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([CategoryId] ASC);
GO

-- Creating primary key on [DoctorId] in table 'Doctors'
ALTER TABLE [dbo].[Doctors]
ADD CONSTRAINT [PK_Doctors]
    PRIMARY KEY CLUSTERED ([DoctorId] ASC);
GO

-- Creating primary key on [SpecialId] in table 'Specials'
ALTER TABLE [dbo].[Specials]
ADD CONSTRAINT [PK_Specials]
    PRIMARY KEY CLUSTERED ([SpecialId] ASC);
GO

-- Creating primary key on [PatientCardId] in table 'PatientCards'
ALTER TABLE [dbo].[PatientCards]
ADD CONSTRAINT [PK_PatientCards]
    PRIMARY KEY CLUSTERED ([PatientCardId] ASC);
GO

-- Creating primary key on [SexId] in table 'SexSet'
ALTER TABLE [dbo].[SexSet]
ADD CONSTRAINT [PK_SexSet]
    PRIMARY KEY CLUSTERED ([SexId] ASC);
GO

-- Creating primary key on [CardPageId] in table 'CardPages'
ALTER TABLE [dbo].[CardPages]
ADD CONSTRAINT [PK_CardPages]
    PRIMARY KEY CLUSTERED ([CardPageId] ASC);
GO

-- Creating primary key on [SiteId] in table 'Sites'
ALTER TABLE [dbo].[Sites]
ADD CONSTRAINT [PK_Sites]
    PRIMARY KEY CLUSTERED ([SiteId] ASC);
GO

-- Creating primary key on [SiteAddressId] in table 'SiteAddresses'
ALTER TABLE [dbo].[SiteAddresses]
ADD CONSTRAINT [PK_SiteAddresses]
    PRIMARY KEY CLUSTERED ([SiteAddressId] ASC);
GO

-- Creating primary key on [AddressId] in table 'AddressSet'
ALTER TABLE [dbo].[AddressSet]
ADD CONSTRAINT [PK_AddressSet]
    PRIMARY KEY CLUSTERED ([AddressId] ASC);
GO

-- Creating primary key on [SurgeryId] in table 'Surgeries'
ALTER TABLE [dbo].[Surgeries]
ADD CONSTRAINT [PK_Surgeries]
    PRIMARY KEY CLUSTERED ([SurgeryId] ASC);
GO

-- Creating primary key on [DistrictScheduleId] in table 'DistrictSchedules'
ALTER TABLE [dbo].[DistrictSchedules]
ADD CONSTRAINT [PK_DistrictSchedules]
    PRIMARY KEY CLUSTERED ([DistrictScheduleId] ASC);
GO

-- Creating primary key on [DoctorTypeId] in table 'DoctorTypes'
ALTER TABLE [dbo].[DoctorTypes]
ADD CONSTRAINT [PK_DoctorTypes]
    PRIMARY KEY CLUSTERED ([DoctorTypeId] ASC);
GO

-- Creating primary key on [SiteDoctorId] in table 'SiteDoctors'
ALTER TABLE [dbo].[SiteDoctors]
ADD CONSTRAINT [PK_SiteDoctors]
    PRIMARY KEY CLUSTERED ([SiteDoctorId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Category_CategoryId] in table 'Doctors'
ALTER TABLE [dbo].[Doctors]
ADD CONSTRAINT [FK_DoctorCategory]
    FOREIGN KEY ([Category_CategoryId])
    REFERENCES [dbo].[Categories]
        ([CategoryId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DoctorCategory'
CREATE INDEX [IX_FK_DoctorCategory]
ON [dbo].[Doctors]
    ([Category_CategoryId]);
GO

-- Creating foreign key on [Special_SpecialId] in table 'Doctors'
ALTER TABLE [dbo].[Doctors]
ADD CONSTRAINT [FK_DoctorSpecial]
    FOREIGN KEY ([Special_SpecialId])
    REFERENCES [dbo].[Specials]
        ([SpecialId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DoctorSpecial'
CREATE INDEX [IX_FK_DoctorSpecial]
ON [dbo].[Doctors]
    ([Special_SpecialId]);
GO

-- Creating foreign key on [Sex_SexId] in table 'PatientCards'
ALTER TABLE [dbo].[PatientCards]
ADD CONSTRAINT [FK_SexPatientCard]
    FOREIGN KEY ([Sex_SexId])
    REFERENCES [dbo].[SexSet]
        ([SexId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SexPatientCard'
CREATE INDEX [IX_FK_SexPatientCard]
ON [dbo].[PatientCards]
    ([Sex_SexId]);
GO

-- Creating foreign key on [PatientCard_PatientCardId] in table 'CardPages'
ALTER TABLE [dbo].[CardPages]
ADD CONSTRAINT [FK_PatientCardCardPage]
    FOREIGN KEY ([PatientCard_PatientCardId])
    REFERENCES [dbo].[PatientCards]
        ([PatientCardId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PatientCardCardPage'
CREATE INDEX [IX_FK_PatientCardCardPage]
ON [dbo].[CardPages]
    ([PatientCard_PatientCardId]);
GO

-- Creating foreign key on [Doctor_DoctorId] in table 'CardPages'
ALTER TABLE [dbo].[CardPages]
ADD CONSTRAINT [FK_CardPageDoctor]
    FOREIGN KEY ([Doctor_DoctorId])
    REFERENCES [dbo].[Doctors]
        ([DoctorId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CardPageDoctor'
CREATE INDEX [IX_FK_CardPageDoctor]
ON [dbo].[CardPages]
    ([Doctor_DoctorId]);
GO

-- Creating foreign key on [Address_AddressId] in table 'SiteAddresses'
ALTER TABLE [dbo].[SiteAddresses]
ADD CONSTRAINT [FK_AddressSiteAdresses]
    FOREIGN KEY ([Address_AddressId])
    REFERENCES [dbo].[AddressSet]
        ([AddressId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AddressSiteAdresses'
CREATE INDEX [IX_FK_AddressSiteAdresses]
ON [dbo].[SiteAddresses]
    ([Address_AddressId]);
GO

-- Creating foreign key on [Site_SiteId] in table 'SiteAddresses'
ALTER TABLE [dbo].[SiteAddresses]
ADD CONSTRAINT [FK_SiteSiteAdresses]
    FOREIGN KEY ([Site_SiteId])
    REFERENCES [dbo].[Sites]
        ([SiteId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SiteSiteAdresses'
CREATE INDEX [IX_FK_SiteSiteAdresses]
ON [dbo].[SiteAddresses]
    ([Site_SiteId]);
GO

-- Creating foreign key on [Address_AddressId] in table 'PatientCards'
ALTER TABLE [dbo].[PatientCards]
ADD CONSTRAINT [FK_AddressPatientCard]
    FOREIGN KEY ([Address_AddressId])
    REFERENCES [dbo].[AddressSet]
        ([AddressId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AddressPatientCard'
CREATE INDEX [IX_FK_AddressPatientCard]
ON [dbo].[PatientCards]
    ([Address_AddressId]);
GO

-- Creating foreign key on [Surgery_SurgeryId] in table 'DistrictSchedules'
ALTER TABLE [dbo].[DistrictSchedules]
ADD CONSTRAINT [FK_SurgeryDistrictSchedule]
    FOREIGN KEY ([Surgery_SurgeryId])
    REFERENCES [dbo].[Surgeries]
        ([SurgeryId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SurgeryDistrictSchedule'
CREATE INDEX [IX_FK_SurgeryDistrictSchedule]
ON [dbo].[DistrictSchedules]
    ([Surgery_SurgeryId]);
GO

-- Creating foreign key on [Doctor_DoctorId] in table 'DistrictSchedules'
ALTER TABLE [dbo].[DistrictSchedules]
ADD CONSTRAINT [FK_DoctorDistrictSchedule]
    FOREIGN KEY ([Doctor_DoctorId])
    REFERENCES [dbo].[Doctors]
        ([DoctorId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DoctorDistrictSchedule'
CREATE INDEX [IX_FK_DoctorDistrictSchedule]
ON [dbo].[DistrictSchedules]
    ([Doctor_DoctorId]);
GO

-- Creating foreign key on [DoctorType_DoctorTypeId] in table 'Doctors'
ALTER TABLE [dbo].[Doctors]
ADD CONSTRAINT [FK_DoctorTypeDoctor]
    FOREIGN KEY ([DoctorType_DoctorTypeId])
    REFERENCES [dbo].[DoctorTypes]
        ([DoctorTypeId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DoctorTypeDoctor'
CREATE INDEX [IX_FK_DoctorTypeDoctor]
ON [dbo].[Doctors]
    ([DoctorType_DoctorTypeId]);
GO

-- Creating foreign key on [Doctor_DoctorId] in table 'SiteDoctors'
ALTER TABLE [dbo].[SiteDoctors]
ADD CONSTRAINT [FK_DoctorSiteDoctors]
    FOREIGN KEY ([Doctor_DoctorId])
    REFERENCES [dbo].[Doctors]
        ([DoctorId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DoctorSiteDoctors'
CREATE INDEX [IX_FK_DoctorSiteDoctors]
ON [dbo].[SiteDoctors]
    ([Doctor_DoctorId]);
GO

-- Creating foreign key on [Site_SiteId] in table 'SiteDoctors'
ALTER TABLE [dbo].[SiteDoctors]
ADD CONSTRAINT [FK_SiteSiteDoctors]
    FOREIGN KEY ([Site_SiteId])
    REFERENCES [dbo].[Sites]
        ([SiteId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SiteSiteDoctors'
CREATE INDEX [IX_FK_SiteSiteDoctors]
ON [dbo].[SiteDoctors]
    ([Site_SiteId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------