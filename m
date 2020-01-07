Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5C71324FE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 12:35:07 +0100 (CET)
Received: from localhost ([::1]:46924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ion59-0007BC-P0
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 06:31:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37506)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iomq4-0000uQ-Q7
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 06:15:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iomq3-0001TZ-4L
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 06:15:56 -0500
Received: from indium.canonical.com ([91.189.90.7]:40910)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iomq2-0001T9-Um
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 06:15:55 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iomq0-0006cl-W7
 for <qemu-devel@nongnu.org>; Tue, 07 Jan 2020 11:15:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F1CAE2E80CB
 for <qemu-devel@nongnu.org>; Tue,  7 Jan 2020 11:15:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jan 2020 11:02:35 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1851972@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: meoporter philmd
X-Launchpad-Bug-Reporter: Marshall Porter (meoporter)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <157336268640.31256.1488114867676518393.malonedeb@wampee.canonical.com>
Message-Id: <157839495526.14768.14870270568453501440.malone@wampee.canonical.com>
Subject: [Bug 1851972] Re: pc-q35-4.1 and AMD Navi 5700/XT incompatible
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 26aaa228d50ea36a284c989d28541bff03c79b45
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
Reply-To: Bug 1851972 <1851972@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini commented on IRC: AMD avic requires kernel_irqchip=3Dsplit.

Can you try using it? (released QEMU uses -machine
...,kernel_irqchip=3Dsplit, git QEMU expects -accel kernel_irqchip=3Dsplit).

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1851972

Title:
  pc-q35-4.1 and AMD Navi 5700/XT incompatible

Status in QEMU:
  New

Bug description:
  Hello,

  I am not sure if this qualifies as a "bug"; it is be more of an
  unknown issue with default settings. However, since the default value
  of q35 default_kernel_irqchip_split was changed seemingly due to
  similar user feedback, I thought this was important to share..

  AMD Navi 5700/XT vfio-pci passthrough seems incompatible with
  one/multiple settings in pc-q35-3.1 and higher. The workaround for me
  is that pc-q35-3.0 still works fine passing through the GPU and
  official drivers can load/install fine.

  The default/generic GPU drivers in a Fedora 30 or Windows 1903 guest
  do work; the monitor displays the desktop in a 800x600 resolution and
  things are rendered fine.. so the basic functionality of the card
  seems fine with pc-q35-4.1.

  But attempting to use the official open source AMD driver with the
  card resulted in a hung kernel for the Fedora 30 guest.. and a BSOD on
  the Windows 1903 guest immediately during driver install.

  I do not see any errors in Qemu command output.. did not investigate
  other logs or KVM etc, because I am not sure what to look for or how
  to go about it. Also not sure which combination of the latest q35
  default settings are valid combinations to try either, because it
  seems that multiple things have changed related to pcie-root-port
  defaults and other machine options. I am happy to run tests and
  provide feedback if that helps identify the issue.

  I am using "Linux arch 5.4.0-rc6-mainline" kernel on ArchLinux host
  with AMD Navi reset pci quirk patch applied.

  My working Qemu command line is this:

  QEMU_AUDIO_DRV=3Dpa \
  QEMU_PA_SERVER=3D/run/user/1000/pulse/native \
  /usr/bin/qemu-system-x86_64 \
  -name windows \
  -m 16g \
  -accel kvm \
  -machine pc-q35-3.0,accel=3Dkvm,pflash0=3Dovmf0,pflash1=3Dovmf1 \
  -blockdev node-name=3Dovmf0,driver=3Dfile,filename=3D/virt/qemu/roms/OVMF=
_CODE.fd,read-only=3Don \
  -blockdev node-name=3Dovmf1,driver=3Dfile,filename=3D/virt/qemu/machines/=
windows/OVMF_VARS.fd \
  -boot menu=3Don \
  -global kvm-pit.lost_tick_policy=3Ddiscard \
  -no-hpet \
  -rtc base=3Dutc,clock=3Dhost,driftfix=3Dslew \
  -cpu host,kvm=3Doff,hv_vendor_id=3DRedHatRedHat,hv_spinlocks=3D0x1fff,hv_=
vapic,hv_time,hv_reset,hv_vpindex,hv_runtime,hv_relaxed,hv_synic,hv_stimer \
  -smp sockets=3D1,cores=3D4,threads=3D1 \
  -nodefaults \
  -netdev bridge,br=3Dbr0,id=3Dnet0 \
  -device virtio-net-pci,netdev=3Dnet0,addr=3D19.0,mac=3D52:54:00:12:34:77 \
  -device virtio-scsi-pci \
  -blockdev raw,node-name=3Ddisk0,cache.direct=3Doff,discard=3Dunmap,file.d=
river=3Dfile,file.aio=3Dthreads,file.filename=3D/virt/qemu/machines/windows=
/os.raw \
  -device scsi-hd,drive=3Ddisk0,rotation_rate=3D1 \
  -blockdev raw,node-name=3Ddisk1,cache.direct=3Doff,discard=3Dunmap,file.d=
river=3Dfile,file.aio=3Dthreads,file.filename=3D/virt/qemu/machines/windows=
/data.raw \
  -device scsi-hd,drive=3Ddisk1,rotation_rate=3D1 \
  -drive index=3D0,if=3Dide,media=3Dcdrom,readonly,file=3D/virt/qemu/isos/W=
in10_1903_V2_English_x64.iso \
  -drive index=3D1,if=3Dide,media=3Dcdrom,readonly,file=3D/virt/qemu/isos/v=
irtio-win-0.1.173.iso \
  -device ich9-intel-hda,addr=3D1b.0 \
  -device hda-output \
  -monitor stdio \
  -display none \
  -vga none \
  -device pcie-root-port,id=3Dpcierp0,chassis=3D1,slot=3D1,addr=3D1c.0,disa=
ble-acs=3Don,multifunction=3Don \
  -device pcie-root-port,id=3Dpcierp1,chassis=3D2,slot=3D2,addr=3D1c.1,disa=
ble-acs=3Don \
  -device x3130-upstream,bus=3Dpcierp0,id=3Dpcieu0 \
  -device xio3130-downstream,bus=3Dpcieu0,id=3Dpcied0,chassis=3D11,slot=3D1=
1 \
  -device vfio-pci,host=3D03:00.0,bus=3Dpcied0,addr=3D00.0,multifunction=3D=
on \
  -device vfio-pci,host=3D03:00.1,bus=3Dpcied0,addr=3D00.1 \
  -device qemu-xhci,addr=3D1d.0 \
  -device usb-host,vendorid=3D0x258a,productid=3D0x0001 \
  -device usb-host,vendorid=3D0x1bcf,productid=3D0x0005 ;

  Thank you!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1851972/+subscriptions

