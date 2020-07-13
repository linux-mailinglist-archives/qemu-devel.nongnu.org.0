Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB0F21CC8A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 02:35:18 +0200 (CEST)
Received: from localhost ([::1]:39242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jumRB-0004dR-Ck
	for lists+qemu-devel@lfdr.de; Sun, 12 Jul 2020 20:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wang.yi59@zte.com.cn>)
 id 1jumN6-0005rK-Tt
 for qemu-devel@nongnu.org; Sun, 12 Jul 2020 20:31:04 -0400
Received: from mx7.zte.com.cn ([202.103.147.169]:44432 helo=mxct.zte.com.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wang.yi59@zte.com.cn>)
 id 1jumN4-0004fh-Vc
 for qemu-devel@nongnu.org; Sun, 12 Jul 2020 20:31:04 -0400
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
 by Forcepoint Email with ESMTPS id C8890D3ECA2C58578948
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 08:31:00 +0800 (CST)
Received: from notes_smtp.zte.com.cn (notes_smtp.zte.com.cn [10.30.1.239])
 by mse-fl2.zte.com.cn with ESMTP id 06D0Uxau001612
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 08:30:59 +0800 (GMT-8)
 (envelope-from wang.yi59@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2020071308310175-4262431 ;
 Mon, 13 Jul 2020 08:31:01 +0800 
From: Yi Wang <wang.yi59@zte.com.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/sh4: Remove superfluous breaks
Date: Mon, 13 Jul 2020 08:34:12 +0800
Message-Id: <1594600452-23383-1-git-send-email-wang.yi59@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2020-07-13 08:31:01,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2020-07-13 08:31:00, Serialize complete at 2020-07-13 08:31:00
X-MAIL: mse-fl2.zte.com.cn 06D0Uxau001612
Received-SPF: pass client-ip=202.103.147.169;
 envelope-from=wang.yi59@zte.com.cn; helo=mxct.zte.com.cn
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/12 20:30:31
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: wang.yi59@zte.com.cn, Liao Pingfang <liao.pingfang@zte.com.cn>,
 wang.liang82@zte.com.cn, xue.zhihong@zte.com.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liao Pingfang <liao.pingfang@zte.com.cn>

Remove superfluous breaks, as there is a "return" before them.

Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
---
 target/sh4/translate.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 6192d83..60c863d 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -1542,7 +1542,6 @@ static void _decode_opc(DisasContext * ctx)
         tcg_gen_qemu_ld_i32(REG(0), REG(B11_8), ctx->memidx,
                             MO_TEUL | MO_UNALN);
         return;
-        break;
     case 0x40e9:                /* movua.l @Rm+,R0 */
         CHECK_SH4A
         /* Load non-boundary-aligned data */
@@ -1550,7 +1549,6 @@ static void _decode_opc(DisasContext * ctx)
                             MO_TEUL | MO_UNALN);
         tcg_gen_addi_i32(REG(B11_8), REG(B11_8), 4);
         return;
-        break;
     case 0x0029:		/* movt Rn */
         tcg_gen_mov_i32(REG(B11_8), cpu_sr_t);
 	return;
@@ -1638,7 +1636,6 @@ static void _decode_opc(DisasContext * ctx)
         CHECK_SH4A
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
         return;
-        break;
     case 0x4024:		/* rotcl Rn */
 	{
 	    TCGv tmp = tcg_temp_new();
-- 
2.9.5


