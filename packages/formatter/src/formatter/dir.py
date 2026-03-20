import markdown

def format(source: str, language: str, css_class: str, options, md, classes=None, id_value='', attrs=None, **kwargs):
    # TODO document this and pick better variable names i think
    pogchamp = " - " + source.replace("│", " ").replace("└", " ").replace("├", " ").replace("─", "-").replace("\n", "\n    ")
    return "<div class=\"file-tree\">" + markdown.markdown(pogchamp) + "</div>"
