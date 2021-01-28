library(tidyverse)
speedtest <- read_csv("speedtest.csv")

speedtest = mutate(speedtest, Upload=Upload/1000000, Download=Download/1000000)

print("Mean ping:")
print(mean(speedtest$Ping))
p = ggplot(data = speedtest) +
    geom_point(aes(x=Timestamp, y=Ping, color=Ping)) +
    scale_color_gradient(low="#d0a200", high="red")
ggsave("ping.png")
print(p)

print("Mean upload")
print(mean(speedtest$Upload))
print("Mean download")
print(mean(speedtest$Download))
p = ggplot(data = speedtest) +
    # geom_point(aes(x=Timestamp, y=Ping, color=Ping)) +
    geom_point(aes(x=Timestamp, y=Download, color=Download))
    scale_color_gradient(low="#d0a200", high="red")
ggsave("download.png")
print(p)
p = ggplot(data = speedtest) +
    # geom_point(aes(x=Timestamp, y=Ping, color=Ping)) +
    geom_point(aes(x=Timestamp, y=Upload, color=Upload))
    scale_color_gradient(low="#d0a200", high="red")
ggsave("upload.png")
print(p)