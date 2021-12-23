Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 792B047E555
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 16:07:47 +0100 (CET)
Received: from localhost ([::1]:60932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Ph4-0001tg-5a
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 10:07:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasper.ruehl@tum.de>)
 id 1n0KrO-00020I-Kq
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 04:58:07 -0500
Received: from [2001:4ca0:0:103::81bb:ff89] (port=52677
 helo=postout1.mail.lrz.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasper.ruehl@tum.de>)
 id 1n0KrL-0003rb-Ch
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 04:58:05 -0500
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
 by postout1.mail.lrz.de (Postfix) with ESMTP id 4JKQT223Yvzyc6;
 Thu, 23 Dec 2021 10:51:50 +0100 (CET)
Authentication-Results: postout.lrz.de (amavisd-new); dkim=pass (2048-bit key)
 reason="pass (just generated,
 assumed good)" header.d=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tum.de; h=
 content-language:subject:subject:from:from:user-agent
 :mime-version:date:date:message-id:content-type:content-type
 :received:received; s=tu-postout21; t=1640253109; bh=HvkbGNMBhA0
 GLBcjvBrjVdvX0dOQMJxPFNI4+EPyyI4=; b=KuxVTTFH3VrQwNQiQPPkF5y/goX
 vNvCcIoBbmcJTUnXwWABch8DElxTME3qBFZPE/vvGhTYh8nuwvvDPjgUt0G/TKQ8
 WWz+8uhGZw8c0VtuQwUrt25S5OvNHcsSZcv5/VrWq1ph0MMXs6DDBMDRh9PSlwfZ
 hFP7OpdXfmxQL/Lm7rlmC0vO8nhwH3wf8OdBvazG3HmfEQ0Q6peAsNuodb+yYQaA
 vFt3L1t3TWn6UHmSMSfexeV7v/y+o8VJfm780Yinjz2hXDd2YZHl7ZgH8IcC51z/
 wKCctHOM86N3MPStJ76wQB9fYribd+kX90/CneHt77tG3kW+S7RjAPYb0Vw==
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Score: -2.867
Received: from postout1.mail.lrz.de ([127.0.0.1])
 by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new,
 port 20024)
 with LMTP id YM67i9jGW5_K; Thu, 23 Dec 2021 10:51:49 +0100 (CET)
Received: from [IPV6:2001:4ca0:2fff:9:0:1:0:1001] (unknown
 [IPv6:2001:4ca0:2fff:9:0:1:0:1001])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4JKQT12zSPzycB;
 Thu, 23 Dec 2021 10:51:49 +0100 (CET)
Content-Type: multipart/alternative;
 boundary="------------Mha09Jw8Hc6Ic3bKn50D4Y9s"
Message-ID: <67ba86a8-abd2-1715-ed8b-ed360b648c72@tum.de>
Date: Thu, 23 Dec 2021 10:51:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
From: Jasper Ruehl <jasper.ruehl@tum.de>
Subject: QEMU CAS
Content-Language: en-US
To: qemu-devel@nongnu.org
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4ca0:0:103::81bb:ff89
 (failed)
Received-SPF: pass client-ip=2001:4ca0:0:103::81bb:ff89;
 envelope-from=jasper.ruehl@tum.de; helo=postout1.mail.lrz.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_FONT_LOW_CONTRAST=0.001, HTML_MESSAGE=0.001, NORDNS_LOW_CONTRAST=0.001,
 RCVD_IN_DNSWL_MED=-2.3, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 23 Dec 2021 10:02:09 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Redha Gouicem <gouicem@in.tum.de>, peter.maydell@linaro.org,
 richard.henderson@linaro.org, lex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------Mha09Jw8Hc6Ic3bKn50D4Y9s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear QEMU Community,

after chatting a bit in the IRC channel, "stefanha" advised me to 
contact you via EMail about my problem.
My advisor and me from the DSE chair at the TU Munich had the idea to 
improve the emulation of the x86 cmpxchg instruction on ARM64 CPUs by 
improving the translation scheme: instead of generating a call to the 
GCC helper function, we introduce a new TCG IR instruction (CAS) and 
directly translate that into the ARM casal instruction.

During benchmarking, we noticed that our version of QEMU performs 
correctly if we disable TCG optimizations (done in tcg/tcg.c:26).
If we enable them, however, the emulated program hangs indefinitely in 
futex syscalls.
We are not sure if this misbehavior stems from a bug in the 
implementation or if it is due to some assumptions made by the optimizer.

We have tried to analyse the program using -d in_asm,op,op_opt,out_asm, 
but could not determine the issue.

Using gdb, we could determine where the threads hang.

Threads 3 - END are in the futex syscall of the function do_futex_wait, 
waiting for thread 2 to be created.
Judging by the stack trace, Thread 2 seems to still be in the creation 
routine:

