Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C40D219E4
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 16:41:17 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49611 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRe2u-0000ur-DL
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 10:41:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hRe1f-0000RJ-Jk
	for qemu-devel@nongnu.org; Fri, 17 May 2019 10:40:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hRe1e-00076f-Fv
	for qemu-devel@nongnu.org; Fri, 17 May 2019 10:39:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:36956)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hRe1e-00074x-AR
	for qemu-devel@nongnu.org; Fri, 17 May 2019 10:39:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hRe1c-0004dF-S9
	for <qemu-devel@nongnu.org>; Fri, 17 May 2019 14:39:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id C8FF62E80CC
	for <qemu-devel@nongnu.org>; Fri, 17 May 2019 14:39:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 May 2019 14:30:19 -0000
From: Daniel Berrange <676934@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Wishlist; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee berrange developers-tefnet
X-Launchpad-Bug-Reporter: Tefnet Developers (developers-tefnet)
X-Launchpad-Bug-Modifier: Daniel Berrange (berrange)
References: <20101118110340.18016.73281.malonedeb@palladium.canonical.com>
Message-Id: <155810341935.15974.17491893921497061931.malone@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18962";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 934b963986c01351474d4ce4d82e1c3655bc88e1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 676934] Re: Ability to use -net socket with unix
 sockets
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
Reply-To: Bug 676934 <676934@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is just about connecting the NIC backends for 2 QEMUs together
using a UNIX socket, instead of the current TCP/UDP socket. It should be
fairly trivial to support i would expect. Though ideally we'd port the
netdev socket backend to use QIOChannel  too

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/676934

Title:
  Ability to use -net socket with unix sockets

Status in QEMU:
  New

Bug description:
  It would be a nice feature (simplifying access control for example) to
  be able to do something like:

  qemu -net socket,listen=3Dunix:/tmp/qemunet
  qemu -net socket,connect=3Dunix:/tmp/qemunet

  For now one has to use TCP connections even for guests running on the
  same host, which involves setting up iptables to restrict access.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/676934/+subscriptions

