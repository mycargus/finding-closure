
# Pre-refactor code:

def add_assignment_override_for_student_to_quiz(opts={})
  assignment_override = AssignmentOverride.new()
  assignment_override.quiz = @component_quiz  #  <------ ***
  assignment_override.title = "ADHOC OVERRIDE"
  assignment_override.workflow_state = "active"
  assignment_override.set_type = "ADHOC"
  set_override_dates(assignment_override, opts)
  assignment_override.save!
  override_student = assignment_override.assignment_override_students.build
  override_student.user = opts[:user]
  override_student.save!
end

def add_assignment_override_for_student_to_discussion(opts={})
  assignment_override = AssignmentOverride.new()
  assignment_override.discussion = @component_discussion  #  <------ ***
  assignment_override.title = "ADHOC OVERRIDE"
  assignment_override.workflow_state = "active"
  assignment_override.set_type = "ADHOC"
  set_override_dates(assignment_override, opts)
  assignment_override.save!
  override_student = assignment_override.assignment_override_students.build
  override_student.user = opts[:user]
  override_student.save!
end

def add_assignment_override_for_student_to_assignment(opts={})
  assignment_override = AssignmentOverride.new()
  assignment_override.assignment = @component_assignment  #  <------ ***
  assignment_override.title = "ADHOC OVERRIDE"
  assignment_override.workflow_state = "active"
  assignment_override.set_type = "ADHOC"
  set_override_dates(assignment_override, opts)
  assignment_override.save!
  override_student = assignment_override.assignment_override_students.build
  override_student.user = opts[:user]
  override_student.save!
end

