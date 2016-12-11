company = [
  {
    Department: { name: "行政部" },
    Employees: [
      { name: "謝沛廷" },
      { name: "蔡鴻銘" },
      { name: "吳惠娟" },
      { name: "吳麗儀" },
      { name: "梁素晶" }
    ]
  },
  {
    Department: { name: "財務部" },
    Employees: [
      { name: "陈玉玲" },
      { name: "蔡颖华" },
      { name: "陆玉桃" },
      { name: "陈玉翠" },
      { name: "廖雪萍" },
      { name: "陈转娥" }
    ]
  }
]

company.each do |part|
  department = Department.create part[:Department]
  department.employees.create part[:Employees]
end

for i in 1..10 do
  item = Item.create({
    name: "Star Wars #{i}",
    spec: "",
    quantity: "",
    department_id: rand(1..Department.all.size),
    employee_id: rand(1..Employee.all.size)
  })
end