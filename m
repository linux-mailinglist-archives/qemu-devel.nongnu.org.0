Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90552D4CC
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 06:37:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46952 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVqKn-0004CV-T7
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 00:37:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hVqJB-0003Wx-R9
	for qemu-devel@nongnu.org; Wed, 29 May 2019 00:35:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hVqJA-0003gf-QR
	for qemu-devel@nongnu.org; Wed, 29 May 2019 00:35:25 -0400
Received: from indium.canonical.com ([91.189.90.7]:58402)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hVqJA-0003ea-LN
	for qemu-devel@nongnu.org; Wed, 29 May 2019 00:35:24 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hVqJ9-0004aE-Hr
	for <qemu-devel@nongnu.org>; Wed, 29 May 2019 04:35:23 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 8407E2E806F
	for <qemu-devel@nongnu.org>; Wed, 29 May 2019 04:35:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 May 2019 04:17:16 -0000
From: Launchpad Bug Tracker <1542965@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
	assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor jignasha-vithalani th-huth
X-Launchpad-Bug-Reporter: Jignasha (jignasha-vithalani)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160208021851.24550.86196.malonedeb@soybean.canonical.com>
Message-Id: <155910343674.31442.18188948058132331879.malone@loganberry.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18968";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 0ad91b9b0a53f389614a2ecfb57edfa7e1c9339e
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1542965] Re: Failed to set NBD socket ubuntu
 15.10 & nbd client 3.10
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
Reply-To: Bug 1542965 <1542965@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1542965

Title:
  Failed to set NBD socket ubuntu 15.10 & nbd client 3.10

Status in QEMU:
  Expired

Bug description:
  Running command to mount using nbd fails
  with error
  /build/qemu-YZq7uh/qemu-2.3+dfsg/nbd.c:nbd_init():L670: Failed to set NBD=
 socket

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1542965/+subscriptions

