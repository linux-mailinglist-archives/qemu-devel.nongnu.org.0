Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EC22DC2A3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:02:51 +0100 (CET)
Received: from localhost ([::1]:33776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYKI-0004PA-0H
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:02:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kpYIY-0003Wi-VE
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:01:03 -0500
Received: from indium.canonical.com ([91.189.90.7]:37644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kpYIQ-00071b-Vh
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:01:02 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kpYIO-00012u-7r
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 15:00:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 226982E8142
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 15:00:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Dec 2020 14:48:12 -0000
From: A user <1908416@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: 20h2 aarch64 uefi windows windows10 windows10arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: raspiduino
X-Launchpad-Bug-Reporter: A user (raspiduino)
X-Launchpad-Bug-Modifier: A user (raspiduino)
Message-Id: <160813009293.16281.11756114510615914668.malonedeb@soybean.canonical.com>
Subject: [Bug 1908416] [NEW] qemu-system-aarch64 can't run Windows 10 for ARM
 version 2004
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a68a6d599c812dd1dd335307d9c5c017c50ba81b"; Instance="production"
X-Launchpad-Hash: e38e7b350041f58ccd58247df26158855971d235
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
Reply-To: Bug 1908416 <1908416@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Problem: qemu-system-aarch64 can't run Windows 10 for ARM version 2004
(20H2) or newer

Host OS: Windows 10 x64 version 20H2
CPU    : Intel Pentium Dual-core T4300 (no vt-x)
QEMU   : QEMU version 5.1.0 from qemu.org

cmdline: qemu-system-aarch64.exe -M virt -cpu cortex-a72 -smp 3 --accel
tcg,thread=3Dmulti -m 2048 -pflash QEMU_EFI.img -pflash QEMU_VARS.img
-device VGA -device nec-usb-xhci -device usb-kbd -device usb-mouse
-device usb-storage,drive=3Dcdrom -drive
file=3D"isofile.iso",media=3Dcdrom,if=3Dnone,id=3Dcdrom

Note: QEMU_VARS and QEMU_EFI are taken from edk2

Details: From this post (https://kitsunemimi.pw/notes/posts/running-
windows-10-for-arm64-in-a-qemu-virtual-machine.html) and from what I
have tried, QEMU can't run Windows ARM newer or equal to the 2004
version. When we boot a 2004 iso (made from uupdump.ml), it stuck as the
boot screen with the Windows ARM logo and nothing else. When I check the
machine state and registers through the QEMU monitor, it shows that the
VM is still running, but the registers are completely frozen! But if I
try the older version, like 19H2, it works! Please help!

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: 20h2 aarch64 uefi windows windows10 windows10arm

** Description changed:

  Problem: qemu-system-aarch64 can't run Windows 10 for ARM version 2004
  (20H2) or newer
  =

  Host OS: Windows 10 x64 version 20H2
  CPU    : Intel Pentium Dual-core T4300 (no vt-x)
  QEMU   : QEMU version 5.1.0 from qemu.org
  =

  cmdline: qemu-system-aarch64.exe -M virt -cpu cortex-a72 -smp 3 --accel
  tcg,thread=3Dmulti -m 2048 -pflash QEMU_EFI.img -pflash QEMU_VARS.img
  -device VGA -device nec-usb-xhci -device usb-kbd -device usb-mouse
  -device usb-storage,drive=3Dcdrom -drive
  file=3D"isofile.iso",media=3Dcdrom,if=3Dnone,id=3Dcdrom
  =

- Note: QEMU_VARS and QEMU_EFI are taken from edk2, which can be seen in
- the attachment below.
+ Note: QEMU_VARS and QEMU_EFI are taken from edk2
  =

  Details: From this post (https://kitsunemimi.pw/notes/posts/running-
  windows-10-for-arm64-in-a-qemu-virtual-machine.html) and from what I
  have tried, QEMU can't run Windows ARM newer or equal to the 2004
  version. When we boot a 2004 iso (made from uupdump.ml), it stuck as the
  boot screen with the Windows ARM logo and nothing else. When I check the
  machine state and registers through the QEMU monitor, it shows that the
  VM is still running, but the registers are completely frozen! But if I
  try the older version, like 19H2, it works! Please help!

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1908416

Title:
  qemu-system-aarch64 can't run Windows 10 for ARM version 2004

Status in QEMU:
  New

Bug description:
  Problem: qemu-system-aarch64 can't run Windows 10 for ARM version 2004
  (20H2) or newer

  Host OS: Windows 10 x64 version 20H2
  CPU    : Intel Pentium Dual-core T4300 (no vt-x)
  QEMU   : QEMU version 5.1.0 from qemu.org

  cmdline: qemu-system-aarch64.exe -M virt -cpu cortex-a72 -smp 3
  --accel tcg,thread=3Dmulti -m 2048 -pflash QEMU_EFI.img -pflash
  QEMU_VARS.img -device VGA -device nec-usb-xhci -device usb-kbd -device
  usb-mouse -device usb-storage,drive=3Dcdrom -drive
  file=3D"isofile.iso",media=3Dcdrom,if=3Dnone,id=3Dcdrom

  Note: QEMU_VARS and QEMU_EFI are taken from edk2

  Details: From this post (https://kitsunemimi.pw/notes/posts/running-
  windows-10-for-arm64-in-a-qemu-virtual-machine.html) and from what I
  have tried, QEMU can't run Windows ARM newer or equal to the 2004
  version. When we boot a 2004 iso (made from uupdump.ml), it stuck as
  the boot screen with the Windows ARM logo and nothing else. When I
  check the machine state and registers through the QEMU monitor, it
  shows that the VM is still running, but the registers are completely
  frozen! But if I try the older version, like 19H2, it works! Please
  help!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1908416/+subscriptions

