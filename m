Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E57766BB5
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 13:40:11 +0200 (CEST)
Received: from localhost ([::1]:48483 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hltuM-0002WQ-P8
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 07:40:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53639)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hlttJ-0006Gh-6K
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 07:39:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hlttH-0005Bb-FX
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 07:39:05 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:59635 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hlttH-00059g-6N
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 07:39:03 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 7F15C1A1FBF;
 Fri, 12 Jul 2019 13:37:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 4B0EA1A1FE2;
 Fri, 12 Jul 2019 13:37:56 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Fri, 12 Jul 2019 13:37:50 +0200
Message-Id: <1562931470-3700-6-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562931470-3700-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1562931470-3700-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.1 4/4] target/mips: Add missing 'break'
 for certain cases of MTTR handling
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
Cc: arikalo@wavecomp.com, sw@weilnetz.de, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

This was found by GCC 8.3 static analysis.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index b1cf5f0..ca62800 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -10055,6 +10055,7 @@ static void gen_mttr(CPUMIPSState *env, DisasContext *ctx, int rd, int rt,
                 gen_mtc0(ctx, t0, rd, sel);
                 break;
             }
+            break;
         case 12:
             switch (sel) {
             case 0:
@@ -10064,6 +10065,7 @@ static void gen_mttr(CPUMIPSState *env, DisasContext *ctx, int rd, int rt,
                 gen_mtc0(ctx, t0, rd, sel);
                 break;
             }
+            break;
         case 13:
             switch (sel) {
             case 0:
-- 
2.7.4


