from datetime import datetime
from datetime import timedelta

def get_original_line(file_path):
    import os
    print(os.getcwd())
    f = open(file_path)
    for line in f.readlines():
        if line.startswith('due_date'):
            return line

def get_replacement_line(line, time_delta, current_start):
    replace_me = line.split(' ')[1].strip()
    d = datetime.strptime(replace_me, '%Y-%m-%d')
    if d < current_start:
        d = d + time_delta
        return line.replace(replace_me, d.strftime('%Y-%m-%d'))
    return line

def do_replacement(old_line, new_line, file_path):
    with open(file_path, 'r') as file:
        filedata = file.read()
    file.close()

    # Replace the target string
    filedata = filedata.replace(old_line, new_line)

    # Write the file out again
    with open(file_path, 'w') as file:
        file.write(filedata)
    file.close()

def get_files(file_path):
    import glob, os
    file_paths = []
    types = ('*.md', '*.scss', '*.html')
    for type in types:
        for file in glob.glob(file_path + '/' + type):
            file_paths.append(file)
    return file_paths

def migrate_date(old_date, new_date, file_path):
    past_start = datetime.strptime(old_date, '%Y-%m-%d')
    current_start = datetime.strptime(new_date, '%Y-%m-%d')
    diff = current_start - past_start
    days_to_add = diff.days
    print(diff, days_to_add)

    old_line = get_original_line(file_path)
    if old_line:
        new_line = get_replacement_line(old_line, diff, current_start)
        print(new_line)
        do_replacement(old_line, new_line, file_path)


if __name__ == '__main__':
    old_date = '2023-08-21'
    new_date = '2024-08-19'
    file_paths = get_files('../../pages/_lectures')
    file_paths += get_files('../../pages/_assignments') 
    file_paths += get_files('../../pages/_quizzes') 
    print(file_paths)
    for file_path in file_paths:
        print(file_path)
        migrate_date(old_date, new_date, file_path)
        print(file_path, 'migrated.')

    # global find and replace:
    file_paths += get_files('../../pages/resources')  
    file_paths += get_files('../../pages') 
    file_paths += get_files('../../_sass/minima') 
    file_paths += get_files('../../_layouts') 
    file_paths += get_files('../../_includes') 
    # for file_path in file_paths:
    #     # do_replacement('CSCI XXX', 'CSCI 185', file_path)
    #     do_replacement('draft: 1', 'draft: 1', file_path)
    #     # do_replacement('Northwestern University', 'UNCA', file_path)
    #     # do_replacement('Northwestern', 'UNCA', file_path)