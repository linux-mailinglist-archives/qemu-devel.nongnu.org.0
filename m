Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 021F969976
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 19:01:10 +0200 (CEST)
Received: from localhost ([::1]:40994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn4Lc-0000pI-Qb
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 13:01:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39138)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hn4LF-0008SJ-Aq
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 13:00:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hn4LE-0000A7-7c
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 13:00:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:60118)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hn4LE-00009e-0c
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 13:00:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hn4LD-0008Na-9X
 for <qemu-devel@nongnu.org>; Mon, 15 Jul 2019 17:00:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 460E62E80C7
 for <qemu-devel@nongnu.org>; Mon, 15 Jul 2019 17:00:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jul 2019 16:54:03 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: docs
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28alex-bennee=29?=
References: <156303245351.28480.9481024859968233865.malonedeb@chaenomeles.canonical.com>
Message-Id: <156320964417.15101.15246424391778112872.launchpad@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19007";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 4bc7fce4d65d111cbd0f18a0815cceeedd518a82
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1836451] Re: 'make info' fails due to errors in
 qemu-tech.texi
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
Reply-To: Bug 1836451 <1836451@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Tags added: docs

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1836451

Title:
  'make info' fails due to errors in qemu-tech.texi

Status in QEMU:
  New

Bug description:
  git tag: v4.1.0-rc0
  host: Fedora 29, x86_64

  $ make info
  make[1]: Entering directory 'qemu/slirp'
  make[1]: Nothing to be done for 'all'.
  make[1]: Leaving directory 'qemu/slirp'
    GEN     docs/version.texi
    GEN     qemu-options.texi
    GEN     qemu-monitor.texi
    GEN     qemu-img-cmds.texi
    GEN     qemu-monitor-info.texi
    GEN     qemu-doc.info
  qemu/qemu-tech.texi:6: @menu reference to nonexistent node `Translator In=
ternals'
  qemu/qemu-tech.texi:7: @menu reference to nonexistent node `QEMU compared=
 to other emulators'
  qemu/qemu-tech.texi:9: @menu reference to nonexistent node `Bibliography'
  Makefile:960: recipe for target 'qemu-doc.info' failed
  make: *** [qemu-doc.info] Error 1

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1836451/+subscriptions

