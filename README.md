# Computer Graphics Through OpenGL From Theory to Experiments code


1. **Add CMake build support on Win10 and Ubuntu20.04/Ubuntu18.04**.

2. **Supported third and fourth version**.

- Win10

Install VS2019 and CMake before building.

Open **x64 Native Tools Command Prompt for VS 2019**, and

```shell
>>cd *SRC_ROOT*
>>mkdir buildVS2019
>>cd buildVS2019
# book_version_num can be 3 or 4
>>cmake ../ -DCMAKE_BUILD_TYPE=Release -Dbook_version_num=3 -G Ninja
>>ninja -j8
......
```

After build, the building outputs will be in `SRC_ROOT`/bin/Windows

- Linux(Ubuntu20.04/Ubuntu18.04)

Open your linux terminal, and 


```shell
# Install third party softwares
>>sudo apt update
>>sudo apt upgrade
>>sudo apt install cmake ninja libglew-dev libgl-dev libglfw3-dev libopengl-dev 
>>cd *SRC_ROOT*
>>mkdir buildLinux
>>cd buildLinux
# book_version_num can be 3 or 4
>>cmake ../ -DCMAKE_BUILD_TYPE=Release -Dbook_version_num=3 -G Ninja
>>ninja -j8
......
```

After build, the building outputs will be in `SRC_ROOT`/bin/Linux

