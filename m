Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323793ADCD0
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 06:31:13 +0200 (CEST)
Received: from localhost ([::1]:32798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lup72-00057G-8e
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 00:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lup2K-0000fm-1K
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:26:20 -0400
Received: from indium.canonical.com ([91.189.90.7]:45894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lup2I-0002rc-59
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:26:19 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lup23-0003lb-Qz
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 04:26:04 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 589D02E8188
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 04:25:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Jun 2021 04:17:20 -0000
From: Launchpad Bug Tracker <1809144@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor th-huth thebabush
X-Launchpad-Bug-Reporter: Paolo Montesel (thebabush)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <154524068665.20249.14759163527388138129.malonedeb@wampee.canonical.com>
Message-Id: <162416264113.7948.15262849804962413418.malone@loganberry.canonical.com>
Subject: [Bug 1809144] Re: SVM instructions fail with SVME bit enabled
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: c327f2e4f26d54ac6784946d1ba2dcb2d448d71f
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
Reply-To: Bug 1809144 <1809144@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1809144

Title:
  SVM instructions fail with SVME bit enabled

Status in QEMU:
  Expired

Bug description:
  I was trying to use QEMU/TCG to emulate some stuff that uses SVM.
  I know SVM is only partially implemented but I gave it a try anyway.

  I found that if SVM is enabled in the same basic block in which there's a=
 call to VMSAVE/etc,
  the call fails as illegal op because the flags don't get updated correctl=
y.

  The pseudocode for the asm I'm running is:

  ```
  EFER |=3D SVME; set the appropriate bit with wrmsr
  vmsave
  ```

  This is an example of the relevant translate.c code:

  ```
              if (!(s->flags & HF_SVME_MASK) || !s->pe) {
                  goto illegal_op;
              }
              if (s->cpl !=3D 0) {
                  gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
                  break;
              }
  ```

  s->flags doesn't get updated after the wrmsr instruction and so QEMU
  raises an illegal opcode interrupt.

  A quick fix is to make the tb end after `wrmsr` instructions, but it's an=
 hack afaik.
  I'm not too comfortable with QEMU's code, so I don't know what a proper f=
ix would be.

  Cheers,

  thebabush

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1809144/+subscriptions

