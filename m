Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B009537776F
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:52:03 +0200 (CEST)
Received: from localhost ([::1]:59774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lflis-0008WJ-PF
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lflhX-0006TS-DJ
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:50:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:58244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lflhV-000160-S1
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:50:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lflhU-0003nX-Ch
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 15:50:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5F1C72E8139
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 15:50:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 15:45:07 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1879646@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: i386
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <158996169456.22050.5633849401809444729.malonedeb@wampee.canonical.com>
Message-Id: <162057510740.7144.17393221593080458391.malone@gac.canonical.com>
Subject: [Bug 1879646] Re: [Feature request] x86: dump MSR features in human
 form
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: ebb13921522c84e9c1de1055d7adbe9f95e9a89c
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
Reply-To: Bug 1879646 <1879646@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'invalid' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/237


** Changed in: qemu
       Status: New =3D> Invalid

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #237
   https://gitlab.com/qemu-project/qemu/-/issues/237

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1879646

Title:
  [Feature request] x86: dump MSR features in human form

Status in QEMU:
  Invalid

Bug description:
  QEMU might fail because host/guest cpu features are not properly
  configured:

  qemu-system-x86_64: error: failed to set MSR 0x48f to 0x7fefff00036dfb
  qemu-system-x86_64: /root/qemu-master/target/i386/kvm.c:2695:
  kvm_buf_set_msrs: Assertion `ret =3D=3D cpu->kvm_msr_buf->nmsrs' failed.

  To ease debugging, it the MSR features bit could be dumped.

  Example in this thread:

  https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg05593.html

    The high 32 bits are 0111 1111 1110 1111 1111 1111.

    The low 32 bits are  0000 0011 0110 1101 1111 1011.

    The features that are set are the xor, so 0111 1100 1000 0010 0000
  0100:

    - bit 2, vmx-exit-nosave-debugctl
    - bit 9, host address space size, is handled automatically by QEMU
    - bit 15, vmx-exit-ack-intr
    - bit 17, vmx-exit-save-pat
    - bit 18, vmx-exit-load-pat
    - bit 19, vmx-exit-save-efer
    - bit 20, vmx-exit-load-efer
    - bit 21, vmx-exit-save-preemption-timer

  This output ^^^ is easier to digest.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1879646/+subscriptions

