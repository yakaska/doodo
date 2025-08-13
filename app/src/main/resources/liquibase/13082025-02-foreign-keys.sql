--liquibase formatted sql

--changeset yakaska:02

ALTER TABLE "Milestones" ADD FOREIGN KEY ("ProjectID") REFERENCES "Projects" ("ProjectID");

ALTER TABLE "Attachments" ADD FOREIGN KEY ("TaskID") REFERENCES "Tasks" ("TaskID");

ALTER TABLE "TaskDependencies" ADD FOREIGN KEY ("TaskID") REFERENCES "Tasks" ("TaskID");

ALTER TABLE "TeamMembers" ADD FOREIGN KEY ("UserID") REFERENCES "Users" ("UserID");

ALTER TABLE "TimeTracking" ADD FOREIGN KEY ("UserID") REFERENCES "Users" ("UserID");

ALTER TABLE "ProjectMembers" ADD FOREIGN KEY ("UserID") REFERENCES "Users" ("UserID");

ALTER TABLE "Checklists" ADD FOREIGN KEY ("TaskID") REFERENCES "Tasks" ("TaskID");

ALTER TABLE "TaskHistory" ADD FOREIGN KEY ("ChangedBy") REFERENCES "Users" ("UserID");

ALTER TABLE "Tasks" ADD FOREIGN KEY ("AssignedTo") REFERENCES "Users" ("UserID");

ALTER TABLE "TaskLabels" ADD FOREIGN KEY ("LabelID") REFERENCES "Labels" ("LabelID");

ALTER TABLE "UserRoleMapping" ADD FOREIGN KEY ("UserID") REFERENCES "Users" ("UserID");

ALTER TABLE "WorkflowSteps" ADD FOREIGN KEY ("WorkflowID") REFERENCES "Workflows" ("WorkflowID");

ALTER TABLE "TaskLabels" ADD FOREIGN KEY ("TaskID") REFERENCES "Tasks" ("TaskID");

ALTER TABLE "Tasks" ADD FOREIGN KEY ("ProjectID") REFERENCES "Projects" ("ProjectID");

ALTER TABLE "BugReports" ADD FOREIGN KEY ("ReportedBy") REFERENCES "Users" ("UserID");

ALTER TABLE "ProjectMembers" ADD FOREIGN KEY ("ProjectID") REFERENCES "Projects" ("ProjectID");

ALTER TABLE "Notifications" ADD FOREIGN KEY ("UserID") REFERENCES "Users" ("UserID");

ALTER TABLE "TaskComments" ADD FOREIGN KEY ("UserID") REFERENCES "Users" ("UserID");

ALTER TABLE "Sprints" ADD FOREIGN KEY ("ProjectID") REFERENCES "Projects" ("ProjectID");

ALTER TABLE "UserPreferences" ADD FOREIGN KEY ("UserID") REFERENCES "Users" ("UserID");

ALTER TABLE "WorkflowTaskMappings" ADD FOREIGN KEY ("TaskID") REFERENCES "Tasks" ("TaskID");

ALTER TABLE "Teams" ADD FOREIGN KEY ("OwnerID") REFERENCES "Users" ("UserID");

ALTER TABLE "WorkflowTaskMappings" ADD FOREIGN KEY ("WorkflowID") REFERENCES "Workflows" ("WorkflowID");

ALTER TABLE "TaskComments" ADD FOREIGN KEY ("TaskID") REFERENCES "Tasks" ("TaskID");

ALTER TABLE "TaskReminders" ADD FOREIGN KEY ("TaskID") REFERENCES "Tasks" ("TaskID");

ALTER TABLE "TaskHistory" ADD FOREIGN KEY ("TaskID") REFERENCES "Tasks" ("TaskID");

ALTER TABLE "TeamMembers" ADD FOREIGN KEY ("TeamID") REFERENCES "Teams" ("TeamID");

ALTER TABLE "UserRoleMapping" ADD FOREIGN KEY ("RoleID") REFERENCES "UserRoles" ("RoleID");

ALTER TABLE "BugReports" ADD FOREIGN KEY ("ProjectID") REFERENCES "Projects" ("ProjectID");

ALTER TABLE "TimeTracking" ADD FOREIGN KEY ("TaskID") REFERENCES "Tasks" ("TaskID");

ALTER TABLE "Announcements" ADD FOREIGN KEY ("ProjectID") REFERENCES "Projects" ("ProjectID");

ALTER TABLE "UserActivity" ADD FOREIGN KEY ("UserID") REFERENCES "Users" ("UserID");

ALTER TABLE "Projects" ADD FOREIGN KEY ("OwnerID") REFERENCES "Users" ("UserID");

ALTER TABLE "ChecklistItems" ADD FOREIGN KEY ("ChecklistID") REFERENCES "Checklists" ("ChecklistID");

ALTER TABLE "Workflows" ADD FOREIGN KEY ("CreatedBy") REFERENCES "Users" ("UserID");

ALTER TABLE "TaskDependencies" ADD FOREIGN KEY ("DependentTaskID") REFERENCES "Tasks" ("TaskID");

ALTER TABLE "ActivityLog" ADD FOREIGN KEY ("UserID") REFERENCES "Users" ("UserID");
