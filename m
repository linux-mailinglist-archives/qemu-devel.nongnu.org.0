Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F0BF2B71
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 10:52:30 +0100 (CET)
Received: from localhost ([::1]:40238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSeSr-0001mM-0Z
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 04:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60105)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iSeRE-0001GP-J2
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 04:50:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iSeRD-0003G2-9p
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 04:50:48 -0500
Received: from indium.canonical.com ([91.189.90.7]:33792)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iSeRD-0003Ai-47
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 04:50:47 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iSeRB-00037F-KD
 for <qemu-devel@nongnu.org>; Thu, 07 Nov 2019 09:50:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 789682E80C9
 for <qemu-devel@nongnu.org>; Thu,  7 Nov 2019 09:50:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 07 Nov 2019 09:41:54 -0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dgilbert-h marietto2008
X-Launchpad-Bug-Reporter: Marietto (marietto2008)
X-Launchpad-Bug-Modifier: Dr. David Alan Gilbert (dgilbert-h)
References: <157306426546.28368.6683622999323132409.malonedeb@chaenomeles.canonical.com>
Message-Id: <157311971459.2909.16940338236959599896.malone@gac.canonical.com>
Subject: [Bug 1851547] Re: qemu 4 crashes with this parameter attached -usb
 -device usb-host, hostbus=1, hostaddr=7 \
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="469f241f4e73cc0bdffa4e30654052a2af068e06";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 03d7e04de58d2edf469a84b497b61bd43e75e14a
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
Reply-To: Bug 1851547 <1851547@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marietto,
  Can you attach an lsusb output from your host?
I'm curious what host bug 1, addr 7 and 8 are.

Dave

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1851547

Title:
  qemu 4 crashes with this parameter attached -usb -device usb-
  host,hostbus=3D1,hostaddr=3D7 \

Status in QEMU:
  New

Bug description:
  Hello.

  qemu / kvm does not start anymore after upgrading ubuntu from 19.04 to
  19.10 and qemu from 3 to 4,as you can see below. what can I do ?

  root@ziomario-Z390-AORUS-PRO:/home/ziomario/Scrivania/OS-KVM# ./boot-
  OS-HSP2.sh

  ----> qemu-system-x86_64: /build/qemu-
  UryNDZ/qemu-4.0+dfsg/hw/usb/core.c:720: usb_ep_get: asserzione "dev !=3D
  NULL" non riuscita.

  ./boot-OS-HSP2.sh: riga 40: 26312 Annullato (core dump creato) qemu-
  system-x86_64 -enable-kvm -m 16000 -cpu
  Penryn,kvm=3Don,vendor=3DGenuineIntel,+invtsc,vmware-cpuid-
  freq=3Don,$MY_OPTIONS -machine pc-q35-2.9 -smp 4,cores=3D2 -vga none
  -device vfio-pci,host=3D01:00.0,bus=3Dpcie.0,multifunction=3Don -device
  vfio-pci,host=3D01:00.1,bus=3Dpcie.0 -device vfio-
  pci,host=3D01:00.2,bus=3Dpcie.0 -device vfio-pci,host=3D01:00.3,bus=3Dpci=
e.0
  -usb -device usb-host,hostbus=3D1,hostaddr=3D7 -drive
  if=3Dpflash,format=3Draw,readonly,file=3D$OVMF/OVMF_CODE.fd -drive
  if=3Dpflash,format=3Draw,file=3D$OVMF/OVMF_VARS-1024x768.fd -smbios type=
=3D2
  -device ich9-ahci,id=3Dsata -drive
  id=3DClover,if=3Dnone,snapshot=3Don,format=3Dqcow2,file=3D./'Mo/CloverNG.=
qcow2'
  -device ide-hd,bus=3Dsata.2,drive=3DClover -device ide-
  hd,bus=3Dsata.3,drive=3DInstallMedia -drive
  id=3DInstallMedia,if=3Dnone,file=3DBaseSystemHS.img,format=3Draw -drive
  id=3DBsdHDD,if=3Dnone,file=3D/dev/sdg,format=3Draw -device ide-
  hd,bus=3Dsata.4,drive=3DBsdHDD -netdev
  tap,id=3Dnet0,ifname=3Dtap0,script=3Dno,downscript=3Dno -device
  e1000-82545em,netdev=3Dnet0,id=3Dnet0,mac=3D52:54:00:c9:18:27 -monitor st=
dio

  It seems that this line is not good anymore (it worked with qemu 3.x)
  :

  -usb -device usb-host,hostbus=3D1,hostaddr=3D7 \

  when I removed it,it works. But I need that. With what can I change it
  ? You can reproduce that upgrading ubuntu 19.04 to 19.10 because in
  that way also qemu will be upgraded from 3 to 4. These are the
  packages that I'm using :

  root@ziomario-Z390-AORUS-PRO:/home/ziomario# qemu-system-x86_64 --version
  QEMU emulator version 4.0.0 (Debian 1:4.0+dfsg-0ubuntu9)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1851547/+subscriptions

