Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A2431C114
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 19:03:44 +0100 (CET)
Received: from localhost ([::1]:46160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBiDm-0006bH-TO
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 13:03:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lBiBB-0005Vy-IG
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 13:01:01 -0500
Received: from indium.canonical.com ([91.189.90.7]:54078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lBiB4-0004rX-KP
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 13:01:01 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lBiB2-000344-Bx
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 18:00:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2E28B2E8010
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 18:00:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Feb 2021 17:55:43 -0000
From: Vadim Averin <1914535@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: avevad pmaydell
X-Launchpad-Bug-Reporter: Vadim Averin (avevad)
X-Launchpad-Bug-Modifier: Vadim Averin (avevad)
References: <161241593716.24579.2543593740941156934.malonedeb@wampee.canonical.com>
Message-Id: <161341174402.15615.11597752142190787397.malone@soybean.canonical.com>
Subject: [Bug 1914535] Re: PL110 8-bit mode is not emulated correctly
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b3a93345a124168b715ec9ae0945884caa15f58f"; Instance="production"
X-Launchpad-Hash: bf2748aa634c4778bb8038a6202ba5adec82df18
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
Reply-To: Bug 1914535 <1914535@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Archive with all the demo files (kernel, disk image, dtb file, screenshot o=
f the bug):
https://avevad.ddns.net/storage/qbug.tar
QEMU commandline:
qemu-system-arm -serial stdio -M vexpress-a15 -dtb vexpress-v2p-ca15_a7.dtb=
 -smp 4  -m 256M -kernel zImage_new  -append "console=3DttyAMA0 root=3D/dev=
/mmcblk0p1 loglevel=3D9 vt.global_cursor_default=3D0 video=3Dvfb:" -drive i=
f=3Dsd,format=3Draw,file=3Ddisk

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914535

Title:
  PL110 8-bit mode is not emulated correctly

Status in QEMU:
  New

Bug description:
  When the emulated pl110/pl111 is switched programmatically to 8-bit
  color depth mode, the display is drawn green and blue, but the real
  PL110 displays grayscale in 8-bit mode.

  The bug appears in qemu-system-arm version 3.1.0 (Debian
  1:3.1+dfsg-8+deb10u8) and qemu-system-arm version 5.2.50
  (v5.2.0-1579-g99ae0cd90d).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1914535/+subscriptions

