Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C34DA2B2B24
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 04:51:51 +0100 (CET)
Received: from localhost ([::1]:33490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdmbO-0007Yp-SC
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 22:51:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdmaM-0006f0-KV
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 22:50:46 -0500
Received: from indium.canonical.com ([91.189.90.7]:48558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdmaJ-0001wz-QK
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 22:50:46 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kdmaI-00023Q-3f
 for <qemu-devel@nongnu.org>; Sat, 14 Nov 2020 03:50:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1A5622E80E9
 for <qemu-devel@nongnu.org>; Sat, 14 Nov 2020 03:50:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2020 03:43:15 -0000
From: Jessica Clarke <1894836@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: hvf macos
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jrtc27 jwillikers
X-Launchpad-Bug-Reporter: Jordan Williams (jwillikers)
X-Launchpad-Bug-Modifier: Jessica Clarke (jrtc27)
References: <159956768761.20174.3940381536855370035.malonedeb@gac.canonical.com>
Message-Id: <160532539531.1050.13066268856085163302.malone@chaenomeles.canonical.com>
Subject: [Bug 1894836] Re: kernel panic using hvf with CPU passthrough
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="38ebca4a151c7e484f2992f7b90f5a3ede13f97f"; Instance="production"
X-Launchpad-Hash: 00a07eb4ead7a09f1a0ef6e5dc9f8d669a0e9370
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 22:45:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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

0f 01 f9 is RDTSCP; use -cpu host,-rdtscp to mask out the feature. KVM
couldn't pass the feature through for a while, and HVF currently can't,
though HVF should be modified to automatically hide the feature until it
can emulate it.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1894836

Title:
  kernel panic using hvf with CPU passthrough

Status in QEMU:
  New

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

