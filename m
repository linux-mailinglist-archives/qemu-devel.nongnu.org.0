Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2C4183E37
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 02:04:13 +0100 (CET)
Received: from localhost ([::1]:52378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCYkG-0003l0-Er
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 21:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43662)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1jCYio-0002Ys-M6
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 21:02:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1jCYik-0003z5-Ub
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 21:02:41 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:42125 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1jCYij-0002eT-2x
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 21:02:37 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 0A3FB1A416B;
 Fri, 13 Mar 2020 02:01:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from localhost.localdomain (226.87.148.91.adsl.dyn.beotel.net
 [91.148.87.226])
 by mail.rt-rk.com (Postfix) with ESMTPSA id BD87C1A4130;
 Fri, 13 Mar 2020 02:01:34 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH 1/3] MAINTAINERS: Adjust maintainer's status for some MIPS
 items
Date: Fri, 13 Mar 2020 02:00:50 +0100
Message-Id: <1584061252-16635-2-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584061252-16635-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1584061252-16635-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: Aurelien Jarno <aurelien@aurel32.net>, aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>

Aurelien has been and will forever remain an idol in QEMU for
MIPS world. However, since he decided to move on to other projects,
acknowledge the reality, and formally releive him from maintainer's
duties for QEMU for MIPS items. Aurelien is though welcome to come
back at any time. Some empty spots caused by this are filled in by
Aleksandar.

CC: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
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


