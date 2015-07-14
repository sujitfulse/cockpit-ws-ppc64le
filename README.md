# cockpit-ws-ppc64le
# To start cockpit on fedora atomic command is " sudo atomic run cockpit/ws ", 
# But on power this command will not run . 
# The reson behind is base image used in cockpit/ws is x86_64 image. 
# To make is runnable on power we need image that support power architecture. this repo will help to create such cockpit-ws that will run on power
# sudo atomic run cockpit/ws
