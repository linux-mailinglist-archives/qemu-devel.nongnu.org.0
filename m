Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556A33BB65B
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 06:29:31 +0200 (CEST)
Received: from localhost ([::1]:38258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0GEc-0003iT-EG
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 00:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0GBY-0003rO-7a
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 00:26:20 -0400
Received: from indium.canonical.com ([91.189.90.7]:49118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0GBS-0002t6-4c
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 00:26:19 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0GBN-0004RZ-Br
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 04:26:09 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 37D742E825D
 for <qemu-devel@nongnu.org>; Mon,  5 Jul 2021 04:25:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Jul 2021 04:17:25 -0000
From: Launchpad Bug Tracker <1861653@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: awdrg901 janitor th-huth
X-Launchpad-Bug-Reporter: zwq (awdrg901)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158071042004.19865.7386710530747108432.malonedeb@wampee.canonical.com>
Message-Id: <162545864592.12677.8758861024214132942.malone@loganberry.canonical.com>
Subject: [Bug 1861653] Re: CPU of qemu-system-aarch64 always stuck
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c7d3f30bfe7d7b488c7f9d3c8d7880184b1d065e"; Instance="production"
X-Launchpad-Hash: 162e9e7c2f9bdadfb8b0b7b0a7b159672c3d857c
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1861653 <1861653@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1861653

Title:
  CPU of qemu-system-aarch64 always stuck

Status in QEMU:
  Expired

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

