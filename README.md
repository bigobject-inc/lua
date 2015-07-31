# lua
public lua functions for BigObject

Please refer http://bigobject.readme.io/ for detail

copy a lua script to bigobject docker image

    sh cpLua2BO.sh <lua script file> <docker image name (option) >

ex. 
copy put.lua into the docker image "bigobject" 

    sh cpLua2BO.sh put.lua

copy put.lua into the docker image "bigobject_dev" 

    sh cpLua2BO.sh put.lua bigobject_dev
