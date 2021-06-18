Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460103ACF1A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:32:40 +0200 (CEST)
Received: from localhost ([::1]:35092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luGU3-0007QB-8q
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1luGR4-0002cn-IC
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:29:34 -0400
Received: from indium.canonical.com ([91.189.90.7]:58032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1luGR1-0000Uk-GQ
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:29:34 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1luGQx-0003sA-0c
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 15:29:27 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EF0B32E8085
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 15:29:26 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Jun 2021 15:19:10 -0000
From: Thomas Huth <1581334@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=ceph; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug: product=linux; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug: product=qemu; status=Won't Fix; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chenwqin jdillaman jdurgin serge-hallyn th-huth
X-Launchpad-Bug-Reporter: chenwqin (chenwqin)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160513064148.21523.39352.malonedeb@wampee.canonical.com>
Message-Id: <162402955066.17261.1917997991877642620.malone@gac.canonical.com>
Subject: [Bug 1581334] Re: qemu + librbd takes high %sy cpu under high random
 io workload
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: 4fa30575bfa392827c141be3cf2a85555ce56fa1
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1581334 <1581334@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since there wasn't a reply within the last two months, I'm assuming this
doesn't affect QEMU anymore, thus I'm closing this ticket for QEMU now.

** Changed in: qemu
       Status: Incomplete =3D> Won't Fix

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1581334

Title:
  qemu + librbd takes high %sy cpu under high random io workload

Status in Ceph:
  New
Status in Linux:
  New
Status in QEMU:
  Won't Fix

Bug description:
  I got an IO problem. When running Qemu + ceph(use librbd), and do a rando=
m IO benchmark or some high load random IO test, it will exhaust all my hos=
t cpu on %sy cpu.
  It doesn=E2=80=99t happen all the time, but when it appear it will reprod=
uce every time I start a random IO benchmark(test with Fio).
  And the only way to fix the problem is shutdown my vm and start it, but t=
he problem will happen again with high random IO load.

  Some information:
      Vendor      : HP
      Product     : HP ProLiant BL460c Gen9
      Kernel      : 3.16.0-4-amd64
      Disto       : Debian
      Version     : 8.4
      Arch        : amd64
      Qemu        : 2.1 ~ 2.6 (Yes, I already test the latest qemu2.6 versi=
on, but still got the problem)
      Ceph        : Hammer 0.94.5
      Librbd      : 0.94.5 ~ 10.2 (I rebuild librbd with ceph 10.2 source c=
ode, but the problem still here)
      Qemu config : cache=3Dnone
      Qemu cpu&mem: 4core, 8GB

  How can i reproduce the problem?

  while :; do bash randwrite.sh ; sleep 3600; done >test.log 2>&1 &
  (Sleep 3600 is the key to reproduce my problem. I don=E2=80=99t known how=
 long sleep suit for reproduce, but one hour sleep is enough. the problem w=
ill easy reproduce after a long sleep, if i keep benchmark running without =
sleep, i can't reproduce it)

  My randwrite.sh script
  ----------------------------------------------
  #!/bin/sh
  sync
  echo 3 > /proc/sys/vm/drop_caches

  FILENAME=3D/dev/vdc
  RUNTIME=3D100
  BLOCKSIZE=3D4K
  IOENGINE=3Dlibaio
  RESULTFILE=3Dfio-randwrite.log
  IODEPTH=3D32
  RAMP_TIME=3D5
  SIZE=3D100G

  fio --numjobs 10 --norandommap --randrepeat=3D0 --readwrite=3Drandwrite -=
-ramp_time=3D$RAMP_TIME --bs=3D$BLOCKSIZE --runtime=3D$RUNTIME --iodepth=3D=
$IODEPTH --filename=3D$FILENAME --ioengine=3D$IOENGINE --direct=3D1 --name=
=3Diops_randwrite --group_reporting  | tee $RESULTFILE
  ----------------------------------------------

  What happened after the problem appear?
  my vm will got huge IOPS drop. In my case, it will drop from 15000 IOPS t=
o 3500 IOPS. And other thing, my host cpu will exhaust on %sy. Top output l=
ike this.

  Qemu Fio benchmark
  ----------------------------------------------------
  Tasks: 284 total,   2 running, 282 sleeping,   0 stopped,   0 zombie
  %Cpu0  : 11.8 us, 66.7 sy,  0.0 ni, 21.5 id,  0.0 wa,  0.0 hi,  0.0 si,  =
0.0 st
  %Cpu1  : 12.7 us, 64.9 sy,  0.0 ni, 22.4 id,  0.0 wa,  0.0 hi,  0.0 si,  =
0.0 st
  %Cpu2  : 13.7 us, 64.5 sy,  0.0 ni, 21.7 id,  0.0 wa,  0.0 hi,  0.0 si,  =
0.0 st
  %Cpu3  : 13.2 us, 64.1 sy,  0.0 ni, 22.7 id,  0.0 wa,  0.0 hi,  0.0 si,  =
0.0 st
  %Cpu4  : 11.7 us, 65.4 sy,  0.0 ni, 22.8 id,  0.0 wa,  0.0 hi,  0.0 si,  =
0.0 st
  %Cpu5  : 13.2 us, 64.4 sy,  0.0 ni, 22.4 id,  0.0 wa,  0.0 hi,  0.0 si,  =
0.0 st
  %Cpu6  : 12.4 us, 65.1 sy,  0.0 ni, 22.5 id,  0.0 wa,  0.0 hi,  0.0 si,  =
0.0 st
  %Cpu7  : 13.6 us, 63.8 sy,  0.0 ni, 22.6 id,  0.0 wa,  0.0 hi,  0.0 si,  =
0.0 st
  %Cpu8  :  9.8 us, 73.0 sy,  0.0 ni, 17.2 id,  0.0 wa,  0.0 hi,  0.0 si,  =
0.0 st
  %Cpu9  :  7.8 us, 74.5 sy,  0.0 ni, 17.7 id,  0.0 wa,  0.0 hi,  0.0 si,  =
0.0 st
  %Cpu10 :  6.0 us, 81.4 sy,  0.0 ni,  6.6 id,  0.0 wa,  0.0 hi,  6.0 si,  =
0.0 st
  %Cpu11 :  8.4 us, 79.5 sy,  0.0 ni,  8.8 id,  0.0 wa,  0.0 hi,  3.4 si,  =
0.0 st
  %Cpu12 :  7.6 us, 80.7 sy,  0.0 ni,  7.0 id,  0.0 wa,  0.0 hi,  4.7 si,  =
0.0 st
  %Cpu13 :  7.4 us, 79.9 sy,  0.0 ni,  7.7 id,  0.0 wa,  0.0 hi,  5.0 si,  =
0.0 st
  %Cpu14 :  9.8 us, 75.4 sy,  0.0 ni, 11.4 id,  0.0 wa,  0.0 hi,  3.4 si,  =
0.0 st
  %Cpu15 :  6.7 us, 80.1 sy,  0.0 ni, 10.1 id,  0.0 wa,  0.0 hi,  3.0 si,  =
0.0 st
  %Cpu16 :  9.2 us, 69.2 sy,  0.0 ni, 17.5 id,  0.0 wa,  0.0 hi,  4.1 si,  =
0.0 st
  %Cpu17 :  9.9 us, 66.6 sy,  0.0 ni, 20.1 id,  0.0 wa,  0.0 hi,  3.4 si,  =
0.0 st
  %Cpu18 : 16.6 us, 49.0 sy,  0.0 ni, 34.4 id,  0.0 wa,  0.0 hi,  0.0 si,  =
0.0 st
  %Cpu19 : 16.7 us, 46.4 sy,  0.0 ni, 36.9 id,  0.0 wa,  0.0 hi,  0.0 si,  =
0.0 st
  %Cpu20 : 13.0 us, 50.8 sy,  0.0 ni, 36.1 id,  0.0 wa,  0.0 hi,  0.0 si,  =
0.0 st
  %Cpu21 : 18.9 us, 46.2 sy,  0.0 ni, 34.9 id,  0.0 wa,  0.0 hi,  0.0 si,  =
0.0 st
  %Cpu22 : 12.1 us, 52.9 sy,  0.0 ni, 35.0 id,  0.0 wa,  0.0 hi,  0.0 si,  =
0.0 st
  %Cpu23 : 15.9 us, 47.6 sy,  0.0 ni, 36.6 id,  0.0 wa,  0.0 hi,  0.0 si,  =
0.0 st
  %Cpu24 :  6.7 us, 62.0 sy,  0.0 ni, 31.3 id,  0.0 wa,  0.0 hi,  0.0 si,  =
0.0 st
  %Cpu25 :  7.6 us, 63.7 sy,  0.0 ni, 28.7 id,  0.0 wa,  0.0 hi,  0.0 si,  =
0.0 st
  %Cpu26 :  8.1 us, 75.8 sy,  0.0 ni, 16.1 id,  0.0 wa,  0.0 hi,  0.0 si,  =
0.0 st
  %Cpu27 :  6.7 us, 73.6 sy,  0.0 ni, 19.7 id,  0.0 wa,  0.0 hi,  0.0 si,  =
0.0 st
  %Cpu28 :  9.2 us, 74.3 sy,  0.0 ni, 16.4 id,  0.0 wa,  0.0 hi,  0.0 si,  =
0.0 st
  %Cpu29 :  8.2 us, 73.3 sy,  0.0 ni, 18.5 id,  0.0 wa,  0.0 hi,  0.0 si,  =
0.0 st
  %Cpu30 :  4.4 us, 73.1 sy,  0.0 ni, 22.4 id,  0.0 wa,  0.0 hi,  0.0 si,  =
0.0 st
  %Cpu31 :  7.5 us, 69.6 sy,  0.0 ni, 22.9 id,  0.0 wa,  0.0 hi,  0.0 si,  =
0.0 st
  KiB Mem:  13217662+total,  3721572 used, 12845504+free,   283228 buffers
  KiB Swap:  4194300 total,        0 used,  4194300 free.  2242976 cached M=
em

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMA=
ND
  30349 root      20   0 25.381g 499892  20640 R  2495  0.4 119:11.98 qemu-=
system-x86

  Anything I do?
  I use perf top, profile to debug the problem. It show me that something l=
ike thread deadlock problem. Any I test QEMU with kernel RBD, it work fine.
  Here are the perf top output on host.
  ---------------------------------------------------------------
     PerfTop:   12393 irqs/sec  kernel:87.3%  exact:  0.0% [4000Hz cycles],=
  (all, 32 CPUs)
  -------------------------------------------------------------------------=
------

      75.25%  [kernel]            [k] _raw_spin_lock
       1.17%  [kernel]            [k] futex_wait_setup
       0.86%  libc-2.19.so        [.] malloc
       0.58%  [kernel]            [k] futex_wake
       0.55%  libc-2.19.so        [.] 0x00000000000ea96f
       0.41%  [kernel]            [k] native_write_msr_safe
  ---------------------------------------------------------------

To manage notifications about this bug go to:
https://bugs.launchpad.net/ceph/+bug/1581334/+subscriptions

