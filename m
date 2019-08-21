Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1192597A3D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 15:02:24 +0200 (CEST)
Received: from localhost ([::1]:48230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0QFq-0002hZ-Oa
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 09:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41613)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1i0QEQ-0001Ri-Mw
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 09:00:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1i0QEP-0005D1-Lv
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 09:00:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:46272)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1i0QEP-0005CQ-Gn
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 09:00:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1i0QEN-0001rL-RF
 for <qemu-devel@nongnu.org>; Wed, 21 Aug 2019 13:00:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9EA612E80CE
 for <qemu-devel@nongnu.org>; Wed, 21 Aug 2019 13:00:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Aug 2019 12:53:12 -0000
From: Brad Parker <1819289@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cbparker curryrice71 dgilbert-h philmd pmaydell
X-Launchpad-Bug-Reporter: John M (curryrice71)
X-Launchpad-Bug-Modifier: Brad Parker (cbparker)
References: <155216177409.9624.16357609956497374456.malonedeb@gac.canonical.com>
Message-Id: <156639199256.22565.2849093712763706130.malone@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19022";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 040b11be915c8d80db3667030778c175a23c4f70
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1819289] Re: Windows 95 and Windows 98 will not
 install or run
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
Reply-To: Bug 1819289 <1819289@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I tried reverting that commit on top of master but it did not help, so
I'm guessing it broke yet again (differently) somewhere else. I'll try
reverting cd1bfd5 on top of the very next commit and bisect from there
to master, and see where that takes me.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1819289

Title:
  Windows 95 and Windows 98 will not install or run

Status in QEMU:
  New

Bug description:
  The last version of QEMU I have been able to run Windows 95 or Windows
  98 on was 2.7 or 2.8. Recent versions since then even up to 3.1 will
  either not install or will not run 95 or 98 at all. I have tried every
  combination of options like isapc or no isapc, cpu pentium  or cpu as
  486. Tried different memory configurations, but they just don't work
  anymore.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1819289/+subscriptions

