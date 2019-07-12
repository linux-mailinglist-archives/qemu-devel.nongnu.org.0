Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEE966BE7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 13:57:36 +0200 (CEST)
Received: from localhost ([::1]:48578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hluBD-0002Bx-5n
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 07:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58744)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hluAj-0000zN-Sk
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 07:57:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hluAi-000675-UD
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 07:57:05 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:41229 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hluAi-00065B-MP
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 07:57:04 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 1A00B1A2051;
 Fri, 12 Jul 2019 13:57:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id F40191A2052;
 Fri, 12 Jul 2019 13:57:00 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Fri, 12 Jul 2019 13:56:51 +0200
Message-Id: <1562932613-11660-3-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562932613-11660-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1562932613-11660-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.1 v2 2/4] target/mips: Add missing
 'break' for a case of MTHC0 handling
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
 target/mips/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 2be5e2d..59d4acd 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -6745,6 +6745,7 @@ static void gen_mthc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         default:
             goto cp0_unimplemented;
         }
+        break;
     case CP0_REGISTER_17:
         switch (sel) {
         case 0:
-- 
2.7.4


