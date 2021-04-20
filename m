Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B856E365446
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 10:39:11 +0200 (CEST)
Received: from localhost ([::1]:55734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYluY-0001OR-Qm
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 04:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYlit-0004op-Ve
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:27:08 -0400
Received: from indium.canonical.com ([91.189.90.7]:59108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYlio-0002bu-Hk
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:27:07 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYlim-000281-5t
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:27:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 111F52E818D
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:26:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Apr 2021 07:57:08 -0000
From: Thomas Huth <1809144@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth thebabush
X-Launchpad-Bug-Reporter: Paolo Montesel (thebabush)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154524068665.20249.14759163527388138129.malonedeb@wampee.canonical.com>
Message-Id: <161890542854.17207.8673648549081585294.malone@wampee.canonical.com>
Subject: [Bug 1809144] Re: SVM instructions fail with SVME bit enabled
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="8932ab84469600dc3d8b3344fb7135c702d5179e"; Instance="production"
X-Launchpad-Hash: 91193f038136851d2e470242bd9aeb6078ebb2f4
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

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1809144

Title:
  SVM instructions fail with SVME bit enabled

Status in QEMU:
  Incomplete

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

