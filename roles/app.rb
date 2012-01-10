name 'app'
description 'Runs the app server tier'
run_list ['recipe[passenger::daemon]']