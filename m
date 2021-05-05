Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826C0373E80
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 17:27:49 +0200 (CEST)
Received: from localhost ([::1]:54896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leJRE-0006VH-Jc
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 11:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leJPK-0004dW-3o
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:25:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:44978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leJPE-000297-0q
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:25:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leJPB-0004Ap-O0
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 15:25:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B0B962E800F
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 15:25:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 15:17:14 -0000
From: Thomas Huth <1862979@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: falhumai96 th-huth
X-Launchpad-Bug-Reporter: Faisal Al-Humaimidi (falhumai96)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158152463419.28848.6286969532824555776.malonedeb@chaenomeles.canonical.com>
Message-Id: <162022783495.15365.10867760899465184757.malone@soybean.canonical.com>
Subject: [Bug 1862979] Re: Cannot Create Socket Networking in Windows Host
 using Multicast
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 5258e0744411805115ea2cb1c48a2cdf31b93068
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
Reply-To: Bug 1862979 <1862979@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

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
https://bugs.launchpad.net/bugs/1862979

Title:
  Cannot Create Socket Networking in Windows Host using Multicast

Status in QEMU:
  Incomplete

Bug description:
  Hello QEMU devs,

  I am trying to create a simulated VLAN using socket networking, and
  the only way to connect multiple networks in QEMU using socket
  networking is by using the multicast `mcast` option of the `socket`
  network backend.

  However, when I try use the following arguments in QEMU to create a
  multicast socket network:

  `-device e1000,id=3Dsock-0 -netdev id=3Dsock-0,mcast=3D230.0.0.1:1234`

  it fails with:

  `can't bind ip address=3D230.0.0.1: unknown error` in my Windows host.

  I would like to know if this is a bug, or if I am missing a
  prerequisite before running the QEMU command.

  By the way, I am using Windows 10, and running a cross-compiled QEMU
  4.2.0.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1862979/+subscriptions

