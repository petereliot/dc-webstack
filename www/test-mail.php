<?php

if (mail('your@mail.com', 'subject', 'hello!')) {
    echo 'ok';
}else{
    echo 'not sent';
}