module Employee
	class Data < Grape::API
		helpers StrongParamsHelpers

		rescue_from ActiveRecord::RecordNotFound do |e|
			error!({error: 'Employee not found'}, 404)
		end

		rescue_from :all

		resource :employee_datas do

			desc 'list all employees'

			get do
				Emp.all
			end

			desc 'list one employee'

			params do
				requires :id, type: String
			end

			get ':id' do
				Emp.find(params[:id])
			end

			desc 'create new employee'

			params do
			  requires :name, type: String
			  requires :sport, type:String
			  requires :age, type:Integer
			end

			post do
			  Emp.create!({
			    name: params[:name],
			    sport: params[:sport],
			    age: params[:age]
			  })
			end

			desc 'update an employee'

			params do
				requires :id, type: String
			end

			put ':id' do
				Emp.find(params[:id]).update(permitted_params)
			end

			desc 'delete an employee'

			params do
				requires :id, type: String
			end

			delete ':id' do
				Emp.find(params[:id]).destroy!
			end

		end

	end
end