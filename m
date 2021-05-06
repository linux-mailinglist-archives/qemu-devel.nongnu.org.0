Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7836375025
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 09:27:08 +0200 (CEST)
Received: from localhost ([::1]:35674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leYPb-00019r-Oa
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 03:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leYOU-0008He-Nx
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:25:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:54736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leYOR-0006Mz-6m
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:25:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leYOO-0000Sd-SO
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 07:25:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D2D022E8186
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 07:25:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 07:14:03 -0000
From: Thomas Huth <1868617@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dkg0 th-huth
X-Launchpad-Bug-Reporter: dkg (dkg0)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158499422385.10961.5853987871982902669.malonedeb@soybean.canonical.com>
Message-Id: <162028524337.6735.2076869026948021862.malone@wampee.canonical.com>
Subject: [Bug 1868617] Re: multiseat: route different spice tablet events to
 distinct vdagents
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 581136ce0e2a6c64c74411472e36d9f221b0c904
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

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting older bugs to "Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1868617

Title:
  multiseat: route different spice tablet events to distinct vdagents

Status in QEMU:
  Incomplete

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

