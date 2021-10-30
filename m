Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD27440A7F
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:17:37 +0200 (CEST)
Received: from localhost ([::1]:53864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgrz6-0000yx-CV
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrpN-0003E4-99
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:07:33 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrpL-0004qS-Ov
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:07:33 -0400
Received: by mail-wr1-x433.google.com with SMTP id o14so21542882wra.12
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xz1TQ6s9Qh5Fab/EMDxpOyuPBUhPeAKpgU6YR6kckS8=;
 b=KzcUfbfcv6Fbp4VB+2bH1yX+hVrRXIFr85cQbFWx6yUZ1c/TWuT8g/L3h5lypwjIOp
 mEtrpGAyypmAvUvITMj0nxaw6onOq+l2MP25nMcLRX/HT6JSjQEOng6xTMRv5eXoRSS7
 t83q1bH3rxf2Wl2tujH82e7EvjHC4Nrbtr7EtCvcKs+++O1xW78sK5CEmBrIGA7I4i/o
 Eni3+uVl2gT2L426YsnWeVmJjJhlOoMj3YdNTFdYbEaoW3sTvTkzOTyA4lGAuqVxFcNM
 Ykowy+hlIzJ+TwGLQoyI/7/QTmfqKS9AxsePF3j0lesSfeR+BOusYrgnyhXUkxQqtuGN
 XA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Xz1TQ6s9Qh5Fab/EMDxpOyuPBUhPeAKpgU6YR6kckS8=;
 b=FCo+bDZ2MPgD0zHtwN4+cWG+E16ebo31SoU6NrFOsbZmgEhcCi/O40xg+P+iT46RUB
 s1vwTGiaysvc8pLL/XTDIfVpnwUCw8xdCCz2uUL7VbqVMDvBztVNGXRvk7PFuqbDA877
 AiXOCVTL4oVqygXaO89pI9yYKRPIW1A0GbjCgtqEal+1pkFlBijMyzx0TGV2i9erZ99B
 TeuUemfLf/vVrzH8eWN7nEujmlauAJoShJkvbh2DX2dMm1W1Rn3DsPZN2YvFH3fGVz5j
 ik+HycmfjBu7fi1v3ILzISPrXMd8bDqWu7YQZO4S6o3LLHSISe33XYbYb4aEovLiw8Rk
 o8DQ==
X-Gm-Message-State: AOAM5314Pczwbitw8kld5274f7PG/mBSfzNYW/bqxECz9QwO4GDjZKYt
 DyJvV6kvkLRy1nXeUAD0j7zIuSN795g=
X-Google-Smtp-Source: ABdhPJxYwcr8HWG5s5h0KnJoWog4qaf9vP2INgmSnx9EyiNh7rh95guNsl5/Xfl3AYvHgxmILGezCw==
X-Received: by 2002:a5d:64a5:: with SMTP id m5mr14344263wrp.281.1635613650261; 
 Sat, 30 Oct 2021 10:07:30 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 v4sm8623593wrs.86.2021.10.30.10.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:07:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/30] hw/intc/sh_intc: Use existing macro instead of local one
Date: Sat, 30 Oct 2021 19:06:00 +0200
Message-Id: <20211030170615.2636436-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211030170615.2636436-1-f4bug@amsat.org>
References: <20211030170615.2636436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

The INTC_A7 local macro does the same as the A7ADDR from
include/sh/sh.h so use the latter and drop the local macro definition.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <53f033477c73b7c9b021d36033c590416d6199c7.1635541329.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/sh_intc.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index 673606b24b3..a98953d665f 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -16,8 +16,6 @@
 #include "hw/sh4/sh.h"
 #include "trace.h"
 
-#define INTC_A7(x) ((x) & 0x1fffffff)
-
 void sh_intc_toggle_source(struct intc_source *source,
                            int enable_adj, int assert_adj)
 {
@@ -112,12 +110,12 @@ int sh_intc_get_pending_vector(struct intc_desc *desc, int imask)
 static unsigned int sh_intc_mode(unsigned long address,
                                  unsigned long set_reg, unsigned long clr_reg)
 {
-    if ((address != INTC_A7(set_reg)) &&
-        (address != INTC_A7(clr_reg)))
+    if ((address != A7ADDR(set_reg)) &&
+        (address != A7ADDR(clr_reg)))
         return INTC_MODE_NONE;
 
     if (set_reg && clr_reg) {
-        if (address == INTC_A7(set_reg)) {
+        if (address == A7ADDR(set_reg)) {
             return INTC_MODE_DUAL_SET;
         } else {
             return INTC_MODE_DUAL_CLR;
@@ -297,11 +295,11 @@ static unsigned int sh_intc_register(MemoryRegion *sysmem,
 
 #define SH_INTC_IOMEM_FORMAT "interrupt-controller-%s-%s-%s"
     snprintf(name, sizeof(name), SH_INTC_IOMEM_FORMAT, type, action, "p4");
-    memory_region_init_alias(iomem_p4, NULL, name, iomem, INTC_A7(address), 4);
+    memory_region_init_alias(iomem_p4, NULL, name, iomem, A7ADDR(address), 4);
     memory_region_add_subregion(sysmem, P4ADDR(address), iomem_p4);
 
     snprintf(name, sizeof(name), SH_INTC_IOMEM_FORMAT, type, action, "a7");
-    memory_region_init_alias(iomem_a7, NULL, name, iomem, INTC_A7(address), 4);
+    memory_region_init_alias(iomem_a7, NULL, name, iomem, A7ADDR(address), 4);
     memory_region_add_subregion(sysmem, A7ADDR(address), iomem_a7);
 #undef SH_INTC_IOMEM_FORMAT
 
-- 
2.31.1


