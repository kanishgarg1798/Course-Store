class CoursesController < ApplicationController
    before_action :authenticate_user!, only: [:index, :buy]
    
    def index
        @courses = Course.all
    end

    def new
        @course = Course.new
    end

    def create
        @course = Course.new(course_params)
        if @course.save
            redirect_to courses_path, notice: 'Course created successfully!'
        else
            render :new
        end
    end

    def show

    end
end