#0  syscall () at ../sysdeps/unix/sysv/linux/aarch64/syscall.S:38
#1  0x0000aaaad21b4e60 in qemu_futex_wait (val=<optimized out>, 
f=<optimized out>) at /qemu/qemu/include/qemu/futex.h:29
#2  qemu_event_wait (ev=ev@entry=0xaaaad25a9470 <rcu_call_ready_event>) 
at ../util/qemu-thread-posix.c:480
#3  0x0000aaaad21be044 in call_rcu_thread (opaque=opaque@entry=0x0) at 
../util/rcu.c:258
#4  0x0000aaaad21b3d38 in qemu_thread_start (args=<optimized out>) at 
../util/qemu-thread-posix.c:541
#5  0x0000ffffb2626f5c in start_thread (arg=0x0) at pthread_create.c:463
#6  0x0000ffffb257eb1c in thread_start () at 
../sysdeps/unix/sysv/linux/aarch64/clone.S:78

The code for the creation of the threads is found at 
phoenix2.0/src/tpool.c:tpool_create
Thread 2 is created the same way the others are, however it is the only 
one failing.

Commit introducing the native CAS emulation: 
https://github.com/rgouicem/qemu/commit/5bc56e203936338d98acdb868786834c751f87a7

Repo with the code demonstrating the problem: 
https://github.com/haxkor/qemu_phoenix
Run it with qemu_opt ./histogram small.bmp

I have included my binary and the source code if you want to build it 
yourself, simply run "make" in the phoenix2 folder.
The binary will be at phoenix2/tests/histogram/histogram

We hope to have provided you useful information. Please let us know if 
there is anything else we can do.


Best regards,
Redha Gouicem and Jasper Ruehl.


--------------Mha09Jw8Hc6Ic3bKn50D4Y9s
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Dear QEMU Community,</p>
    <p>after chatting a bit in the IRC channel, "stefanha" advised me to
      contact you via EMail about my problem.<br>
      My advisor and me from the DSE chair at the TU Munich had the idea
      to improve the emulation of the x86 cmpxchg instruction on ARM64
      CPUs by improving the translation scheme: instead of generating a
      call to the GCC helper function, we introduce a new TCG IR
      instruction (CAS) and directly translate that into the ARM casal
      instruction.</p>
    <p>During benchmarking, we noticed that our version of QEMU performs
      correctly if we disable TCG optimizations (done in tcg/tcg.c:26).<br>
      If we enable them, however, the emulated program hangs
      indefinitely in futex syscalls. <br>
      We are not sure if this misbehavior stems from a bug in the
      implementation or if it is due to some assumptions made by the
      optimizer.<br>
    </p>
    <p>We have tried to analyse the program using -d
      in_asm,op,op_opt,out_asm, but could not determine the issue.</p>
    <p>Using gdb, we could determine where the threads hang.</p>
    <p>Threads 3 - END are in the futex syscall of the function
      do_futex_wait, waiting for thread 2 to be created.<br>
      Judging by the stack trace, Thread 2 seems to still be in the
      creation routine: <br>
      <br>
      <span style="font-family:monospace"><span
          style="font-family:monospace"><span
            style="color:#000000;background-color:#ffffff;">#0  syscall
            () at ../sysdeps/unix/sysv/linux/aarch64/syscall.S:38 </span><br>
          #1  0x0000aaaad21b4e60 in qemu_futex_wait (val=&lt;optimized
          out&gt;, f=&lt;optimized out&gt;) at
          /qemu/qemu/include/qemu/futex.h:29 <br>
          #2  qemu_event_wait (ev=ev@entry=0xaaaad25a9470
          &lt;rcu_call_ready_event&gt;) at
          ../util/qemu-thread-posix.c:480 <br>
          #3  0x0000aaaad21be044 in call_rcu_thread
          (opaque=opaque@entry=0x0) at ../util/rcu.c:258 <br>
          #4  0x0000aaaad21b3d38 in qemu_thread_start
          (args=&lt;optimized out&gt;) at
          ../util/qemu-thread-posix.c:541 <br>
          #5  0x0000ffffb2626f5c in start_thread (arg=0x0) at
          pthread_create.c:463 <br>
          #6  0x0000ffffb257eb1c in thread_start () at
          ../sysdeps/unix/sysv/linux/aarch64/clone.S:78<br>
          <br>
        </span></span></p>
    <p>The code for the creation of the threads is found at
      phoenix2.0/src/tpool.c:tpool_create<br>
      Thread 2 is created the same way the others are, however it is the
      only one failing.</p>
    <p>Commit introducing the native CAS emulation:
      <font color="white"> <a class="moz-txt-link-freetext"
href="https://github.com/rgouicem/qemu/commit/5bc56e203936338d98acdb868786834c751f87a7">https://github.com/rgouicem/qemu/commit/5bc56e203936338d98acdb868786834c751f87a7</a></font></p>
    <p>Repo with the code demonstrating the problem:
      <a class="moz-txt-link-freetext" href="https://github.com/haxkor/qemu_phoenix">https://github.com/haxkor/qemu_phoenix</a><br>
      Run it with qemu_opt ./histogram small.bmp<br>
    </p>
    <p>I have included my binary and the source code if you want to
      build it yourself, simply run "make" in the phoenix2 folder.<br>
      The binary will be at phoenix2/tests/histogram/histogram</p>
    <p>We hope to have provided you useful information. Please let us
      know if there is anything else we can do.</p>
    <p><br>
    </p>
    <p>Best regards,<br>
      Redha Gouicem and Jasper Ruehl.<br>
    </p>
    <p><br>
    </p>
  </body>
</html>
--------------Mha09Jw8Hc6Ic3bKn50D4Y9s--


