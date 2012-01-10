name 'db'
description 'Runs the mysql database server'
run_list ['recipe[mysql::server]']