Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB046117B5
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:41:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSPP-00050g-0X; Fri, 28 Oct 2022 12:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSPB-0003kB-89; Fri, 28 Oct 2022 12:40:29 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSP7-0007lr-QZ; Fri, 28 Oct 2022 12:40:24 -0400
Received: by mail-oi1-x22d.google.com with SMTP id r187so6681336oia.8;
 Fri, 28 Oct 2022 09:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lMbH8BdSoM5L6/MCFulS4esl/l8+JuB7NAjtoPNa4iU=;
 b=PHnrGxvOsTLzNYY8y3VVeL50gqeiEWftp+YRYnuj9PJRtyXYska/T95yXRgqq6bEmH
 iJg1vqYiwPahcqjSjJg8kLkLmvRjalZdFq+YT5Ox93gZJNk9nY2/7GlPKesM1v2w1B4G
 5NNKnpOnC2GPmyin7GwZnNAuI04d079GVPCz8WKSsq728Om3DcjBKNpMMvKoZ26aFEJ/
 dAgcCLA4Ns3egWyw0nQjImFGbao0tTOQFYnc3DS/DKdT7oC/10KTes6K/fk5r01ArlBQ
 H64uDl5bCgUcE7JmiDLdODQ0SzrkKJxbTnfS5aocrmqBwU22NV5JbW48sKGwM/3DfSbg
 v/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lMbH8BdSoM5L6/MCFulS4esl/l8+JuB7NAjtoPNa4iU=;
 b=q3LdiDVUoiIxMMdJmJYBvWRZE4m6TydGTX90bjOHT8lI0SjAwsr+0DcEiPcuD8ngLQ
 6AhIPg9mohHTRVu7bQB8zIDASA4WYumnKB9mMXeD4551ps3SpbU+hRf7tp1kX5lWFAAX
 uPYCwAvfSz4uOLJmVlb/+fP4xU37Sq8BBKRgYzcfrenkJAW0mS2suTL0T6KnLglK1wVW
 qn6A56I/7/N94T1dwY1D1LMrfRG8bPvXdP8RWQNVkH2YRr6h5mk4qiYq3U1auAXksnTU
 IfNSk28xO+frmkMAHfcWI8rRMdVJnd5vDop8ugm1hrFcT4Tj/n/3ZpU/cb481vE5nDTU
 vtYg==
X-Gm-Message-State: ACrzQf0pA6SpO7+IvQscqubl2O3a6cA8Q4X7F802t1T5B1K9nlzqdsJQ
 LotcGg+N0tj1L/xxpcbb6NnZsVoY5eOkNg==
X-Google-Smtp-Source: AMsMyM5wLxAuCfH/baWQFyUFrzuMK9ZTh/4sLhKrKPjUTKyDL+oNnD3plhFkgwm0eQa6u4tykyJrZw==
X-Received: by 2002:a05:6808:140a:b0:355:230f:b7f1 with SMTP id
 w10-20020a056808140a00b00355230fb7f1mr8637183oiv.8.1666975218907; 
 Fri, 28 Oct 2022 09:40:18 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:40:17 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 04/62] target/ppc: move msgclr/msgsnd to decodetree
Date: Fri, 28 Oct 2022 13:38:53 -0300
Message-Id: <20221028163951.810456-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20221006200654.725390-5-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/insn32.decode                      |  5 ++
 target/ppc/translate.c                        | 34 +--------
 .../ppc/translate/processor-ctrl-impl.c.inc   | 70 +++++++++++++++++++
 3 files changed, 77 insertions(+), 32 deletions(-)
 create mode 100644 target/ppc/translate/processor-ctrl-impl.c.inc

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index a5249ee32c..bba49ded1b 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -908,3 +908,8 @@ SLBSYNC         011111 ----- ----- ----- 0101010010 -
 
 TLBIE           011111 ..... - .. . . ..... 0100110010 -            @X_tlbie
 TLBIEL          011111 ..... - .. . . ..... 0100010010 -            @X_tlbie
+
+# Processor Control Instructions
+
+MSGCLR          011111 ----- ----- ..... 0011101110 -   @X_rb
+MSGSND          011111 ----- ----- ..... 0011001110 -   @X_rb
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index f73ff2d2ee..231bc9551e 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6241,34 +6241,6 @@ static void gen_icbt_440(DisasContext *ctx)
 
 /* Embedded.Processor Control */
 
