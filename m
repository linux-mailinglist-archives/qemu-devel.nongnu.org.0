Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE6A3776F5
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 16:21:27 +0200 (CEST)
Received: from localhost ([::1]:53594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfkJC-0006JW-EI
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 10:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfkIP-0005Wu-93
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:20:37 -0400
Received: from indium.canonical.com ([91.189.90.7]:52574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfkIN-0006F7-MF
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:20:37 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfkIM-0004m0-1i
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 14:20:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 05F182E8139
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 14:20:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 14:10:48 -0000
From: Thomas Huth <1904210@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: k1eee pmaydell th-huth
X-Launchpad-Bug-Reporter: Wang Zhongwei (k1eee)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160527852783.476.2473984132248883691.malonedeb@chaenomeles.canonical.com>
Message-Id: <162056944842.10829.2412329397902876186.malone@chaenomeles.canonical.com>
Subject: [Bug 1904210] Re: Crashed with 'uncaught target signal SIGILL' while
 program has registered by signal(SIGILL, handler)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: d16e1cf2531676be81247987d46010e7992668b9
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1904210 <1904210@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter's patch had been included here:
https://gitlab.com/qemu-project/qemu/-/commit/acebed948c4f2f3be89
... so I'm closing this issue now. If you still think that there is anythin=
g left to do here, please open a new ticket in our new bug tracker here: ht=
tps://gitlab.com/qemu-project/qemu/-/issues

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1904210

Title:
  Crashed with 'uncaught target signal SIGILL' while program has
  registered by signal(SIGILL, handler)

Status in QEMU:
  Fix Released

Bug description:
  This binary is an CTF reverse challenge binary, it registers signal
  handler via 'signal(SIGILL, 0x1193D);' while 0x1193D is the SIGILL
  handler.

  Please see the attachment, the file 'repair' is the binary i mentioned
  above, the file 'qemu-arm' is an old version qemu at 2.5.0, and it
  seems an official release (not modified).

  Which means, it could be a bug in recent release.

  You need to input 'flag{' to the stdin to let the binary execute the
  illegal instruction at 0x10A68.

  In 2.5.0 version the -strace logs:
  116 uname(0xf6ffed40) =3D 0
  116 brk(NULL) =3D 0x0009f000
  116 brk(0x0009fd00) =3D 0x0009fd00
  116 readlink("/proc/self/exe",0xf6ffde78,4096) =3D 21
  116 brk(0x000c0d00) =3D 0x000c0d00
  116 brk(0x000c1000) =3D 0x000c1000
  116 access("/etc/ld.so.nohwcap",F_OK) =3D -1 errno=3D2 (No such file or d=
irectory)
  116 rt_sigaction(SIGILL,0xf6ffec48,0xf6ffecd4) =3D 0
  116 fstat64(1,0xf6ffe8e8) =3D 0
  116 ioctl(1,21505,-151000980,-151000924,652480,640808) =3D 0
  116 fstat64(0,0xf6ffe7d0) =3D 0
  116 ioctl(0,21505,-151001260,-151001204,652480,641152) =3D 0
  116 write(1,0xa5548,6)input: =3D 6
  116 read(0,0xa6550,4096)flag{
   =3D 6
  116 write(1,0xa5548,7)wrong!
   =3D 7
  116 _llseek(0,4294967295,4294967295,0xf6ffee18,SEEK_CUR) =3D -1 errno=3D2=
9 (Illegal seek)
  116 exit_group(0)

  In 2.11.1, it shows:
  113 uname(0xfffeed30) =3D 0
  113 brk(NULL) =3D 0x0009f000
  113 brk(0x0009fd00) =3D 0x0009fd00
  113 readlink("/proc/self/exe",0xfffede68,4096) =3D 21
  113 brk(0x000c0d00) =3D 0x000c0d00
  113 brk(0x000c1000) =3D 0x000c1000
  113 access("/etc/ld.so.nohwcap",F_OK) =3D -1 errno=3D2 (No such file or d=
irectory)
  113 rt_sigaction(SIGILL,0xfffeec38,0xfffeecc4) =3D 0
  113 fstat64(1,0xfffee8d8) =3D 0
  113 ioctl(1,21505,-71588,-71532,652480,640808) =3D 0
  113 fstat64(0,0xfffee7c0) =3D 0
  113 ioctl(0,21505,-71868,-71812,652480,641152) =3D 0
  113 write(1,0xa5548,6)input: =3D 6
  113 read(0,0xa6550,4096)flag{
   =3D 6
  --- SIGILL {si_signo=3DSIGILL, si_code=3D2, si_addr=3D0x00010a68} ---
  --- SIGILL {si_signo=3DSIGILL, si_code=3D2, si_addr=3D0x0001182c} ---
  qemu: uncaught target signal 4 (Illegal instruction) - core dumped
  Illegal instruction (core dumped)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1904210/+subscriptions

