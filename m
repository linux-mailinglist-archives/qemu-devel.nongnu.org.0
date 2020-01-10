Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C61F136A44
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 10:52:25 +0100 (CET)
Received: from localhost ([::1]:43258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipqxs-0006gm-5E
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 04:52:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43533)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ipqwK-00058A-5Y
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 04:50:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ipqwI-0005xh-Vi
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 04:50:48 -0500
Received: from indium.canonical.com ([91.189.90.7]:39134)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ipqwI-0005s6-OO
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 04:50:46 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ipqwF-0002BF-EK
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2020 09:50:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 89DA82E80CF
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2020 09:50:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jan 2020 09:37:25 -0000
From: Thomas Huth <1657010@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ehabkost pmaydell rjones-redhat th-huth
X-Launchpad-Bug-Reporter: Richard Jones (rjones-redhat)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20170117063435.21322.40478.malonedeb@gac.canonical.com>
Message-Id: <157864904545.2766.7384436974771290284.malone@soybean.canonical.com>
Subject: [Bug 1657010] Re: RFE: Please implement -cpu best or a CPU fallback
 option
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 8db56c94111b3b2467b32f4cb71b6f825cfc27de
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
Reply-To: Bug 1657010 <1657010@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As far as I can see, we have "-cpu max" now for x86, arm, ppc and s390x
... is that enough, so that we can close this bug now?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1657010

Title:
  RFE: Please implement -cpu best or a CPU fallback option

Status in QEMU:
  Incomplete

Bug description:
  QEMU should implement a -cpu best option or some other way to make
  this work:

  qemu -M pc,accel=3Dkvm:tcg -cpu best

  qemu -M pc,accel=3Dkvm:tcg -cpu host:qemu64

  See also:

  https://bugzilla.redhat.com/show_bug.cgi?id=3D1277744#c6

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1657010/+subscriptions

