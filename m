Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 295E5BC172
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 07:47:57 +0200 (CEST)
Received: from localhost ([::1]:40998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCdg3-0003oG-Ir
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 01:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55592)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iCde2-0002uv-ES
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 01:45:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iCde0-0001Gs-45
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 01:45:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:45306)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iCddz-0001GC-HC
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 01:45:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iCddw-000309-CY
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 05:45:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5DA1D2E80C8
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 05:45:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Sep 2019 05:38:13 -0000
From: Thomas Huth <1842916@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=ubuntu-z-systems; status=Triaged; importance=High;
 assignee=frank.heimes@canonical.com; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=linux; component=main;
 status=New; importance=Undecided; assignee=skipper-screen-team; 
X-Launchpad-Bug-Tags: architecture-s39064 bugnameltc-181316 severity-high
 targetmilestone-inin1804
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bugproxy frank-heimes
X-Launchpad-Bug-Reporter: bugproxy (bugproxy)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
X-Launchpad-Bug-Duplicate: 1842774
References: <156768308911.708.6152721761425216653.malonedeb@wampee.canonical.com>
Message-Id: <156930349364.27379.3408697603133219841.launchpad@soybean.canonical.com>
Subject: [Bug 1842916] Re: [18.04 FEAT] Enhanced Hardware Support - Finalize
 Naming
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19048";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: a292a28f454ed35bed871620c625a07be0f6981d
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
Reply-To: Bug 1842916 <1842916@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*** This bug is a duplicate of bug 1842774 ***
    https://bugs.launchpad.net/bugs/1842774

** No longer affects: qemu

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1842916

Title:
  [18.04 FEAT] Enhanced Hardware Support - Finalize Naming

Status in Ubuntu on IBM z Systems:
  Triaged
Status in linux package in Ubuntu:
  New

Bug description:
  This feature request will provide the final naming of the next machine

To manage notifications about this bug go to:
https://bugs.launchpad.net/ubuntu-z-systems/+bug/1842916/+subscriptions

