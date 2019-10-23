Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED36E1EB8
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 17:00:07 +0200 (CEST)
Received: from localhost ([::1]:38514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNI7J-0005vx-K3
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 11:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60974)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iNHz2-0000KP-1y
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 10:51:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iNHz0-0003Wa-3X
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 10:51:31 -0400
Received: from indium.canonical.com ([91.189.90.7]:35746)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iNHyz-0003UH-Sk
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 10:51:30 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iNHyv-0005lA-VW
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 14:51:25 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D80E92E8083
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 14:51:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Oct 2019 14:38:50 -0000
From: Thomas Huth <1656234@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: robert-hu stefanha th-huth
X-Launchpad-Bug-Reporter: Robert Hu (robert-hu)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20170113084022.20152.24498.malonedeb@wampee.canonical.com>
Message-Id: <157184153031.28406.10800705354498659048.malone@chaenomeles.canonical.com>
Subject: [Bug 1656234] Re: Qemu core dumped if using virtio-net
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="469f241f4e73cc0bdffa4e30654052a2af068e06";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 66e745a025d3e073aee79e478014d32ef1bfb214
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1656234 <1656234@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix had been included here:
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3D332fa82d0963409

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1656234

Title:
  Qemu core dumped if using virtio-net

Status in QEMU:
  Fix Released

Bug description:
  System Environment
  =3D=3D=3D=3D=3D=3D=3D
  Qemu commit/branch: e92fbc75
  Host OS: RHEL7.2 ia32e
  Host Kernel: 4.9.0
  Guest OS: RHEL7.2 ia32e
  Guest Kernel: 4.9.0

  Bug detailed description
  =3D=3D=3D=3D=3D=3D=3D
  While create a kvm guest using virtio-net, the qemu will core dump with s=
howing "Aborted (core dumped)".
  Reproduce Steps
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  create a guest:
  qemu-system-x86_64 -enable-kvm -m 4096 -smp 4 -device virtio-net-pci,netd=
ev=3Dnic0,mac=3D00:16:3e:49:be:24 -netdev tap,id=3Dnic0,script=3D/etc/kvm/q=
emu-ifup -drive file=3D/ia32e_rhel7u2_kvm.qcow2,if=3Dnone,id=3Dvirtio-disk0=
 -device virtio-blk-pci,drive=3Dvirtio-disk0 -serial file:serial.log

  Current Result:
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  qemu-system-x86_64: /workspace/ia32e/nightly/kvm-next-20170105-ef85b6-e92=
fbc/kvm/qemu/hw/virtio/virtio.c:214: virtio_queue_set_notification: Asserti=
on `vq->notification_disabled > 0' failed.
  Aborted (core dumped)

  add info
  =3D=3D=3D=3D=3D=3D=3D=3D
  [root@hsw-ep2 Desktop]# dmesg |grep -v virbr0 |tail -n 10
  [ 1760.265000] device tap0 left promiscuous mode
  [ 1879.148642] device tap0 entered promiscuous mode
  [ 1885.213702] kvm [14186]: vcpu0, guest rIP: 0xffffffff81066784 disabled=
 perfctr wrmsr: 0xc2 data 0xffff
  [ 1912.258783] device tap0 left promiscuous mode
  [ 1995.972267] device tap0 entered promiscuous mode
  [ 2001.990207] kvm [14335]: vcpu0, guest rIP: 0xffffffff81066784 disabled=
 perfctr wrmsr: 0xc2 data 0xffff
  [ 2024.703072] device tap0 left promiscuous mode
  [ 2145.374239] device tap0 entered promiscuous mode
  [ 2151.409948] kvm [14541]: vcpu0, guest rIP: 0xffffffff81066784 disabled=
 perfctr wrmsr: 0xc2 data 0xffff
  [ 2178.281446] device tap0 left promiscuous mode

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1656234/+subscriptions

