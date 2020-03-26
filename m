Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F5D1948C0
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 21:25:47 +0100 (CET)
Received: from localhost ([::1]:59912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHZ4U-0000F9-TL
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 16:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35276)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jHYuu-0006Do-N5
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 16:15:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jHYut-0005ip-GQ
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 16:15:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:50804)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jHYut-0005iS-9r
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 16:15:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jHYur-0006WP-G9
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 20:15:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 77E372E80C7
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 20:15:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Mar 2020 20:09:55 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=Laurent@vivier.eu; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: laurent-vivier manuel-reimer pmaydell
X-Launchpad-Bug-Reporter: Manuel Reimer (manuel-reimer)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <158516596046.18657.8423350120096244746.malonedeb@chaenomeles.canonical.com>
Message-Id: <158525339532.11569.16837643719119989361.malone@soybean.canonical.com>
Subject: [Bug 1869073] Re: qemu-arm-static crashes "segmentation fault" when
 running "git clone -s"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3a6db24bbe7280ec09bae73384238390fcc98ad3";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: acb3a53a6e8c334dd55a981b231fe0129e5d978f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Reply-To: Bug 1869073 <1869073@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"git crashes" was a known issue with some older versions of QEMU (we had
race conditions and git happens to go multi-threaded for some operations
including I think 'clone'), but they should all now be fixed. If it does
happen again I would recommend trying the most recent QEMU release.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1869073

Title:
  qemu-arm-static crashes "segmentation fault" when running "git clone
  -s"

Status in QEMU:
  Incomplete

Bug description:
  I want to use qemu-arm-static to cross-compile software. The compiler
  itself is a native cross-compiler connected via "distcc".

  The problem is that a script tries to do some stuff with "git" and
  with a "git clone -s" command the whole story reproducibly stops with
  a "segmentation fault".

  I don't know how to properly debug the issue but it happens 100% of
  the time that I get the "crash" or git just hangs forever with 100%
  CPU usage.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1869073/+subscriptions

