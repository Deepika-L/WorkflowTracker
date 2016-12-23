
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/12/2016 01:40:48
-- Generated from EDMX file: C:\Users\Deepika\Desktop\WorkflowTracker\WorkflowTracker\DatabaseDesign.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [dlakshmaDataBase];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UserUserLogin]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_UserUserLogin];
GO
IF OBJECT_ID(N'[dbo].[FK_UserUserRole]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_UserUserRole];
GO
IF OBJECT_ID(N'[dbo].[FK_ProjectStep]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Steps] DROP CONSTRAINT [FK_ProjectStep];
GO
IF OBJECT_ID(N'[dbo].[FK_StepStepTemplate]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Steps] DROP CONSTRAINT [FK_StepStepTemplate];
GO
IF OBJECT_ID(N'[dbo].[FK_StepChangeJustificationStep]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StepStatusChangeJustifications] DROP CONSTRAINT [FK_StepChangeJustificationStep];
GO
IF OBJECT_ID(N'[dbo].[FK_UserStepChangeJustification]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StepStatusChangeJustifications] DROP CONSTRAINT [FK_UserStepChangeJustification];
GO
IF OBJECT_ID(N'[dbo].[FK_StepStepComment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StepComments] DROP CONSTRAINT [FK_StepStepComment];
GO
IF OBJECT_ID(N'[dbo].[FK_UserStepComment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StepComments] DROP CONSTRAINT [FK_UserStepComment];
GO
IF OBJECT_ID(N'[dbo].[FK_UserAccessList]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AccessLists] DROP CONSTRAINT [FK_UserAccessList];
GO
IF OBJECT_ID(N'[dbo].[FK_ProjectAccessList]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AccessLists] DROP CONSTRAINT [FK_ProjectAccessList];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[UserLogins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserLogins];
GO
IF OBJECT_ID(N'[dbo].[UserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserRoles];
GO
IF OBJECT_ID(N'[dbo].[Projects]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Projects];
GO
IF OBJECT_ID(N'[dbo].[Steps]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Steps];
GO
IF OBJECT_ID(N'[dbo].[StepTemplates]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StepTemplates];
GO
IF OBJECT_ID(N'[dbo].[StepStatusChangeJustifications]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StepStatusChangeJustifications];
GO
IF OBJECT_ID(N'[dbo].[StepComments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StepComments];
GO
IF OBJECT_ID(N'[dbo].[AccessLists]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AccessLists];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [UserId] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [UserType] int  NOT NULL,
    [UserEmail] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'UserLogins'
CREATE TABLE [dbo].[UserLogins] (
    [UserId] int IDENTITY(1,1) NOT NULL,
    [Login] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [LastLogin] datetime  NOT NULL
);
GO

-- Creating table 'UserRoles'
CREATE TABLE [dbo].[UserRoles] (
    [RoleId] int IDENTITY(1,1) NOT NULL,
    [RoleType] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Projects'
CREATE TABLE [dbo].[Projects] (
    [ProjId] int IDENTITY(1,1) NOT NULL,
    [ProjName] nvarchar(max)  NOT NULL,
    [CreatedBy] int  NOT NULL,
    [CreatedOn] datetime  NOT NULL,
    [COEstimate] datetime  NOT NULL,
    [CCEstimate] nvarchar(max)  NOT NULL,
    [CActual] datetime  NOT NULL,
    [ProgressPercent] nvarchar(max)  NOT NULL,
    [ProjStatus] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Steps'
CREATE TABLE [dbo].[Steps] (
    [StepId] int IDENTITY(1,1) NOT NULL,
    [ProjId] int  NOT NULL,
    [EStart] datetime  NOT NULL,
    [EEnd] datetime  NOT NULL,
    [AStart] datetime  NOT NULL,
    [AEnd] datetime  NOT NULL,
    [StepStatus] nvarchar(max)  NOT NULL,
    [StepType] int  NOT NULL
);
GO

-- Creating table 'StepTemplates'
CREATE TABLE [dbo].[StepTemplates] (
    [StepType] int IDENTITY(1,1) NOT NULL,
    [StepName] nvarchar(max)  NOT NULL,
    [Enabled] int  NOT NULL,
    [Sequence] int  NOT NULL
);
GO

-- Creating table 'StepStatusChangeJustifications'
CREATE TABLE [dbo].[StepStatusChangeJustifications] (
    [JId] int IDENTITY(1,1) NOT NULL,
    [StepId] int  NOT NULL,
    [ChangedByUserId] int  NOT NULL,
    [ChangedAt] datetime  NOT NULL,
    [BeforeChange] nvarchar(max)  NOT NULL,
    [AfterChange] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'StepComments'
CREATE TABLE [dbo].[StepComments] (
    [CommentId] int IDENTITY(1,1) NOT NULL,
    [CommentText] nvarchar(max)  NOT NULL,
    [CreatedAt] datetime  NOT NULL,
    [EnteredByUserId] int  NOT NULL,
    [EnteredForStepId] int  NOT NULL
);
GO

-- Creating table 'AccessLists'
CREATE TABLE [dbo].[AccessLists] (
    [ALId] int IDENTITY(1,1) NOT NULL,
    [ProjId] int  NOT NULL,
    [UserId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [UserId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [UserId] in table 'UserLogins'
ALTER TABLE [dbo].[UserLogins]
ADD CONSTRAINT [PK_UserLogins]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [RoleId] in table 'UserRoles'
ALTER TABLE [dbo].[UserRoles]
ADD CONSTRAINT [PK_UserRoles]
    PRIMARY KEY CLUSTERED ([RoleId] ASC);
GO

-- Creating primary key on [ProjId] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [PK_Projects]
    PRIMARY KEY CLUSTERED ([ProjId] ASC);
GO

-- Creating primary key on [StepId] in table 'Steps'
ALTER TABLE [dbo].[Steps]
ADD CONSTRAINT [PK_Steps]
    PRIMARY KEY CLUSTERED ([StepId] ASC);
GO

-- Creating primary key on [StepType] in table 'StepTemplates'
ALTER TABLE [dbo].[StepTemplates]
ADD CONSTRAINT [PK_StepTemplates]
    PRIMARY KEY CLUSTERED ([StepType] ASC);
GO

-- Creating primary key on [JId] in table 'StepStatusChangeJustifications'
ALTER TABLE [dbo].[StepStatusChangeJustifications]
ADD CONSTRAINT [PK_StepStatusChangeJustifications]
    PRIMARY KEY CLUSTERED ([JId] ASC);
GO

-- Creating primary key on [CommentId] in table 'StepComments'
ALTER TABLE [dbo].[StepComments]
ADD CONSTRAINT [PK_StepComments]
    PRIMARY KEY CLUSTERED ([CommentId] ASC);
GO

-- Creating primary key on [ALId] in table 'AccessLists'
ALTER TABLE [dbo].[AccessLists]
ADD CONSTRAINT [PK_AccessLists]
    PRIMARY KEY CLUSTERED ([ALId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_UserUserLogin]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserLogins]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [UserType] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_UserUserRole]
    FOREIGN KEY ([UserType])
    REFERENCES [dbo].[UserRoles]
        ([RoleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserUserRole'
CREATE INDEX [IX_FK_UserUserRole]
ON [dbo].[Users]
    ([UserType]);
GO

-- Creating foreign key on [ProjId] in table 'Steps'
ALTER TABLE [dbo].[Steps]
ADD CONSTRAINT [FK_ProjectStep]
    FOREIGN KEY ([ProjId])
    REFERENCES [dbo].[Projects]
        ([ProjId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectStep'
CREATE INDEX [IX_FK_ProjectStep]
ON [dbo].[Steps]
    ([ProjId]);
GO

-- Creating foreign key on [StepType] in table 'Steps'
ALTER TABLE [dbo].[Steps]
ADD CONSTRAINT [FK_StepStepTemplate]
    FOREIGN KEY ([StepType])
    REFERENCES [dbo].[StepTemplates]
        ([StepType])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StepStepTemplate'
CREATE INDEX [IX_FK_StepStepTemplate]
ON [dbo].[Steps]
    ([StepType]);
GO

-- Creating foreign key on [StepId] in table 'StepStatusChangeJustifications'
ALTER TABLE [dbo].[StepStatusChangeJustifications]
ADD CONSTRAINT [FK_StepChangeJustificationStep]
    FOREIGN KEY ([StepId])
    REFERENCES [dbo].[Steps]
        ([StepId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StepChangeJustificationStep'
CREATE INDEX [IX_FK_StepChangeJustificationStep]
ON [dbo].[StepStatusChangeJustifications]
    ([StepId]);
GO

-- Creating foreign key on [ChangedByUserId] in table 'StepStatusChangeJustifications'
ALTER TABLE [dbo].[StepStatusChangeJustifications]
ADD CONSTRAINT [FK_UserStepChangeJustification]
    FOREIGN KEY ([ChangedByUserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserStepChangeJustification'
CREATE INDEX [IX_FK_UserStepChangeJustification]
ON [dbo].[StepStatusChangeJustifications]
    ([ChangedByUserId]);
GO

-- Creating foreign key on [EnteredForStepId] in table 'StepComments'
ALTER TABLE [dbo].[StepComments]
ADD CONSTRAINT [FK_StepStepComment]
    FOREIGN KEY ([EnteredForStepId])
    REFERENCES [dbo].[Steps]
        ([StepId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StepStepComment'
CREATE INDEX [IX_FK_StepStepComment]
ON [dbo].[StepComments]
    ([EnteredForStepId]);
GO

-- Creating foreign key on [EnteredByUserId] in table 'StepComments'
ALTER TABLE [dbo].[StepComments]
ADD CONSTRAINT [FK_UserStepComment]
    FOREIGN KEY ([EnteredByUserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserStepComment'
CREATE INDEX [IX_FK_UserStepComment]
ON [dbo].[StepComments]
    ([EnteredByUserId]);
GO

-- Creating foreign key on [UserId] in table 'AccessLists'
ALTER TABLE [dbo].[AccessLists]
ADD CONSTRAINT [FK_UserAccessList]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserAccessList'
CREATE INDEX [IX_FK_UserAccessList]
ON [dbo].[AccessLists]
    ([UserId]);
GO

-- Creating foreign key on [ProjId] in table 'AccessLists'
ALTER TABLE [dbo].[AccessLists]
ADD CONSTRAINT [FK_ProjectAccessList]
    FOREIGN KEY ([ProjId])
    REFERENCES [dbo].[Projects]
        ([ProjId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectAccessList'
CREATE INDEX [IX_FK_ProjectAccessList]
ON [dbo].[AccessLists]
    ([ProjId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------