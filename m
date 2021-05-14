Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A133810F7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 21:37:52 +0200 (CEST)
Received: from localhost ([::1]:57290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhdd9-0000vh-Ah
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 15:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhdap-0006sr-FM
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:35:27 -0400
Received: from indium.canonical.com ([91.189.90.7]:44594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhdao-0000aM-01
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:35:27 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhdam-0003Ke-Ju
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:35:24 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 953EA2E804B
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:35:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 May 2021 19:26:27 -0000
From: Thomas Huth <1918975@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Tags: feature-request linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: rado-smg th-huth
X-Launchpad-Bug-Reporter: Rado Smogura (rado-smg)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161557726147.15858.464971602934054917.malonedeb@gac.canonical.com>
Message-Id: <162102038796.21199.12182968483499760153.malone@soybean.canonical.com>
Subject: [Bug 1918975] Re: [Feature request] Propagate interpreter to spawned
 processes
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: fcd0a577e60c23bc1628f9901a99bc5ada3cac88
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
Reply-To: Bug 1918975 <1918975@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also, is this a duplicate of
https://bugs.launchpad.net/qemu/+bug/1912107 or do you mean something
different here?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1918975

Title:
  [Feature request] Propagate interpreter to spawned processes

Status in QEMU:
  Incomplete

Bug description:
  I want QEMU user static to propagate interpreter to spawned processes,
  for instances by adding -R recursive.

  I.e. if my program is interpreted by QEMU static than everything what
  it launches should be interpreted by it, too.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1918975/+subscriptions

