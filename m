Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 582033F7061
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:28:50 +0200 (CEST)
Received: from localhost ([::1]:33938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInL7-00036R-DZ
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInDR-0001Og-KS
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:20:53 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:43508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInDO-00006k-TE
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:20:53 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id AEC8E3F32F
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629876046;
 bh=Im3TSqGJfaYHbNc8PQo7i3/vU9HZf1UOXe8+WaAzTyQ=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=TkPXsl3q+fK0JZJIJsY9dg42DiDeDkYzZ/kGZOUy0QDFEL+8kjs68kNG37hyp6bTJ
 6ZZ4KxKpoj6106yDRTDTcw/A1eqkBabcDcO7U8//LFSQzys9+tkCwZ0U9dE5RNWYE1
 E5PC5GOQmzmM5Oy8nfZwWe82ntjHkV/UhqJNsBdj99qLnjw6Mv7Q7kdlOgmNpyYLH+
 6lLkvCiHGwPtoWGf9MkePMZCDyKTZMPnxr/1tmdi4Q4ptM5fYm0ekgcuUA6oVX2ZKT
 wF9a90UFfLci221I0+GvoeSpqgf3OfwQ+cvvvtEpEbIpE+S35ByC3xljBuMbjrgDmv
 bCbmEJPlVE8eg==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 702B92E81A1
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:20:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Aug 2021 07:15:29 -0000
From: Thomas Huth <1895363@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mslade philmd th-huth
X-Launchpad-Bug-Reporter: Michael Slade (mslade)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159987499082.17652.11658819873688678558.malonedeb@soybean.canonical.com>
Message-Id: <162987573117.28460.1303228431852680763.launchpad@wampee.canonical.com>
Subject: [Bug 1895363] Re: borland IDEs double up cursor key presses (need
 timing on PS2 port input)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7edb2d45353e030166106ae05838b77ab406edcd"; Instance="production"
X-Launchpad-Hash: 0470e13a7ea99f3f96a29e959c83d8bcb10bd735
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
       Status: Fix Committed =3D> Fix Released

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1895363

Title:
  borland IDEs double up cursor key presses (need timing on PS2 port
  input)

Status in QEMU:
  Fix Released

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