-static void gen_msgclr(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV(ctx);
-#else
-    CHK_HV(ctx);
-    if (is_book3s_arch2x(ctx)) {
-        gen_helper_book3s_msgclr(cpu_env, cpu_gpr[rB(ctx->opcode)]);
-    } else {
-        gen_helper_msgclr(cpu_env, cpu_gpr[rB(ctx->opcode)]);
-    }
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
-static void gen_msgsnd(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV(ctx);
-#else
-    CHK_HV(ctx);
-    if (is_book3s_arch2x(ctx)) {
-        gen_helper_book3s_msgsnd(cpu_gpr[rB(ctx->opcode)]);
-    } else {
-        gen_helper_msgsnd(cpu_gpr[rB(ctx->opcode)]);
-    }
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
 #if defined(TARGET_PPC64)
 static void gen_msgclrp(DisasContext *ctx)
 {
@@ -6628,6 +6600,8 @@ static bool resolve_PLS_D(DisasContext *ctx, arg_D *d, arg_PLS_D *a)
 
 #include "translate/branch-impl.c.inc"
 
+#include "translate/processor-ctrl-impl.c.inc"
+
 #include "translate/storage-ctrl-impl.c.inc"
 
 /* Handles lfdp */
@@ -6901,10 +6875,6 @@ GEN_HANDLER2_E(tlbivax_booke206, "tlbivax", 0x1F, 0x12, 0x18, 0x00000001,
                PPC_NONE, PPC2_BOOKE206),
 GEN_HANDLER2_E(tlbilx_booke206, "tlbilx", 0x1F, 0x12, 0x00, 0x03800001,
                PPC_NONE, PPC2_BOOKE206),
-GEN_HANDLER2_E(msgsnd, "msgsnd", 0x1F, 0x0E, 0x06, 0x03ff0001,
-               PPC_NONE, (PPC2_PRCNTL | PPC2_ISA207S)),
-GEN_HANDLER2_E(msgclr, "msgclr", 0x1F, 0x0E, 0x07, 0x03ff0001,
-               PPC_NONE, (PPC2_PRCNTL | PPC2_ISA207S)),
 GEN_HANDLER2_E(msgsync, "msgsync", 0x1F, 0x16, 0x1B, 0x00000000,
                PPC_NONE, PPC2_ISA300),
 GEN_HANDLER(wrtee, 0x1F, 0x03, 0x04, 0x000FFC01, PPC_WRTEE),
diff --git a/target/ppc/translate/processor-ctrl-impl.c.inc b/target/ppc/translate/processor-ctrl-impl.c.inc
new file mode 100644
index 0000000000..208f2c2391
--- /dev/null
+++ b/target/ppc/translate/processor-ctrl-impl.c.inc
@@ -0,0 +1,70 @@
+/*
+ * Power ISA decode for Storage Control instructions
+ *
+ * Copyright (c) 2022 Instituto de Pesquisas Eldorado (eldorado.org.br)
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+/*
+ * Processor Control Instructions
+ */
+
+static bool trans_MSGCLR(DisasContext *ctx, arg_X_rb *a)
+{
+    if (!(ctx->insns_flags2 & PPC2_ISA207S)) {
+        /*
+         * Before Power ISA 2.07, processor control instructions were only
+         * implemented in the "Embedded.Processor Control" category.
+         */
+        REQUIRE_INSNS_FLAGS2(ctx, PRCNTL);
+    }
+
+    REQUIRE_HV(ctx);
+
+#if !defined(CONFIG_USER_ONLY)
+    if (is_book3s_arch2x(ctx)) {
+        gen_helper_book3s_msgclr(cpu_env, cpu_gpr[a->rb]);
+    } else {
+        gen_helper_msgclr(cpu_env, cpu_gpr[a->rb]);
+    }
+#else
+    qemu_build_not_reached();
+#endif
+    return true;
+}
+
+static bool trans_MSGSND(DisasContext *ctx, arg_X_rb *a)
+{
+    if (!(ctx->insns_flags2 & PPC2_ISA207S)) {
+        /*
+         * Before Power ISA 2.07, processor control instructions were only
+         * implemented in the "Embedded.Processor Control" category.
+         */
+        REQUIRE_INSNS_FLAGS2(ctx, PRCNTL);
+    }
+
+    REQUIRE_HV(ctx);
+
+#if !defined(CONFIG_USER_ONLY)
+    if (is_book3s_arch2x(ctx)) {
+        gen_helper_book3s_msgsnd(cpu_gpr[a->rb]);
+    } else {
+        gen_helper_msgsnd(cpu_gpr[a->rb]);
+    }
+#else
+    qemu_build_not_reached();
+#endif
+    return true;
+}
-- 
2.37.3


