Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD3B18F3D8
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 12:42:49 +0100 (CET)
Received: from localhost ([::1]:60666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGLTk-0000UD-B4
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 07:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44313)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jGLSM-0007o2-Qd
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 07:41:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jGLSL-0001gV-Je
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 07:41:22 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:57101)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1jGLSL-0001fM-9I
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 07:41:21 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MAOVx-1j69Fl0Put-00BsH9; Mon, 23 Mar 2020 12:41:18 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user,
 configure: improve syscall_nr.h dependencies checking
Date: Mon, 23 Mar 2020 12:41:16 +0100
Message-Id: <20200323114116.163609-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5qcARi9rXGpxGaXQemJtBne0FBbXF1UTCLyoMZ5RzdtNktSmMV8
 5C956xm3vxqr6PhVHHrsWD2iPmDNtxSKfZ5EPGdpqK/S801gjEaoRMLGe2F/LRGoA+bzKIR
 9YC2FQp3dWFhzm/B1+vpKpTEUbgLQlK7GGceJK9kOPtXJWoalBr6MxL0lDuNtTkmkKPSwZ4
 lgWi2JELlW2ekCs7RpuxQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LuAM++BEoZE=:FIbXhzONaEzzxJ9kYrtwZm
 Izr+9Fql3Tad1yEGUw6565PGM8Iq1mhFXRsP7DcKW3U+ys5zNt+0GXKOGh9PYtBpULUeI6qNE
 3JlRkbaI7iF80WUYauzE3vrk2veoqB/Go/x1phHcjXG++vqPmRiQyFLrREY6CF+bYkrHqhJMO
 oVX4fIhdP983V1nps43jD9PClnOd1c9p1CTE4rJN3gF409EO0/uqiO8+AC+ZtoWGp4JylbRBj
 UifBsbbB61oSPW5IWrqGaJJpn7d69TRuCoeeb2hOBd4JV0h048khMPO/43/xt6Wh4sKju/So+
 y1q1HB8TLYeJGnfB5Lu44/qOtjmbXXrMvOTXrwFn4kX9tf085avTJmy8Xt7nLzwbgbyaKXdHk
 op1/7NWMFoc3dcz1Fnj6SHj/w7pQ8R4S3lUPgZnDjzS7rdhTpR8O0c314C8n4pP/BVLuWC6iq
 v3uWWC7giGNr3BWamiaAcU1BDykdxJt8oGNOynT5JFTZOorN8oPfNFWcV3qwNaUB8RL7ICSJf
 Ho16oYmGeWi/AaL4R9z2PAiNxjuSGGuTABpOwQD9Nl6TNRI49mRUxg5LYDPzGwK0WJxkbbPfc
 xGxoTm2quVKxX4TFQXwhM6T92jRS0ohUyjwRQb9MIgrz66Sg/z7sMVVcmPRcI59dSrHq6v34Y
 tylhCgCMrrrYnWWn6/s47bgw+ofucxPb87FdfzjxGg/wbF2NMU8RZmjLyjQk9IO1J2nQx3T+l
 hlGX0SQQl5Yh7Kt6MHnJcng0acUerMgFfUh1SdzOxuuQdWpsO9ODfFOER9GUaR+AAPQinN5jf
 NflywAHNHNy3O7pTnx50yR58yS4TGETDndqioikDeM3Vv73ntQZEHtpknfIDenYqa9LXN1P
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is mostly a fix for in-tree build.

It removes errors on .d directories:

  grep: ./.gitlab-ci.d: Is a directory
  grep: ./scripts/qemu-guest-agent/fsfreeze-hook.d: Is a directory

and improves performance by only checking <ARCH>-linux-user directories.

Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 4f12cd01777e..da09c3589572 100755
--- a/configure
+++ b/configure
@@ -1910,9 +1910,9 @@ for arch in alpha hppa m68k xtensa sh4 microblaze arm ppc s390x sparc sparc64 \
     # remove the file if it has been generated in the source directory
     rm -f "${source_path}/linux-user/${arch}/syscall_nr.h"
     # remove the dependency files
-    find . -name "*.d" \
-           -exec grep -q "${source_path}/linux-user/${arch}/syscall_nr.h" {} \; \
-           -exec rm {} \;
+    test -d ${arch}-linux-user && find ${arch}-linux-user -type f -name "*.d" \
+         -exec grep -q "${source_path}/linux-user/${arch}/syscall_nr.h" {} \; \
+         -exec rm {} \;
 done
 
 if test -z "$python"
-- 
2.25.1


