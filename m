Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB0C31377D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 16:28:17 +0100 (CET)
Received: from localhost ([::1]:60222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l98SW-0007qc-M5
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 10:28:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l91FL-0003Ce-MZ
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 02:46:17 -0500
Received: from indium.canonical.com ([91.189.90.7]:33052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l91Ev-00071G-86
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 02:46:01 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l91Er-0002ap-TU
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 07:45:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CEDAE2E8138
 for <qemu-devel@nongnu.org>; Mon,  8 Feb 2021 07:45:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Feb 2021 07:39:00 -0000
From: Toolybird <1914986@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: toolybird
X-Launchpad-Bug-Reporter: Toolybird (toolybird)
X-Launchpad-Bug-Modifier: Toolybird (toolybird)
Message-Id: <161276994082.12973.16246708530563261197.malonedeb@soybean.canonical.com>
Subject: [Bug 1914986] [NEW] KVM internal error. Suberror: 1 - OVMF / Audio
 related
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3d7abcb776ec05aa0a89112accc21bf8b41dfc24"; Instance="production"
X-Launchpad-Hash: 9f4b9265466819bc57b60a84aef44a0669576e96
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1914986 <1914986@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

This is latest release QEMU-5.2.0 on Arch Linux running kernel 5.10.13,
latest OVMF etc.

I'm seeing the following crash when loading an audio driver from the
OpenCore[1] project in the UEFI shell:

KVM internal error. Suberror: 1
emulation failure
RAX=3D0000000000000000 RBX=3D0000000000000000 RCX=3D0000000000000000 RDX=3D=
0000000000000000
RSI=3D0000000000000000 RDI=3D000000007e423628 RBP=3D000000007fee6a90 RSP=3D=
000000007fee6a08
R8 =3D0000000000000000 R9 =3D0000000000000080 R10=3D0000000000000000 R11=3D=
0000000000000000
R12=3D000000007eeaf828 R13=3D0000000000000000 R14=3D0000000000000000 R15=3D=
000000007fee6a67
RIP=3D00000000000b0000 RFL=3D00000246 [---Z-P-] CPL=3D0 II=3D0 A20=3D1 SMM=
=3D0 HLT=3D0
ES =3D0030 0000000000000000 ffffffff 00c09300 DPL=3D0 DS   [-WA]
CS =3D0038 0000000000000000 ffffffff 00a09b00 DPL=3D0 CS64 [-RA]
SS =3D0030 0000000000000000 ffffffff 00c09300 DPL=3D0 DS   [-WA]
DS =3D0030 0000000000000000 ffffffff 00c09300 DPL=3D0 DS   [-WA]
FS =3D0030 0000000000000000 ffffffff 00c09300 DPL=3D0 DS   [-WA]
GS =3D0030 0000000000000000 ffffffff 00c09300 DPL=3D0 DS   [-WA]
LDT=3D0000 0000000000000000 0000ffff 00008200 DPL=3D0 LDT
TR =3D0000 0000000000000000 0000ffff 00008b00 DPL=3D0 TSS64-busy
GDT=3D     000000007f9ee698 00000047
IDT=3D     000000007f27a018 00000fff
CR0=3D80010033 CR2=3D0000000000000000 CR3=3D000000007fc01000 CR4=3D00000668
DR0=3D0000000000000000 DR1=3D0000000000000000 DR2=3D0000000000000000 DR3=3D=
0000000000000000 =

DR6=3D00000000ffff0ff0 DR7=3D0000000000000400
EFER=3D0000000000000d00
Code=3D00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 <ff> ff =
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff =
ff ff ff


Here's the QEMU command line I'm using:

qemu-system-x86_64 \
-machine q35,accel=3Dkvm \
-cpu host,+topoext,+invtsc \
-smp 4,sockets=3D1,cores=3D2 \
-m 4096 \
-drive file=3D/usr/share/edk2-ovmf/x64/OVMF_CODE.fd,if=3Dpflash,format=3Dra=
w,readonly=3Don \
-drive file=3DOVMF_VARS.fd,if=3Dpflash,format=3Draw \
-usb -device usb-tablet -device usb-kbd \
-drive file=3DOpenCore-0.6.6.img,format=3Draw \
-device ich9-intel-hda,bus=3Dpcie.0,addr=3D0x1b \
-device hda-micro,audiodev=3Dhda \
-audiodev pa,id=3Dhda,server=3D/run/user/1000/pulse/native

The driver loads fine when using the "no connect" switch. eg:

Shell> load -nc fs0:\efi\oc\drivers\audiodxe.efi
Shell> Image 'fs0:\EFI\OC\Drivers\AudioDxe.efi' loaded at 7E3C7000 - Success

However, the crash occurs when loading normally.

Any ideas? Thanks.

[1]: https://github.com/acidanthera/OpenCorePkg/releases

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914986

Title:
  KVM internal error. Suberror: 1  -  OVMF / Audio related

Status in QEMU:
  New

Bug description:
  This is latest release QEMU-5.2.0 on Arch Linux running kernel
  5.10.13, latest OVMF etc.

  I'm seeing the following crash when loading an audio driver from the
  OpenCore[1] project in the UEFI shell:

  KVM internal error. Suberror: 1
  emulation failure
  RAX=3D0000000000000000 RBX=3D0000000000000000 RCX=3D0000000000000000 RDX=
=3D0000000000000000
  RSI=3D0000000000000000 RDI=3D000000007e423628 RBP=3D000000007fee6a90 RSP=
=3D000000007fee6a08
  R8 =3D0000000000000000 R9 =3D0000000000000080 R10=3D0000000000000000 R11=
=3D0000000000000000
  R12=3D000000007eeaf828 R13=3D0000000000000000 R14=3D0000000000000000 R15=
=3D000000007fee6a67
  RIP=3D00000000000b0000 RFL=3D00000246 [---Z-P-] CPL=3D0 II=3D0 A20=3D1 SM=
M=3D0 HLT=3D0
  ES =3D0030 0000000000000000 ffffffff 00c09300 DPL=3D0 DS   [-WA]
  CS =3D0038 0000000000000000 ffffffff 00a09b00 DPL=3D0 CS64 [-RA]
  SS =3D0030 0000000000000000 ffffffff 00c09300 DPL=3D0 DS   [-WA]
  DS =3D0030 0000000000000000 ffffffff 00c09300 DPL=3D0 DS   [-WA]
  FS =3D0030 0000000000000000 ffffffff 00c09300 DPL=3D0 DS   [-WA]
  GS =3D0030 0000000000000000 ffffffff 00c09300 DPL=3D0 DS   [-WA]
  LDT=3D0000 0000000000000000 0000ffff 00008200 DPL=3D0 LDT
  TR =3D0000 0000000000000000 0000ffff 00008b00 DPL=3D0 TSS64-busy
  GDT=3D     000000007f9ee698 00000047
  IDT=3D     000000007f27a018 00000fff
  CR0=3D80010033 CR2=3D0000000000000000 CR3=3D000000007fc01000 CR4=3D000006=
68
  DR0=3D0000000000000000 DR1=3D0000000000000000 DR2=3D0000000000000000 DR3=
=3D0000000000000000 =

  DR6=3D00000000ffff0ff0 DR7=3D0000000000000400
  EFER=3D0000000000000d00
  Code=3D00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 <ff> f=
f ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff f=
f ff ff ff

  =

  Here's the QEMU command line I'm using:

  qemu-system-x86_64 \
  -machine q35,accel=3Dkvm \
  -cpu host,+topoext,+invtsc \
  -smp 4,sockets=3D1,cores=3D2 \
  -m 4096 \
  -drive file=3D/usr/share/edk2-ovmf/x64/OVMF_CODE.fd,if=3Dpflash,format=3D=
raw,readonly=3Don \
  -drive file=3DOVMF_VARS.fd,if=3Dpflash,format=3Draw \
  -usb -device usb-tablet -device usb-kbd \
  -drive file=3DOpenCore-0.6.6.img,format=3Draw \
  -device ich9-intel-hda,bus=3Dpcie.0,addr=3D0x1b \
  -device hda-micro,audiodev=3Dhda \
  -audiodev pa,id=3Dhda,server=3D/run/user/1000/pulse/native

  The driver loads fine when using the "no connect" switch. eg:

  Shell> load -nc fs0:\efi\oc\drivers\audiodxe.efi
  Shell> Image 'fs0:\EFI\OC\Drivers\AudioDxe.efi' loaded at 7E3C7000 - Succ=
ess

  However, the crash occurs when loading normally.

  Any ideas? Thanks.

  [1]: https://github.com/acidanthera/OpenCorePkg/releases

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1914986/+subscriptions

