Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456703BF4BF
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 06:28:50 +0200 (CEST)
Received: from localhost ([::1]:49206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Leb-0005rU-B3
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 00:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1Lc5-0006KS-4R
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 00:26:13 -0400
Received: from indium.canonical.com ([91.189.90.7]:58136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1Lc3-0003Kr-Er
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 00:26:12 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m1Lbp-0000mG-DO
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 04:25:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7FA8C2E80E9
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 04:25:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Jul 2021 04:17:18 -0000
From: Launchpad Bug Tracker <1891829@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: serial
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor mslade th-huth
X-Launchpad-Bug-Reporter: Michael Slade (mslade)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <159762208982.14812.18418944831865683616.malonedeb@gac.canonical.com>
Message-Id: <162571783815.7916.15914568216597164233.malone@loganberry.canonical.com>
Subject: [Bug 1891829] Re: High bit(s) sometimes set high on rcvd serial bytes
 when char size < 8 bits
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: e345cf03fd03353ef5520e506a74ef1b8e12413d
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
Reply-To: Bug 1891829 <1891829@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1891829

Title:
  High bit(s) sometimes set high on rcvd serial bytes when char size < 8
  bits

Status in QEMU:
  Expired

Bug description:
  I *believe* (not confirmed) that the old standard PC serial ports,
  when configured with a character size of 7 bits or less, should set
  non-data bits to 0 when the CPU reads received chars from the read
  register.  qemu doesn't do this.

  Windows 1.01 will not make use of a serial mouse when bit 7 is 1.  The
  ID byte that the mouse sends on reset is ignored.  I added a temporary
  hack to set bit 7 to 0 on all incoming bytes, and this convinced
  windows 1.01 to use the mouse.

  note 1:  This was using a real serial mouse through a passed-through
  serial port.  The emulated msmouse doesn't work for other reasons.

  note 2:  The USB serial port I am passing through to the guest sets
  non-data bits to 1.  Not sure if this is the USB hardware or linux.

  note 3:  I also needed to add an -icount line to slow down the guest
  CPU, so that certain cpu-sensitive timing code in the guest didn't
  give up too quickly.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1891829/+subscriptions

