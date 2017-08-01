module Employee
	class Data < Grape::API

		resource :employee_datas do

			desc 'List all employees'

			get do
				Emp.all
			end

		end

		resource :employee_data do

			desc 'create new employee'

			params do
			  requires :name, type: String
			  requires :sport, type:String
			  requires :age, type:Integer
			end

			post do
			  Emp.create!({
			    name:params[:name],
			    sport:params[:sport],
			    age:params[:age]
			  })
			end

		end

	end
end