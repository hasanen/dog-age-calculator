<?php
  if(isset($_POST['payload'])) {
    shell_exec('git pull origin master');
    shell_exec('coffee --compile --output js/ src/');
  }