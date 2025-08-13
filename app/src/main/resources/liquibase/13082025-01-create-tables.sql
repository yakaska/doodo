--liquibase formatted sql

--changeset yakaska:01
CREATE TABLE "Milestones" (
                              "MilestoneID" int PRIMARY KEY,
                              "ProjectID" int NOT NULL,
                              "MilestoneName" varchar(100) NOT NULL,
                              "DueDate" timestamp NOT NULL,
                              "CreatedAt" timestamp NOT NULL
);

CREATE TABLE "TaskReminders" (
                                 "ReminderID" int PRIMARY KEY,
                                 "TaskID" int NOT NULL,
                                 "ReminderText" varchar(100) NOT NULL,
                                 "ReminderTime" timestamp NOT NULL
);

CREATE TABLE "ChecklistItems" (
                                  "ChecklistItemID" int PRIMARY KEY,
                                  "ChecklistID" int NOT NULL,
                                  "ItemName" varchar(100) NOT NULL,
                                  "IsCompleted" boolean NOT NULL
);

CREATE TABLE "AppSettings" (
                               "SettingID" int PRIMARY KEY,
                               "SettingName" varchar(50) NOT NULL,
                               "SettingValue" varchar(100) NOT NULL
);

CREATE TABLE "Users" (
                         "UserID" int PRIMARY KEY,
                         "Username" varchar(50) NOT NULL,
                         "Email" varchar(100) NOT NULL,
                         "PasswordHash" varchar(255) NOT NULL,
                         "CreatedAt" timestamp NOT NULL
);

CREATE TABLE "TaskComments" (
                                "CommentID" int PRIMARY KEY,
                                "TaskID" int NOT NULL,
                                "UserID" int NOT NULL,
                                "CommentText" text NOT NULL,
                                "CreatedAt" timestamp NOT NULL
);

CREATE TABLE "TaskDependencies" (
                                    "DependencyID" int PRIMARY KEY,
                                    "TaskID" int NOT NULL,
                                    "DependentTaskID" int NOT NULL
);

CREATE TABLE "UserRoles" (
                             "RoleID" int PRIMARY KEY,
                             "RoleName" varchar(50) NOT NULL
);

CREATE TABLE "UserRoleMapping" (
                                   "MappingID" int PRIMARY KEY,
                                   "UserID" int NOT NULL,
                                   "RoleID" int NOT NULL,
                                   "AssignedAt" timestamp NOT NULL
);

CREATE TABLE "Attachments" (
                               "AttachmentID" int PRIMARY KEY,
                               "TaskID" int NOT NULL,
                               "FileName" varchar(255) NOT NULL,
                               "FilePath" varchar(255) NOT NULL,
                               "UploadedAt" timestamp NOT NULL
);

CREATE TABLE "Projects" (
                            "ProjectID" int PRIMARY KEY,
                            "ProjectName" varchar(100) NOT NULL,
                            "OwnerID" int NOT NULL,
                            "CreatedAt" timestamp NOT NULL
);

CREATE TABLE "ProjectMembers" (
                                  "MemberID" int PRIMARY KEY,
                                  "ProjectID" int NOT NULL,
                                  "UserID" int NOT NULL,
                                  "JoinedAt" timestamp NOT NULL
);

CREATE TABLE "Notifications" (
                                 "NotificationID" int PRIMARY KEY,
                                 "UserID" int NOT NULL,
                                 "NotificationText" text NOT NULL,
                                 "IsRead" boolean NOT NULL,
                                 "CreatedAt" timestamp NOT NULL
);

CREATE TABLE "BugReports" (
                              "BugID" int PRIMARY KEY,
                              "ProjectID" int NOT NULL,
                              "ReportedBy" int NOT NULL,
                              "BugDescription" text NOT NULL,
                              "ReportedAt" timestamp NOT NULL,
                              "Priority" varchar(50) NOT NULL,
                              "Status" varchar(50) NOT NULL
);

CREATE TABLE "UserPreferences" (
                                   "PreferenceID" int PRIMARY KEY,
                                   "UserID" int NOT NULL,
                                   "PreferenceName" varchar(50) NOT NULL,
                                   "PreferenceValue" varchar(50) NOT NULL
);

