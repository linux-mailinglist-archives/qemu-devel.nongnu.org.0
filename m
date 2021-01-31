Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3C2309A30
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 05:27:39 +0100 (CET)
Received: from localhost ([::1]:42746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l64Ko-0006ZQ-Aa
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 23:27:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l64J8-0005dw-7g
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 23:25:54 -0500
Received: from indium.canonical.com ([91.189.90.7]:36770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l64J6-0001bw-7J
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 23:25:54 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l64J4-0003GL-DT
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 04:25:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 62D3B2E8142
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 04:25:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 Jan 2021 04:17:20 -0000
From: Launchpad Bug Tracker <1804961@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: aarch64 acpi
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee driver1998.ub imammedo janitor th-huth
X-Launchpad-Bug-Reporter: GH Cao (driver1998.ub)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <154309137717.32238.5287661827417174062.malonedeb@wampee.canonical.com>
Message-Id: <161206664024.375.4339171902523339227.malone@loganberry.canonical.com>
Subject: [Bug 1804961] Re: qemu-system-aarch64: Windows 10 ARM64 BSoD on boot
 while using virt-3.0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e00fb96b2e64b75333d0178ec15cb78e5aadb64d"; Instance="production"
X-Launchpad-Hash: 34b16ffc985d974aae539c5b07fd0b75dc7fdc39
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
Reply-To: Bug 1804961 <1804961@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1804961

Title:
  qemu-system-aarch64: Windows 10 ARM64 BSoD on boot while using
  virt-3.0

Status in QEMU:
  Expired

Bug description:
  When I emulate a virt-3.0 machine, Windows 10 BSoD on boot, with the
  error code being ACPI_BIOS_ERROR(0x000000A5), virt-2.12 boots fine.

  Windows Build: 10.0.17134.1
  QEMU version: 3.0.0
  Commandline: qemu-system-aarch64 -M virt -accel tcg,thread=3Dmulti -cpu c=
ortex-a57 -smp 2 -m 2048 -bios QEMU_EFI.fd -device ramfb -device nec-usb-xh=
ci -device usb-kbd -device usb-tablet -hda disk.vhd -vnc :0

  By the way, the patch to add DBG2 table discussed here
  https://lists.gnu.org/archive/html/qemu-devel/2015-09/msg01719.html
  works (although minor change is required to adapt to the qemu 3.0.0
  code), the table is accepted by Windows (Windows require both DBG2 and
  SPCR to be valid for serial kernel debugging to work), so it may help
  further diagnosing this issue.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1804961/+subscriptions

