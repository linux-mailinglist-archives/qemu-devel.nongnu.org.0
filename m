Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E205C37778A
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 18:20:32 +0200 (CEST)
Received: from localhost ([::1]:55662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfmAS-0003ka-1n
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 12:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfm9S-00033Q-PP
 for qemu-devel@nongnu.org; Sun, 09 May 2021 12:19:30 -0400
Received: from indium.canonical.com ([91.189.90.7]:60182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfm9R-0002fG-5m
 for qemu-devel@nongnu.org; Sun, 09 May 2021 12:19:30 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfm9P-0006eD-Cr
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 16:19:27 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5D0942E8010
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 16:19:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 16:06:35 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1502613@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Tags: battery management power virtual
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kranebrain naftaly-avadiaev npastorale philmd
 snizovtsev wolfgangandreas
X-Launchpad-Bug-Reporter: Wolfgang Andreas (wolfgangandreas)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <20151004131253.1871.94138.malonedeb@wampee.canonical.com>
Message-Id: <162057639607.10044.15771293161083289821.malone@chaenomeles.canonical.com>
Subject: [Bug 1502613] Re: [Feature Request] Battery Status / Virtual Battery
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 4736d8b22afb99151d88fec20a0c1304727e79a7
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
Reply-To: Bug 1502613 <1502613@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'invalid' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/242


** Changed in: qemu
       Status: New =3D> Invalid

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #242
   https://gitlab.com/qemu-project/qemu/-/issues/242

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1502613

Title:
  [Feature Request] Battery Status / Virtual Battery

Status in QEMU:
  Invalid

Bug description:
  When using virtualization on notebooks heavily then virtual machines
  do not realize that they're running on a notebook device causing high
  power consumption because they're not switching into a optimized
  "laptop mode". This leads to the circumstance that they are trying to
  do things like defragmentation / virtus scan / etc. while the host is
  still running on batteries.

  So it would be great if QEMU / KVM would have support for emulating
  "Virtual Batteries" to guests causing them to enable power-saving
  options like disabling specific services / devices / file operations
  automatically by OS.

  Optionally a great feature would be to set virtual battery's status
  manually. For example: Current charge rate / charging / discharging /
  ...

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1502613/+subscriptions

