Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B761884BD
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 14:07:16 +0100 (CET)
Received: from localhost ([::1]:60942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEBwB-0007Ci-RC
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 09:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39429)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1jEBuk-0005Yr-Vt
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 09:05:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1jEBui-0007Hb-Pr
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 09:05:46 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:60520 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1jEBui-00067f-H5
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 09:05:44 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 21E911A21B2;
 Tue, 17 Mar 2020 14:04:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 000941A2185;
 Tue, 17 Mar 2020 14:04:39 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] MAINTAINERS: Adjust maintainer's status for some MIPS items
Date: Tue, 17 Mar 2020 14:04:27 +0100
Message-Id: <1584450269-26897-2-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584450269-26897-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1584450269-26897-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
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
Cc: peter.maydell@linaro.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Aurelien has been and will forever remain an idol in QEMU for
MIPS world. However, since he decided to move on to other projects,
acknowledge the reality, and formally releive him from maintainer's
duties for QEMU for MIPS items. Aurelien is though welcome to come
back at any time. Some empty spots caused by this are filled in by
Aleksandar.

CC: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Acked-by: Aurelien Jarno <aurelien@aurel32.net>
Message-Id: <1584061252-16635-2-git-send-email-aleksandar.markovic@rt-rk.com>
---
 MAINTAINERS | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 32867bc..4fba8b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -209,8 +209,8 @@ F: hw/microblaze/
 F: disas/microblaze.c
 
 MIPS TCG CPUs
-M: Aurelien Jarno <aurelien@aurel32.net>
 M: Aleksandar Markovic <amarkovic@wavecomp.com>
+R: Aurelien Jarno <aurelien@aurel32.net>
 R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
 S: Maintained
 F: target/mips/
@@ -1036,7 +1036,8 @@ F: hw/mips/mips_mipssim.c
 F: hw/net/mipsnet.c
 
 R4000
-M: Aurelien Jarno <aurelien@aurel32.net>
+M: Aleksandar Markovic <amarkovic@wavecomp.com>
+R: Aurelien Jarno <aurelien@aurel32.net>
 R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
 S: Obsolete
 F: hw/mips/mips_r4k.c
@@ -2507,7 +2508,8 @@ F: tcg/i386/
 F: disas/i386.c
 
 MIPS TCG target
-M: Aurelien Jarno <aurelien@aurel32.net>
+M: Aleksandar Markovic <amarkovic@wavecomp.com>
+R: Aurelien Jarno <aurelien@aurel32.net>
 R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
 S: Maintained
 F: tcg/mips/
-- 
2.7.4


