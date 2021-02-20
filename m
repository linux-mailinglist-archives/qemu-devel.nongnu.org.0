Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35362320448
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 08:02:05 +0100 (CET)
Received: from localhost ([::1]:57130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDMHE-0004hq-AY
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 02:02:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lDMG0-0004Cj-5c
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 02:00:48 -0500
Received: from indium.canonical.com ([91.189.90.7]:35848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lDMFx-0006hy-Sz
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 02:00:47 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lDMFu-00024G-UH
 for <qemu-devel@nongnu.org>; Sat, 20 Feb 2021 07:00:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E1A662E80F3
 for <qemu-devel@nongnu.org>; Sat, 20 Feb 2021 07:00:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 Feb 2021 06:54:48 -0000
From: Ravishankar <1916112@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell rreddy78
X-Launchpad-Bug-Reporter: Ravishankar (rreddy78)
X-Launchpad-Bug-Modifier: Ravishankar (rreddy78)
References: <161371415849.8154.11815373638536869361.malonedeb@gac.canonical.com>
Message-Id: <161380408867.17159.13207438010380482220.malone@wampee.canonical.com>
Subject: [Bug 1916112] Re: Illegal instruction crash of QEMU on Jetson Nano
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bbfee60eef9f7fd8d30b24b3f53e75656e4d5fb0"; Instance="production"
X-Launchpad-Hash: 9329f973ecd41fad6fb45c840c2220c0d43216ee
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1916112 <1916112@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Disassembly:

[  OK  ] Mounted RPC Pipe File System.
[   75.916706] systemd[1]: Started Create list of required static device no=
des for the current kernel.
[  OK  ] Started Create list of req=E2=80=A6 nodes for the current kernel.

Thread 7 "qemu-system-aar" received signal SIGILL, Illegal instruction.
[Switching to Thread 0x7fade0aba0 (LWP 7777)]
0x0000007f8aca04d0 in code_gen_buffer ()
(gdb) disas $pc-32,$pc+32
Dump of assembler code from 0x7f8aca04b0 to 0x7f8aca04f0:
   0x0000007f8aca04b0 <code_gen_buffer+162653284>:	cmp	x0, x3
   0x0000007f8aca04b4 <code_gen_buffer+162653288>:	b.ne	0x7f8aca0908 <code_=
gen_buffer+162654396>  // b.any
   0x0000007f8aca04b8 <code_gen_buffer+162653292>:	ldr	x23, [x1, x23]
   0x0000007f8aca04bc <code_gen_buffer+162653296>:	str	x23, [x19, #3688]
   0x0000007f8aca04c0 <code_gen_buffer+162653300>:	add	w22, w22, w21
   0x0000007f8aca04c4 <code_gen_buffer+162653304>:	str	w22, [x19, #16]
   0x0000007f8aca04c8 <code_gen_buffer+162653308>:	ldr	d0, [x19, #3944]
   0x0000007f8aca04cc <code_gen_buffer+162653312>:	ldr	d1, [x19, #4192]
=3D> 0x0000007f8aca04d0 <code_gen_buffer+162653316>:	.inst	0x2ee0b822 ; und=
efined
   0x0000007f8aca04d4 <code_gen_buffer+162653320>:	movi	d3, #0xff
   0x0000007f8aca04d8 <code_gen_buffer+162653324>:	and	v1.8b, v1.8b, v3.8b
   0x0000007f8aca04dc <code_gen_buffer+162653328>:	and	v2.8b, v2.8b, v3.8b
   0x0000007f8aca04e0 <code_gen_buffer+162653332>:	.inst	0x2ee14404 ; undef=
ined
   0x0000007f8aca04e4 <code_gen_buffer+162653336>:	.inst	0x2ee0b845 ; und--=
Typ--Ty--Ty-----Ty--T--Type--Type-----Ty--T--Type <RET> for more, q to quit=
, c to continue without paging--
efined
   0x0000007f8aca04e8 <code_gen_buffer+162653340>:	.inst	0x2ee54400 ; undef=
ined
   0x0000007f8aca04ec <code_gen_buffer+162653344>:	ldr	d5, 0x7f8aca09f0 <co=
de_gen_buffer+162654628>
End of assembler dump.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1916112

Title:
  Illegal instruction crash of QEMU on Jetson Nano

Status in QEMU:
  New

Bug description:
  I have a jetson nano (arm64 SBC) and I want to check the native
  emulation performance of Raspbian Buster. I used the info available
  here:

  https://github.com/dhruvvyas90/qemu-rpi-kernel/tree/master/native-
  emuation

  I have Xubuntut 20.04 with KVM enabled kernel running on the Jetson
  Nano

  However QEMU crashes with "Illegal Instruction" during kernel boot. I
  have a built latest QEMU from sources with following configuration

  ./configure --prefix=3D/usr/local --target-list=3Daarch64-softmmu,arm-
  softmmu  --enable-guest-agent --enable-vnc  --enable-vnc-jpeg
  --enable-vnc-png --enable-kvm --enable-spice --enable-sdl --enable-gtk
  --enable-virglrenderer --enable-opengl

  qemu-system-aarch64 --version
  QEMU emulator version 5.2.50 (v5.2.0-1731-g5b19cb63d9)

  When I run as follows:

  ../build/qemu-system-aarch64 -M raspi3
  -append "rw earlyprintk loglevel=3D8 console=3DttyAMA0,115200 dwc_otg.lpm=
_enable=3D0 root=3D/dev/mmcblk0p2 rootdelay=3D1"
  -dtb ./bcm2710-rpi-3-b-plus.dtb
  -sd /media/96747D21747D0571/JetsonNano/2020-08-20-raspios-buster-armhf-fu=
ll.qcow2
  -kernel ./kernel8.img
  -m 1G -smp 4 -serial stdio -usb -device usb-mouse -device usb-kbd

  I get :
  [ 74.994834] systemd[1]: Condition check resulted in FUSE Control File Sy=
stem being skipped.
  [ 76.281274] systemd[1]: Starting Apply Kernel Variables...
  Starting Apply Kernel Variables...
  Illegal instruction (core dumped)

  When I use GDB I see this:

  Thread 8 "qemu-system-aar" received signal SIGILL, Illegal instruction.
  [Switching to Thread 0x7fad7f9ba0 (LWP 28037)]
  0x0000007f888ac690 in code_gen_buffer ()
  (gdb) bt
  #0 0x0000007f888ac690 in code_gen_buffer ()
  #1 0x0000005555d7c038 in cpu_tb_exec (tb_exit=3D, itb=3D, cpu=3D0x7fb4502=
c40)
  at ../accel/tcg/cpu-exec.c:191
  #2 cpu_loop_exec_tb (tb_exit=3D, last_tb=3D, tb=3D, cpu=3D0x7fb4502c40)
  at ../accel/tcg/cpu-exec.c:708
  #3 cpu_exec (cpu=3Dcpu@entry=3D0x7fb4502c40) at ../accel/tcg/cpu-exec.c:8=
19
  ..

  I have just two questions:

  Is this a problem with QEMU or is there anything specific build or
  options I need to use. Any specific version of QEMU should be used ?

  Why is TCG used as the accelerator when KVM is present. Is it possible
  and how to use KVM ?

  If I enabled the KVM then I get this error:

  ../build/qemu-system-aarch64 -M raspi3 -enable-kvm -append "rw earlyprint=
k loglevel=3D8 console=3DttyAMA0,115200 dwc_otg.lpm_enable=3D0 root=3D/dev/=
mmcblk0p2 rootdelay=3D1" -dtb ./bcm2710-rpi-3-b-plus.dtb -sd /media/96747D2=
1747D0571/JetsonNano/2020-08-20-raspios-buster-armhf-full.qcow2 -kernel ./k=
ernel8.img -m 1G -smp 4 -serial stdio -usb -device usb-mouse -device usb-kbd
  WARNING: Image format was not specified for '/media/96747D21747D0571/Jets=
onNano/2020-08-20-raspios-buster-armhf-full.img' and probing guessed raw.
           Automatically detecting the format is dangerous for raw images, =
write operations on block 0 will be restricted.
           Specify the 'raw' format explicitly to remove the restrictions.
  qemu-system-aarch64: ../softmmu/physmem.c:750: cpu_address_space_init: As=
sertion `asidx =3D=3D 0 || !kvm_enabled()' failed.

  Thanks a lot.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1916112/+subscriptions

