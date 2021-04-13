Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E301335E3AF
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:20:05 +0200 (CEST)
Received: from localhost ([::1]:45812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLll-0004Ko-0R
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaM-00069H-CS
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:18 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:35566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaJ-0006q2-7E
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:18 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 w7-20020a1cdf070000b0290125f388fb34so8515157wmg.0
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 09:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3A0M0Ns1nfhjoarHwhLsGI4fCWU7EVEJ+MBBeDljsws=;
 b=gfWgFaKH9oMicYgLyCVGlBcCmoI56vLV/Q2SEx4DmfbKhyMSGXthJUhZTpSWtH49PI
 RBw6t0PA0Zt339opAxqqCCGmBNLGb7I4i+v1r9wZkkmfkwvijr3EK7PNpOjdsgpWj7Zc
 GA0nx1h0u/yXaQOYIEO/5G3PgxYYgc9sCcsgBj/39swyjHpFWK43AO0Jvw9O8qpkM5f4
 8jbQNg2KIQu9uxaIBVZ5Ll5kfdnS95gklvoBkrX7IQSyN7Dvum6YsyUshhC/d0fMFu5Y
 A/tMG1lqj85VXijPh+u+ewic2h5EtccRlPbZpfoq6lDCAQsHTpX3Dd/u7qZAP4f8ZCGI
 cFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3A0M0Ns1nfhjoarHwhLsGI4fCWU7EVEJ+MBBeDljsws=;
 b=RfztN+URQTIaYkGoID/6ohwcEaJF5X/EEzTW0tOsLDWQmxe+T+ywPdJh/z8/z/rJsz
 7F0sPE3HOfGttCEQ9aThLUOKc9ebNV4OU+isKI5WmKUjO04WtupfWG0a+gI6l6SWw2lr
 Gq3nM4VfbsUXcYST/xrXHoYX+JebHRKtJbGCOwOeCAd6iS4f5U/3uQ4bpvsZ24zBFB3+
 Y2Mktt296od3Cod/rT7qo/RKf1GSH2Io9zhGePZhO4moGzOfhdXFT8pTlYuEflPLZOQA
 elU9STRkH8z5YQDre1bDTD0T6Lw7fxO2/4+X2BOus/FGNGz+gYOljn5o9ABXDmQyRpXG
 +Gmw==
X-Gm-Message-State: AOAM530ekZ05Kou0Jryvkm8OIVBdOLhbyq/FUPFQg15iNitxXgyAn5uk
 /0h9BdSC/BfZQS2JiOsMkiO6R8UD0CQ4YpL7
X-Google-Smtp-Source: ABdhPJxk4k4Dt5jPesxgfl1+/OGosOKGRFWPnuVYHZfi0zc26pf2RzTkpK3xOa/34pXeVFj+IzO8ew==
X-Received: by 2002:a05:600c:358c:: with SMTP id
 p12mr705076wmq.19.1618330091497; 
 Tue, 13 Apr 2021 09:08:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b1sm20810888wru.90.2021.04.13.09.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/13] target/arm: Share unallocated_encoding() and
 gen_exception_insn()
Date: Tue, 13 Apr 2021 17:07:48 +0100
Message-Id: <20210413160759.5917-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210413160759.5917-1-peter.maydell@linaro.org>
References: <20210413160759.5917-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The unallocated_encoding() function is the same in both
translate-a64.c and translate.c; make the translate.c function global
and drop the translate-a64.c version.  To do this we need to also
share gen_exception_insn(), which currently exists in two slightly
different versions for A32 and A64: merge those into a single
function that can work for both.

This will be useful for splitting up translate.c, which will require
unallocated_encoding() to no longer be file-local.  It's also
hopefully less confusing to have only one version of the function
rather than two.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.h |  2 --
 target/arm/translate.h     |  3 +++
 target/arm/translate-a64.c | 15 ---------------
 target/arm/translate.c     | 14 +++++++++-----
 4 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 3668b671ddb..ee15f084982 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -18,8 +18,6 @@
 #ifndef TARGET_ARM_TRANSLATE_A64_H
 #define TARGET_ARM_TRANSLATE_A64_H
 
-void unallocated_encoding(DisasContext *s);
-
 #define unsupported_encoding(s, insn)                                    \
     do {                                                                 \
         qemu_log_mask(LOG_UNIMP,                                         \
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 4c0b6e8fc42..a9f90e3ed4c 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -226,6 +226,9 @@ void arm_test_cc(DisasCompare *cmp, int cc);
 void arm_free_cc(DisasCompare *cmp);
 void arm_jump_cc(DisasCompare *cmp, TCGLabel *label);
 void arm_gen_test_cc(int cc, TCGLabel *label);
+void unallocated_encoding(DisasContext *s);
+void gen_exception_insn(DisasContext *s, uint64_t pc, int excp,
+                        uint32_t syn, uint32_t target_el);
 
 /* Return state of Alternate Half-precision flag, caller frees result */
 static inline TCGv_i32 get_ahp_flag(void)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 0b42e53500e..4ce28ec54db 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -360,14 +360,6 @@ static void gen_exception_internal_insn(DisasContext *s, uint64_t pc, int excp)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_exception_insn(DisasContext *s, uint64_t pc, int excp,
-                               uint32_t syndrome, uint32_t target_el)
-{
-    gen_a64_set_pc_im(pc);
-    gen_exception(excp, syndrome, target_el);
-    s->base.is_jmp = DISAS_NORETURN;
-}
-
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syndrome)
 {
     TCGv_i32 tcg_syn;
@@ -438,13 +430,6 @@ static inline void gen_goto_tb(DisasContext *s, int n, uint64_t dest)
     }
 }
 
-void unallocated_encoding(DisasContext *s)
-{
-    /* Unallocated and reserved encodings are uncategorized */
-    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
-                       default_exception_el(s));
-}
-
 static void init_tmp_a64_array(DisasContext *s)
 {
 #ifdef CONFIG_DEBUG_TCG
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 0e30892d54e..24f50dea669 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1042,11 +1042,15 @@ static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_exception_insn(DisasContext *s, uint32_t pc, int excp,
-                               int syn, uint32_t target_el)
+void gen_exception_insn(DisasContext *s, uint64_t pc, int excp,
+                        uint32_t syn, uint32_t target_el)
 {
-    gen_set_condexec(s);
-    gen_set_pc_im(s, pc);
+    if (s->aarch64) {
+        gen_a64_set_pc_im(pc);
+    } else {
+        gen_set_condexec(s);
+        gen_set_pc_im(s, pc);
+    }
     gen_exception(excp, syn, target_el);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -1063,7 +1067,7 @@ static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static void unallocated_encoding(DisasContext *s)
+void unallocated_encoding(DisasContext *s)
 {
     /* Unallocated and reserved encodings are uncategorized */
     gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
-- 
2.20.1


