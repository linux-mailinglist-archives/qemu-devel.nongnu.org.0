Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B533E383D6F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:31:01 +0200 (CEST)
Received: from localhost ([::1]:47048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liixA-0003uw-AX
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1liidz-0007wz-21
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:11:11 -0400
Received: from indium.canonical.com ([91.189.90.7]:54078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1liidu-0003Sf-JF
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:11:10 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1liido-0007Sr-Tp
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 19:11:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 27A232E8261
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 19:10:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 May 2021 19:02:52 -0000
From: Thomas Huth <1886225@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159380302138.1124.12942774814113194933.malonedeb@chaenomeles.canonical.com>
Message-Id: <162127817296.7612.7643622213606708727.malone@gac.canonical.com>
Subject: [Bug 1886225] Re: [Feature request] Oracle Solaris 11.4 VM image
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 94fb768bb9e55a5b64302e212ad4c9bb0227967c
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
Reply-To: Bug 1886225 <1886225@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm closing this since it's very unlikely that we get a Solaris VM
image, since they are not available for free, as far as I know. Maybe
somebody could contribute an illumos-based image one day, but that's
nothing that we have to track in the bug tracker, I think.

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1886225

Title:
  [Feature request] Oracle Solaris 11.4 VM image

Status in QEMU:
  Invalid

Bug description:
  We already have handy VMs to build QEMU within:

  $ git grep -l basevm.BaseVM
  tests/vm/centos
  tests/vm/fedora
  tests/vm/freebsd
  tests/vm/netbsd
  tests/vm/openbsd
  tests/vm/ubuntu.i386

  Some people have interest in building QEMU on Solaris:
  https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg01429.html

  To help them it would be useful to have a Solaris VM.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1886225/+subscriptions

