Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A75E2346
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 21:24:00 +0200 (CEST)
Received: from localhost ([::1]:44880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNMEg-0006Kf-VC
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 15:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40047)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iNLFl-0007ev-1N
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 14:21:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iNLFg-0001Ym-8Q
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 14:20:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:38838)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iNLFc-0001P0-Cm
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 14:20:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iNLFW-00011Y-TW
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 18:20:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DD87F2E802A
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 18:20:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Oct 2019 18:14:06 -0000
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Won't Fix; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: christophe-lyon pmaydell rth
X-Launchpad-Bug-Reporter: Christophe Lyon (christophe-lyon)
X-Launchpad-Bug-Modifier: Richard Henderson (rth)
References: <150712892432.28170.15132413345734525245.malonedeb@gac.canonical.com>
Message-Id: <157185444645.29920.1434842458502380844.malone@soybean.canonical.com>
Subject: [Bug 1721275] Re: Support more ARM CPUs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="469f241f4e73cc0bdffa4e30654052a2af068e06";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 5b52a2731df6a9d92ef0c296d9cc803d7ebd07d1
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
Reply-To: Bug 1721275 <1721275@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

They are implemented, because they also appear in A-profile.
We just need to set the corresponding MVFR field to enable them.

Setting MVFR2.FPMISC =3D 4 will do the job, I believe.

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

