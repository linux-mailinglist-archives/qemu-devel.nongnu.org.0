Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6F53BA0F0
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:09:30 +0200 (CEST)
Received: from localhost ([::1]:42948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzIvB-0002KD-Ey
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzImN-0007i5-0L
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:24 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:36863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzIm4-0007hg-Uz
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:16 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 m41-20020a05600c3b29b02901dcd3733f24so9037131wms.1
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JDXqm5HZRmA9G4/nIJB0sZe1fT/1cLm8zXBtyLe2hBg=;
 b=xdW9nJ9vB0XTGz+UuPjQzF66rG+X22goFnvc4Xg0zS72uBUbQz/WUG1zDg8fW6225s
 ADwGWDWh4uu8NtUk7AUkm5BnSe38qV1WsIrKCZ1RnBq8IDltBLEILbxGawks0fRNcXcd
 Tb2XcAZN+UgYFt3NnR01SHWLG47qsib3/OTbp5qYecyxQ11fGUTIrSbc8ETZVFSPXoV0
 90aZD6UJNm0hhW5SGrMKvr0oOqZutUf/Bf30zXv30bgNvVKekq4Yn300Ky4pIZF5Dq//
 D/KIu6F+kG5zysv0WrIV6byGS9NRUNaGbo0yBsmeCIrftUvY5e5c4DpXs6ioh9BSDk/7
 3xIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JDXqm5HZRmA9G4/nIJB0sZe1fT/1cLm8zXBtyLe2hBg=;
 b=lrLvUFqZN7GEfhNRZti85u1l+PUjecv5rd9BZiu5bvRWBc3WUjAmIbqJf5cMrF5XXV
 2LOHlJvVtk4MzZbUbQwLFujwz9OXd14THxUVNZHsS00n9/HgkeY/+gn99vBI3BxBOz5O
 DB9h1Vhl13ArELfnD8U4bDKYref4P86IxIK/rbNjKLqcYxqNoqAUQYr95YZaYSR5DQg5
 bI4Fz8MjXPfQ+XLTOEJVi5PeRT5vHQ1DhqUHnuMF+JXs+zE7K7OLH//BgHSCRl0zlwye
 p0oa4bnjG6LLR/VbE2s85TeaqHnhiViMEjuzZ37VMst+CaTRhjTCMiI0+Kd3L5lgW3wH
 axIg==
X-Gm-Message-State: AOAM531LlLiPapU86BCEj0vPq+NTPJo1la12a8wwxXXmhY8ZLsjJfBXK
 trUn4d+pcyO6mMJq9Y9qS/JdOfYZfuEAUT5/
X-Google-Smtp-Source: ABdhPJzyjZCtaqNzEY2YeF/b29mCdLi6GRQBY5n5apipRkHG4vPG8efY3ItYLeXstfkT4/l0qye7zg==
X-Received: by 2002:a05:600c:354f:: with SMTP id
 i15mr16695485wmq.24.1625230803515; 
 Fri, 02 Jul 2021 06:00:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s3sm3333351wro.30.2021.07.02.06.00.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:00:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/24] target/arm: Use asimd_imm_const for A64 decode
Date: Fri,  2 Jul 2021 13:59:40 +0100
Message-Id: <20210702125954.13247-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702125954.13247-1-peter.maydell@linaro.org>
References: <20210702125954.13247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The A64 AdvSIMD modified-immediate grouping uses almost the same
constant encoding that A32 Neon does; reuse asimd_imm_const() (to
which we add the AArch64-specific case for cmode 15 op 1) instead of
reimplementing it all.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210628135835.6690-5-peter.maydell@linaro.org
---
 target/arm/translate.h     |  3 +-
 target/arm/translate-a64.c | 86 ++++----------------------------------
 target/arm/translate.c     | 17 +++++++-
 3 files changed, 24 insertions(+), 82 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 6c8d5f6ede1..e2f056c32c2 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -540,7 +540,8 @@ static inline MemOp finalize_memop(DisasContext *s, MemOp opc)
  * VMVN and VBIC (when cmode < 14 && op == 1).
  *
  * The combination cmode == 15 op == 1 is a reserved encoding for AArch32;
- * callers must catch this.
+ * callers must catch this; we return the 64-bit constant value defined
+ * for AArch64.
  *
  * cmode = 2,3,4,5,6,7,10,11,12,13 imm=0 was UNPREDICTABLE in v7A but
  * is either not unpredictable or merely CONSTRAINED UNPREDICTABLE in v8A;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 1a40e49db7f..66781f71cb2 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -8190,8 +8190,6 @@ static void disas_simd_mod_imm(DisasContext *s, uint32_t insn)
 {
     int rd = extract32(insn, 0, 5);
     int cmode = extract32(insn, 12, 4);
-    int cmode_3_1 = extract32(cmode, 1, 3);
-    int cmode_0 = extract32(cmode, 0, 1);
     int o2 = extract32(insn, 11, 1);
     uint64_t abcdefgh = extract32(insn, 5, 5) | (extract32(insn, 16, 3) << 5);
     bool is_neg = extract32(insn, 29, 1);
@@ -8210,83 +8208,13 @@ static void disas_simd_mod_imm(DisasContext *s, uint32_t insn)
         return;
     }
 
