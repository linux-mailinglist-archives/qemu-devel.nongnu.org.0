Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E657A2B7173
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 23:22:38 +0100 (CET)
Received: from localhost ([::1]:48476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf9Mz-0003F3-Hd
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 17:22:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kf9Lb-0002hY-UQ
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 17:21:11 -0500
Received: from indium.canonical.com ([91.189.90.7]:44154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kf9LX-0004At-NX
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 17:21:11 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kf9LU-0007vk-Mw
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 22:21:04 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AB8DA2E80E9
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 22:21:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2020 22:11:51 -0000
From: Jordan Williams <1894836@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: hvf macos
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jrtc27 jwillikers
X-Launchpad-Bug-Reporter: Jordan Williams (jwillikers)
X-Launchpad-Bug-Modifier: Jordan Williams (jwillikers)
References: <159956768761.20174.3940381536855370035.malonedeb@gac.canonical.com>
Message-Id: <160565111154.28731.12851942188171522863.malone@gac.canonical.com>
Subject: [Bug 1894836] Re: kernel panic using hvf with CPU passthrough
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a2ee2035671f86427804714f331b9ff7fecaef7e"; Instance="production"
X-Launchpad-Hash: 9a2ecdceaadd4a3b750d9c41e7752777153e14ab
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 17:21:05
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

Thanks for the response Jessica! The option you provided fixes the
problem and everything works flawlessly now. Thank you!!

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

