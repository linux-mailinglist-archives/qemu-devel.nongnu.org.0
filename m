Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E30DD3AE275
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 06:35:49 +0200 (CEST)
Received: from localhost ([::1]:35528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvBf2-0006Sy-Uy
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 00:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvBZH-0007xw-6S
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:29:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:37898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvBZF-0001ZO-Cz
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:29:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvBZD-0003YP-Bq
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 04:29:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4F6292E80F3
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 04:29:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Jun 2021 04:17:41 -0000
From: Launchpad Bug Tracker <1502884@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Tags: extension keyboard kvm norepeat repeat server vnc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange empee584 janitor mikael-trash th-huth
X-Launchpad-Bug-Reporter: Mikael (mikael-trash)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20151005123157.4012.27683.malonedeb@soybean.canonical.com>
Message-Id: <162424906160.11837.11213507778480328834.malone@loganberry.canonical.com>
Subject: [Bug 1502884] Re: Super important feature req: QEMU VNC server:
 Introduce a keyboard "norepeat" option!
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: 3984ba3849c690c9d6ba2d63610e32b5d641f19b
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
Reply-To: Bug 1502884 <1502884@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1502884

Title:
  Super important feature req: QEMU VNC server: Introduce a keyboard
  "norepeat" option!

Status in QEMU:
  Expired

Bug description:
  Hi,

  A big issue when using QEMU's VNC server (VNC KVM) is that, when
  there's a network lag, unintended keypresses go through to the QEMU
  guest VM.

  This is frequently "enter" keypresses, causing all kinds of unintended
  consequences in the VM. So basically it's extremely dangerous.

  This is because the VNC protocol's keyboard interaction is implemented
  in terms of key down - key up events, making the server's keyboard
  autorepeat kick in when it should not.

  =

  For this reason, it would be great if QEMU's VNC server part would be enh=
anced with an option such that when a VNC protocol key down is received, th=
en locally that is treated as one single keypress only (I don't know how th=
at should be implemented but I guess either as an immediate key down - key =
up sequence locally, or key down + key up after say 0.05 seconds), instead =
of waiting for the key up event from the VNC client.

  Thanks!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1502884/+subscriptions

