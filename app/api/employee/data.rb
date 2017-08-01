module Employee
	class Data < Grape::API

		resource :employee_datas do
			desc 'List all employees'

			get do
				Emp.all
			end

		end

	end
end