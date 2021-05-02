Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB3C370E93
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 20:43:04 +0200 (CEST)
Received: from localhost ([::1]:33264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldH3X-0000Zm-GH
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 14:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldGrt-0004ZX-Gr
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:31:05 -0400
Received: from indium.canonical.com ([91.189.90.7]:46336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldGri-0002qk-1v
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:31:01 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldGrg-0001El-S6
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 18:30:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D3C262E815B
 for <qemu-devel@nongnu.org>; Sun,  2 May 2021 18:30:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 May 2021 18:21:10 -0000
From: Thomas Huth <1858623@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth theartlav
X-Launchpad-Bug-Reporter: Artyom (theartlav)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157839132261.5317.2350112240462311551.malonedeb@gac.canonical.com>
Message-Id: <161997967119.12465.3718854885867426269.malone@soybean.canonical.com>
Subject: [Bug 1858623] Re: VNC outputs garbage in zlib mode
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: c02405d867ddcbdfbc807861fd9ee786069907fe
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
Reply-To: Bug 1858623 <1858623@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1858623

Title:
  VNC outputs garbage in zlib mode

Status in QEMU:
  Incomplete

Bug description:
  TL;DR: When QEMU is launched with VNC as the output and viewed with a
  client that defaults to zlib VNC encoding, the resulting output tends
  to accumulate artifacts.

  Reproduction:
  Launch QEMU (tried with versions 4.2.0 and 4.1.0 on Linux  64bit) with -v=
nc 0.0.0.0:0
  Connect to it with a VNC client that allows you to select encoding, i.e. =
UltraVNC.
  Set encoding to zlib (type 6), 32bit color.
  As screen content changes it starts accumulating artifacts. Almost certai=
n to appear if you open-close windows over a pattern.
  Does not seem to depend on guest used, but easier to reproduce with a GUI.

  Looks like this: https://orbides.org/img/vnc.png

  It appears to be a deflate glitch of some sort - all of the bad pixels
  are generated by length/distance codes. Can't narrow it down any more.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1858623/+subscriptions

