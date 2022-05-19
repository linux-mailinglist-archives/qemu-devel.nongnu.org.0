Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1257352DB89
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 19:44:00 +0200 (CEST)
Received: from localhost ([::1]:42726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrkBr-0002f8-4R
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 13:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk54-00061k-B5
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:36:59 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk52-0000og-1y
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:36:57 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 i204-20020a1c3bd5000000b003972dda143eso1001164wma.3
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 10:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NuzCT3jd427MAyssQ0Yn5enOl1i+/jsuzDXmexAnHqU=;
 b=VlEhnktt7FuNJcx6823v+scS+QIwd1HQdmWbE48Y5P3viXbolHCqJHTFYfjecs2Chi
 iqSkTN5isWDuSUXNrXS3L3DY1nDvT/LVjdTtCkh0mDOgilhYvKoF6ulxWwBuSsbJvbAU
 43cSWw1vYzanpsvBgFX+32+l/XNmIuIkuinCkYJ8x+RM2yn5XOSXJN1keCf5kj53Zng1
 j8N4bReiNrf4bcMp2UWpF/DnMUw3Do8gfxW+3vgaTO3n0W/tsDiisFzu58fv2sq0vwgv
 ovQ4yHo6r/nexLBvNapNkUI1dy2ZdisLDhoXaJU/5A6UvOJifcGupOfYD5Uq4nJbg2Km
 WQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NuzCT3jd427MAyssQ0Yn5enOl1i+/jsuzDXmexAnHqU=;
 b=Okr4AHxda6H0alzLk0txie8z1amLbzL3/gzC8KxBz+xLxZE69uiQDUoJtaYiVADbO3
 2Deb30iJtLkZ4LIjZ4KZ0EJdMGkbOkzsIyQZj1Qgb2kR3RsXE2WOaBfKVa+9qlU0V9Qw
 M+6cAYscpD0DByNSFqnjgx0aTf0P7Lw714jPj3xKMPEZ2YynZS1TvF2l508hMD471siM
 rpdFgafrWVxYEX9WE7t3jUTlmKd8/zF1VpLB+mwzeoUi1IHo+zy8tCaq9Vzz5CqYIQrW
 QrJhuwsHhltBSvyn8Lk8114Hxezv7DlxfMhAvPllxWz0CNzZdAYD77V5CiiiEg4ObObU
 dS/w==
X-Gm-Message-State: AOAM533qg0YXXWYGh0ZRFK/GYNzkYLQy4SNbTEG6NdOy3LHNP7ZVhABf
 3P6d5evDu4ZTuwb78xfATYIYo2vlR6b9jw==
X-Google-Smtp-Source: ABdhPJyUNVvCAEP2tnkLHz7NVDp8JPDx/NLLKHVmuhrg97x8hdBYgd/FYDFGlD+Q/qokoOe10VWUkA==
X-Received: by 2002:a05:600c:3658:b0:394:725:be12 with SMTP id
 y24-20020a05600c365800b003940725be12mr4923549wmq.192.1652981814401; 
 Thu, 19 May 2022 10:36:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfa742000000b0020c5253d8f2sm180183wrd.62.2022.05.19.10.36.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 10:36:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/22] target/arm: Postpone interpretation of stage 2
 descriptor attribute bits
Date: Thu, 19 May 2022 18:36:30 +0100
Message-Id: <20220519173651.399295-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519173651.399295-1-peter.maydell@linaro.org>
References: <20220519173651.399295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

In the original Arm v8 two-stage translation, both stage 1 and stage
2 specify memory attributes (memory type, cacheability,
shareability); these are then combined to produce the overall memory
attributes for the whole stage 1+2 access.  In QEMU we implement this
by having get_phys_addr() fill in an ARMCacheAttrs struct, and we
convert both the stage 1 and stage 2 attribute bit formats to the
same encoding (an 8-bit attribute value matching the MAIR_EL1 fields,
plus a 2-bit shareability value).

