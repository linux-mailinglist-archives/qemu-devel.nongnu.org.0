Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8318670298
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 16:44:57 +0200 (CEST)
Received: from localhost ([::1]:34224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpZYe-00023G-5A
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 10:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40230)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hpZY8-0000mx-BY
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 10:44:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hpZY7-0000gw-Eb
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 10:44:24 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:35076 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hpZY7-0007wY-7A
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 10:44:23 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 140CC1A1FC4;
 Mon, 22 Jul 2019 16:43:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id EE7931A20A5;
 Mon, 22 Jul 2019 16:43:12 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jul 2019 16:43:03 +0200
Message-Id: <1563806584-25975-2-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563806584-25975-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1563806584-25975-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.1 v5 1/2] target/mips: Add 'fall through'
 comments for handling nanoMips' SHXS, SWXS
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
Reviewed-by: Aleksandar Rikalo <arikalo@wavecomp.com>
---
 target/mips/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 3575eff..ca62800 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -20141,12 +20141,14 @@ static void gen_p_lsx(DisasContext *ctx, int rd, int rs, int rt)
         switch (extract32(ctx->opcode, 7, 4)) {
         case NM_SHXS:
             check_nms(ctx);
+            /* fall through */
         case NM_LHXS:
         case NM_LHUXS:
             tcg_gen_shli_tl(t0, t0, 1);
             break;
         case NM_SWXS:
             check_nms(ctx);
+            /* fall through */
         case NM_LWXS:
         case NM_LWC1XS:
         case NM_SWC1XS:
-- 
2.7.4


