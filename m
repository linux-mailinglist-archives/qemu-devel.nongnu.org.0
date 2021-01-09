Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE862EFDAE
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 05:28:45 +0100 (CET)
Received: from localhost ([::1]:58410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky5ro-0001U5-Az
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 23:28:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5pi-0008Ff-SE
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:26:34 -0500
Received: from indium.canonical.com ([91.189.90.7]:46768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5pg-0006we-R1
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:26:34 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ky5pd-0007Hl-IY
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 04:26:29 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6A07B2E8197
 for <qemu-devel@nongnu.org>; Sat,  9 Jan 2021 04:26:26 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 Jan 2021 04:17:54 -0000
From: Launchpad Bug Tracker <1719339@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: canonical-is
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dzagorui janitor paulgear th-huth
X-Launchpad-Bug-Reporter: Denys Zagorui (dzagorui)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <150635197143.30872.17188090859541401647.malonedeb@wampee.canonical.com>
Message-Id: <161016587444.8490.12590899584383488530.malone@loganberry.canonical.com>
Subject: [Bug 1719339] Re: serial8250: too much work for irq3
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: 0af59e019943f70f4259d9e1521f95ad10ad2705
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1719339 <1719339@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1719339

Title:
  serial8250: too much work for irq3

Status in QEMU:
  Expired

Bug description:
  It's know issue and sometimes mentioned since 2007. But it seems not
  fixed.

  http://lists.gnu.org/archive/html/qemu-devel/2008-02/msg00140.html
  https://bugzilla.redhat.com/show_bug.cgi?id=3D986761
  http://old-list-archives.xenproject.org/archives/html/xen-devel/2009-02/m=
sg00696.html

  I don't think fixes like increases PASS_LIMIT
  (/drivers/tty/serial/8250.c) or remove this annoying message
  (https://patchwork.kernel.org/patch/3920801/) is real fix. Some fix
  was proposed by H. Peter Anvin  https://lkml.org/lkml/2008/2/7/485.

  Can reproduce on Debian Strech host (Qemu 1:2.8+dfsg-6+deb9u2), Ubuntu
  16.04.2 LTS (Qemu 1:2.5+dfsg-5ubuntu10.15) also tried to use master
  branch (QEMU emulator version 2.10.50 (v2.10.0-766-ga43415ebfd-dirty))
  if we write a lot of message into console (dmesg or dd if=3D/dev/zero
  of=3D/dev/ttyS1).

  /usr/local/bin/qemu-system-x86_64 -name guest=3Dultra1,debug-threads=3Don
  -S -object
  secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu/domain-2=
7-ultra1
  /master-key.aes -machine pc-i440fx-2.8,accel=3Dkvm,usb=3Doff,dump-guest-
  core=3Doff -cpu Skylake-
  Client,ds=3Don,acpi=3Don,ss=3Don,ht=3Don,tm=3Don,pbe=3Don,dtes64=3Don,mon=
itor=3Don,ds_cpl=3Don,vmx=3Don,smx=3Don,est=3Don,tm2=3Don,xtpr=3Don,pdcm=3D=
on,osxsave=3Don,tsc_adjust=3Don,clflushopt=3Don,pdpe1gb=3Don
  -m 4096 -realtime mlock=3Doff -smp 4,sockets=3D1,cores=3D4,threads=3D1 -u=
uid
  4537ca29-73b2-40c3-9b43-666de182ba5f -display none -no-user-config
  -nodefaults -chardev
  socket,id=3Dcharmonitor,path=3D/var/lib/libvirt/qemu/domain-27-ultra1/mon=
itor.sock,server,nowait
  -mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol -rtc
  base=3Dutc,driftfix=3Dslew -global kvm-pit.lost_tick_policy=3Ddelay -no-h=
pet
  -no-shutdown -global PIIX4_PM.disable_s3=3D1 -global
  PIIX4_PM.disable_s4=3D1 -boot strict=3Don -device ich9-usb-
  ehci1,id=3Dusb,bus=3Dpci.0,addr=3D0x8.0x7 -drive
  file=3D/home/dzagorui/csr/csr_disk.qcow2,format=3Dqcow2,if=3Dnone,id=3Ddr=
ive-
  ide0-0-0 -device ide-hd,bus=3Dide.0,unit=3D0,drive=3Ddrive-
  ide0-0-0,id=3Dide0-0-0,bootindex=3D1 -netdev tap,fd=3D26,id=3Dhostnet0 -d=
evice
  e1000,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:a9:4c:86,bus=3Dpci.0,add=
r=3D0x3
  -chardev
  socket,id=3Dcharserial0,host=3D127.0.0.1,port=3D4000,telnet,server,nowait
  -device isa-serial,chardev=3Dcharserial0,id=3Dserial0 -chardev
  socket,id=3Dcharserial1,host=3D127.0.0.1,port=3D4001,telnet,server,nowait
  -device isa-serial,chardev=3Dcharserial1,id=3Dserial1 -device virtio-
  balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x2 -msg timestamp=3Don

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1719339/+subscriptions

