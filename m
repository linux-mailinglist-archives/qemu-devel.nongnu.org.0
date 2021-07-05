Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2BA3BB66F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 06:34:32 +0200 (CEST)
Received: from localhost ([::1]:57020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0GJT-0007kD-Kq
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 00:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0GBl-0004ap-7c
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 00:26:33 -0400
Received: from indium.canonical.com ([91.189.90.7]:49470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0GBh-0002xj-HI
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 00:26:32 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0GBT-0004Rb-Mr
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 04:26:16 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 86FD52E8201
 for <qemu-devel@nongnu.org>; Mon,  5 Jul 2021 04:26:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Jul 2021 04:17:33 -0000
From: Launchpad Bug Tracker <1815252@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor johnandersenpdx th-huth
X-Launchpad-Bug-Reporter: john (johnandersenpdx)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <154966719970.21699.16286451963680929757.malonedeb@chaenomeles.canonical.com>
Message-Id: <162545865369.12677.14104033849498449831.malone@loganberry.canonical.com>
Subject: [Bug 1815252] Re: virtio-9p-pci passthrough fsync hang
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c7d3f30bfe7d7b488c7f9d3c8d7880184b1d065e"; Instance="production"
X-Launchpad-Hash: ed84dbf4a0738f510302178b709d6d4674cbc262
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
Reply-To: Bug 1815252 <1815252@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1815252

Title:
  virtio-9p-pci passthrough fsync hang

Status in QEMU:
  Expired

Bug description:
  Tested against QEMU: e47f81b617684c4546af286d307b69014a83538a

  and $qemu-system-x86_64 --version
  QEMU emulator version 2.11.1(Debian 1:2.11+dfsg-1ubuntu7.9)
  Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers

  + exec sudo qemu-system-x86_64 -enable-kvm -bios /usr/share/ovmf/OVMF.fd =
-cpu host -smp sockets=3D1,cpus=3D4,cores=3D2 -m 2048 -vga none -nographic =
-chardev socket,id=3Dchrtpm0,path=3D/tmp/clrwifi/swtpm2/tpm-sock -tpmdev em=
ulator,id=3Dtpm0,chardev=3Dchrtpm0 -device tpm-tis,tpmdev=3Dtpm0 -device vi=
rtio-rng-pci -netdev user,id=3Dmynet0,hostfwd=3Dtcp::10022-:22 -device virt=
io-net-pci,netdev=3Dmynet0 -kernel /home/.../Documents/c/iwd/tools/bzImage =
-append 'console=3DttyS0,115200n8 quiet kvm-intel.nested=3D1 init=3D/usr/bi=
n/bash initcall_debug tsc=3Dreliable no_timer_check noreplace-smp cryptomgr=
.notests rootfstype=3D9p root=3D/dev/root rootflags=3Dtrans=3Dvirtio,versio=
n=3D9p2000.u rw' -fsdev local,id=3Dfsdev-root,path=3Dmnt,security_model=3Dp=
assthrough -device virtio-9p-pci,fsdev=3Dfsdev-root,mount_tag=3D/dev/root
  [    0.000000] Linux version 4.19.0-rc2 (...) (gcc version 7.3.0 (Ubuntu =
7.3.0-27ubuntu1~18.04)) #10 SMP Fri Feb 8 13:55:20 PST 2019
  [    0.000000] Command line: console=3DttyS0,115200n8 quiet kvm-intel.nes=
ted=3D1 init=3D/usr/bin/bash initcall_debug tsc=3Dreliable no_timer_check n=
oreplace-smp cryptomgr.notests rootfstype=3D9p root=3D/dev/root rootflags=
=3Dtrans=3Dvirtio,version=3D9p2000.u rw
  [    0.000000] KERNEL supported cpus:
  [    0.000000]   Intel GenuineIntel
  [    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating poi=
nt registers'
  [    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
  [    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
  [    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
  [    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 =
bytes, using 'standard' format.
  [    0.000000] BIOS-provided physical RAM map:
  [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usa=
ble
  [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000007fffff] usa=
ble
  [    0.000000] BIOS-e820: [mem 0x0000000000800000-0x0000000000807fff] ACP=
I NVS
  [    0.000000] BIOS-e820: [mem 0x0000000000808000-0x000000000080ffff] usa=
ble
  [    0.000000] BIOS-e820: [mem 0x0000000000810000-0x00000000008fffff] ACP=
I NVS
  [    0.000000] BIOS-e820: [mem 0x0000000000900000-0x000000007e87efff] usa=
ble
  [    0.000000] BIOS-e820: [mem 0x000000007e87f000-0x000000007e888fff] ACP=
I NVS
  [    0.000000] BIOS-e820: [mem 0x000000007e889000-0x000000007e889fff] ACP=
I data
  [    0.000000] BIOS-e820: [mem 0x000000007e88a000-0x000000007e88bfff] usa=
ble
  [    0.000000] BIOS-e820: [mem 0x000000007e88c000-0x000000007e88ffff] ACP=
I NVS
  [    0.000000] BIOS-e820: [mem 0x000000007e890000-0x000000007e8a9fff] res=
erved
  [    0.000000] BIOS-e820: [mem 0x000000007e8aa000-0x000000007e8b9fff] ACP=
I NVS
  [    0.000000] BIOS-e820: [mem 0x000000007e8ba000-0x000000007e8bafff] res=
erved
  [    0.000000] BIOS-e820: [mem 0x000000007e8bb000-0x000000007e9e5fff] usa=
ble
  [    0.000000] BIOS-e820: [mem 0x000000007e9e6000-0x000000007e9edfff] ACP=
I NVS
  [    0.000000] BIOS-e820: [mem 0x000000007e9ee000-0x000000007eb1afff] res=
erved
  [    0.000000] BIOS-e820: [mem 0x000000007eb1b000-0x000000007fb9afff] usa=
ble
  [    0.000000] BIOS-e820: [mem 0x000000007fb9b000-0x000000007fbf2fff] res=
erved
  [    0.000000] BIOS-e820: [mem 0x000000007fbf3000-0x000000007fbfafff] ACP=
I data
  [    0.000000] BIOS-e820: [mem 0x000000007fbfb000-0x000000007fbfefff] ACP=
I NVS
  [    0.000000] BIOS-e820: [mem 0x000000007fbff000-0x000000007ff3ffff] usa=
ble
  [    0.000000] BIOS-e820: [mem 0x000000007ff40000-0x000000007ff5ffff] res=
erved
  [    0.000000] BIOS-e820: [mem 0x000000007ff60000-0x000000007fffffff] ACP=
I NVS
  [    0.352469] acpiphp_ibm: ibm_acpiphp_init: acpi_walk_namespace failed
  Started bpfilter
  bash: cannot set terminal process group (-1): Inappropriate ioctl for dev=
ice
  bash: no job control in this shell
  grep: /proc/cpuinfo: No such file or directory
  grep: /proc/cpuinfo: No such file or directory
  root@clr / # passwd
  ...
  openat(AT_FDCWD, "/etc/nshadow", O_WRONLY|O_CREAT|O_TRUNC, 0666) =3D 4
  umask(077)                              =3D 077
  openat(AT_FDCWD, "/etc/shadow", O_RDONLY|O_CREAT|O_CLOEXEC, 000) =3D 5
  fcntl(5, F_GETFL)                       =3D 0x8000 (flags O_RDONLY|O_LARG=
EFILE)
  fstat(5, {st_mode=3DS_IFREG|0644, st_size=3D0, ...}) =3D 0
  fchown(4, 0, 0)                         =3D 0
  fchmod(4, 0100644)                      =3D 0
  lseek(5, 0, SEEK_CUR)                   =3D 0
  fstat(5, {st_mode=3DS_IFREG|0644, st_size=3D0, ...}) =3D 0
  read(5, "", 8192)                       =3D 0
  close(5)                                =3D 0
  fstat(4, {st_mode=3DS_IFREG|0644, st_size=3D0, ...}) =3D 0
  write(4, "root:$6$jihvB1NonG88C5Yt$kvDCqF7"..., 124) =3D 124
  fsync(4 <- hung here

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1815252/+subscriptions

