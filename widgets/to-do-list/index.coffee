refreshFrequency: 60000

# ToDoList Entries:
# Use a '-' for an open item
# Use a '+' for a completed item
todolistfile = '~/ToDo.list'

command: "cat #{todolistfile} | awk 'BEGIN {print \"<ol>\"} /^[-]/ {print \"<li>\"substr($0,2)\"</li>\"} /^[+]/ {print \"<li class=\\\"completed\\\">\"substr($0,2)\"</li>\"} END {print \"</ol>\"}'"

style: """
  top: 280px
  left: 70px
  color: #fff
  font-family: Menlo

  h
    display: block
    text-align: center
    font-size: 24px
    font-weight: 110
    color: lavender

  div
    display: block
    text-shadow: 0 0 1px rgba(#000, 0.5)
    font-size: 12px

  ol
    padding-left: 20px
    color: peachpuff
    font-size: 14px

  .completed
    color: lightsteelblue
    font-weight: regular
    text-decoration:line-through

  div.yuuoriginal
    background-color: rgba(black, .5)
    padding: 5px 20px 5px 20px
"""


render: -> """
  <div class='yuuoriginal'>
  <h>Notes</h>
  ------------------------------------------------------------------
  <div class='todolist'></div>
  </div>
"""

update: (output, domEl) ->
  $(domEl).find('.todolist').html(output)