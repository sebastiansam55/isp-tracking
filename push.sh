!#/bin/sh
/usr/bin/python3 /home/sam/isp-tracking/stripinfo.py /home/sam/speedtest.csv /home/sam/isp-tracking/out.csv convert header
cd /home/sam/isp-tracking
git add out.csv
git commit -m 'Update csv'
git push
