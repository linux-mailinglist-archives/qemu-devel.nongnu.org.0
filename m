Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A453E1827C5
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 05:26:51 +0100 (CET)
Received: from localhost ([::1]:35604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCFQo-0006Y8-Fr
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 00:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35930)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jCFPj-0005u8-JY
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 00:25:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jCFPe-0002qm-EF
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 00:25:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:50232)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jCFPe-0002pI-8a
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 00:25:38 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jCFPc-0005we-WC
 for <qemu-devel@nongnu.org>; Thu, 12 Mar 2020 04:25:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F1F332E8029
 for <qemu-devel@nongnu.org>; Thu, 12 Mar 2020 04:25:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Mar 2020 04:17:16 -0000
From: Launchpad Bug Tracker <1653577@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gkurz janitor nathan-renniewaldock
X-Launchpad-Bug-Reporter: Nathan Rennie-Waldock (nathan-renniewaldock)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20170103031332.1493.46452.malonedeb@soybean.canonical.com>
Message-Id: <158398663734.32742.8343242188770413569.malone@loganberry.canonical.com>
Subject: [Bug 1653577] Re: Ability to set umask for 9pfs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e0878392dc799b267dea80578fa65500a5d74155";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 2d1b1f9d9fa2913d9caa147b4b39b21c3f0fdba6
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
Reply-To: Bug 1653577 <1653577@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1653577

Title:
  Ability to set umask for 9pfs

Status in QEMU:
  Expired

Bug description:
  We should be able to specify the umask for 9pfs so that files created
  by the guest can be accessed by other users on the host. Currently
  they're only accessible by the user running qemu (and of course,
  root).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1653577/+subscriptions

