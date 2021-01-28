# isp-tracking
Track your ping and download speeds over time to make sure you are getting your money's worth

## Requirements

Some kind of always on linux machine HARD wired into your local network. Using this kind of thing over wifi makes no sense. Don't do it.

I recommend either a RPi3+ or an RPi4 as they are the only models with gigabit ethernet. If you are trying to measure speeds faster that a gigabit use something else.

### Data collection requirements
On Ubuntu/Debian install `speedtest-cli` that's it!
`sudo apt install speedtest-cli`

Before you set your cron job running you should create the data file and add the headers to it;
`speedtest-cli --csv-header >> /home/sam/speedtest.csv`

### Graphing Requirements
You need to have `R` installed on your computer. Either RStudio or command line R. I would recommend RStudio if you are not comfortable with the command prompt.

## Cron job
Here is what the cron job I use looks like:
`0 * * * * /usr/bin/speedtest-cli --csv >> /home/sam/speedtest.csv`

The above will run once at the top of every hour. For more information on cron scheduling see https://crontab.guru/

## Generating graphs
`Rscript speedtest.r`
That's it thats the script.

You can easily import the `.csv` file and work on it in your program/language of choice.

## Output
Here are what the current output of the graphs look like:
**Ping**
![Ping](https://github.com/sebastiansam55/isp-tracking/raw/main/ping.png)

**Download**
![Download](https://github.com/sebastiansam55/isp-tracking/raw/main/download.png)

**Upload**
![Upload](https://github.com/sebastiansam55/isp-tracking/raw/main/upload.png)

## Notes
By default `speedtest-cli` saves a lot of information, like your IP address. Don't go around sharing the output file directly, either strip the private data (there's a script!) or just share the output pictures.

To strip out the info (assuming RPi with basic `python`):
`python3 stripinfo.py <input> <output> convert header`

`<input>` should of course be the input file that you want stripped of information
`<output>` should be the output file that you want the stripped data to go to.

Put `convert` if you want the speed measured converted from bytes (224723837.2107559) to mbps (224.7238372107559). Convert will also try and output the data without quotes when possible. 

Put `header` if you want the new shorter header to be written to the top of the output file.

