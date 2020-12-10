Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074C72D56AD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 10:19:34 +0100 (CET)
Received: from localhost ([::1]:44756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knI6n-0000jz-1Y
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 04:19:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knHz0-0003V3-2m
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:11:30 -0500
Received: from indium.canonical.com ([91.189.90.7]:33986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knHyy-00043i-4s
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:11:29 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1knHyw-0006EC-9l
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:11:26 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 476DE2E8137
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:11:26 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Dec 2020 09:04:59 -0000
From: Thomas Huth <1894836@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: hvf macos
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jrtc27 jwillikers th-huth
X-Launchpad-Bug-Reporter: Jordan Williams (jwillikers)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159956768761.20174.3940381536855370035.malonedeb@gac.canonical.com>
Message-Id: <160759109978.16321.14474173815237443197.malone@chaenomeles.canonical.com>
Subject: [Bug 1894836] Re: kernel panic using hvf with CPU passthrough
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: 00f89ebb7062ca10727744271f89a811b5406c49
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
Reply-To: Bug 1894836 <1894836@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixed in commit 65baabca22366e5246955474228908d6a8354881

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1894836

Title:
  kernel panic using hvf with CPU passthrough

Status in QEMU:
  Fix Released

Bug description:
  Host Details
  QEMU 5.1 (Homebrew)
  macOS 10.15.6 Catalina
  Late 2014 iMac
  i5-4690 @ 3.5 GHz
  8 GB RAM

  Guest Details
  Ubuntu Desktop 20.04.1 Installer ISO

  Problem
  Whenever I boot with "-accel hvf -cpu host", the Ubuntu desktop installer=
 will immediately crash with a kernel panic after the initial splash screen.
  See the attached picture of the kernel panic for more details.

  Steps to recreate
  From https://www.jwillikers.com/posts/virtualize_ubuntu_desktop_on_macos_=
with_qemu/

  1. Install QEMU with Homebrew.
  $ brew install qemu

  2. Create a qcow2 disk image to which to install.
  $ qemu-img create -f qcow2 ubuntu2004.qcow2 60G

  3. Download the ISO.
  $ curl -L -o ubuntu-20.04.1-desktop-amd64.iso https://releases.ubuntu.com=
/20.04/ubuntu-20.04.1-desktop-amd64.iso

  4. Run the installer in QEMU.
  $ qemu-system-x86_64 \
  =C2=A0=C2=A0-accel hvf \
  =C2=A0=C2=A0-cpu host \
  =C2=A0=C2=A0-smp 2 \
  =C2=A0=C2=A0-m 4G \
  =C2=A0=C2=A0-usb \
  =C2=A0=C2=A0-device usb-tablet \
  =C2=A0=C2=A0-vga virtio \
  =C2=A0=C2=A0-display default,show-cursor=3Don \
  =C2=A0=C2=A0-device virtio-net,netdev=3Dvmnic -netdev user,id=3Dvmnic \
  =C2=A0=C2=A0-audiodev coreaudio,id=3Dsnd0 \
  =C2=A0=C2=A0-device ich9-intel-hda -device hda-output,audiodev=3Dsnd0 \
  =C2=A0=C2=A0-cdrom ubuntu-20.04.1-desktop-amd64.iso \
  =C2=A0=C2=A0-drive file=3Dubuntu2004.qcow2,if=3Dvirtio

  Workaround
  Emulating the CPU with "-cpu qemu64" does not result in a kernel panic.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1894836/+subscriptions

