
# Refactored code:
# see full code at /spec/selenium/helpers/components_module.rb

module Components

  class Component

    # ... some code removed for brevity ... #

    private

    def add_assignment_override_for_student(opts={})
      assignment_override = AssignmentOverride.new()
      yield assignment_override
      assignment_override.title = "ADHOC OVERRIDE"
      assignment_override.workflow_state = "active"
      assignment_override.set_type = "ADHOC"
      set_override_dates(assignment_override, opts)
      assignment_override.save!
      override_student = assignment_override.assignment_override_students.build
      override_student.user = opts[:user]
      override_student.save!
    end

    # ... #
  end

  class Quiz < Component

    # ... #

    private

    def initialize(course, quiz_name)
      @component_quiz = assignment_quiz([], course: course, title: quiz_name)
    end

    def add_assignment_override_for_student(opts={})
      super(opts) { |assignment_override| assignment_override.quiz = @component_quiz }
    end
  end

  class Assignment < Component

    # ... #

    private

    def initialize
      # @component_assignment =
    end

    def add_assignment_override_for_student(opts={})
      super(opts) { |assignment_override| assignment_override.assignment = @component_assignment }
    end
  end

  class Discussion < Component

    # ... #

    private

    def initialize
      # @component_discussion =
    end

    def add_assignment_override_for_student(opts={})
      super(opts) { |assignment_override| assignment_override.discussion = @component_discussion }
    end
  end
end
