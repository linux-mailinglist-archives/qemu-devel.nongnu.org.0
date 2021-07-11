Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 710363C3A5C
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 06:28:07 +0200 (CEST)
Received: from localhost ([::1]:34846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2R4X-0003BC-Us
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 00:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2R36-0000gQ-6j
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 00:26:36 -0400
Received: from indium.canonical.com ([91.189.90.7]:35504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2R33-0000YB-VJ
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 00:26:35 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m2R2x-0006UN-Cn
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 04:26:27 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 408212E824E
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 04:26:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Jul 2021 04:17:36 -0000
From: Launchpad Bug Tracker <1902306@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: feature-request usb
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor kiler129 th-huth
X-Launchpad-Bug-Reporter: Greg Zdanowski (kiler129)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160408741769.30267.7403254595393961918.malonedeb@gac.canonical.com>
Message-Id: <162597705617.19787.17878512391525066312.malone@loganberry.canonical.com>
Subject: [Bug 1902306] Re: Allow setting usb storage device ID parameters
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: cdd279aa929b2ef943a07cf9f9f0cf0890af0c16
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
Reply-To: Bug 1902306 <1902306@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1902306

Title:
  Allow setting usb storage device ID parameters

Status in QEMU:
  Expired

Bug description:
  Some stubborn software requires certain VID/PID/Serial to authenticate
  and refuses to start in emulation. This poses a problem with
  unsupported programs which often require keeping an ancient hardware
  praying that the USB stick will not die before the (often defunct)
  company making it.

  Virtualizing such environment is desired. However, QEMU doesn't allow
  setting VID/PID/Serial/Name of emulated USB devices, but instead uses
  hardcoded values:
  https://github.com/qemu/qemu/blob/c99fa56b95a72f6debd50a280561895d078ae02=
0/hw/usb
  /dev-storage.c#L95

  This request (including a patch) was already made in 2015 on the list
  but never got any response: https://lists.nongnu.org/archive/html
  /qemu-discuss/2015-07/msg00072.html

  =

  WDYT of adding such functionality?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1902306/+subscriptions

