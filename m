Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBB61ABF3
	for <lists+qemu-devel@lfdr.de>; Sun, 12 May 2019 14:00:04 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42157 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hPn99-0005e9-GJ
	for lists+qemu-devel@lfdr.de; Sun, 12 May 2019 08:00:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hPn7j-0004k8-Sq
	for qemu-devel@nongnu.org; Sun, 12 May 2019 07:58:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hPn06-0007jD-4D
	for qemu-devel@nongnu.org; Sun, 12 May 2019 07:50:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:55598)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hPn05-0007iO-V5
	for qemu-devel@nongnu.org; Sun, 12 May 2019 07:50:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hPn04-0004NW-5v
	for <qemu-devel@nongnu.org>; Sun, 12 May 2019 11:50:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 260BB2E80C7
	for <qemu-devel@nongnu.org>; Sun, 12 May 2019 11:50:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 May 2019 11:44:09 -0000
From: Thomas Moschny <1828723@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: moschny
X-Launchpad-Bug-Reporter: Thomas Moschny (moschny)
X-Launchpad-Bug-Modifier: Thomas Moschny (moschny)
Message-Id: <155766144999.15801.8727893741494500797.malonedeb@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18962";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 97aeec7651de6d02b218d56905f2a08ee41da12a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1828723] [NEW] [RFE] option to suppress
 gemu_log() output
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1828723 <1828723@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

With user mode emulation, messages from genu_log() are emitted
unconditionally to stderr. I didn't find a way to suppress them. It
would be nice to have options similar to the -D/-d options to be able to
filter and/or redirect the output.

My use case is chroot/container execution for different architectures
via binfmt. In this case it will appear as if the binary in question had
emitted messages like "Unsupported setsockopt ..." to stderr while in
fact the message came from qemu-*-static.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1828723

Title:
  [RFE] option to suppress gemu_log() output

Status in QEMU:
  New

Bug description:
  With user mode emulation, messages from genu_log() are emitted
  unconditionally to stderr. I didn't find a way to suppress them. It
  would be nice to have options similar to the -D/-d options to be able
  to filter and/or redirect the output.

  My use case is chroot/container execution for different architectures
  via binfmt. In this case it will appear as if the binary in question
  had emitted messages like "Unsupported setsockopt ..." to stderr while
  in fact the message came from qemu-*-static.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1828723/+subscriptions

