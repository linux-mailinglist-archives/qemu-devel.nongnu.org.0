Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2393371369
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 12:09:16 +0200 (CEST)
Received: from localhost ([::1]:43750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldVVq-0001sp-6z
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 06:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldVRh-0006vU-P7
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:04:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:37848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldVRe-0002sm-EE
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:04:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldVRd-0005Zz-3V
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 10:04:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 01B392E805D
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 10:04:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 09:51:08 -0000
From: Thomas Huth <812398@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: mmu ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth till-straumann
X-Launchpad-Bug-Reporter: till (till-straumann)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20110718161723.13916.57921.malonedeb@soybean.canonical.com>
Message-Id: <162003546868.11542.15517537996976124907.malone@soybean.canonical.com>
Subject: [Bug 812398] Re: powerpc 7450 MMU initialization broken
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 697efe237657c2945fc9f6540d01977aadb74904
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
Reply-To: Bug 812398 <812398@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/86


** Changed in: qemu
       Status: Triaged =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #86
   https://gitlab.com/qemu-project/qemu/-/issues/86

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/812398

Title:
  powerpc 7450 MMU initialization broken

Status in QEMU:
  Expired

Bug description:
  The 7540 family of PPCs' MMU can update TLBs using hardware search
  (like a 604 or 7400) but also using a software algorithm. The
  mechanism used is defined by HID0[STEN].

  By default (CPU reset) HID0 is set to 0x80000000 (BTW; another small bug,=
 qemu doesn't set the hardwired MSB), hence
  the software-table lookup feature is *disabled*. However, the default (an=
d immutable) 'mmu_model' for this CPU family is POWERC_MMU_SOFT_74XX which =
choses the soft TLB replacement scheme.

  To fix this:

  1) the initial mmu_model for the 7450 family (includes 7441, 7445, 7451, =
7455, 7457, 7447, 7448) should be: POWERPC_MMU_32B
  2) when HID0[STEN] is written then the mmu_model should be changed accord=
ingly (I'm not familiar enough with the qemu internal state to judge if any=
 cached state would have to be updated).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/812398/+subscriptions

