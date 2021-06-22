Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FB73AFBFC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:33:36 +0200 (CEST)
Received: from localhost ([::1]:60294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvY6R-0005p9-Ej
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzS-0006Qq-3J
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:22 -0400
Received: from indium.canonical.com ([91.189.90.7]:55810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzP-0004s8-U8
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:21 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvXzA-000164-E5
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:04 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C728F2E819F
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:18:42 -0000
From: Launchpad Bug Tracker <1851972@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor joeyadams3-14159 meoporter philmd th-huth
X-Launchpad-Bug-Reporter: Marshall Porter (meoporter)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <157336268640.31256.1488114867676518393.malonedeb@wampee.canonical.com>
Message-Id: <162433552268.20423.3557039532468519884.malone@loganberry.canonical.com>
Subject: [Bug 1851972] Re: pc-q35-4.1 and AMD Navi 5700/XT incompatible
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 7bdff78cd137e8cbe688a320ac970b87633ba651
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1851972 <1851972@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1851972

Title:
  pc-q35-4.1 and AMD Navi 5700/XT incompatible

Status in QEMU:
  Expired

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

