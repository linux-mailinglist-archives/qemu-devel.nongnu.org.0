Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0592FC9FC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 05:32:11 +0100 (CET)
Received: from localhost ([::1]:32880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l25AA-000406-HZ
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 23:32:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l257z-0002Ue-5x
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 23:29:59 -0500
Received: from indium.canonical.com ([91.189.90.7]:42820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l257u-0000w4-Kx
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 23:29:54 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l257t-0003Z7-GW
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 04:29:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7C06F2E8140
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 04:29:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 Jan 2021 04:17:20 -0000
From: Launchpad Bug Tracker <824074@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor jmbsvicetto-w th-huth
X-Launchpad-Bug-Reporter: Jorge Manuel B. S. Vicetto (jmbsvicetto-w)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20110810165735.14802.47701.malonedeb@soybean.canonical.com>
Message-Id: <161111624028.27714.8949771094070781528.malone@loganberry.canonical.com>
Subject: [Bug 824074] Re: Provide runtime option to expose the supported list
 of keymaps for vnc
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="44709f752aec466e4fba4ac588c69193e99da5ce"; Instance="production"
X-Launchpad-Hash: c26d5c298d9963f57a70288d1a4e27b47fe387ed
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 824074 <824074@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/824074

Title:
  Provide runtime option to expose the supported list of keymaps for vnc

Status in QEMU:
  Expired

Bug description:
  As discussed in the ganeti group[1], I'm opening this bug to request
  that qemu provides a runtime command or switch to list the supported
  keymaps for vnc.

   [1] -
  http://groups.google.com/group/ganeti/browse_thread/thread/dd524f5311d8d7=
9e

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/824074/+subscriptions

