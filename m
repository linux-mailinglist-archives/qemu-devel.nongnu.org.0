Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B4A3926C6
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 07:12:46 +0200 (CEST)
Received: from localhost ([::1]:60276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm8K4-0005zO-Jj
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 01:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lm8IN-0004a1-3Q
 for qemu-devel@nongnu.org; Thu, 27 May 2021 01:10:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:44246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lm8IK-0006bt-0F
 for qemu-devel@nongnu.org; Thu, 27 May 2021 01:10:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lm8IF-0000Hi-4C
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 05:10:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 11F3D2E8136
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 05:10:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 May 2021 05:01:28 -0000
From: Thomas Huth <1895363@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mslade philmd th-huth
X-Launchpad-Bug-Reporter: Michael Slade (mslade)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159987499082.17652.11658819873688678558.malonedeb@soybean.canonical.com>
Message-Id: <162209168868.5770.11350043337385748832.malone@chaenomeles.canonical.com>
Subject: [Bug 1895363] Re: borland IDEs double up cursor key presses (need
 timing on PS2 port input)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="802ed26817d1cdd050553dbe99cc8a3cad1a3bc7"; Instance="production"
X-Launchpad-Hash: 57a2982c32328694a56c81564505535cccfc80c3
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
Reply-To: Bug 1895363 <1895363@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patch mentioned by Philippe has now been merged to the QEMU master
branch (commit d1e45668d2128b064). Michael, could you maybe check the
current git version to see whether this problem has been fixed now?

** Changed in: qemu
       Status: In Progress =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1895363

Title:
  borland IDEs double up cursor key presses (need timing on PS2 port
  input)

Status in QEMU:
  Fix Committed

Bug description:
  Most DOS-era IDEs from Borland (I have tried Borland C++ 2.0, Borland
  C++ 3.1 and Turbo Pascal 7.1) exhibit strange responses to the
  keyboard.  Cursor keys are registered twice, so each press of a cursor
  key causes the cursor to move twice. Also the other keys occasionally
  are missed or duplicated.

  From an internet search, the problem appears to be this.  These
  programs read the PS2 input register multiple times per incoming byte,
  on the assumption that the byte will remain there for at least a few
  hundred microseconds, before the next byte (if any) appears there.
  qemu treats a read of the register by the guest as an acknowledgement
  of the incoming byte and puts the next byte into the register
  immediately, thus breaking the programs that expect each successive
  byte to stay in place for a while.

  The obvious solution is to use a timer to advance through the queued
  bytes.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1895363/+subscriptions

