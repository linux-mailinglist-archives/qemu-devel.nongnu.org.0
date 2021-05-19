Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA6E388F67
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:43:55 +0200 (CEST)
Received: from localhost ([::1]:33154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljMUM-0001nd-QR
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ljM3J-0006lF-Jo
 for qemu-devel@nongnu.org; Wed, 19 May 2021 09:15:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:60388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ljM3G-00066o-U0
 for qemu-devel@nongnu.org; Wed, 19 May 2021 09:15:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1ljM3E-0003Dd-M7
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 13:15:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9AD612E8186
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 13:15:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 May 2021 13:00:56 -0000
From: Rado Smogura <1918975@bugs.launchpad.net>
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
X-Launchpad-Bug-Modifier: Rado Smogura (rado-smg)
References: <161557726147.15858.464971602934054917.malonedeb@gac.canonical.com>
Message-Id: <162142925657.17426.12552945678787167092.malone@wampee.canonical.com>
Subject: [Bug 1918975] Re: [Feature request] Propagate interpreter to spawned
 processes
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 7ecbedb6bac7520a1fd4ffde8ab76bbe14a3f704
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
Reply-To: Bug 1918975 <1918975@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

However use case is a bit different, I don't use binfmtmisc - so I will
leave it to your decision, if it's same or not.

I.e. Imagine I run sh with qemu - I want any process launched from sh to
be as well qemu interpreted.

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

