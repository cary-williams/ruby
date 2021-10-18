require 'csv'
require 'json'
require 'ostruct'
require 'date'

# Truncate float to 2 decimals
def round_f (num)
  (num * 100).round / 100.0
end

# Monthly requests_counts values can be found in "Requests For Hosting Costs" dashboard in datadog
request_counts = {:CLIENT1 => COUNT1, :CLIENT2 => COUNT2, :CLIENT3 => COUNT3}
# Instantiate clients with costs = 0
clients = { :CLIENT1 => 0, :CLIENT2 => 0, :CLIENT3 => 0, :CLIENT4 => 0, :total => 0}

costs = Hash.new
services = nil
output_file = "hosting_cost_report-#{Date.today.strftime("%Y-%m")}.csv"

csv = CSV.read("CostHistory.csv")

# Services stored on column 0
services = csv[0]

# Building clients structure per service
services.each do |service|
  if service != "Cost Allocation Tag"
     costs.merge!({service => OpenStruct.new(clients)})
  end
end

# Caclulate costs per service per partner by scanning all rows
CSV.foreach("CostHistory.csv", :headers => true) do |row|
  row_total_requests = 0
  allocation_ratio = Hash.new
  ratio_calculated = false
  if !row['Cost Allocation Tag']
    break
  end
  row.headers.each do |header|
    if header != "Cost Allocation Tag"
      if row['Cost Allocation Tag'].downcase.include? ","
        split_string = row['Cost Allocation Tag'].downcase.split(',')
        split_string.each do |allocation|
          if !clients.has_key? allocation.to_sym
            throw "CSV file include cost allocation: '#{row['Cost Allocation Tag']}' that doesn't exist on the clients list"
          else
            if !ratio_calculated
              allocation_ratio.merge!(allocation => request_counts[allocation.to_sym])
              row_total_requests += request_counts[allocation.to_sym].to_f
            end
          end
        end
        if !ratio_calculated
          allocation_ratio.each do |allocation, ratio|
            allocation_ratio[allocation] = ratio.to_f / row_total_requests
          end
          ratio_calculated = true
        end
        allocation_ratio.each do |allocation, ratio|
          costs[header][allocation] += row["#{header}"].to_f * ratio
        end
      elsif !clients.has_key? row['Cost Allocation Tag'].downcase.to_sym
        throw "CSV file include cost allocation: '#{row['Cost Allocation Tag']}' that doesn't exist on the clients list"
      else
          costs[header][row['Cost Allocation Tag'].downcase.to_sym] += row["#{header}"].to_f
      end

      clients.keys.each do |client|
        costs[header][client] = round_f(costs[header][client])
      end

    end
  end
end
# Build CSV and Write it into a new file

CSV.open(output_file, "w") do |csv|
  csv << ["client"] + costs.keys
  clients.keys.each do |client|
    arr = [client.to_s]
    costs.keys.each do |header|
      arr.push(costs[header][client])
    end
     csv << arr
  end
end