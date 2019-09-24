Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C97BFBC173
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 07:48:00 +0200 (CEST)
Received: from localhost ([::1]:41000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCdg7-0003qw-Nk
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 01:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55605)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iCde5-0002v3-6v
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 01:45:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iCde4-0001I2-0U
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 01:45:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:45566)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iCde3-0001HZ-Hm
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 01:45:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iCde1-00034r-DR
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 05:45:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 392782E80E4
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 05:45:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Sep 2019 05:37:15 -0000
From: Thomas Huth <1842774@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=ubuntu-z-systems; status=Triaged; importance=High;
 assignee=frank.heimes@canonical.com; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=linux; component=main;
 status=In Progress; importance=High; assignee=canonical-kernel-team; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=bionic; sourcepackage=linux;
 component=main; status=In Progress; importance=High;
 assignee=canonical-kernel-team; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=disco; sourcepackage=linux; 
 component=main; status=In Progress; importance=High;
 assignee=canonical-kernel-team; 
X-Launchpad-Bug-Tags: architecture-s39064 bugnameltc-181268 severity-high
 targetmilestone-inin1910
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: andrew-cloke bugproxy frank-heimes th-huth
X-Launchpad-Bug-Reporter: bugproxy (bugproxy)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156764756485.6162.5365845259935486076.malonedeb@soybean.canonical.com>
Message-Id: <156930343520.13411.17857665560777317112.malone@gac.canonical.com>
Subject: [Bug 1842774] Re: Enhanced Hardware Support - Finalize Naming
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19048";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 8e9f0dbc3973580b8f776f3694c28c1b13694fcc
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
Reply-To: Bug 1842774 <1842774@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch a0e2251132995b9 is a kernel patch, thus this is certainly not
something we need to track in the upstream QEMU bugtracker.

** No longer affects: qemu

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1842774

Title:
  Enhanced Hardware Support - Finalize Naming

Status in Ubuntu on IBM z Systems:
  Triaged
Status in linux package in Ubuntu:
  In Progress
Status in linux source package in Bionic:
  In Progress
Status in linux source package in Disco:
  In Progress

Bug description:
  SRU Justification:
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  [Impact]

  * Add / activate support for IBM z15 and LinuxONE III systems

  [Fix]

  * a0e2251132995b962281aa80ab54a9288f9e0b6b a0e2251 "s390: add support
  for IBM z15 machines"

  [Test Case]

  * check and verify cpuinfo - regression testing is possible by
  Canonical/me

  * functional testing is currently only doable by IBM

  [Regression Potential]

  * There is regression potential with having new code in and the flags
  added/active

  * but the code changes are pretty straight forward, just add config,
  cases and defs

  * and are not used on existing systems, just on the new generation
  that is not yet out in the field

  [Other Info]

  * SRU of LP 1842916 merged with (this) LP 1842774

  __________

  This feature request will provide the final naming of the next machine

To manage notifications about this bug go to:
https://bugs.launchpad.net/ubuntu-z-systems/+bug/1842774/+subscriptions

