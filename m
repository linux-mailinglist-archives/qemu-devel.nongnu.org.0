Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 949B32F4333
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 05:35:44 +0100 (CET)
Received: from localhost ([::1]:51304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzXsl-0005IM-Ly
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 23:35:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzXoB-0001RV-IG
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 23:30:59 -0500
Received: from indium.canonical.com ([91.189.90.7]:33828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzXo9-0001YX-27
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 23:30:59 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kzXo7-0006je-GC
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 04:30:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7458C2E8144
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 04:30:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 Jan 2021 04:17:15 -0000
From: Launchpad Bug Tracker <1787002@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: eh-plop janitor th-huth
X-Launchpad-Bug-Reporter: Elmar Hanlhofer (eh-plop)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <153427048296.8641.7939320989015317966.malonedeb@wampee.canonical.com>
Message-Id: <161051143559.21184.14902030497099916816.malone@loganberry.canonical.com>
Subject: [Bug 1787002] Re: disas/i386.c compile error
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: 8b26abf873329910b093c06ee5844a9026a8ccd3
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
Reply-To: Bug 1787002 <1787002@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1787002

Title:
  disas/i386.c compile error

Status in QEMU:
  Expired

Bug description:
  QEMU Version: 2.12.1, 3.0.0-rc4
  Compiling with GCC 8.2.0
  System: Plop Linux, 32 bit =


  Error:
    CC      disas/i386.o
  /tmp/ccK8tHRs.s: Assembler messages:
  /tmp/ccK8tHRs.s:53353: Error: can't resolve `L0=01' {*ABS* section} - `ob=
uf' {.bss section}

  =

  The problematic line is in 'disas/i386.c' in the function 'INVLPG_Fixup (=
int bytemode, int sizeflag)':
  strcpy (obuf + strlen (obuf) - 6, alt);

  If I comment out this line, then compiling works without problems.

  =

  The error comes only on 32 bit. On 64 bit, compiling works without proble=
ms.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1787002/+subscriptions

