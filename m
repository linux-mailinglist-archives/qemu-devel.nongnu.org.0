Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E1E3776EB
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 16:11:21 +0200 (CEST)
Received: from localhost ([::1]:36174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfk9Q-0002Zb-HF
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 10:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfk42-0003tE-SI
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:05:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:52134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfk3w-0005kk-85
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:05:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfk3t-0003NT-KQ
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 14:05:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 997832E8135
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 14:05:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 13:56:31 -0000
From: Thomas Huth <1895363@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mslade philmd
X-Launchpad-Bug-Reporter: Michael Slade (mslade)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159987499082.17652.11658819873688678558.malonedeb@soybean.canonical.com>
Message-Id: <162056859179.7144.9931735730788711477.launchpad@gac.canonical.com>
Subject: [Bug 1895363] Re: borland IDEs double up cursor key presses (need
 timing on PS2 port input)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 1903e893afc4e65375f909a69cbb9d23cc12ec21
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

** Changed in: qemu
       Status: Confirmed =3D> In Progress

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1895363

Title:
  borland IDEs double up cursor key presses (need timing on PS2 port
  input)

Status in QEMU:
  In Progress

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

