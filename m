Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6091A8C2D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 22:21:27 +0200 (CEST)
Received: from localhost ([::1]:38686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOS3i-0001U1-US
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 16:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45844)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jORyb-0003kR-0o
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 16:16:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jORyZ-0001eE-LA
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 16:16:08 -0400
Received: from indium.canonical.com ([91.189.90.7]:59316)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jORyZ-0001do-Fq
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 16:16:07 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jORyY-0007NP-1V
 for <qemu-devel@nongnu.org>; Tue, 14 Apr 2020 20:16:06 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9F99A2E8109
 for <qemu-devel@nongnu.org>; Tue, 14 Apr 2020 20:16:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Apr 2020 20:06:22 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: configure pie windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee cat-7 chewi philmd
X-Launchpad-Bug-Reporter: James Le Cuirot (chewi)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <158642182265.5805.199845175533907355.malonedeb@chaenomeles.canonical.com>
Message-Id: <20200414200631.12799-9-alex.bennee@linaro.org>
Subject: [Bug 1871798] [PATCH v2 08/17] configure: disable PIE for Windows
 builds
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2e26c9bbd21cdca248baaea29aeffb920afcc32a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: cf03406da7a4da75e3485e0fb6e6be999289372a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1871798 <1871798@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It seems on some compilers the test can pass but still give you
broken binaries.

Fixes: d2cd29e30736
Fixes: https://bugs.launchpad.net/qemu/+bug/1871798
Cc: Bug 1871798 <1871798@bugs.launchpad.net>
Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Howard Spoelstra <hsp.cat7@gmail.com>
Tested-by: James Le Cuirot <chewi@aura-online.co.uk>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 25f7d915720..23b5e93752b 100755
--- a/configure
+++ b/configure
@@ -807,6 +807,7 @@ MINGW32*)
     audio_drv_list=3D""
   fi
   supported_os=3D"yes"
+  pie=3D"no"
 ;;
 GNU/kFreeBSD)
   bsd=3D"yes"
-- =

2.20.1

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1871798

Title:
  Fails to start on Windows host without explicit --disable-pie

Status in QEMU:
  Incomplete

Bug description:
  Since commit d2cd29e30736afd4a1e8cac3cf4da360bbc65978, which removed
  the x86 conditional around PIE, QEMU completely fails to start on a
  Windows host unless --disable-pie is explicitly given at build time.
  Even just requesting the help text doesn't work. To make testing
  easier, this can be replicated with Wine.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1871798/+subscriptions

