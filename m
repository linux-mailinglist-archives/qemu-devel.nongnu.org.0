Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 034B83705DA
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 08:12:11 +0200 (CEST)
Received: from localhost ([::1]:48524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcirK-0002qh-QQ
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 02:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lciq3-0002KP-Au
 for qemu-devel@nongnu.org; Sat, 01 May 2021 02:10:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:59376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lciq1-0007ir-E5
 for qemu-devel@nongnu.org; Sat, 01 May 2021 02:10:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lciq0-0001T8-5I
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 06:10:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1F3C62E8031
 for <qemu-devel@nongnu.org>; Sat,  1 May 2021 06:10:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 May 2021 06:00:53 -0000
From: Thomas Huth <1863333@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alex-l-williamson mprivozn th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Michal_Pr=C3=ADvozn=C3=ADk_=28mprivozn?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158169737821.29590.14612222914203628319.malonedeb@chaenomeles.canonical.com>
Message-Id: <161984885408.4188.12063304588722520644.malone@chaenomeles.canonical.com>
Subject: [Bug 1863333] Re: Assigning NVMe disk to a domain causes VFIO_MAP_DMA
 errors
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 944027a5c70febce82d35bf289dbffe8b26282b4
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
Reply-To: Bug 1863333 <1863333@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved
to QEMU's new bug tracker on gitlab.com and thus gets marked
as 'expired' now. Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/65


** Changed in: qemu
       Status: New =3D> Expired

** Changed in: qemu
     Assignee: Philippe Mathieu-Daud=C3=A9 (philmd) =3D> (unassigned)

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #65
   https://gitlab.com/qemu-project/qemu/-/issues/65

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1863333

Title:
  Assigning NVMe disk to a domain causes VFIO_MAP_DMA errors

Status in QEMU:
  Expired

Bug description:
  I'm seeing some errors when assigning my NVMe disk to qemu. This is
  the full command line:

  =

  /home/zippy/work/qemu/qemu.git/x86_64-softmmu/qemu-system-x86_64 \
  -name guest=3Dfedora,debug-threads=3Don \
  -S \
  -object secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu/=
domain-2-fedora/master-key.aes \
  -machine pc-i440fx-4.1,accel=3Dkvm,usb=3Doff,dump-guest-core=3Doff \
  -cpu host \
  -m size=3D4194304k,slots=3D16,maxmem=3D1099511627776k \
  -overcommit mem-lock=3Doff \
  -smp 4,sockets=3D1,dies=3D1,cores=3D2,threads=3D2 \
  -object iothread,id=3Diothread1 \
  -object iothread,id=3Diothread2 \
  -object iothread,id=3Diothread3 \
  -object iothread,id=3Diothread4 \
  -mem-prealloc \
  -mem-path /hugepages2M/libvirt/qemu/2-fedora \
  -numa node,nodeid=3D0,cpus=3D0,mem=3D4096 \
  -uuid 63840878-0deb-4095-97e6-fc444d9bc9fa \
  -no-user-config \
  -nodefaults \
  -chardev socket,id=3Dcharmonitor,fd=3D31,server,nowait \
  -mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol \
  -rtc base=3Dutc \
  -no-shutdown \
  -global PIIX4_PM.disable_s3=3D0 \
  -global PIIX4_PM.disable_s4=3D0 \
  -boot menu=3Don,strict=3Don \
  -device piix3-usb-uhci,id=3Dusb,bus=3Dpci.0,addr=3D0x1.0x2 \
  -device virtio-scsi-pci,id=3Dscsi0,bus=3Dpci.0,addr=3D0x4 \
  -device virtio-serial-pci,id=3Dvirtio-serial0,bus=3Dpci.0,addr=3D0x5 \
  -blockdev '{"driver":"file","filename":"/var/lib/libvirt/images/fedora.qc=
ow2","node-name":"libvirt-2-storage","auto-read-only":true,"discard":"unmap=
"}' \
  -blockdev '{"node-name":"libvirt-2-format","read-only":false,"discard":"u=
nmap","driver":"qcow2","file":"libvirt-2-storage","backing":null}' \
  -device scsi-hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D0,device_id=
=3Ddrive-scsi0-0-0-0,drive=3Dlibvirt-2-format,id=3Dscsi0-0-0-0,bootindex=3D=
1 \
  -blockdev '{"driver":"nvme","device":"0000:02:00.0","namespace":1,"node-n=
ame":"libvirt-1-storage","auto-read-only":true,"discard":"unmap"}' \
  -blockdev '{"node-name":"libvirt-1-format","read-only":false,"driver":"ra=
w","file":"libvirt-1-storage"}' \
  -device virtio-blk-pci,scsi=3Doff,bus=3Dpci.0,addr=3D0x6,drive=3Dlibvirt-=
1-format,id=3Dvirtio-disk0 \
  -netdev tap,fd=3D33,id=3Dhostnet0,vhost=3Don,vhostfd=3D34 \
  -device virtio-net-pci,host_mtu=3D9000,netdev=3Dhostnet0,id=3Dnet0,mac=3D=
52:54:00:a4:6f:91,bus=3Dpci.0,addr=3D0x3 \
  -chardev pty,id=3Dcharserial0 \
  -device isa-serial,chardev=3Dcharserial0,id=3Dserial0 \
  -chardev socket,id=3Dcharchannel0,fd=3D35,server,nowait \
  -device virtserialport,bus=3Dvirtio-serial0.0,nr=3D1,chardev=3Dcharchanne=
l0,id=3Dchannel0,name=3Dorg.qemu.guest_agent.0 \
  -spice port=3D5900,addr=3D0.0.0.0,disable-ticketing,seamless-migration=3D=
on \
  -device virtio-vga,id=3Dvideo0,virgl=3Don,max_outputs=3D1,bus=3Dpci.0,add=
r=3D0x2 \
  -device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x7 \
  -sandbox on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resourc=
econtrol=3Ddeny \
  -msg timestamp=3Don

  And these are the errors I see:

  2020-02-14T09:06:18.183167Z qemu-system-x86_64: VFIO_MAP_DMA failed: Inva=
lid argument
  2020-02-14T09:10:49.753767Z qemu-system-x86_64: VFIO_MAP_DMA failed: Cann=
ot allocate memory
  2020-02-14T09:11:04.530344Z qemu-system-x86_64: VFIO_MAP_DMA failed: No s=
pace left on device
  2020-02-14T09:11:04.531087Z qemu-system-x86_64: VFIO_MAP_DMA failed: No s=
pace left on device
  2020-02-14T09:11:04.531230Z qemu-system-x86_64: VFIO_MAP_DMA failed: No s=
pace left on device

  =

  I'm doing nothing with the disk inside the guest, but:

    # dd if=3D/dev/vda of=3D/dev/null status=3Dprogress

  (the disk appears as /dev/vda in the guest). Surprisingly, I do not
  see these errors when I use the traditional PCI assignment (-device
  vfio-pci). My versions of kernel and qemu:

  moe ~ # uname -r
  5.4.15-gentoo
  moe ~ # /home/zippy/work/qemu/qemu.git/x86_64-softmmu/qemu-system-x86_64 =
--version
  QEMU emulator version 4.2.50 (v4.2.0-1439-g5d6542bea7-dirty)
  Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1863333/+subscriptions