-    /* See AdvSIMDExpandImm() in ARM ARM */
-    switch (cmode_3_1) {
-    case 0: /* Replicate(Zeros(24):imm8, 2) */
-    case 1: /* Replicate(Zeros(16):imm8:Zeros(8), 2) */
-    case 2: /* Replicate(Zeros(8):imm8:Zeros(16), 2) */
-    case 3: /* Replicate(imm8:Zeros(24), 2) */
-    {
-        int shift = cmode_3_1 * 8;
-        imm = bitfield_replicate(abcdefgh << shift, 32);
-        break;
-    }
-    case 4: /* Replicate(Zeros(8):imm8, 4) */
-    case 5: /* Replicate(imm8:Zeros(8), 4) */
-    {
-        int shift = (cmode_3_1 & 0x1) * 8;
-        imm = bitfield_replicate(abcdefgh << shift, 16);
-        break;
-    }
-    case 6:
-        if (cmode_0) {
-            /* Replicate(Zeros(8):imm8:Ones(16), 2) */
-            imm = (abcdefgh << 16) | 0xffff;
-        } else {
-            /* Replicate(Zeros(16):imm8:Ones(8), 2) */
-            imm = (abcdefgh << 8) | 0xff;
-        }
-        imm = bitfield_replicate(imm, 32);
-        break;
-    case 7:
-        if (!cmode_0 && !is_neg) {
-            imm = bitfield_replicate(abcdefgh, 8);
-        } else if (!cmode_0 && is_neg) {
-            int i;
-            imm = 0;
-            for (i = 0; i < 8; i++) {
-                if ((abcdefgh) & (1 << i)) {
-                    imm |= 0xffULL << (i * 8);
-                }
-            }
-        } else if (cmode_0) {
-            if (is_neg) {
-                imm = (abcdefgh & 0x3f) << 48;
-                if (abcdefgh & 0x80) {
-                    imm |= 0x8000000000000000ULL;
-                }
-                if (abcdefgh & 0x40) {
-                    imm |= 0x3fc0000000000000ULL;
-                } else {
-                    imm |= 0x4000000000000000ULL;
-                }
-            } else {
-                if (o2) {
-                    /* FMOV (vector, immediate) - half-precision */
-                    imm = vfp_expand_imm(MO_16, abcdefgh);
-                    /* now duplicate across the lanes */
-                    imm = bitfield_replicate(imm, 16);
-                } else {
-                    imm = (abcdefgh & 0x3f) << 19;
-                    if (abcdefgh & 0x80) {
-                        imm |= 0x80000000;
-                    }
-                    if (abcdefgh & 0x40) {
-                        imm |= 0x3e000000;
-                    } else {
-                        imm |= 0x40000000;
-                    }
-                    imm |= (imm << 32);
-                }
-            }
-        }
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
-    if (cmode_3_1 != 7 && is_neg) {
-        imm = ~imm;
+    if (cmode == 15 && o2 && !is_neg) {
+        /* FMOV (vector, immediate) - half-precision */
+        imm = vfp_expand_imm(MO_16, abcdefgh);
+        /* now duplicate across the lanes */
+        imm = bitfield_replicate(imm, 16);
+    } else {
+        imm = asimd_imm_const(abcdefgh, cmode, is_neg);
     }
 
     if (!((cmode & 0x9) == 0x1 || (cmode & 0xd) == 0x9)) {
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 95ceb24ec3b..66b24ab56e9 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -121,8 +121,8 @@ uint64_t asimd_imm_const(uint32_t imm, int cmode, int op)
     case 14:
         if (op) {
             /*
-             * This is the only case where the top and bottom 32 bits
-             * of the encoded constant differ.
+             * This and cmode == 15 op == 1 are the only cases where
+             * the top and bottom 32 bits of the encoded constant differ.
              */
             uint64_t imm64 = 0;
             int n;
@@ -137,6 +137,19 @@ uint64_t asimd_imm_const(uint32_t imm, int cmode, int op)
         imm |= (imm << 8) | (imm << 16) | (imm << 24);
         break;
     case 15:
+        if (op) {
+            /* Reserved encoding for AArch32; valid for AArch64 */
+            uint64_t imm64 = (uint64_t)(imm & 0x3f) << 48;
+            if (imm & 0x80) {
+                imm64 |= 0x8000000000000000ULL;
+            }
+            if (imm & 0x40) {
+                imm64 |= 0x3fc0000000000000ULL;
+            } else {
+                imm64 |= 0x4000000000000000ULL;
+            }
+            return imm64;
+        }
         imm = ((imm & 0x80) << 24) | ((imm & 0x3f) << 19)
             | ((imm & 0x40) ? (0x1f << 25) : (1 << 30));
         break;
-- 
2.20.1


