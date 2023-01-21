Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B739A67696B
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 21:39:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJKcg-0002uo-RO; Sat, 21 Jan 2023 15:37:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pJKce-0002tl-8y; Sat, 21 Jan 2023 15:37:56 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pJKcb-0007nA-LF; Sat, 21 Jan 2023 15:37:55 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 57537746346;
 Sat, 21 Jan 2023 21:35:29 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3B09D745712; Sat, 21 Jan 2023 21:35:29 +0100 (CET)
Message-Id: <8801292992a304609e1eac680fe36b515592b926.1674333199.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1674333199.git.balaton@eik.bme.hu>
References: <cover.1674333199.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 3/3] hw/display/sm501: Code style fix
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Date: Sat, 21 Jan 2023 21:35:29 +0100 (CET)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fix checkpatch warning about multi-line comment.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/display/sm501.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 1e17072452..e1d0591d36 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -1768,7 +1768,8 @@ static const GraphicHwOps sm501_ops = {
 static void sm501_reset(SM501State *s)
 {
     s->system_control = 0x00100000; /* 2D engine FIFO empty */
-    /* Bits 17 (SH), 7 (CDR), 6:5 (Test), 2:0 (Bus) are all supposed
+    /*
+     * Bits 17 (SH), 7 (CDR), 6:5 (Test), 2:0 (Bus) are all supposed
      * to be determined at reset by GPIO lines which set config bits.
      * We hardwire them:
      *  SH = 0 : Hitachi Ready Polarity == Active Low
-- 
2.30.6


