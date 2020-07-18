Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80955224C18
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jul 2020 16:56:54 +0200 (CEST)
Received: from localhost ([::1]:51542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jwoGj-0004CM-K1
	for lists+qemu-devel@lfdr.de; Sat, 18 Jul 2020 10:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jwoFX-0003fe-Pg
 for qemu-devel@nongnu.org; Sat, 18 Jul 2020 10:55:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:37952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jwoFW-0004JA-2F
 for qemu-devel@nongnu.org; Sat, 18 Jul 2020 10:55:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jwoFV-0003gX-1P
 for <qemu-devel@nongnu.org>; Sat, 18 Jul 2020 14:55:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 07CB22E80E7
 for <qemu-devel@nongnu.org>; Sat, 18 Jul 2020 14:55:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2020 14:50:04 -0000
From: Thomas Huth <1629483@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dkerr64 kamath-ben th-huth
X-Launchpad-Bug-Reporter: Benjamin Kamath (kamath-ben)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160930224644.27765.63692.malonedeb@chaenomeles.canonical.com>
Message-Id: <159508380540.12409.12301399522554036524.malone@soybean.canonical.com>
Subject: [Bug 1629483] Re: Build fails on optionrom
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4809fcb62f445aaa3ae919f7f6c3cc7d156ea57a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: fde3e52a91315f84892ff2614063eed586f69248
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/18 10:41:00
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1629483 <1629483@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looking through old bug tickets... can you still reproduce this issue
with the latest version of QEMU? Or could we close this ticket nowadays?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1629483

Title:
  Build fails on optionrom

Status in QEMU:
  Incomplete

Bug description:
  Git pseudo-bisected (focused on optionrom commits) it to this commit.

  commit cdbd727c20ad7aac7797dc8c95e485e1a4c6901b
  Author: Richard Henderson <rth@twiddle.net>
  Date:   Thu Jul 7 21:49:36 2016 -0700

      build: Use $(AS) for optionrom explicitly

  =

  Build output (non-verbose):

    AS    optionrom/linuxboot.o
  cpp: fatal error: '-c' is not a valid option to the preprocessor
  compilation terminated.
  cpp: fatal error: '-c' is not a valid option to the preprocessor
  compilation terminated.
    CC    optionrom/linuxboot_dma.o
    CC    /home/bkamath/dev/workspace/block-2/mothra/output/sp0/targetqga/m=
ain.o
    AS    optionrom/kvmvapic.o
  cpp: fatal error: '-c' is not a valid option to the preprocessor
  compilation terminated.

  Steps to reproduce:
  Using buildroot and overriding qemu version to 2.7.0
  Fedora 24, cpp (GCC) 6.2.1 20160916 (Red Hat 6.2.1-2)

  I tried first just building without the -c option but it hangs
  indefinitely. Reverting the above listed commit fixes the problem on
  my platform. I didn't dive much further into this, because this seems
  like a regression.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1629483/+subscriptions

