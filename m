Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848043C863E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 16:37:09 +0200 (CEST)
Received: from localhost ([::1]:44404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3g0a-000304-95
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 10:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3fzE-0001PM-4V
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:35:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:53798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3fzB-0006sN-J7
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:35:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m3fz8-0005hz-J1
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 14:35:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7F1722E806E
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 14:35:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Jul 2021 14:28:09 -0000
From: Thomas Huth <1906536@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee alecop janitor philmd pmaydell th-huth
X-Launchpad-Bug-Reporter: Alex Coplan (alecop)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160692480491.27592.13493676422712150173.malonedeb@chaenomeles.canonical.com>
Message-Id: <162627288936.13861.15682187000005891395.malone@wampee.canonical.com>
Subject: [Bug 1906536] Re: Unable to set SVE VL to 1024 bits or above since
 7b6a2198
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="48411ad9fd448ca55fc57f9555fc375624a85324"; Instance="production"
X-Launchpad-Hash: d9dcbcd9ccfd6f1d9b18f25a8bb343b4013e3118
Received-SPF: pass client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1906536 <1906536@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/482


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #482
   https://gitlab.com/qemu-project/qemu/-/issues/482

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906536

Title:
  Unable to set SVE VL to 1024 bits or above since 7b6a2198

Status in QEMU:
  Expired

Bug description:
  Prior to 7b6a2198e71794c851f39ac7a92d39692c786820, the QEMU option
  sve-max-vq could be used to set the vector length of the
  implementation. This is useful (among other reasons) for testing
  software compiled with a fixed SVE vector length. Since this commit,
  the vector length is capped at 512 bits.

  To reproduce the issue:

  $ cat rdvl.s
  .global _start
  _start:
    rdvl x0, #1
    asr x0, x0, #4
    mov x8, #93 // exit
    svc #0
  $ aarch64-linux-gnu-as -march=3Darmv8.2-a+sve rdvl.s -o rdvl.o
  $ aarch64-linux-gnu-ld rdvl.o
  $ for vl in 1 2 4 8 16; do ../build-qemu/aarch64-linux-user/qemu-aarch64 =
-cpu max,sve-max-vq=3D$vl a.out; echo $?; done
  1
  2
  4
  4
  4

  For a QEMU built prior to the above revision, we get the output:
  1
  2
  4
  8
  16

  as expected. It seems that either the old behavior should be restored,
  or there should be an option to force a higher vector length?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1906536/+subscriptions


