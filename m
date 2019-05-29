Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 163F62E45E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 20:23:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58957 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hW3EZ-0004kw-7I
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 14:23:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hW2Fv-0007K2-7b
	for qemu-devel@nongnu.org; Wed, 29 May 2019 13:20:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hW2Fu-0003TV-9B
	for qemu-devel@nongnu.org; Wed, 29 May 2019 13:20:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:54274)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hW2Fu-0003SE-3t
	for qemu-devel@nongnu.org; Wed, 29 May 2019 13:20:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hW2Fr-0005fl-Lp
	for <qemu-devel@nongnu.org>; Wed, 29 May 2019 17:20:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 694062E80D0
	for <qemu-devel@nongnu.org>; Wed, 29 May 2019 17:20:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 May 2019 17:14:23 -0000
From: Steve Beattie <sbeattie@ubuntu.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=intel; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
	status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: intel-virt-19.10 qemu-19.10
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: quanxian-wang sbeattie
X-Launchpad-Bug-Reporter: quanxian (quanxian-wang)
X-Launchpad-Bug-Modifier: Steve Beattie (sbeattie)
References: <155909595152.12810.1489513977238974514.malonedeb@soybean.canonical.com>
Message-Id: <155915006372.16310.9543487162464035752.malone@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18968";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 7681295f79fb2ad7dd105fcd6c2756e63ba63e4c
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
X-Mailman-Approved-At: Wed, 29 May 2019 14:21:39 -0400
Subject: [Qemu-devel] [Bug 1830821] Re: Expose ARCH_CAP_MDS_NO in guest
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
Reply-To: Bug 1830821 <1830821@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The specific upstream commit is 20140a82c67467f53814ca197403d5e1b561a5e5
and is incorporated into qemu 1:3.1+dfsg-2ubuntu3.1 in disco-security
(19.04) and 1:3.1+dfsg-2ubuntu4 in eoan-proposed. For backporting to
cosmic and older, I believe it requires the infrastructure to support
IA32_ARCH_CAPABILITIES in place.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1830821

Title:
  Expose ARCH_CAP_MDS_NO in guest

Status in intel:
  New
Status in QEMU:
  New
Status in qemu package in Ubuntu:
  New

Bug description:
  Description:

  MDS_NO is bit 5 of ARCH_CAPABILITIES. Expose this bit to guest.

  Target Qemu: 4.1

To manage notifications about this bug go to:
https://bugs.launchpad.net/intel/+bug/1830821/+subscriptions

