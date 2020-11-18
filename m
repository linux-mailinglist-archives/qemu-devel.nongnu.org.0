Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1E22B83FF
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 19:42:16 +0100 (CET)
Received: from localhost ([::1]:38960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfSPH-00071h-OC
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 13:42:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfRzm-0004he-JM
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 13:15:54 -0500
Received: from indium.canonical.com ([91.189.90.7]:49276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfRzk-0001gz-Bv
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 13:15:54 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kfRzh-0006Mv-DJ
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 18:15:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5B1DA2E8139
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 18:15:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2020 18:03:05 -0000
From: Peter Maydell <1371915@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Tags: qemu ubuntu uninstall
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bonzini deepi kelvin-middleton
 manciot-jeanchristophe pmaydell
X-Launchpad-Bug-Reporter: jean-christophe manciot (manciot-jeanchristophe)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <20140920125958.18087.58091.malonedeb@chaenomeles.canonical.com>
Message-Id: <160572258612.15780.3175952209277788939.malone@chaenomeles.canonical.com>
Subject: [Bug 1371915] Re: Make Uninstall Rule Requested
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 8390eb6c92c341c9371368f2ef01c6b562c127c6
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 10:41:28
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1371915 <1371915@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change is almost sufficient:

diff --git a/Makefile b/Makefile
index 76dbb917f5c..da01e3cd16a 100644
--- a/Makefile
+++ b/Makefile
@@ -156,7 +156,7 @@ NINJAFLAGS =3D $(if $V,-v) $(if $(MAKE.n), -n) $(if $(M=
AKE.k), -k0) \
 ninja-cmd-goals =3D $(or $(MAKECMDGOALS), all)
 ninja-cmd-goals +=3D $(foreach t, $(.tests), $(.test.deps.$t))
 =

-makefile-targets :=3D build.ninja ctags TAGS cscope dist clean uninstall
+makefile-targets :=3D build.ninja ctags TAGS cscope dist clean
 # "ninja -t targets" also lists all prerequisites.  If build system
 # files are marked as PHONY, however, Make will always try to execute
 # "ninja build.ninja".

It makes "make uninstall" uninstall things; however it doesn't uninstall
the various LC_MESSAGES files that meson installs, because those are
installed by a "custom install script" that's part of the meson i18n
module, and meson's uninstall functionality doesn't uninstall things
installed that way. So it's a bit half-baked :-/

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1371915

Title:
  Make Uninstall Rule Requested

Status in QEMU:
  In Progress

Bug description:
  Environment: Ubuntu 14.04 - Qemu 2.1.1
  ------------------
  I've configured qemu with some --prefix, compiled the sources and install=
ed the binaries; now, for some reason, I need to uninstall qemu to configur=
e it with the default prefix, recompile the sources and reinstall the binar=
ies.
  However, there's no rule to uninstall qemu.

  All other packages which I have compiled and installed on my system
  offer the possibility to uninstall it: why not Qemu?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1371915/+subscriptions

