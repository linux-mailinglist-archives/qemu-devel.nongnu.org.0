Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D6F5448DE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:27:47 +0200 (CEST)
Received: from localhost ([::1]:42376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzFOE-0006Sx-Ff
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7e-0001jh-W7
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:35 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7c-00063C-2Z
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:34 -0400
Received: by mail-wr1-x433.google.com with SMTP id d14so22478436wra.10
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Y6NKzjmohrdzTWz249bQwDudC0VH9aW6QTVdwHDMnIc=;
 b=R0faIh7xeFaIzB1VOYAgdfpPLOHHAYna+UOAAyvxW/w11AmltFCmelBXLEUA+IrHBj
 4F+NiBeU9u4HxJ9X3owYxm1Srfc5DpSH+nbjlDUg1OyDzDTEoYefWgq6b4Lbx9WR+f1u
 hTLInLscWUUJku+wN7O1x3yeOwkMRO8QResv2grWibNziF7gzUf4f0+ZVQIehLPuXE1j
 3+Sy7tTuJ67og+JTJvAFqx0Cu+/PGhyEReAh65BleCMYJ9wp9CocD5MygDMk2qip0WbV
 B4QKq1jaBEQdK/oHh0IE9gkPh38xAHssTwCr3omOEhILEBmaBYZS5qzSoPp8gQoQDQwG
 Mi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y6NKzjmohrdzTWz249bQwDudC0VH9aW6QTVdwHDMnIc=;
 b=Tw0no7GwgvaB0raIsMj/HzxjbAPk/W4DGEcYSkBqHkyTSAFqIzjMU3V+mTdJI6ubDH
 vtyfukLmnGoVrureoNP3TOB5wpu+433u0tBJ50/yYLkuW/JGv+pHIGjmK/nHVElb8Z2s
 M4Z2/HvJ26AJMwZL5bfk2zuue9hOOyoyBYRSNm7an7tbzO91odO++ImljwoL5omhbiTg
 8Qd4r+zb6GO7De3fQ4vWfVN7qT+qYyxYq21pSdonhnNdBXtnKyUvhL9aVJstgCzADpA6
 /MRV6Mt0pdjCTYLYUt9IFmnu3fMtFiXbMvw90Mi5/1Ks+IP4l/gBHcVcJSDRnCPZcvTS
 twmA==
X-Gm-Message-State: AOAM530Bc/mzsRECd3TGjuAhW1QlJxbDhZJsRZDnOQozAs56Yuc2Gstg
 K/vg+Bs3Au48hYzuHsRDD12V3FB08nxfyQ==
X-Google-Smtp-Source: ABdhPJw0qXnoznEbtK2ZBayPEzof/Sp6kjpQ6M4Nl1nIUgOSrTw8cgZzEWLqbqXQay6pCqo4Dt2vWQ==
X-Received: by 2002:adf:b644:0:b0:210:1fde:a513 with SMTP id
 i4-20020adfb644000000b002101fdea513mr39475679wre.604.1654765591286; 
 Thu, 09 Jun 2022 02:06:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 48/55] target/arm: Split out load/store primitives to
 sve_ldst_internal.h
Date: Thu,  9 Jun 2022 10:05:30 +0100
Message-Id: <20220609090537.1971756-49-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Begin creation of sve_ldst_internal.h by moving the primitives
that access host and tlb memory.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220607203306.657998-14-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve_ldst_internal.h | 127 +++++++++++++++++++++++++++++++++
 target/arm/sve_helper.c        | 107 +--------------------------
 2 files changed, 128 insertions(+), 106 deletions(-)
 create mode 100644 target/arm/sve_ldst_internal.h