CREATE TABLE "TeamMembers" (
                               "TeamMemberID" int PRIMARY KEY,
                               "TeamID" int NOT NULL,
                               "UserID" int NOT NULL,
                               "JoinedAt" timestamp NOT NULL
);

CREATE TABLE "Labels" (
                          "LabelID" int PRIMARY KEY,
                          "LabelName" varchar(50) NOT NULL,
                          "LabelColor" varchar(7) NOT NULL
);

CREATE TABLE "UserActivity" (
                                "ActivityID" int PRIMARY KEY,
                                "UserID" int NOT NULL,
                                "ActivityType" varchar(50) NOT NULL,
                                "Detail" text NOT NULL,
                                "CreatedAt" timestamp NOT NULL
);

CREATE TABLE "ActivityLog" (
                               "LogID" int PRIMARY KEY,
                               "UserID" int NOT NULL,
                               "Description" text NOT NULL,
                               "LoggedAt" timestamp NOT NULL
);

CREATE TABLE "TimeTracking" (
                                "TimeEntryID" int PRIMARY KEY,
                                "TaskID" int NOT NULL,
                                "UserID" int NOT NULL,
                                "StartTime" timestamp NOT NULL,
                                "EndTime" timestamp NOT NULL
);

CREATE TABLE "TaskLabels" (
                              "TaskLabelID" int PRIMARY KEY,
                              "TaskID" int NOT NULL,
                              "LabelID" int NOT NULL
);

CREATE TABLE "Sprints" (
                           "SprintID" int PRIMARY KEY,
                           "SprintName" varchar(100) NOT NULL,
                           "ProjectID" int NOT NULL,
                           "StartDate" timestamp NOT NULL,
                           "EndDate" timestamp NOT NULL
);

CREATE TABLE "Workflows" (
                             "WorkflowID" int PRIMARY KEY,
                             "WorkflowName" varchar(100) NOT NULL,
                             "CreatedAt" timestamp NOT NULL,
                             "CreatedBy" int NOT NULL
);

CREATE TABLE "Tasks" (
                         "TaskID" int PRIMARY KEY,
                         "TaskName" varchar(100) NOT NULL,
                         "Description" text NOT NULL,
                         "ProjectID" int NOT NULL,
                         "AssignedTo" int,
                         "Status" varchar(50) NOT NULL,
                         "Priority" varchar(50) NOT NULL,
                         "CreatedAt" timestamp NOT NULL,
                         "DueDate" timestamp NOT NULL
);

CREATE TABLE "Checklists" (
                              "ChecklistID" int PRIMARY KEY,
                              "TaskID" int NOT NULL,
                              "ChecklistName" varchar(100) NOT NULL,
                              "CreatedAt" timestamp NOT NULL
);

CREATE TABLE "WorkflowTaskMappings" (
                                        "MappingID" int PRIMARY KEY,
                                        "WorkflowID" int NOT NULL,
                                        "TaskID" int NOT NULL
);

CREATE TABLE "TaskHistory" (
                               "HistoryID" int PRIMARY KEY,
                               "TaskID" int NOT NULL,
                               "ChangedBy" int NOT NULL,
                               "ChangeDescription" text NOT NULL,
                               "ChangedAt" timestamp NOT NULL
);

CREATE TABLE "Announcements" (
                                 "AnnouncementID" int PRIMARY KEY,
                                 "ProjectID" int NOT NULL,
                                 "AnnouncementText" text NOT NULL,
                                 "CreatedAt" timestamp NOT NULL
);

CREATE TABLE "WorkflowSteps" (
                                 "StepID" int PRIMARY KEY,
                                 "WorkflowID" int NOT NULL,
                                 "StepName" varchar(100) NOT NULL,
                                 "StepOrder" int NOT NULL
);

CREATE TABLE "Teams" (
                         "TeamID" int PRIMARY KEY,
                         "TeamName" varchar(100) NOT NULL,
                         "CreatedAt" timestamp NOT NULL,
                         "OwnerID" int NOT NULL
);
