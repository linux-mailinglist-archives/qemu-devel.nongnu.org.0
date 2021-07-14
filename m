Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBD23C85B0
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 15:57:30 +0200 (CEST)
Received: from localhost ([::1]:48216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3fOD-0006ra-1S
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 09:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3fMr-0005TJ-RL
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 09:56:07 -0400
Received: from indium.canonical.com ([91.189.90.7]:46694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3fMp-0005ov-F2
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 09:56:05 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m3fMj-0007Qg-77
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 13:55:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 350F42E817D
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 13:55:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Jul 2021 13:45:39 -0000
From: Peter Maydell <1906536@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: arm linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee alecop janitor philmd pmaydell th-huth
X-Launchpad-Bug-Reporter: Alex Coplan (alecop)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <160692480491.27592.13493676422712150173.malonedeb@chaenomeles.canonical.com>
Message-Id: <162627033910.29844.1610699384486289607.malone@gac.canonical.com>
Subject: [Bug 1906536] Re: Unable to set SVE VL to 1024 bits or above since
 7b6a2198
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="48411ad9fd448ca55fc57f9555fc375624a85324"; Instance="production"
X-Launchpad-Hash: b6089bf2d8180cbb33c65fa9683d6c7c0769372a
Received-SPF: pass client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Whoops, this shouldn't have got expired.


** Changed in: qemu
       Status: Expired =3D> New

--=20
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


