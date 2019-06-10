Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEF03AE2E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 06:36:09 +0200 (CEST)
Received: from localhost ([::1]:40412 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haC2S-0006Pc-De
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 00:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57092)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1haBxn-0003Hu-NG
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 00:31:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1haBxj-0002mc-VO
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 00:31:17 -0400
Received: from indium.canonical.com ([91.189.90.7]:56456)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1haBxh-0002j7-AM
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 00:31:15 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1haBxd-00022h-7B
 for <qemu-devel@nongnu.org>; Mon, 10 Jun 2019 04:31:09 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 303D32E8079
 for <qemu-devel@nongnu.org>; Mon, 10 Jun 2019 04:31:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Jun 2019 04:17:28 -0000
From: Launchpad Bug Tracker <1525676@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Expired; importance=Wishlist; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: halfdog janitor paelzer sdeziel smb th-huth
X-Launchpad-Bug-Reporter: halfdog (halfdog)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20151213173042.25355.35514.malonedeb@soybean.canonical.com>
Message-Id: <156014024888.22010.7145895125458657220.malone@loganberry.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18978";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 3e2daa7e65201719284f97f92da49aa81ea3b30a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1525676] Re: qemu runas and sandbox option
 incompatible, process will hang in futex after setgid
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
Reply-To: Bug 1525676 <1525676@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1525676

Title:
  qemu runas and sandbox option incompatible, process will hang in futex
  after setgid

Status in QEMU:
  Expired
Status in qemu package in Ubuntu:
  Expired

Bug description:
  With -runas [user] and -sandbox on, qemu process will fail in the
  process of dropping privileges. While setgid() is done (see below),
  setuid() is not attempted. Instead process blocks waiting for a futex
  never to come.

  [pid 21769] +++ killed by SIGSYS +++
  [pid 21767] <... tgkill resumed> )      =3D 0
  [pid 21767] tgkill(21767, 21768, SIGRT_1 <unfinished ...>
  [pid 21768] <... nanosleep resumed> {0, 7284187}) =3D ? ERESTART_RESTARTB=
LOCK (Interrupted by signal)
  [pid 21768] --- SIGRT_1 {si_signo=3DSIGRT_1, si_code=3DSI_TKILL, si_pid=
=3D21767, si_uid=3D0} ---
  [pid 21768] setgid(100)                 =3D 0
  [pid 21768] futex(0x7f7f0f53fd1c, FUTEX_WAKE_PRIVATE, 1) =3D 0
  [pid 21768] rt_sigreturn()              =3D -1 EINTR (Interrupted system =
call)
  [pid 21768] nanosleep({0, 7284187},  <unfinished ...>
  [pid 21767] <... tgkill resumed> )      =3D 0
  [pid 21767] futex(0x7ffd5a9b6890, FUTEX_WAIT_PRIVATE, 3, NULL <unfinished=
 ...>
  [pid 21768] <... nanosleep resumed> 0x7f7f0f53eb00) =3D 0
  [pid 21768] futex(0x55f52acd1f44, FUTEX_WAIT, 4294967295, NULL

  This bug might be addresses in the discussion/patchset
  http://qemu.11.n7.nabble.com/PATCH-Add-syscalls-for-runas-and-chroot-
  to-the-seccomp-sandbox-td359588.html

  # lsb_release -rd
  Description:    Ubuntu 15.10
  Release:        15.10

  # apt-cache policy qemu-system-x86
  qemu-system-x86:
    Installed: 1:2.3+dfsg-5ubuntu9.1
    Candidate: 1:2.3+dfsg-5ubuntu9.1
    Version table:
   *** 1:2.3+dfsg-5ubuntu9.1 0
          500 http://archive.ubuntu.com/ubuntu/ wily-updates/main amd64 Pac=
kages
          500 http://archive.ubuntu.com/ubuntu/ wily-security/main amd64 Pa=
ckages
          100 /var/lib/dpkg/status
       1:2.3+dfsg-5ubuntu9 0
          500 http://archive.ubuntu.com/ubuntu/ wily/main amd64 Packages

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1525676/+subscriptions

