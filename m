Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABB32BC291
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 00:06:39 +0100 (CET)
Received: from localhost ([::1]:33382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgbxm-0008Ae-Hq
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 18:06:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgbwo-0007kw-9o
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 18:05:38 -0500
Received: from indium.canonical.com ([91.189.90.7]:54642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgbwm-0000PI-Bz
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 18:05:38 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kgbwl-0006yv-46
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 23:05:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EC7F32E813A
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 23:05:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2020 22:58:45 -0000
From: Peter Maydell <1838658@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange gson pmaydell prlw1
X-Launchpad-Bug-Reporter: Patrick Welche (prlw1)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <156467368424.6955.5535032657029646608.malonedeb@soybean.canonical.com>
Message-Id: <160599952518.21610.11833298103675460008.malone@wampee.canonical.com>
Subject: [Bug 1838658] Re: qemu 4.0.0 broken by glib update
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 26371690f6b902eeaeae56b2e0074cc91b40a7b8
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Reply-To: Bug 1838658 <1838658@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The linked NetBSD bug report http://gnats.netbsd.org/54310 now has
confirmation that this crash was the result of a memory corruption bug
in QEMU which happened to manifest with the newer glib version. That bug
is fixed in QEMU master in commit ef905eff421c5a06a01 which will be in
the 5.2 release, so we can mark this as 'fix committed'.


** Changed in: qemu
       Status: New =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1838658

Title:
  qemu 4.0.0 broken by glib update

Status in QEMU:
  Fix Committed

Bug description:
  In brief, an install CD will successfully boot with qemu 4.0.0 built with=
 glib 2.58.3, but freeze during boot with qemu 4.0.0 built with glib 2.60.0=
. I tracked it down to glib's GHashTable improvements. qemu is happy with a=
 glib built from
  ```
   git checkout -f 2.60.4
   git revert --no-edit 86c6f7e2b..3bed8a13b
   git revert --no-edit 75f8ec1df9b48b0c3a13a9125f2c7d7c5adf5159
   git revert --no-edit 603fb5958..d3074a748
   git revert --no-edit 0b45ddc55..0600dd322
  ```
  When the GHashTable improvements were committed, there was already a pree=
mptive note about any breakage being due to using private implementation de=
tails, hence mentioning it here rather than with glib.

  For the full saga, see: http://gnats.netbsd.org/54310

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1838658/+subscriptions

