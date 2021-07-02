Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F833B9B8C
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 06:34:51 +0200 (CEST)
Received: from localhost ([::1]:47920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzAt8-0005rI-2P
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 00:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzAkv-0000mX-1b
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 00:26:22 -0400
Received: from indium.canonical.com ([91.189.90.7]:43376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzAko-0002Z8-6q
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 00:26:20 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lzAka-00050s-Ka
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 04:26:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D3E2B2E823A
 for <qemu-devel@nongnu.org>; Fri,  2 Jul 2021 04:25:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Jul 2021 04:17:19 -0000
From: Launchpad Bug Tracker <1802465@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alapha23 janitor th-huth zcjia
X-Launchpad-Bug-Reporter: Zhaocong (zcjia)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <154174980807.2749.13752196954108515323.malonedeb@gac.canonical.com>
Message-Id: <162519944002.31921.10962672417038971301.malone@loganberry.canonical.com>
Subject: [Bug 1802465] Re: typing string via VNC is unreliable
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c7d3f30bfe7d7b488c7f9d3c8d7880184b1d065e"; Instance="production"
X-Launchpad-Hash: 4c78796e80a61fedcf3307862e3ed966ab927a78
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
Reply-To: Bug 1802465 <1802465@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1802465

Title:
  typing string via VNC is unreliable

Status in QEMU:
  Expired

Bug description:
  QEMU version is 3.0.0

  # Description

  The problem is that, when typing string through VNC, it can be
  unreliable -- sometimes some key strokes get skipped, sometimes get
  swapped, sometimes get repeated.  There's no problem when typing
  through VNC on physical hardware.

  # Steps to reproduce

  1. Launch virtual machine by:

      qemu-kvm -display vnc=3D:1 -m 2048 opensuse-leap-15.qcow2

  2. Connect to VNC by:

      vncviewer -Shared :5901

  3. Simulate a series of key strokes by "vncdotool" [1]:

      vncdotool -s 127.0.0.1::5901 typefile strings_to_be_typed.txt

  4. Usually after a few hundred keys are typed, something goes wrong.

  I attached a screenshot that it mistypes " hello" to "h ello".

  [1] https://github.com/sibson/vncdotool

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1802465/+subscriptions

