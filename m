Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E8B6F0EA
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Jul 2019 00:25:55 +0200 (CEST)
Received: from localhost ([::1]:53798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoxnd-00067h-VY
	for lists+qemu-devel@lfdr.de; Sat, 20 Jul 2019 18:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47301)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hoxnR-0005jM-GH
 for qemu-devel@nongnu.org; Sat, 20 Jul 2019 18:25:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hoxnQ-00076Y-8c
 for qemu-devel@nongnu.org; Sat, 20 Jul 2019 18:25:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:42956)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hoxnQ-00075G-2h
 for qemu-devel@nongnu.org; Sat, 20 Jul 2019 18:25:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hoxnO-0002tT-82
 for <qemu-devel@nongnu.org>; Sat, 20 Jul 2019 22:25:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 357932E80C7
 for <qemu-devel@nongnu.org>; Sat, 20 Jul 2019 22:25:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 Jul 2019 22:15:44 -0000
From: post-factum <1837218@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: post-factum
X-Launchpad-Bug-Reporter: post-factum (post-factum)
X-Launchpad-Bug-Modifier: post-factum (post-factum)
References: <156354588692.30209.14783168884867057348.malonedeb@soybean.canonical.com>
Message-Id: <156366094422.8687.7086161697221768697.malone@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19010";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 756682c82f9b44fa10928f99a73561b6cce50014
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1837218] Re: qemu segfaults after spice update
 with bochs-display
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
Reply-To: Bug 1837218 <1837218@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've also built qemu v4.0.0 with debug info, and the issue is not
reproducible with such a build.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1837218

Title:
  qemu segfaults after spice update with bochs-display

Status in QEMU:
  New

Bug description:
  Description:

  qemu segfaults after latest spice update with bochs-display.
  Downgrading spice solves the issue. Switching to qxl-vga and/or
  virtio-gpu also works even with new spice.

  Additional info:
  * package version(s)

  spice 0.14.2-1 (0.14.0 is unaffected)
  qemu-headless 4.0.0-3

  * config and/or log files etc.

  pf@defiant:~ =C2=BB /mnt/vms/02-archlinux/start.sh
  /mnt/vms/02-archlinux/start.sh: line 41: 13501 Segmentation fault (core d=
umped) qemu-system-x86_64 -name "${NAME}" -display none -spice ipv4,addr=3D=
127.0.0.1,port=3D270${ID},disable-ticketing,disable-copy-paste,disable-agen=
t-file-xfer,agent-mouse=3Doff -serial mon:telnet:127.0.0.1:280${ID},server,=
nowait,nodelay -gdb tcp::260${ID} -nodefaults -machine q35,accel=3Dkvm -cpu=
 max -smp cores=3D${CPU},threads=3D1,sockets=3D1 -m ${MEM} -drive if=3Dpfla=
sh,format=3Draw,readonly,file=3D"${BIOS}" -drive if=3Dpflash,format=3Draw,f=
ile=3D"${VARS}" -device virtio-rng -device bochs-display -device virtio-key=
board -netdev bridge,id=3Dbridge.0,br=3Dvm0 -device virtio-net,mac=3D${_MAC=
}:01,netdev=3Dbridge.0,mq=3Don,vectors=3D${_VECTORS} -fsdev local,id=3D"${N=
AME}",path=3D"${SHARED}",security_model=3Dmapped,writeout=3Dimmediate -devi=
ce virtio-9p-pci,fsdev=3D"${NAME}",mount_tag=3D"shared" -device virtio-scsi=
,id=3Dscsi,num_queues=3D${CPU},vectors=3D${_VECTORS} -device scsi-hd,drive=
=3Dhd1 -drive if=3Dnone,media=3Ddisk,id=3Dhd1,file=3D"${DISK1}",format=3Dra=
w,cache=3Ddirectsync,discard=3Dunmap,detect-zeroes=3Dunmap -device scsi-hd,=
drive=3Dhd2 -drive if=3Dnone,media=3Ddisk,id=3Dhd2,file=3D"${DISK2}",format=
=3Draw,cache=3Ddirectsync,discard=3Dunmap,detect-zeroes=3Dunmap -device scs=
i-cd,drive=3Dcd1 -drive if=3Dnone,media=3Dcdrom,id=3Dcd1,file=3D"${CDROM1}"=
,format=3Draw,cache=3Ddirectsync

  Steps to reproduce:

  Update spice, launch a VM like the above and observe a segfault.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1837218/+subscriptions

