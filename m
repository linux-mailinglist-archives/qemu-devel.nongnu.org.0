Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 547A33C1E8E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 06:42:28 +0200 (CEST)
Received: from localhost ([::1]:38970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1iLL-0002nC-9H
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 00:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1i5k-0006Cg-Ai
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:25 -0400
Received: from indium.canonical.com ([91.189.90.7]:60994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1i5c-0001Gk-HN
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:20 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m1i5M-0005F9-1E
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 04:25:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D9E002E81AE
 for <qemu-devel@nongnu.org>; Fri,  9 Jul 2021 04:25:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Jul 2021 04:17:22 -0000
From: Launchpad Bug Tracker <1898490@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ethannij janitor noneenon novhak
 s-launchpad-paulsd-com th-huth
X-Launchpad-Bug-Reporter: Ethan (ethannij)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160185589302.24503.10461684970761806737.malonedeb@chaenomeles.canonical.com>
Message-Id: <162580424243.19936.10578222260985412238.malone@loganberry.canonical.com>
Subject: [Bug 1898490] Re: gtk with virtio and opengl black screen
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: 353b0feca251b5867d1cb875e91e960135d2bedd
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1898490 <1898490@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1898490

Title:
  gtk with virtio and opengl black screen

Status in QEMU:
  Expired

Bug description:
  qemu-system-x86_64 -name manjaro -enable-kvm -cpu host -smp
  cores=3D4,threads=3D1 -M q35 -m 8G -cdrom /mnt/Storage/ISO/manjaro-
  gnome-20.0.3-minimal-200606-linux56.iso -machine type=3Dpc,accel=3Dkvm
  -vga virtio -display sdl,gl=3Don Boots properly and has working 3d
  acceleration with virgl.

  Running qemu-system-x86_64 -name manjaro -enable-kvm -cpu host -smp
  cores=3D4,threads=3D1 -M q35 -m 8G -cdrom /mnt/Storage/ISO/manjaro-
  gnome-20.0.3-minimal-200606-linux56.iso -machine type=3Dpc,accel=3Dkvm
  -vga virtio -display gtk,gl=3Don however, (difference being gtk instead
  of sdl), the screen is black, and the vm still starts.

  System Specs
  Gentoo Linux 64bit
  Gentoo-Sources 5.8.13 Kernel
  Qemu 5.10.0-r1 compiled with USE=3D"aio bzip2 caps curl fdt filecaps gtk =
jpeg ncurses nls opengl oss pin-upstream-blobs png pulseaudio sdl seccomp s=
lirp spice usb usbredir vhost-net virgl vnc xattr xkb" PYTHON_TARGETS=3D"py=
thon3_7" QEMU_SOFTMMU_TARGETS=3D"x86_64" QEMU_USER_TARGETS=3D"x86_64"

  Ryzen 7 2700x
  Nvidia 1070ti GPU

  I can confirm the same issue when using libvirt with opengl.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1898490/+subscriptions

