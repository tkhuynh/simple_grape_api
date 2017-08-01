module Employee
	class Data < Grape::API
		helpers StrongParamsHelpers

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

			desc 'update an employee sport'

			params do
				requires :id, type: String
			end

			put ':id' do
				Emp.find(params[:id]).update(permitted_params)
			end

		end

	end
end