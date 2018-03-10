rem
rem reads reference.json to produce per page json data files
rem

tload "reference.json", s, 1
ref = array(s)
for package in ref
  num_items = len(ref[package]) - 1
  for i = 0 to num_items
    item = ref[package][i]
    filename = "_out/data/" + item.nodeId + "-" + lower(package) + "-" + lower(item.keyword) + ".json"
    filename = translate(filename, " ", "")
    buffer = str(item)
    tsave filename, buffer
  next i
next package
