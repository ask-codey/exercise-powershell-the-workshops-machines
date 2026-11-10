# Exercise: The Workshop's Machines

Exercise code for the lesson **Exercise: The Workshop's Machines** in PowerShell in Depth on [ask-codey.com](https://www.ask-codey.com).

Ada Wren, an inventor, is away at the inventors' fair, and you're minding her workshop. Her machines need a count, a new list, a parts order, two dates worked out, a tidy drawer lookup, power and oil. Each task uses one idea from the chapter *Variables and Values*: variables, quotes, dates, arrays, hashtables and environment variables. A Pester check tells you which tasks are done.

## What's here

- `letter.txt`: Ada's note to you. Read it first.
- `machines.txt`: Ada's machines, one a line.
- `oil-log.txt`: the date the gears were last oiled.
- `kettle-bot.ps1`: the kettle-bot, a small script. Read it before you run it.
- `tools/oil.ps1`: the oil can, another small script. Read it too.
- `Check.Tests.ps1`: the check that reads your results. You don't need to change it.

## What to do

Open PowerShell 7 in this folder, the one with `Check.Tests.ps1` in it. Run every command from here, and write every result here too, beside `Check.Tests.ps1`.

1. **The machine count.** Read `machines.txt` into a variable, `$machines = Get-Content machines.txt`: each line becomes one item. Then write one line into `label.txt`, made with double quotes and `$( )` from `$machines.Count`, in the form `The workshop has N machines`.
2. **A new machine.** Add `music box` to the end of `$machines` with `+=`. Then write the whole list into `machines-new.txt`, one machine a line.
3. **The parts order.** Write these three lines into `order.txt` with a here-string, exactly as they are, dollar signs and all:

   ```text
   Parts to order:
   2 brass springs at $4.50 each
   1 copper beak at $12.00
   ```

4. **The next oiling.** The gears need oil every 30 days. Turn the date in `oil-log.txt` into a date, and write the date 30 days later into `next-oiling.txt`, written year-month-day, such as `2026-01-31`.
5. **Days until Ada is back.** Ada is back on December 4, 2026. Write the number of days from the date in `oil-log.txt` to that day into `days.txt`: the number only.
6. **Where things are.** Make this hashtable of where things are kept:

   ```powershell
   $drawers = @{ screws = 'drawer-1'; springs = 'drawer-2'; string = 'drawer-3' }
   ```

   Ada moved the springs to `drawer-4`, and the golden cog is in `drawer-3`. Change the springs' key, and add a `golden cog` key. Then write one line into `drawers.txt`, made from `$drawers.Count` and `$drawers.springs`, in the form `N things; springs in drawer-N`.
7. **Tea.** Give the kettle-bot power, the way its first lines say, and run it with `.\kettle-bot.ps1`. When it has power, it writes `tea.txt` itself.
8. **Oil.** Put this folder's `tools` folder on your `PATH`, for this window only, and oil the gears by name, from this folder: `oil gears`. When it's called by its name, the oil can writes `oiled.txt` itself.

## Check your work

The check needs Pester 5 or newer. Install it once, if you haven't already:

```powershell
Install-PSResource Pester
```

Then, from this folder:

```powershell
Invoke-Pester
```

At first every test fails: that is expected. Each task you finish turns its test green. A failing test's message says which task it is, what it expected, and what it found.

Made a mistake? Write the file again: `Set-Content` replaces what a file held. To start over, download the exercise again. Everything you set for tasks 7 and 8 lasts until you close the window, so in a new window, set them again before you run the machines again.

If PowerShell says a script *cannot be loaded because running scripts is disabled* or *is not digitally signed*, the folder came from a download that Windows marked as from the internet. Unblock its files once with `Get-ChildItem -Recurse | Unblock-File`, from this folder, and try again. *Why a Script Won't Run: The Execution Policy*, in the next chapter, explains what that does.

## Tips

- Build each answer on the screen first, and write it to a file only when the screen shows the right thing.
- `$machines[0]` is the first machine and `$machines.Count` how many there are.
- Double quotes fill in values; single quotes, and a single-quoted here-string, keep every `$` as it is.
- `[datetime]'2026-12-04'` is a date. One date minus another is a TimeSpan, and its `.Days` is a whole number.
- A plain `$POWER` is a PowerShell variable. The kettle-bot reads the environment.
- `Get-Location` shows this folder's full path. The folder to add to `PATH` is the `tools` folder inside it, and `+=` with a `;` in front keeps the folders already there.

## Hand it in

When it works, push your solution to a public repo of your own on GitHub, then paste that repo's address into **Submit your exercise** on the lesson page at [ask-codey.com](https://www.ask-codey.com). That's what completes the lesson. The lesson page shows the Git commands, step by step.
