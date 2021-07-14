Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA8C3C7D8D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 06:29:07 +0200 (CEST)
Received: from localhost ([::1]:50864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3WWA-0006Ci-2U
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 00:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3WUc-00048R-Gh
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 00:27:30 -0400
Received: from indium.canonical.com ([91.189.90.7]:51808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3WUZ-0003jn-84
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 00:27:30 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m3WUV-0006vG-J0
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 04:27:23 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id ACB1D2E8355
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 04:26:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Jul 2021 04:17:24 -0000
From: Launchpad Bug Tracker <1921280@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: hvf
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor mohd-akram th-huth
X-Launchpad-Bug-Reporter: Mohamed (mohd-akram)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161661979202.23519.15513295084745002515.malonedeb@chaenomeles.canonical.com>
Message-Id: <162623624505.32682.18421943795091438683.malone@loganberry.canonical.com>
Subject: [Bug 1921280] Re: OpenIndiana stuck in boot loop when using hvf
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="48411ad9fd448ca55fc57f9555fc375624a85324"; Instance="production"
X-Launchpad-Hash: 0f02fb59f27c4979570aae70824d342505a8a64c
Received-SPF: pass client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1921280 <1921280@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1921280

Title:
  OpenIndiana stuck in boot loop when using hvf

Status in QEMU:
  Expired

Bug description:
  I'm using QEMU version 5.2.0 on macOS, and running the "OpenIndiana
  Hipster 2020.10 Text Install DVD (64-bit x86)" ISO:

  qemu-system-x86_64 -cdrom ~/Downloads/OI-hipster-text-20201031.iso -m
  2048 -accel hvf -cpu host

  It gets to "Booting...", stays there for a bit, and then restarts.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1921280/+subscriptions


