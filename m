Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FFDB21B0
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 16:17:36 +0200 (CEST)
Received: from localhost ([::1]:44492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8mOF-00037M-V9
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 10:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44187)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1i8mN3-0002QV-9X
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 10:16:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1i8mN2-0004Ms-3x
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 10:16:21 -0400
Received: from indium.canonical.com ([91.189.90.7]:43860)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1i8mN1-0004MK-VI
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 10:16:20 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1i8mMz-0004Gw-LB
 for <qemu-devel@nongnu.org>; Fri, 13 Sep 2019 14:16:18 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9598B2E824D
 for <qemu-devel@nongnu.org>; Fri, 13 Sep 2019 14:16:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Sep 2019 14:05:53 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Won't Fix; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: christophe-lyon pmaydell
X-Launchpad-Bug-Reporter: Christophe Lyon (christophe-lyon)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <150712892432.28170.15132413345734525245.malonedeb@gac.canonical.com>
Message-Id: <156838355338.27734.2088434921830533616.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19048";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: aef8c2596f4274b335c512c3bbc11dbf00a2f8a5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1721275] Re: Support more ARM CPUs
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
Reply-To: Bug 1721275 <1721275@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yes, QEMU supports DP (I actually had to go to some lengths to disable
the DP support for the M4 :-))

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1721275

Title:
  Support more ARM CPUs

Status in QEMU:
  Won't Fix

Bug description:
  Hi,

  This is an enhancement request, rather than a bug report.

  After some discussions/presentations during the last Linaro Connect
  (SFO17), I understand that it may be easy to add support for more ARM
  CPUs in QEMU. I am interested in user-mode, if that matters.

  I'm primarily using QEMU for GCC validations, and I'd like to make
  sure that GCC doesn't generate instructions not supported by the CPU
  it's supposed to generate code for.

  I'd like to have:
  cortex-m0
  cortex-m4
  cortex-m7
  cortex-m23
  cortex-m33

  cortex-a35
  cortex-a53
  cortex-a57

  Is it possible?
  Is it the right place to ask?
  Should I file separate requests for each?

  Thanks

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1721275/+subscriptions

