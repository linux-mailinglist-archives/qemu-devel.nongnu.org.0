Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A747E36F84B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:07:20 +0200 (CEST)
Received: from localhost ([::1]:42370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQ3L-0006j1-QE
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcQ28-0005XN-2I
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:06:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:48016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcQ21-0000sq-Cv
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:06:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcQ1y-0001nT-Tk
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 10:05:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D70832E815B
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 10:05:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 09:59:40 -0000
From: Thomas Huth <1907952@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=debian; sourcepackage=qemu; component=main;
 status=Confirmed; importance=Unknown; assignee=None; 
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: emojifreak pmaydell
X-Launchpad-Bug-Reporter: Ryutaroh Matsumoto (emojifreak)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160786029328.5567.5976635715445692881.malonedeb@gac.canonical.com>
Message-Id: <161977678124.9801.12337764787237264085.launchpad@gac.canonical.com>
Subject: [Bug 1907952] Re: qemu-system-aarch64: with "-display gtk" arrow keys
 are received as just ^[ on ttyAMA0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: aa7d7de14366b00a712718277fede46419ad4ef6
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
Reply-To: Bug 1907952 <1907952@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1907952

Title:
  qemu-system-aarch64: with "-display gtk" arrow keys are received as
  just ^[ on ttyAMA0

Status in QEMU:
  Fix Released
Status in qemu package in Debian:
  Confirmed

Bug description:
  I originally observed this on Debian packaged qemu 5.2 at
  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D976808

  Today I checked out the latest git source at
  Sun, 13 Dec 2020 19:21:09 +0900
  and configured the source as follows:

  ./configure --prefix=3D/usr --sysconfdir=3D/etc --libexecdir=3D/usr/lib/q=
emu \
   --localstatedir=3D/var --disable-blobs --disable-strip --localstatedir=
=3D/var \
   --libdir=3D/usr/lib/aarch64-linux-gnu \ =

   --firmwarepath=3D/usr/share/qemu:/usr/share/seabios:/usr/lib/ipxe/qemu \ =

   --target-list=3Daarch64-softmmu,arm-softmmu --disable-werror \ =

   --disable-user  --enable-gtk --enable-vnc
  then executed "make" on an ARM64 (not an x86_64) host,
  running the latest Debian testing.

  I did the following commands on an arm64 host with the Debian Installer A=
lpha 3 at
  https://cdimage.debian.org/cdimage/bullseye_di_alpha3/arm64/iso-cd/debian=
-bullseye-DI-alpha3-arm64-netinst.iso

  #!/bin/sh

  ARCH=3Darm64
  IMAGE=3D`pwd`/qemu-disk-${ARCH}.qcow2
  CDROM=3D`pwd`/debian-bullseye-DI-alpha3-${ARCH}-netinst.iso
  rm -f $IMAGE
  qemu-img create -f qcow2 -o compat=3D1.1 -o lazy_refcounts=3Don -o preall=
ocation=3Doff $IMAGE 20G
  cd /var/tmp
  cp /usr/share/AAVMF/AAVMF_VARS.fd .
  $HOME/qemu-git/qemu/build/qemu-system-aarch64 \
      -display gtk -enable-kvm -machine virt -cpu host -m 3072 -smp 2\
      -net nic,model=3Dvirtio -net user -object rng-random,filename=3D/dev/=
urandom,id=3Drng0 \
      -device virtio-rng-pci,rng=3Drng0,id=3Drng-device0 \
      -drive if=3Dvirtio,file=3D${IMAGE},index=3D0,format=3Dqcow2,discard=
=3Dunmap,detect-zeroes=3Dunmap,media=3Ddisk \
      -drive if=3Dvirtio,file=3D${CDROM},index=3D1,format=3Draw,readonly=3D=
on,media=3Dcdrom \
      -drive if=3Dpflash,format=3Draw,unit=3D0,file=3D/usr/share/AAVMF/AAVM=
F_CODE.fd,readonly=3Don \
      -drive if=3Dpflash,format=3Draw,unit=3D1,file=3D`pwd`/AAVMF_VARS.fd

  Then 4 arrow keys on the physical keyboard are received as just "^[".

  This symptom was not observed on qemu-system-x86_64.
  This symptom was not observed with virt-manager on my arm64 host, neither.
  This seems unique to -display gtk of qemu-system-aarch64.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1907952/+subscriptions

