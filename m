Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31724373EC1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 17:42:41 +0200 (CEST)
Received: from localhost ([::1]:58618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leJfY-0004GX-6K
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 11:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leJUU-0001vP-57
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:31:10 -0400
Received: from indium.canonical.com ([91.189.90.7]:46452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leJUQ-0005Hu-7q
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:31:09 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leJUK-0005oT-TJ
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 15:31:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3E1922E8194
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 15:30:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 15:23:10 -0000
From: Thomas Huth <1861653@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: awdrg901 th-huth
X-Launchpad-Bug-Reporter: zwq (awdrg901)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158071042004.19865.7386710530747108432.malonedeb@wampee.canonical.com>
Message-Id: <162022819017.14445.17739974022585401595.malone@soybean.canonical.com>
Subject: [Bug 1861653] Re: CPU of qemu-system-aarch64 always stuck
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 9334c4658f5368a1d8d9150537a5682ba379f593
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
Reply-To: Bug 1861653 <1861653@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

** Tags added: arm

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1861653

Title:
  CPU of qemu-system-aarch64 always stuck

Status in QEMU:
  Incomplete

Bug description:
  I started qemu with these arguments:
   qemu-system-aarch64 -M virt-2.9 -cpu cortex-a72 -smp cores=3D8,threads=
=3D1,sockets=3D1 -m 2G -device nec-usb-xhci -device usb-kbd -device usb-tab=
let -pflash /sdcard/QEMU_EFI.img -pflash /sdcard/QEMU_VARS.img -device virt=
io-blk-device,drive=3DUbuntu -drive if=3Dnone,id=3DUbuntu,file=3DUbuntu.vhd=
 -nographic -net user -net nic,model=3Drtl8139 -kernel linux -initrd initrd=
.gz
  The setup program of Ubuntu devel aarch64 ran normally.But after several =
hours,the CPUs emulated by qemu-system-aarch64 went wrong.
  Here are the messages displayed on the tty
  [15842.164745] watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [ksoftir=
qd/0:9]                                                                    =
     [15930.163589] watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [ksof=
tirqd/0:9]
  [16110.163540] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [ksoftir=
qd/0:9] =

  [16290.162801] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [ksoftir=
qd/0:9]
  [16470.163927] watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [ksoftir=
qd/0:9] =

  [16650.163246] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [ksoftir=
qd/0:9] =

  [16830.163216] watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [ksoftir=
qd/0:9] =

  [17010.164504] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [ksoftir=
qd/0:9]

  Then I tried CentOS 7.1908 aarch64 with almost the same arguments.
  After several hours,it went wrong too.
  [17480 . 201 1 58] rcu : (3 ticks this GP) idle=3D362/0/0x3 softirq=3D616=
31 /61 631 fqs=3D10077
  [17480 . 204889] (detected by 3 , t=3D24007 jiffies , g=3D218453 , q=3D52=
85) [1 7480 . 21 7986] Task dump for CPU 7 :
  [17480.222379] swapper/7R running task	0 =

  0  0x0000002a [17480.229073] Call trace :
  [1 7480.241518]	switch t0+0x104/0x1 f8
  [17480.249839]	Ox7fffffffffffffff
  [17660.232314] rcu : INFO: rcu sched detected stalls on CPUs/ tasks :
  [17660.233580] rcu : (3 ticks this GP) idle=3D362/0/0x3 softirq=3D61631 /=
61 631 fqs=3D17770
  [17660.235837] (detected by 3,t=3D42012 jiffies , g=3D218453 , q=3D7039) =

  [17660 . 237955] Task dump for CPU 7 :
  [17660.238900] swapper/ 7  R running task  0   0
  [17660.242967] Call trace :
  [17660.246192]	switch t0+0x104/0x1 f8
  [17660.253215]	Ox7fffffffffffffff

  Obviously qemu-system-aarch64 caused these bugs.

  qemu version: 4.x(I have tested version 4.0 & 4.1.0 & 4.2.0)
  host architecture: aarch64(Qualcomm Snapdragon series)
  host system:Ubuntu devel 20.04& Debian 10(I have tested on many devices)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1861653/+subscriptions

