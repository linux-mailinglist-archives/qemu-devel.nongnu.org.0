Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DAFED1B8
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Nov 2019 05:42:12 +0100 (CET)
Received: from localhost ([::1]:51904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iR7iN-0002Ro-FL
	for lists+qemu-devel@lfdr.de; Sun, 03 Nov 2019 00:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52720)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iR7h9-0001Wk-5r
 for qemu-devel@nongnu.org; Sun, 03 Nov 2019 00:40:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iR7h6-00046L-WF
 for qemu-devel@nongnu.org; Sun, 03 Nov 2019 00:40:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:39180)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iR7h6-00045t-OW
 for qemu-devel@nongnu.org; Sun, 03 Nov 2019 00:40:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iR7h5-0003a9-Ae
 for <qemu-devel@nongnu.org>; Sun, 03 Nov 2019 04:40:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4783F2E80C8
 for <qemu-devel@nongnu.org>; Sun,  3 Nov 2019 04:40:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 03 Nov 2019 04:31:46 -0000
From: Shawn Landden <1851095@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: scientes
X-Launchpad-Bug-Reporter: Shawn Landden (scientes)
X-Launchpad-Bug-Modifier: Shawn Landden (scientes)
References: <157275520880.19702.5640428141206739403.malonedeb@wampee.canonical.com>
Message-Id: <157275550612.2617.13611918334558950010.malone@gac.canonical.com>
Subject: [Bug 1851095] Re: [feature request] awareness of instructions that
 are well emulated
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="469f241f4e73cc0bdffa4e30654052a2af068e06";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 16fe798ac9a9f0ce66dcf8a7d701564391a28403
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1851095 <1851095@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here is a pull request for the zig language that runs into this problems
in qemu https://github.com/ziglang/zig/pull/2945/

I have more code for validation if someone is working on this.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1851095

Title:
  [feature request] awareness of instructions that are well emulated

Status in QEMU:
  New

Bug description:
  While qemu's scalar emulation tends to be excellent, qemu's SIMD
  emulation tends to be incorrect (except for arm64 from x86_64)--i have
  found this both for mipsel and arm32. Until these code paths are
  audited, which is probably a large job, it would be nice if qemu knew
  its emulation of this class of instructions was not very good, and
  thus it would give up on finding these instructions if a "careful"
  operation is passed.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1851095/+subscriptions

