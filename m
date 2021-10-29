Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1B3440103
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 19:12:37 +0200 (CEST)
Received: from localhost ([::1]:34338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgVQh-0000Tk-UM
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 13:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgUvr-0007C3-DM
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:43 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:51113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgUvo-00066g-GY
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:43 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 617827561EB;
 Fri, 29 Oct 2021 18:40:27 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A8BD17561A5; Fri, 29 Oct 2021 18:40:26 +0200 (CEST)
Message-Id: <695476af8e88f12287645f4b1df38bc80fe38603.1635524617.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635524616.git.balaton@eik.bme.hu>
References: <cover.1635524616.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v5 15/25] hw/intc/sh_intc: Remove excessive parenthesis
Date: Fri, 29 Oct 2021 18:23:36 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop unneded parenthesis and split up one complex expression to write
it with less brackets so it's easier to follow.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/sh_intc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index 54803bc2ca..537fc503d4 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -23,7 +23,7 @@ void sh_intc_toggle_source(struct intc_source *source,
     int pending_changed = 0;
     int old_pending;
 
-    if ((source->enable_count == source->enable_max) && (enable_adj == -1)) {
+    if (source->enable_count == source->enable_max && enable_adj == -1) {
         enable_changed = -1;
     }
     source->enable_count += enable_adj;
@@ -68,7 +68,7 @@ void sh_intc_toggle_source(struct intc_source *source,
 static void sh_intc_set_irq(void *opaque, int n, int level)
 {
   struct intc_desc *desc = opaque;
-  struct intc_source *source = &(desc->sources[n]);
+  struct intc_source *source = &desc->sources[n];
 
   if (level && !source->asserted) {
     sh_intc_toggle_source(source, 0, 1);
@@ -164,7 +164,7 @@ static void sh_intc_locate(struct intc_desc *desc,
             *modep = mode | INTC_MODE_IS_PRIO;
             *datap = &pr->value;
             *enums = pr->enum_ids;
-            *first = (pr->reg_width / pr->field_width) - 1;
+            *first = pr->reg_width / pr->field_width - 1;
             *width = pr->field_width;
             return;
         }
@@ -245,7 +245,8 @@ static void sh_intc_write(void *opaque, hwaddr offset,
     }
 
     for (k = 0; k <= first; k++) {
-        mask = ((1 << width) - 1) << ((first - k) * width);
+        mask = (1 << width) - 1;
+        mask <<= (first - k) * width;
 
         if ((*valuep & mask) == (value & mask)) {
             continue;
-- 
2.21.4


