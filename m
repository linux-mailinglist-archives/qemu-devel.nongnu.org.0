Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDD63AE274
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 06:34:27 +0200 (CEST)
Received: from localhost ([::1]:59632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvBdi-0003d9-N0
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 00:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvBVd-0006xd-4r
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:26:05 -0400
Received: from indium.canonical.com ([91.189.90.7]:37290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvBVZ-0007Jx-Ik
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:26:04 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvBVV-0002BJ-P5
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 04:25:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3EEC72E8207
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 04:25:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Jun 2021 04:17:44 -0000
From: Launchpad Bug Tracker <1724590@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bwasim123 janitor samuel-thibault th-huth
 willemmaster-hotmail
X-Launchpad-Bug-Reporter: Willem Mulder (willemmaster-hotmail)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <150833765599.17635.13860559072232712887.malonedeb@gac.canonical.com>
Message-Id: <162424906471.11837.4881358390904183800.malone@loganberry.canonical.com>
Subject: [Bug 1724590] Re: Usermode networking hostfwd only listens on IPv4
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: d5c9d8175799e265f27be73acd6c1868b5b6c865
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1724590 <1724590@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1724590

Title:
  Usermode networking hostfwd only listens on IPv4

Status in QEMU:
  Expired

Bug description:
  When forwarding ports in usermode networking (-net user,hostfwd=3D),
  QEMU binds to IPv4 only. Therefore, connecting to the port over IPv6
  results in 'connection refused'.

  I experienced this in QEMU 2.10.1, but it looks to still be present in
  the current master (861cd431c99e56ddb5953ca1da164a9c32b477ca), since
  slirp_hostfwd in net/slirp.c uses in_addr instead of in6_addr.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1724590/+subscriptions

