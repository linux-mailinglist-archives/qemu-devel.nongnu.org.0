Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27CB145E5E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 23:07:09 +0100 (CET)
Received: from localhost ([::1]:47548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuO9U-0001ab-Ed
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 17:07:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49203)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iuO86-0000lC-LC
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 17:05:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iuO84-00017N-Ou
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 17:05:42 -0500
Received: from indium.canonical.com ([91.189.90.7]:46586)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iuO83-00011j-I2
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 17:05:40 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iuO81-0006J0-NI
 for <qemu-devel@nongnu.org>; Wed, 22 Jan 2020 22:05:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A8F7A2E80AD
 for <qemu-devel@nongnu.org>; Wed, 22 Jan 2020 22:05:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jan 2020 21:59:04 -0000
From: Robert Henry <1860610@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mhodog
X-Launchpad-Bug-Reporter: Robert Henry (mhodog)
X-Launchpad-Bug-Modifier: Robert Henry (mhodog)
Message-Id: <157973034496.4473.7342941286220324914.malonedeb@soybean.canonical.com>
Subject: [Bug 1860610] [NEW] cap_disas_plugin leaks memory
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b8d1327fd820d6bf500589d6da587d5037c7d88e";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 7c670483afcba03c22d657da79e33053ca10e52e
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
Reply-To: Bug 1860610 <1860610@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Looking at origin/master head, the function cap_disas_plugin leaks
memory.

per capstone's examples using their ABI, cs_free(insn, count); needs to
called just before cs_close.

I discovered this running qemu under valgrind.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1860610

Title:
  cap_disas_plugin leaks memory

Status in QEMU:
  New

Bug description:
  Looking at origin/master head, the function cap_disas_plugin leaks
  memory.

  per capstone's examples using their ABI, cs_free(insn, count); needs
  to called just before cs_close.

  I discovered this running qemu under valgrind.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1860610/+subscriptions

