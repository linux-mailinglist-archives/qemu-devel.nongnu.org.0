Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A571937131C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 11:41:54 +0200 (CEST)
Received: from localhost ([::1]:60854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldV5N-0001TW-OS
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 05:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldV3B-00008v-6t
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:39:37 -0400
Received: from indium.canonical.com ([91.189.90.7]:34924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldV36-0003vL-W4
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:39:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldV34-0003tU-KS
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 09:39:30 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 99F1B2E815C
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 09:39:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 09:28:41 -0000
From: Thomas Huth <697510@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr bugs-syssec janitor jeromepoulin stefanha
 th-huth vrozenfe
X-Launchpad-Bug-Reporter: =?utf-8?q?J=C3=A9r=C3=B4me_Poulin_=28jeromepoulin?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20110105050549.989.70900.malonedeb@wampee.canonical.com>
Message-Id: <162003412144.13621.3426637869652195515.malone@wampee.canonical.com>
Subject: [Bug 697510] Re: Machine shut off after tons of lsi_scsi: error: MSG
 IN data too long
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: e55d56b430fbcf1c8638310839795ee21a849ab2
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 697510 <697510@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/84


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #84
   https://gitlab.com/qemu-project/qemu/-/issues/84

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/697510

Title:
  Machine shut off after tons of lsi_scsi: error: MSG IN data too long

Status in QEMU:
  Expired

Bug description:
  The problem mostly happens during our backup, syslog does not have any
  problematic messages.

  Host is Ubuntu 10.10 x86 64 bits
  Guest is Windows 2003 Server 32 bits
  Using Virtio and Red Hat driver I get a STOP screen 0x100000d1 and machin=
e either reboot, stay frozen or shut off.
  Using SCSI the machine shuts off and I get tons of message on stdout;

  LC_ALL=3DC PATH=3D/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin=
:/bin QEMU_AUDIO_DRV=3Dnone /usr/bin/kvm -S -M pc-0.12 -enable-kvm -m 3500 =
-smp 4,sockets=3D4,cores=3D1,threads=3D1 -name BMSRV0101 -uuid 6ccbb5fa-588=
0-a1ab-3b7a-fb7ccc7c8ccf -nodefaults -chardev socket,id=3Dmonitor,path=3D/v=
ar/lib/libvirt/qemu/BMSRV0101.monitor,server,nowait -mon chardev=3Dmonitor,=
mode=3Dreadline -rtc base=3Dlocaltime -boot c -device lsi,id=3Dscsi0,bus=3D=
pci.0,addr=3D0x4 -drive if=3Dnone,media=3Dcdrom,id=3Ddrive-ide0-1-0,readonl=
y=3Don,format=3Draw -device ide-drive,bus=3Dide.1,unit=3D0,drive=3Ddrive-id=
e0-1-0,id=3Dide0-1-0 -drive file=3D/dev/vgUbuntu/vmBMSRV0101,if=3Dnone,id=
=3Ddrive-scsi0-0-0,boot=3Don,format=3Draw -device scsi-disk,bus=3Dscsi0.0,s=
csi-id=3D0,drive=3Ddrive-scsi0-0-0,id=3Dscsi0-0-0 -device virtio-net-pci,vl=
an=3D0,id=3Dnet0,mac=3D52:54:00:5d:7b:07,bus=3Dpci.0,addr=3D0x3 -net tap,fd=
=3D63,vlan=3D0,name=3Dhostnet0 -chardev pty,id=3Dserial0 -device isa-serial=
,chardev=3Dserial0 -usb -device usb-tablet,id=3Dinput0 -vnc 127.0.0.1:0 -vg=
a cirrus -device usb-host,hostbus=3D002,hostaddr=3D005,id=3Dhostdev0 -devic=
e virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x6 =

  char device redirected to /dev/pts/0
  pci_add_option_rom: failed to find romfile "pxe-virtio.bin"
  husb: open device 2.5
  husb: config #1 need -1
  husb: 1 interfaces claimed for configuration 1
  husb: grabbed usb device 2.5
  husb: config #1 need 1
  husb: 1 interfaces claimed for configuration 1

  lsi_scsi: error: Unimplemented message 0x00
  (x8)

  lsi_scsi: error: MSG IN data too long
  lsi_scsi: error: Unimplemented message 0x00
  (x760)

  lsi_scsi: error: MSG IN data too long
  lsi_scsi: error: MSG IN data too long
  kvm: /build/buildd/qemu-kvm-0.12.5+noroms/hw/lsi53c895a.c:512: lsi_do_dma=
: Assertion `s->current' failed.

  =

  I can include minidump file if needed.
  I am currently using IDE and it seems OK.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/697510/+subscriptions

