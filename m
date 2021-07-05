Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEB83BB652
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 06:27:32 +0200 (CEST)
Received: from localhost ([::1]:57588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0GCh-0006HX-RU
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 00:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0GBQ-0003cX-Jf
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 00:26:12 -0400
Received: from indium.canonical.com ([91.189.90.7]:48774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0GBN-0002o7-LY
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 00:26:12 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0GBI-0004Rz-26
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 04:26:04 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7C0932E829A
 for <qemu-devel@nongnu.org>; Mon,  5 Jul 2021 04:25:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Jul 2021 04:17:22 -0000
From: Launchpad Bug Tracker <1862979@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: falhumai96 janitor th-huth
X-Launchpad-Bug-Reporter: Faisal Al-Humaimidi (falhumai96)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158152463419.28848.6286969532824555776.malonedeb@chaenomeles.canonical.com>
Message-Id: <162545864266.12677.5848941013224469979.malone@loganberry.canonical.com>
Subject: [Bug 1862979] Re: Cannot Create Socket Networking in Windows Host
 using Multicast
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c7d3f30bfe7d7b488c7f9d3c8d7880184b1d065e"; Instance="production"
X-Launchpad-Hash: 7d0e6a294ffc40a20bec90c803c2f4cee69fd990
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1862979 <1862979@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1862979

Title:
  Cannot Create Socket Networking in Windows Host using Multicast

Status in QEMU:
  Expired

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

