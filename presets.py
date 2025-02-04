
def load_presets( preset_file ):
 with open( preset_file, "r" ) as f:
  return json.loads( f.readlines() )

def preset_selection_menu( preset_data ):
 return 0
 print( preset_data )
 choice = get_typed_var(">", int)
 return choice
