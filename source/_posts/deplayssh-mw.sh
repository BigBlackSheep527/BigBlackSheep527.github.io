#!/bin/bash

# 测试数据  git@gitee.com:daheiyang/testssh.git ./teshssh 有空把仓库清掉

#   stash参数
##  gitee 仓库 ：git@gitee.com:daheiyang/smartchat.git  
##  github 仓库： git@github.com:BigBlackSheep527/BigBlackSheep527.github.io.git
#   tarpatt参数
##  ./unpackage/dist/build/h5
#   type参数
##  force

# 仓库git
stash=$1
# 目标路径
tarpath=$2
# 脚本参数
type=$3

# 判断测试是否为空
testParamsIsNull() {
  echo "执行脚本了脚本， stach: $stash ； tarpath: $tarpath ； type: $type " 
  if [ -z "$stash" ] || [ -z "$tarpath" ]; then
  echo -e "\033[1;31m error:仓库名称不能为空\033[0m"
  exit 0
  fi
}
# start:二次确定推送代码路径是否正确
vefifypath(){
    current_path=$(pwd)
    echo "被代码推送的路径为$current_path ,是否继续？（输入 y/n）"
    read answer1
    if [ "$answer1" == "y" ]; then
     echo "继续执行中..."
    else
     exit 0
    fi
}
#!/bin/bash

# 判断当前操作系统是 macOS 还是 Windows
get_system() {
  case "$(uname -s)" in
    Darwin*)
      echo "macOS"
      ;;
    CYGWIN*|MINGW32*|MSYS*|MINGW*)
      echo "Windows"
      ;;
    *)
      echo "Unknown"
      ;;
  esac
}

# 判断当前操作系统是 macOS 还是 Windows
get_branch_name() {
  case "$(uname -s)" in
    Darwin*)
      echo "main"
      ;;
    CYGWIN*|MINGW32*|MSYS*|MINGW*)
      echo "master:main"
      ;;
    *)
      echo "master:main"
      ;;
  esac
}

# 调用函数并获取分支名称
current_branch=$(get_branch_name)

# 调用函数并获取当前操作系统
current_system=$(get_system)

# 输出当前操作系统
echo "当前操作系统是：$current_system"

current_time=$(date +"%Y-%m-%d %H:%M:%S")
// 定义执行脚步
testParamsIsNull

if [[ $type == "force" ]]; then
  echo -e "\033[1;33m warnning:执行强制推送代码，将会覆盖别人的代码\033[0m"
  echo "是否继续？（输入 y/n）"
  read answer
  if [ "$answer" == "y" ]; then
    echo "继续执行强制推送代码"
    echo "123456" | sudo chgrp -S admin $tarpath
    sudo chmod -S g+w $tarpath
    cd $tarpath
    vefifypath
    rm -rf ./.git/
    git init 
    git add .
    git commit -m "sh-deploy-force-$current_time"
    git remote add origin $stash
    git push -f origin $current_branch
  fi
else
  echo "123456" | sudo chgrp -R admin $tarpath
  sudo chmod -R g+w $tarpath 
  cd $tarpath
  vefifypath
  rm -rf ./.git/
  git init 
  git add .
  git commit -m "ssh-deplay-normal-$current_time"
  git remote add origin $stash
  git config pull.rebase false
  git fetch origin
  git merge origin/$current_branch --allow-unrelated-histories
  git push -u origin  $current_branch
fi
if [ $? -ne 0 ]; then
  current_path=$(pwd)
  echo -e "\033[1;31m error:推送失败，请到当前文件夹路径：$current_path 看是否代码冲突\033[0m"
fi
