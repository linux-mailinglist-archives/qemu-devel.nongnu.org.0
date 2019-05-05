Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4051406D
	for <lists+qemu-devel@lfdr.de>; Sun,  5 May 2019 17:01:09 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42201 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNIdY-0005Z6-9G
	for lists+qemu-devel@lfdr.de; Sun, 05 May 2019 11:01:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hNIcL-00059D-PE
	for qemu-devel@nongnu.org; Sun, 05 May 2019 10:59:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hNIcK-0006YV-EG
	for qemu-devel@nongnu.org; Sun, 05 May 2019 10:59:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:40040)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hNIcK-0006YF-8Y
	for qemu-devel@nongnu.org; Sun, 05 May 2019 10:59:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hNIcI-0004uL-F9
	for <qemu-devel@nongnu.org>; Sun, 05 May 2019 14:59:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 6662E2E80CC
	for <qemu-devel@nongnu.org>; Sun,  5 May 2019 14:59:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 May 2019 14:46:48 -0000
From: Thomas Huth <1583421@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Wishlist; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: joshtriplett narcisgarcia uqbar
X-Launchpad-Bug-Reporter: Josh Triplett (joshtriplett)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160519041741.20886.94270.malonedeb@wampee.canonical.com>
Message-Id: <155706760903.32129.2569064921897456589.launchpad@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18953";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: bdf1169f06e9d140b89f4c725a2dd6dd6f0cfdc8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1583421] Re: Please provide an option to print
 the default hardware configuration as command-line options,
 to make -nodefaults easier to use
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
Reply-To: Bug 1583421 <1583421@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
   Importance: Undecided =3D> Wishlist

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1583421

Title:
  Please provide an option to print the default hardware configuration
  as command-line options, to make -nodefaults easier to use

Status in QEMU:
  New

Bug description:
  For full customization of the default set of hardware qemu supports, a
  user can pass -nodefaults and then manually specify each device they
  want.  Many specific options document what they translate to in terms
  of the full configuration model; however, the defaults for any given
  platform don't.

  I'd love to have documentation of the default hardware configuration,
  in terms of qemu command-line options, to make it easy to run qemu
  -nodefaults, paste in the default command-line, and edit it.

  As this varies by emulated machine, perhaps qemu could have a command-
  line option to print a specific machine (e.g. pc-i440fx-2.5) in the
  form of qemu command-line options?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1583421/+subscriptions

