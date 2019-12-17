#!/usr/bin/env python3.7
import sys
import iterm2

fullCmdArguments = sys.argv
argumentList = fullCmdArguments[1:]

print(argumentList)


async def main(connection):
    feApp = argumentList[0]
    app = await iterm2.async_get_app(connection)
    window = app.current_terminal_window
    if window is not None:
        await window.async_create_tab()
        top_session = app.current_terminal_window.current_tab.current_session
        await top_session.async_send_text(f"" + feApp + "\n")
        mid_session = await top_session.async_split_pane(vertical=False)
        await mid_session.async_send_text(f"" + feApp + "\n")
        bottom_session = await mid_session.async_split_pane(vertical=False)
        await bottom_session.async_send_text(f"fe\n")

    else:
        print("No current window")

iterm2.run_until_complete(main)