diff --git a/target/arm/sve_ldst_internal.h b/target/arm/sve_ldst_internal.h
new file mode 100644
index 00000000000..ef9117e84c1
--- /dev/null
+++ b/target/arm/sve_ldst_internal.h
@@ -0,0 +1,127 @@
+/*
+ * ARM SVE Load/Store Helpers
+ *
+ * Copyright (c) 2018-2022 Linaro
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
+#ifndef TARGET_ARM_SVE_LDST_INTERNAL_H
+#define TARGET_ARM_SVE_LDST_INTERNAL_H
+
+#include "exec/cpu_ldst.h"
+
+/*
+ * Load one element into @vd + @reg_off from @host.
+ * The controlling predicate is known to be true.
+ */
+typedef void sve_ldst1_host_fn(void *vd, intptr_t reg_off, void *host);
+
+/*
+ * Load one element into @vd + @reg_off from (@env, @vaddr, @ra).
+ * The controlling predicate is known to be true.
+ */
+typedef void sve_ldst1_tlb_fn(CPUARMState *env, void *vd, intptr_t reg_off,
+                              target_ulong vaddr, uintptr_t retaddr);
+
+/*
+ * Generate the above primitives.
+ */
+
+#define DO_LD_HOST(NAME, H, TYPEE, TYPEM, HOST)                              \
+static inline void sve_##NAME##_host(void *vd, intptr_t reg_off, void *host) \
+{ TYPEM val = HOST(host); *(TYPEE *)(vd + H(reg_off)) = val; }
+
+#define DO_ST_HOST(NAME, H, TYPEE, TYPEM, HOST)                              \
+static inline void sve_##NAME##_host(void *vd, intptr_t reg_off, void *host) \
+{ TYPEM val = *(TYPEE *)(vd + H(reg_off)); HOST(host, val); }
+
+#define DO_LD_TLB(NAME, H, TYPEE, TYPEM, TLB)                              \
+static inline void sve_##NAME##_tlb(CPUARMState *env, void *vd,            \
+                        intptr_t reg_off, target_ulong addr, uintptr_t ra) \
+{                                                                          \
+    TYPEM val = TLB(env, useronly_clean_ptr(addr), ra);                    \
+    *(TYPEE *)(vd + H(reg_off)) = val;                                     \
+}
+
+#define DO_ST_TLB(NAME, H, TYPEE, TYPEM, TLB)                              \
+static inline void sve_##NAME##_tlb(CPUARMState *env, void *vd,            \
+                        intptr_t reg_off, target_ulong addr, uintptr_t ra) \
+{                                                                          \
+    TYPEM val = *(TYPEE *)(vd + H(reg_off));                               \
+    TLB(env, useronly_clean_ptr(addr), val, ra);                           \
+}
+
+#define DO_LD_PRIM_1(NAME, H, TE, TM)                   \
+    DO_LD_HOST(NAME, H, TE, TM, ldub_p)                 \
+    DO_LD_TLB(NAME, H, TE, TM, cpu_ldub_data_ra)
+
+DO_LD_PRIM_1(ld1bb,  H1,   uint8_t,  uint8_t)
+DO_LD_PRIM_1(ld1bhu, H1_2, uint16_t, uint8_t)
+DO_LD_PRIM_1(ld1bhs, H1_2, uint16_t,  int8_t)
+DO_LD_PRIM_1(ld1bsu, H1_4, uint32_t, uint8_t)
+DO_LD_PRIM_1(ld1bss, H1_4, uint32_t,  int8_t)
+DO_LD_PRIM_1(ld1bdu, H1_8, uint64_t, uint8_t)
+DO_LD_PRIM_1(ld1bds, H1_8, uint64_t,  int8_t)
+
+#define DO_ST_PRIM_1(NAME, H, TE, TM)                   \
+    DO_ST_HOST(st1##NAME, H, TE, TM, stb_p)             \
+    DO_ST_TLB(st1##NAME, H, TE, TM, cpu_stb_data_ra)
+
+DO_ST_PRIM_1(bb,   H1,  uint8_t, uint8_t)
+DO_ST_PRIM_1(bh, H1_2, uint16_t, uint8_t)
+DO_ST_PRIM_1(bs, H1_4, uint32_t, uint8_t)
+DO_ST_PRIM_1(bd, H1_8, uint64_t, uint8_t)
+
+#define DO_LD_PRIM_2(NAME, H, TE, TM, LD) \
+    DO_LD_HOST(ld1##NAME##_be, H, TE, TM, LD##_be_p)    \
+    DO_LD_HOST(ld1##NAME##_le, H, TE, TM, LD##_le_p)    \
+    DO_LD_TLB(ld1##NAME##_be, H, TE, TM, cpu_##LD##_be_data_ra) \
+    DO_LD_TLB(ld1##NAME##_le, H, TE, TM, cpu_##LD##_le_data_ra)
+
+#define DO_ST_PRIM_2(NAME, H, TE, TM, ST) \
+    DO_ST_HOST(st1##NAME##_be, H, TE, TM, ST##_be_p)    \
+    DO_ST_HOST(st1##NAME##_le, H, TE, TM, ST##_le_p)    \
+    DO_ST_TLB(st1##NAME##_be, H, TE, TM, cpu_##ST##_be_data_ra) \
+    DO_ST_TLB(st1##NAME##_le, H, TE, TM, cpu_##ST##_le_data_ra)
+
+DO_LD_PRIM_2(hh,  H1_2, uint16_t, uint16_t, lduw)
+DO_LD_PRIM_2(hsu, H1_4, uint32_t, uint16_t, lduw)
+DO_LD_PRIM_2(hss, H1_4, uint32_t,  int16_t, lduw)
+DO_LD_PRIM_2(hdu, H1_8, uint64_t, uint16_t, lduw)
+DO_LD_PRIM_2(hds, H1_8, uint64_t,  int16_t, lduw)
+
+DO_ST_PRIM_2(hh, H1_2, uint16_t, uint16_t, stw)
+DO_ST_PRIM_2(hs, H1_4, uint32_t, uint16_t, stw)
+DO_ST_PRIM_2(hd, H1_8, uint64_t, uint16_t, stw)
+
+DO_LD_PRIM_2(ss,  H1_4, uint32_t, uint32_t, ldl)
+DO_LD_PRIM_2(sdu, H1_8, uint64_t, uint32_t, ldl)
+DO_LD_PRIM_2(sds, H1_8, uint64_t,  int32_t, ldl)
+
+DO_ST_PRIM_2(ss, H1_4, uint32_t, uint32_t, stl)
+DO_ST_PRIM_2(sd, H1_8, uint64_t, uint32_t, stl)
+
+DO_LD_PRIM_2(dd, H1_8, uint64_t, uint64_t, ldq)
+DO_ST_PRIM_2(dd, H1_8, uint64_t, uint64_t, stq)
+
+#undef DO_LD_TLB
+#undef DO_ST_TLB
+#undef DO_LD_HOST
+#undef DO_LD_PRIM_1
+#undef DO_ST_PRIM_1
+#undef DO_LD_PRIM_2
+#undef DO_ST_PRIM_2
+
+#endif /* TARGET_ARM_SVE_LDST_INTERNAL_H */
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 3bdcd4ce9d0..0c6dde00aa6 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -21,12 +21,12 @@
 #include "cpu.h"
 #include "internals.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "fpu/softfloat.h"
 #include "tcg/tcg.h"
 #include "vec_internal.h"
+#include "sve_ldst_internal.h"
 
 
 /* Return a value for NZCV as per the ARM PredTest pseudofunction.
@@ -5301,111 +5301,6 @@ void HELPER(sve_fcmla_zpzzz_d)(void *vd, void *vn, void *vm, void *va,
  * Load contiguous data, protected by a governing predicate.
  */
 
-/*
- * Load one element into @vd + @reg_off from @host.
- * The controlling predicate is known to be true.
- */
-typedef void sve_ldst1_host_fn(void *vd, intptr_t reg_off, void *host);
-
-/*
- * Load one element into @vd + @reg_off from (@env, @vaddr, @ra).
- * The controlling predicate is known to be true.
- */
-typedef void sve_ldst1_tlb_fn(CPUARMState *env, void *vd, intptr_t reg_off,
-                              target_ulong vaddr, uintptr_t retaddr);
-
-/*
- * Generate the above primitives.
- */
-
-#define DO_LD_HOST(NAME, H, TYPEE, TYPEM, HOST) \
-static void sve_##NAME##_host(void *vd, intptr_t reg_off, void *host)  \
-{                                                                      \
-    TYPEM val = HOST(host);                                            \
-    *(TYPEE *)(vd + H(reg_off)) = val;                                 \
-}
-
-#define DO_ST_HOST(NAME, H, TYPEE, TYPEM, HOST) \
-static void sve_##NAME##_host(void *vd, intptr_t reg_off, void *host)  \
-{ HOST(host, (TYPEM)*(TYPEE *)(vd + H(reg_off))); }
-
-#define DO_LD_TLB(NAME, H, TYPEE, TYPEM, TLB) \
-static void sve_##NAME##_tlb(CPUARMState *env, void *vd, intptr_t reg_off,  \
-                             target_ulong addr, uintptr_t ra)               \
-{                                                                           \
-    *(TYPEE *)(vd + H(reg_off)) =                                           \
-        (TYPEM)TLB(env, useronly_clean_ptr(addr), ra);                      \
-}
-
-#define DO_ST_TLB(NAME, H, TYPEE, TYPEM, TLB) \
-static void sve_##NAME##_tlb(CPUARMState *env, void *vd, intptr_t reg_off,  \
-                             target_ulong addr, uintptr_t ra)               \
-{                                                                           \
-    TLB(env, useronly_clean_ptr(addr),                                      \
-        (TYPEM)*(TYPEE *)(vd + H(reg_off)), ra);                            \
-}
-
-#define DO_LD_PRIM_1(NAME, H, TE, TM)                   \
-    DO_LD_HOST(NAME, H, TE, TM, ldub_p)                 \
-    DO_LD_TLB(NAME, H, TE, TM, cpu_ldub_data_ra)
-
-DO_LD_PRIM_1(ld1bb,  H1,   uint8_t,  uint8_t)
-DO_LD_PRIM_1(ld1bhu, H1_2, uint16_t, uint8_t)
-DO_LD_PRIM_1(ld1bhs, H1_2, uint16_t,  int8_t)
-DO_LD_PRIM_1(ld1bsu, H1_4, uint32_t, uint8_t)
-DO_LD_PRIM_1(ld1bss, H1_4, uint32_t,  int8_t)
-DO_LD_PRIM_1(ld1bdu, H1_8, uint64_t, uint8_t)
-DO_LD_PRIM_1(ld1bds, H1_8, uint64_t,  int8_t)
-
-#define DO_ST_PRIM_1(NAME, H, TE, TM)                   \
-    DO_ST_HOST(st1##NAME, H, TE, TM, stb_p)             \
-    DO_ST_TLB(st1##NAME, H, TE, TM, cpu_stb_data_ra)
-
-DO_ST_PRIM_1(bb,   H1,  uint8_t, uint8_t)
-DO_ST_PRIM_1(bh, H1_2, uint16_t, uint8_t)
-DO_ST_PRIM_1(bs, H1_4, uint32_t, uint8_t)
-DO_ST_PRIM_1(bd, H1_8, uint64_t, uint8_t)
-
-#define DO_LD_PRIM_2(NAME, H, TE, TM, LD) \
-    DO_LD_HOST(ld1##NAME##_be, H, TE, TM, LD##_be_p)    \
-    DO_LD_HOST(ld1##NAME##_le, H, TE, TM, LD##_le_p)    \
-    DO_LD_TLB(ld1##NAME##_be, H, TE, TM, cpu_##LD##_be_data_ra) \
-    DO_LD_TLB(ld1##NAME##_le, H, TE, TM, cpu_##LD##_le_data_ra)
-
-#define DO_ST_PRIM_2(NAME, H, TE, TM, ST) \
-    DO_ST_HOST(st1##NAME##_be, H, TE, TM, ST##_be_p)    \
-    DO_ST_HOST(st1##NAME##_le, H, TE, TM, ST##_le_p)    \
-    DO_ST_TLB(st1##NAME##_be, H, TE, TM, cpu_##ST##_be_data_ra) \
-    DO_ST_TLB(st1##NAME##_le, H, TE, TM, cpu_##ST##_le_data_ra)
-
-DO_LD_PRIM_2(hh,  H1_2, uint16_t, uint16_t, lduw)
-DO_LD_PRIM_2(hsu, H1_4, uint32_t, uint16_t, lduw)
-DO_LD_PRIM_2(hss, H1_4, uint32_t,  int16_t, lduw)
-DO_LD_PRIM_2(hdu, H1_8, uint64_t, uint16_t, lduw)
-DO_LD_PRIM_2(hds, H1_8, uint64_t,  int16_t, lduw)
-
-DO_ST_PRIM_2(hh, H1_2, uint16_t, uint16_t, stw)
-DO_ST_PRIM_2(hs, H1_4, uint32_t, uint16_t, stw)
-DO_ST_PRIM_2(hd, H1_8, uint64_t, uint16_t, stw)
-
-DO_LD_PRIM_2(ss,  H1_4, uint32_t, uint32_t, ldl)
-DO_LD_PRIM_2(sdu, H1_8, uint64_t, uint32_t, ldl)
-DO_LD_PRIM_2(sds, H1_8, uint64_t,  int32_t, ldl)
-
-DO_ST_PRIM_2(ss, H1_4, uint32_t, uint32_t, stl)
-DO_ST_PRIM_2(sd, H1_8, uint64_t, uint32_t, stl)
-
-DO_LD_PRIM_2(dd, H1_8, uint64_t, uint64_t, ldq)
-DO_ST_PRIM_2(dd, H1_8, uint64_t, uint64_t, stq)
-
-#undef DO_LD_TLB
-#undef DO_ST_TLB
-#undef DO_LD_HOST
-#undef DO_LD_PRIM_1
-#undef DO_ST_PRIM_1
-#undef DO_LD_PRIM_2
-#undef DO_ST_PRIM_2
-
 /*
  * Skip through a sequence of inactive elements in the guarding predicate @vg,
  * beginning at @reg_off bounded by @reg_max.  Return the offset of the active
-- 
2.25.1


