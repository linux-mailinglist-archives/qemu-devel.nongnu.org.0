Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F03FBE90
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Nov 2019 05:32:26 +0100 (CET)
Received: from localhost ([::1]:53282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iV6nx-0007Yn-1E
	for lists+qemu-devel@lfdr.de; Wed, 13 Nov 2019 23:32:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38991)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iV6mf-00076a-2e
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 23:31:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iV6md-0001kI-Sz
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 23:31:04 -0500
Received: from indium.canonical.com ([91.189.90.7]:33372)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iV6md-0001i3-MG
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 23:31:03 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iV6ma-0003Lr-J5
 for <qemu-devel@nongnu.org>; Thu, 14 Nov 2019 04:31:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 205E52E80D8
 for <qemu-devel@nongnu.org>; Thu, 14 Nov 2019 04:31:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 Nov 2019 04:17:30 -0000
From: Launchpad Bug Tracker <1841592@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: ppc64 testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 7-pc ajbennee janitor rth
X-Launchpad-Bug-Reporter: Paul Clarke (7-pc)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <156691209320.18814.746226319480624520.malonedeb@soybean.canonical.com>
Message-Id: <157370505016.12955.7999823869647311350.malone@loganberry.canonical.com>
Subject: [Bug 1841592] Re: ppc: softfloat float implementation issues
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c597c3229eb023b1e626162d5947141bf7befb13";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 172b65c860cccfe11c25a5e308c17a61e333119f
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
Reply-To: Bug 1841592 <1841592@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1841592

Title:
  ppc: softfloat float implementation issues

Status in QEMU:
  Expired

Bug description:
  Per bug #1841491, Richard Henderson (rth) said:
  > The float test failure is part of a larger problem for target/powerpc
  > in which all float routines are implemented incorrectly. They are all
  > implemented as double operations with rounding to float as a second
  > step. Which not only produces incorrect exceptions, as in this case,
  > but incorrect numerical results from the double rounding.
  >
  > This should probably be split to a separate bug...

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1841592/+subscriptions

