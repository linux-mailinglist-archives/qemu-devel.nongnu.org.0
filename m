Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DE42CD463
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:15:06 +0100 (CET)
Received: from localhost ([::1]:52640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmZl-0003uD-Ey
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:15:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kkmMI-0003S8-5k
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:01:10 -0500
Received: from indium.canonical.com ([91.189.90.7]:59932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kkmMD-0004GB-7z
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:01:09 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kkmMA-00063o-I4
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 11:01:02 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 855642E804A
 for <qemu-devel@nongnu.org>; Thu,  3 Dec 2020 11:01:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Dec 2020 10:50:53 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <1906536@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: arm linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee alecop philmd pmaydell
X-Launchpad-Bug-Reporter: Alex Coplan (alecop)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <160692480491.27592.13493676422712150173.malonedeb@chaenomeles.canonical.com>
Message-Id: <160699265358.26194.9115745893658720907.malone@chaenomeles.canonical.com>
Subject: [Bug 1906536] Re: Unable to set SVE VL to 1024 bits or above since
 7b6a2198
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="55c41fea591e042b8bb54e6952942f55c764435e"; Instance="production"
X-Launchpad-Hash: b0dbde78227f2a38d933f7bea8c33788a3aea241
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1906536 <1906536@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Are there any other examples of where linux-user tries to preserve
execution environment details over an execve?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906536

Title:
  Unable to set SVE VL to 1024 bits or above since 7b6a2198

Status in QEMU:
  New

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

