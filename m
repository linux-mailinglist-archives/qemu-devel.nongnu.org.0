Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C803BC5B1
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:46:06 +0200 (CEST)
Received: from localhost ([::1]:57956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0cyD-0002Lm-U3
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfh-0000Sb-F1
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:52772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cff-0003Sp-QY
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0cfS-0004xQ-09
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 04:26:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BCD892E843C
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 04:26:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Jul 2021 04:17:25 -0000
From: Launchpad Bug Tracker <1868617@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dkg0 janitor th-huth
X-Launchpad-Bug-Reporter: dkg (dkg0)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158499422385.10961.5853987871982902669.malonedeb@soybean.canonical.com>
Message-Id: <162554504531.7821.10344605235453635202.malone@loganberry.canonical.com>
Subject: [Bug 1868617] Re: multiseat: route different spice tablet events to
 distinct vdagents
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: ee626b98b5ae8c60d1f2aa2d088836f232d41485
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
Reply-To: Bug 1868617 <1868617@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1868617

Title:
  multiseat: route different spice tablet events to distinct vdagents

Status in QEMU:
  Expired

Bug description:
  docs/multiseat.txt says:

  > Note on spice: Spice handles multihead just fine.  But it can't do
  > multiseat.  For tablet events the event source is sent to the spice
  > agent.  But qemu can't figure it, so it can't do input routing.
  > Fixing this needs a new or extended input interface between
  > libspice-server and qemu.  For keyboard events it is even worse:  The
  > event source isn't included in the spice protocol, so the wire
  > protocol must be extended to support this.

  I'm not sure exactly what "can't figure it" means, but it looks to me
  like qemu can't route incoming tablet events from a spice client to
  distinct vdagent channels.

  I think this part of the process can be fixed within qemu.  I've
  reported https://gitlab.freedesktop.org/spice/spice-gtk/issues/121 to
  address the issues with the keyboard interface at the protocol level.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1868617/+subscriptions

