Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D252936DB1C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:15:00 +0200 (CEST)
Received: from localhost ([::1]:43354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbltz-0004RG-Ve
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lbls0-0003kU-8m
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 11:12:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:44006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lblqE-0000dg-70
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 11:12:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lblqB-0004vb-Qc
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 15:11:03 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 987B92E8169
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 15:11:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Apr 2021 14:57:53 -0000
From: Thomas Huth <1874676@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158772214298.26171.14045550676291595233.malonedeb@soybean.canonical.com>
Message-Id: <161962187378.11202.10658608638051087969.malone@wampee.canonical.com>
Subject: [Bug 1874676] Re: [Feature request] MDIO bus
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f9f562f07f129de414c16be22a405ff0964e0018"; Instance="production"
X-Launchpad-Hash: e6817c968be5afd2d37535d86dd822bbddead0a8
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Bug 1874676 <1874676@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved
to QEMU's new bug tracker on gitlab.com and thus gets marked
as 'expired' now. Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/49


** Changed in: qemu
       Status: Incomplete =3D> Expired

** Changed in: qemu
     Assignee: Philippe Mathieu-Daud=C3=A9 (philmd) =3D> (unassigned)

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #49
   https://gitlab.com/qemu-project/qemu/-/issues/49

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1874676

Title:
  [Feature request] MDIO bus

Status in QEMU:
  Expired

Bug description:
  Various network devices open-code a MDIO bus with a dedicated PHY.
  Introduce a new MDIO subsystem to
  - reuse various duplicated components
  - be able to interchange PHYs
  - have common tracing
  - use libqos to test all the PHYs from different NICs

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1874676/+subscriptions

