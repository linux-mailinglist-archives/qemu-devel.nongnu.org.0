Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC19E5A422A
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 07:22:29 +0200 (CEST)
Received: from localhost ([::1]:60164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSXEB-0004mj-S0
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 01:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSX9j-0003It-Rw
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 01:17:51 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:39785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSX9h-0002OT-QX
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 01:17:51 -0400
Received: by mail-pl1-x62b.google.com with SMTP id d12so6897029plr.6
 for <qemu-devel@nongnu.org>; Sun, 28 Aug 2022 22:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=4kOy2oqciXP8M6ZCGRBBHU9ZeT9d/lVmiyFCtuhiNAA=;
 b=axRd0AvWKv9yh8JrtHNfTH0O8c/edo8UAAt2849zlJNUGd9oFiLL9Y6k19+Nqx9lSK
 AignLftfqpDXy68i29Nqh9YuyZzgW+BTvSsOas7r1LfMLsBELG9nAioK/g/yJue2HAAX
 JeI7w5Vu16oNJUp+sRxUmQoPnZN2tLLmAVBr5K/i/uegKMOyktLEv1tdz+9SGIyF55bB
 80hTpc78KW/rSeNhHlKjDE/yEcmaIY3ai39evYvk8kqP+8rvUhmF0thw9ID5QGdnblwh
 28eG/3NXaw5L0+9QiOz55iFIVAUaEmG31glaHm3LhtDsV5Mp4wxOyV62dQ0euTQC0ojm
 BkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=4kOy2oqciXP8M6ZCGRBBHU9ZeT9d/lVmiyFCtuhiNAA=;
 b=5dWk/evpf58rrRc+wNQ6OgdFVlRYV7gd6moC3ONfPzmueSDHc/BtPMhwTj21ZpEb21
 /vdBgNVqyRZ5OcX2yjarRmj8AjQM8dNcH+7L1lqSlEdxxMFZO5Qa2umHb1JDDuKkHOdi
 pDGh88ZXYvHA4shgowqkXoKSLkF7b3PtT4M7lHjPQJYuyb3hCF4PTznFsJLi8Gk9Wpjc
 z3Hg55aDxQr6GXmrRIYWZTM8N0me5TaOffVKtQEZl6zmGslzCbtyIXXfYq4kRCZH1a9w
 W2ef18wRo+Ukjf5c0G3gNuKR7dNs1b+OcCMKxKNwxoIO1mR3CsJJ2dWnViBZhtB1osCj
 Bwcg==
X-Gm-Message-State: ACgBeo3tQsJO37cO56CewShAZtOw/Gxq9BCJUOIaJnm1OTTr8U4pFrr0
 lngaw9vc3bdF5+VqvC0+iNsJMW8LK+w5OA==
X-Google-Smtp-Source: AA6agR6NSapqTlJCzY7kIAMjyn7ftD3BRPGl+gQaPIIVzVnHteGS9N7GomK0Qe16Y0f0oLHR1SlVOg==
X-Received: by 2002:a17:90b:1d83:b0:1fb:6795:5cc9 with SMTP id
 pf3-20020a17090b1d8300b001fb67955cc9mr16916662pjb.162.1661750268005; 
 Sun, 28 Aug 2022 22:17:48 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:2fa6:2ab5:a96e:2a35])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a1709027c8a00b00172f4835f53sm6307392pll.192.2022.08.28.22.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 22:17:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH] target/m68k: Implement atomic test-and-set
Date: Sun, 28 Aug 2022 22:17:46 -0700
Message-Id: <20220829051746.227094-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is slightly more complicated than cas,
because tas is allowed on data registers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 40 ++++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 8f3c298ad0..0aef827b38 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -2825,19 +2825,39 @@ DISAS_INSN(illegal)
     gen_exception(s, s->base.pc_next, EXCP_ILLEGAL);
 }
 
-/* ??? This should be atomic.  */
 DISAS_INSN(tas)
 {
-    TCGv dest;
-    TCGv src1;
-    TCGv addr;
+    int mode = extract32(insn, 3, 3);
+    int reg0 = REG(insn, 0);
 
-    dest = tcg_temp_new();
-    SRC_EA(env, src1, OS_BYTE, 1, &addr);
-    gen_logic_cc(s, src1, OS_BYTE);
-    tcg_gen_ori_i32(dest, src1, 0x80);
-    DEST_EA(env, insn, OS_BYTE, dest, &addr);
-    tcg_temp_free(dest);
+    if (mode == 0) {
+        /* data register direct */
+        TCGv dest = cpu_dregs[reg0];
+        gen_logic_cc(s, dest, OS_BYTE);
+        tcg_gen_ori_tl(dest, dest, 0x80);
+    } else {
+        TCGv src1, addr;
+
+        addr = gen_lea_mode(env, s, mode, reg0, OS_BYTE);
+        if (IS_NULL_QREG(addr)) {
+            gen_addr_fault(s);
+            return;
+        }
+        src1 = tcg_temp_new();
+        tcg_gen_atomic_fetch_or_tl(src1, addr, tcg_constant_tl(0x80),
+                                   IS_USER(s), MO_SB);
+        gen_logic_cc(s, src1, OS_BYTE);
+        tcg_temp_free(src1);
+
+        switch (mode) {
+        case 3: /* Indirect postincrement.  */
+            tcg_gen_addi_i32(AREG(insn, 0), addr, 1);
+            break;
+        case 4: /* Indirect predecrememnt.  */
+            tcg_gen_mov_i32(AREG(insn, 0), addr);
+            break;
+        }
+    }
 }
 
 DISAS_INSN(mull)
-- 
2.34.1


