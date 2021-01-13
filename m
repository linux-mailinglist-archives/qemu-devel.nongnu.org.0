Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 080182F432B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 05:33:12 +0100 (CET)
Received: from localhost ([::1]:44974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzXqJ-0002iH-2w
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 23:33:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzXoA-0001QO-9l
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 23:30:58 -0500
Received: from indium.canonical.com ([91.189.90.7]:33538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzXo7-0001Wm-2T
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 23:30:58 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kzXo2-0006cL-Nc
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 04:30:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B1C002E8148
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 04:30:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 Jan 2021 04:17:20 -0000
From: Launchpad Bug Tracker <1800401@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor nvinson th-huth
X-Launchpad-Bug-Reporter: Nicholas Vinson (nvinson)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <154077313146.29068.467827083588404194.malonedeb@soybean.canonical.com>
Message-Id: <161051144069.21184.8911756165011387646.malone@loganberry.canonical.com>
Subject: [Bug 1800401] Re: efifb on Linux guest fails to load when using VGA
 passthrough
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: 1c72ad8d46527ce769bfda74e86e8845ce0de43b
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
Reply-To: Bug 1800401 <1800401@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1800401

Title:
  efifb on Linux guest fails to load when using VGA passthrough

Status in QEMU:
  Expired

Bug description:
  The EFI framebuffer fails to load when booting a Gentoo guest using
  ovmf + vga_passthrough.  I retested using they system rescue CD and
  saw the same issue, but also noticed that when a second framebuffer
  loads, nouveaufb in my case, the terminal appears.  I have also
  verified that the Gentoo min CD is not hanging at boot as I can type
  'poweroff' after waiting a few minutes and the system responds by
  powering off.  I am unable to reproduce with seabios as I have been
  unable to get vga passthrough to work with that BIOS.

  Steps to Reproduce:
      1. Install qemu and ovmf
      2. Download systemrescuecd-x86-5.3.1.iso
      3. Run qemu using one of the configurations below
      4. Select first boot option in GRUB menu
      5. Wait 30 seconds
      6. Press enter # System rescue is prompting for the keymap between st=
eps 5 and 6
      7. Wait 2 minutes
      8. Observe fb console
      9. Note lack of output until very late in boot process
     10. Check dmesg
     11. Note efifb failed to load (invalid address)
     12. Note nouveaufb started late in boot process =


  Expected Results:
     The EFI FB to load and display output to monitor.  This is the behavio=
r I see when booting the host system via UEFI.

  Actual Results:
     The EFI FB fails to load and display output.  System fails to display =
any output until nouveaufb loads.  When booting using the Gentoo minCD, thi=
s makes the system largely unusable.

  Additional information:

  Tested using Gentoo's app-emulation/qemu-3.0.0 version.  Bug report:
  https://bugs.gentoo.org/669880

  I also tested qemu at git commit
  179f9ac887973c818b2578bd79fa3ed2522657d4.  Configuration log for the
  build will be attached.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1800401/+subscriptions

