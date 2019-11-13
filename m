Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A0FFAE53
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Nov 2019 11:17:03 +0100 (CET)
Received: from localhost ([::1]:42620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUphu-0001Up-9V
	for lists+qemu-devel@lfdr.de; Wed, 13 Nov 2019 05:17:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50286)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iUpgo-00014b-2i
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 05:15:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iUpgj-0007iO-7l
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 05:15:54 -0500
Received: from indium.canonical.com ([91.189.90.7]:48374)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iUpgj-0007hq-1p
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 05:15:49 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iUpgh-0004pB-SQ
 for <qemu-devel@nongnu.org>; Wed, 13 Nov 2019 10:15:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D39D12E80C0
 for <qemu-devel@nongnu.org>; Wed, 13 Nov 2019 10:15:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 Nov 2019 10:04:50 -0000
From: Laurent Vivier <Laurent@vivier.eu>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gnzlbg kb9vqf laurent-vivier
X-Launchpad-Bug-Reporter: Timothy Pearson (kb9vqf)
X-Launchpad-Bug-Modifier: Laurent Vivier (laurent-vivier)
References: <151183114573.10651.11339653840196724023.malonedeb@wampee.canonical.com>
Message-Id: <157363949043.30952.1031773832461049191.malone@wampee.canonical.com>
Subject: [Bug 1734792] Re: linux-user mode does not support memfd_create
 syscall
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c597c3229eb023b1e626162d5947141bf7befb13";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 6b1e7b3168ceb03531c6b86147d53c11a4b8b2b4
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
Reply-To: Bug 1734792 <1734792@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

9bdfa4d23f43 linux-user: add memfd_create


** Changed in: qemu
       Status: Confirmed =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1734792

Title:
  linux-user mode does not support memfd_create syscall

Status in QEMU:
  Fix Committed

Bug description:
  qemu-x86_66 GIT HEAD fails on a userspace application that requires
  memfd_create with:

  "qemu: Unsupported syscall: 319".

  memfd_create support needs to be implemented in QEMU.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1734792/+subscriptions

