Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3277B3C695C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 06:29:38 +0200 (CEST)
Received: from localhost ([::1]:46596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3A32-0005rT-PM
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 00:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m39zn-0006u2-1q
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:26:11 -0400
Received: from indium.canonical.com ([91.189.90.7]:40884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m39zl-0008VC-00
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:26:10 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m39zX-0003eN-P2
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 04:25:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 09EA62E81FB
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 04:25:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Jul 2021 04:17:24 -0000
From: Launchpad Bug Tracker <1908416@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm uefi windows windows10
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor raspiduino th-huth
X-Launchpad-Bug-Reporter: A user (raspiduino)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160813009293.16281.11756114510615914668.malonedeb@soybean.canonical.com>
Message-Id: <162614984442.15811.18414525876062041671.malone@loganberry.canonical.com>
Subject: [Bug 1908416] Re: qemu-system-aarch64 can't run Windows 10 for ARM
 version 2004
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: a50a6958e4bbd69e661f97c3e8cf7e852cb5e5a1
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
Reply-To: Bug 1908416 <1908416@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1908416

Title:
  qemu-system-aarch64 can't run Windows 10 for ARM version 2004

Status in QEMU:
  Expired

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

