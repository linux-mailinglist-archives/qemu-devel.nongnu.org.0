Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 435063C4307
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 06:28:17 +0200 (CEST)
Received: from localhost ([::1]:59668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2nYF-0001im-LL
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 00:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2nWP-0007Wy-8d
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 00:26:21 -0400
Received: from indium.canonical.com ([91.189.90.7]:38274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2nWM-0006HJ-QL
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 00:26:20 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m2nWG-0005M0-BR
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 04:26:12 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4DF582E8252
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 04:26:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Jul 2021 04:17:54 -0000
From: Launchpad Bug Tracker <1914294@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor programmingkidx th-huth
X-Launchpad-Bug-Reporter: John Arbuckle (programmingkidx)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161229965531.12871.15940133447161704311.malonedeb@soybean.canonical.com>
Message-Id: <162606347504.2726.1095552119012161367.malone@loganberry.canonical.com>
Subject: [Bug 1914294] Re: Windows XP displays black screen when smp option is
 used
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: ed32f164b7dcd7aea98c7da7b61b037fda35addc
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
Reply-To: Bug 1914294 <1914294@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914294

Title:
  Windows XP displays black screen when smp option is used

Status in QEMU:
  Expired

Bug description:
  When I use Windows XP with the -smp option, the screen goes black. The
  only thing I can see is a cursor. I have tried -smp 2, -smp cores=3D4,
  and -smp cores=3D2.

  My info:

  Host:
  M1 Mac
  Mac OS 11.1
  QEMU 5.2 at cf7ca7d5b9faca13f1f8e3ea92cfb2f741eb0c0e.

  Guest:
  32-bit Windows XP SP3 build 2600.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1914294/+subscriptions