The new FEAT_S2FWB feature allows the guest to enable a different
interpretation of the attribute bits in the stage 2 descriptors.
These bits can now be used to control details of how the stage 1 and
2 attributes should be combined (for instance they can say "always
use the stage 1 attributes" or "ignore the stage 1 attributes and
always be Device memory").  This means we need to pass the raw bit
information for stage 2 down to the function which combines the stage
1 and stage 2 information.

Add a field to ARMCacheAttrs that indicates whether the attrs field
should be interpreted as MAIR format, or as the raw stage 2 attribute
bits from the descriptor, and store the appropriate values when
filling in cacheattrs.

We only need to interpret the attrs field in a few places:
 * in do_ats_write(), where we know to expect a MAIR value
   (there is no ATS instruction to do a stage-2-only walk)
 * in S1_ptw_translate(), where we want to know whether the
   combined S1 + S2 attributes indicate Device memory that
   should provoke a fault
 * in combine_cacheattrs(), which does the S1 + S2 combining
Update those places accordingly.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220505183950.2781801-2-peter.maydell@linaro.org
---
 target/arm/internals.h |  7 ++++++-
 target/arm/helper.c    | 42 ++++++++++++++++++++++++++++++++++++------
 2 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 6ca0e957468..9b354eea7e4 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1149,8 +1149,13 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
 
 /* Cacheability and shareability attributes for a memory access */
 typedef struct ARMCacheAttrs {
-    unsigned int attrs:8; /* as in the MAIR register encoding */
+    /*
+     * If is_s2_format is true, attrs is the S2 descriptor bits [5:2]
+     * Otherwise, attrs is the same as the MAIR_EL1 8-bit format
+     */
+    unsigned int attrs:8;
     unsigned int shareability:2; /* as in the SH field of the VMSAv8-64 PTEs */
+    bool is_s2_format:1;
 } ARMCacheAttrs;
 
 bool get_phys_addr(CPUARMState *env, target_ulong address,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 432bd819195..93c58ad29ab 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3187,6 +3187,12 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
     ret = get_phys_addr(env, value, access_type, mmu_idx, &phys_addr, &attrs,
                         &prot, &page_size, &fi, &cacheattrs);
 
+    /*
+     * ATS operations only do S1 or S1+S2 translations, so we never
+     * have to deal with the ARMCacheAttrs format for S2 only.
+     */
+    assert(!cacheattrs.is_s2_format);
+
     if (ret) {
         /*
          * Some kinds of translation fault must cause exceptions rather
@@ -10717,6 +10723,19 @@ static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
     return true;
 }
 
+static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
+{
+    /*
+     * For an S1 page table walk, the stage 1 attributes are always
+     * some form of "this is Normal memory". The combined S1+S2
+     * attributes are therefore only Device if stage 2 specifies Device.
+     * With HCR_EL2.FWB == 0 this is when descriptor bits [5:4] are 0b00,
+     * ie when cacheattrs.attrs bits [3:2] are 0b00.
+     */
+    assert(cacheattrs.is_s2_format);
+    return (cacheattrs.attrs & 0xc) == 0;
+}
+
 /* Translate a S1 pagetable walk through S2 if needed.  */
 static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
                                hwaddr addr, bool *is_secure,
@@ -10745,7 +10764,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             return ~0;
         }
         if ((arm_hcr_el2_eff(env) & HCR_PTW) &&
-            (cacheattrs.attrs & 0xf0) == 0) {
+            ptw_attrs_are_device(env, cacheattrs)) {
             /*
              * PTW set and S1 walk touched S2 Device memory:
              * generate Permission fault.
@@ -11817,12 +11836,14 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     }
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
-        cacheattrs->attrs = convert_stage2_attrs(env, extract32(attrs, 0, 4));
+        cacheattrs->is_s2_format = true;
+        cacheattrs->attrs = extract32(attrs, 0, 4);
     } else {
         /* Index into MAIR registers for cache attributes */
         uint8_t attrindx = extract32(attrs, 0, 3);
         uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
         assert(attrindx <= 7);
+        cacheattrs->is_s2_format = false;
         cacheattrs->attrs = extract64(mair, attrindx * 8, 8);
     }
 
@@ -12560,14 +12581,22 @@ static uint8_t combine_cacheattr_nibble(uint8_t s1, uint8_t s2)
 /* Combine S1 and S2 cacheability/shareability attributes, per D4.5.4
  * and CombineS1S2Desc()
  *
+ * @env:     CPUARMState
  * @s1:      Attributes from stage 1 walk
  * @s2:      Attributes from stage 2 walk
  */
-static ARMCacheAttrs combine_cacheattrs(ARMCacheAttrs s1, ARMCacheAttrs s2)
+static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
+                                        ARMCacheAttrs s1, ARMCacheAttrs s2)
 {
     uint8_t s1lo, s2lo, s1hi, s2hi;
     ARMCacheAttrs ret;
     bool tagged = false;
+    uint8_t s2_mair_attrs;
+
+    assert(s2.is_s2_format && !s1.is_s2_format);
+    ret.is_s2_format = false;
+
+    s2_mair_attrs = convert_stage2_attrs(env, s2.attrs);
 
     if (s1.attrs == 0xf0) {
         tagged = true;
@@ -12575,9 +12604,9 @@ static ARMCacheAttrs combine_cacheattrs(ARMCacheAttrs s1, ARMCacheAttrs s2)
     }
 
     s1lo = extract32(s1.attrs, 0, 4);
-    s2lo = extract32(s2.attrs, 0, 4);
+    s2lo = extract32(s2_mair_attrs, 0, 4);
     s1hi = extract32(s1.attrs, 4, 4);
-    s2hi = extract32(s2.attrs, 4, 4);
+    s2hi = extract32(s2_mair_attrs, 4, 4);
 
     /* Combine shareability attributes (table D4-43) */
     if (s1.shareability == 2 || s2.shareability == 2) {
@@ -12731,7 +12760,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                 }
                 cacheattrs->shareability = 0;
             }
-            *cacheattrs = combine_cacheattrs(*cacheattrs, cacheattrs2);
+            *cacheattrs = combine_cacheattrs(env, *cacheattrs, cacheattrs2);
 
             /* Check if IPA translates to secure or non-secure PA space. */
             if (arm_is_secure_below_el3(env)) {
@@ -12849,6 +12878,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         /* Fill in cacheattr a-la AArch64.TranslateAddressS1Off. */
         hcr = arm_hcr_el2_eff(env);
         cacheattrs->shareability = 0;
+        cacheattrs->is_s2_format = false;
         if (hcr & HCR_DC) {
             if (hcr & HCR_DCT) {
                 memattr = 0xf0;  /* Tagged, Normal, WB, RWA */
-- 
2.25.1


