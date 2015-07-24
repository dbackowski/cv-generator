module Cv
  module Generator
    class ErbData
      attr_reader :general, :jobs, :skills, :other_skills, :projects, :education
      attr_accessor :css_paths

      def initialize(data)
        @general = data['general']
        @jobs = data['jobs']
        @skills = data['skills']
        @other_skills = data['other_skills']
        @projects = data['projects']
        @education = data['education']
      end

      def get_binding
        binding
      end
    end
  end
end
