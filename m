Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CB8379F53
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 07:49:23 +0200 (CEST)
Received: from localhost ([::1]:45564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgLGk-00012u-B4
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 01:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgLDI-0006de-EG
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:45:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:33008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgLDE-0006L3-Bc
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:45:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgLDA-00046t-LL
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:45:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 792F32E8194
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:45:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 May 2021 05:38:33 -0000
From: Thomas Huth <1882123@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm armhf debian regression
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: joveler pmaydell th-huth
X-Launchpad-Bug-Reporter: Hajin Jang (joveler)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159129432300.4081.5698403082350753204.malonedeb@soybean.canonical.com>
Message-Id: <162071151343.6448.636822869901031408.malone@gac.canonical.com>
Subject: [Bug 1882123] Re: ARM cpu emulation regression on QEMU 4.2.0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 2a8841cc9db0b2c31938c10ba54fcc4e6a4d1495
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
Reply-To: Bug 1882123 <1882123@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/271


** Changed in: qemu
       Status: Confirmed =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #271
   https://gitlab.com/qemu-project/qemu/-/issues/271

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1882123

Title:
  ARM cpu emulation regression on QEMU 4.2.0

Status in QEMU:
  Expired

Bug description:
  [*] Summary

  Latest QEMU has an ARM CPU emulation regression.
  Regression is reproducible by building any C# project with .NET Core SDK =
3.1.300 on Debian 10 armhf guest OS.

  Releases affected: QEMU 4.2.0, 5.0.0
  Releases not affected: QEMU 4.1.0, QEMU 4.1.1

  [*] Detail

  .NET Core SDK 3.1 fails to run on Debian 10 emulated by qemu-system-
  arm.

  I occasionally test my C# projects on the virtual armhf/arm64 system
  emulated by QEMU. MSBuild, a build engine of the .NET Core SDK,
  crashes on QEMU 4.2.0 or later. The crash only happens when MSBuild
  tries to do any JIT compiling (dotnet build / dotnet test).

  I attached the MSBuild crash logs. MSBuild always crashes with
  SEHException, which means it tried to call C binary from .NET binary.

  I think the ARM CPU emulation regression happened between QEMU 4.1.1 ~
  4.2.0. The issue affects QEMU 4.2.0 and 5.0.0. QEMU 4.1.0, 4.1.1, and
  real Raspberry Pi 2 are not affected by this issue, and .NET Core SDK
  works completely fine.

  [*] Environment

  [Host OS]
  Distribution: Linux Mint 19.3 amd64
  CPU: AMD Ryzen 5 3600
  Kernel: Ubuntu 5.3.0-51-generic

  [QEMU Guest OS]
  Distribution: Debian 10 Buster armhf
  Kernel: Debian 4.19.0-9-armmp-lpae
  .NET Core SDK: 3.1.300

  [Raspberry Pi 2]
  Distribution: Raspberry Pi OS Buster armhf
  Kernel: 4.19.118-v7+

  [Tested C# Projects]
  This is a list of C# projects I have tested on QEMU and RPI2.
  - https://github.com/ied206/Joveler.DynLoader
  - https://github.com/ied206/Joveler.Compression
  - https://github.com/ied206/ManagedWimLib

  [QEMU Launch Arguments]
  qemu-system-arm \
  =C2=A0=C2=A0=C2=A0=C2=A0-smp 3 -M virt -m 4096 \
  =C2=A0=C2=A0=C2=A0=C2=A0-kernel vmlinuz-4.19.0-9-armmp-lpae \
  =C2=A0=C2=A0=C2=A0=C2=A0-initrd initrd.img-4.19.0-9-armmp-lpae \
  =C2=A0=C2=A0=C2=A0=C2=A0-append "root=3D/dev/vda2" \
  =C2=A0=C2=A0=C2=A0=C2=A0-drive if=3Dnone,file=3Ddebian_arm.qcow2,format=
=3Dqcow2,id=3Dhd \
  =C2=A0=C2=A0=C2=A0=C2=A0-device virtio-blk-device,drive=3Dhd \
  =C2=A0=C2=A0=C2=A0=C2=A0-netdev user,id=3Dmynet,hostfwd=3Dtcp::<PORT>-:22=
 \
  =C2=A0=C2=A0=C2=A0=C2=A0-device virtio-net-device,netdev=3Dmynet \
  =C2=A0=C2=A0=C2=A0=C2=A0-device virtio-rng-device

  [QEMU Configure Arguments]
  ./configure --enable-spice --enable-gtk --enable-vnc-jpeg --enable-vnc-pn=
g --enable-avx2 --enable-libusb --enable-opengl --enable-virglrenderer --en=
able-kvm --enable-system --enable-modules --audio-drv-list=3Dpa

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1882123/+subscriptions

