module BookytSalary
  module Navigation
    def setup_bookyt_salary(navigation)
      navigation.item :salaries, t_title(:index, Salary), "#",
                   :if => Proc.new { user_signed_in? and can? :index, Salary } do |salaries|
        salaries.item :salary_list, t_title(:index, Salary), salaries_path, :highlights_on => /\/salaries($|\/[0-9]*($|\/.*))/
        salaries.item :new_salary, t_title(:new, Salary), select_employee_salaries_path
        
        salaries.item :divider, "", '#', :html => {:class => 'divider' }
        salaries.item :statistics, t('salary_reports.statistics.title'), url_for('/salary_reports/statistics'), if: Proc.new { can? :yearly_ahv_statement, :salary_reports }
        salaries.item :yearly_ahv_statement, t('salary_reports.yearly_ahv_statement.title'), url_for("/salary_reports/yearly_ahv_statement"), if: Proc.new { can? :statistics, :salary_reports }

        salaries.item :divider, "", '#', :html => {:class => 'divider' }
        salaries.item :salary_booking_templates, t_title(:index, SalaryBookingTemplate), salary_booking_templates_path, if: Proc.new { can? :index, SalaryBookingTemplate }
        salaries.item :salary_templates, t_title(:index, SalaryTemplate), salary_templates_path, if: Proc.new { can? :index, SalaryTemplate }
      end
    end
  end
end
