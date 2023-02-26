Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A366A345F
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 23:08:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWPAv-0002Tu-Ct; Sun, 26 Feb 2023 17:07:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Etj7YwgKCtcLFHLM3839HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--smostafa.bounces.google.com>)
 id 1pWPAs-0002TF-4r
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:07:19 -0500
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Etj7YwgKCtcLFHLM3839HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--smostafa.bounces.google.com>)
 id 1pWPAq-0003uC-G2
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:07:17 -0500
Received: by mail-wm1-x349.google.com with SMTP id
 f14-20020a7bcc0e000000b003dd41ad974bso2105258wmh.3
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 14:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=26w0ZsK+yJV9JuE2L/gekg4quDGDsIKNMc4eL5/NDRI=;
 b=CTSGuKkVgdYZQi1dCSGiHEk+sdX8iCW/vK4nvGaGetkrr67LvWKZCvm3yuR9nNile1
 XOpt0G78roqLs46t5FqFBUbleob/fHH1ewnvq+1FujnFhUjr9luhQSaSP9pyKLunbEYu
 w+qFfeTWI0na/1oNXmHxDRb6OgaPy+5hea4cUEit1KQ6AB3QA0nGn3mDAMUGV5aNmAve
 Cgu9EdeGG1DakBM9WuJAtiOxPA+B7Gk9i6RWpiQfTuobvmNBgeHbz8dTQhe5aiO/ZQp6
 nLxQABLxd0L9czFDkuxKEcJgQRC7oFudK40VIPbK2k5zc14q5mT2riffLWRWeRkv7sLf
 pD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=26w0ZsK+yJV9JuE2L/gekg4quDGDsIKNMc4eL5/NDRI=;
 b=K1id1Cwcnxe2Nz9z9f/bN6t1ABysuBajG6+07ZVV5FIn/lbEYYF59Vh624TVuAoj9a
 0QthLaFBLXnIr/3xPeQbleaFykLH3gxwYyTl7wB7rEjZqfLd8kovYtcQY4wVmdDCqCEj
 DV08KRoQn2ssbRYiinHkfuAnFl7UaUh5LoeB9e0EgbMuGfUVLzoj3WjvdV2jK2Yy3Ipi
 b0k8h6hGrGqVgCS7b+ZhQyCh9/74S3yTyAegvZXx6kM+kgi05GJ13z6mLv56rUkE4f/c
 xHlmI9M1N3zEL7Xkl8+aCp84lJQkRYVMiOtiAy6gl/HowmZw/Hs5vMRAMFe1pT+nYJHS
 J+iA==
X-Gm-Message-State: AO0yUKXqX5RVOfJa6PVmK1wh8UKc94QFAtZryOaZg45MbVjKNZPIT2OY
 +SWAJNjeeybpRwEfeP8fQo/pK2vr7gZ8N8SgKoU4MPB/E6mVLUy4HDkqJmgOctAZz2IEw266oCf
 A1OdpkV0tHYuh35KiSXwUlf0FIeaCNdKfbNPNq0LZbpgL/+T5/f3rRWwk45esE4W3Dg==
X-Google-Smtp-Source: AK7set+V1suInn3skMA6vwc80ZQ2Y+dZaPXKKrRKADthsFDPt7PI8HmcwJqTu8O4jy0/amkpdw0XHDm1XwR8Mw==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a5d:4205:0:b0:2c9:bd6e:83c0 with SMTP id
 n5-20020a5d4205000000b002c9bd6e83c0mr547690wrq.3.1677449234920; Sun, 26 Feb
 2023 14:07:14 -0800 (PST)
Date: Sun, 26 Feb 2023 22:06:45 +0000
In-Reply-To: <20230226220650.1480786-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230226220650.1480786-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Message-ID: <20230226220650.1480786-7-smostafa@google.com>
Subject: [RFC PATCH v2 06/11] hw/arm/smmuv3: Make TLB lookup work for stage-2
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3Etj7YwgKCtcLFHLM3839HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x349.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Right now, either stage-1 or stage-2 are supported, this simplifies
how we can deal with TLBs.
This patch makes TLB lookup work if stage-2 is enabled instead of
stage-1.
TLB lookup is done before a PTW, if a valid entry is found we won't
do the PTW.
To be able to do TLB lookup, we need the correct tagging info, as
granularity and input size, so we get this based on the supported
translation stage. The TLB entries are added correctly from each
stage PTW.

When nested translation is supported, this would need to change, for
example if we go with a combined TLB implementation, we would need to
use the min of the granularities in TLB.

As stage-2 shouldn't be tagged by ASID, it will be set to -1 if S1P
is not enabled.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
Changes in v2:
- check if S1 is enabled(not supported) when reading S1 TT.
---
 hw/arm/smmuv3.c | 45 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 11 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index dc74a5442d..ce193e9598 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -697,6 +697,9 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
     STE ste;
     CD cd;
 
+    /* ASID defaults to -1 (if s1 is not supported). */
+    cfg->asid = -1;
+
     ret = smmu_find_ste(s, sid, &ste, event);
     if (ret) {
         return ret;
@@ -787,6 +790,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     SMMUTLBEntry *cached_entry = NULL;
     SMMUTransTableInfo *tt;
     SMMUTransCfg *cfg = NULL;
+    uint8_t granule_sz, tsz;
     IOMMUTLBEntry entry = {
         .target_as = &address_space_memory,
         .iova = addr,
@@ -822,21 +826,40 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         goto epilogue;
     }
 
-    tt = select_tt(cfg, addr);
-    if (!tt) {
-        if (cfg->record_faults) {
-            event.type = SMMU_EVT_F_TRANSLATION;
-            event.u.f_translation.addr = addr;
-            event.u.f_translation.rnw = flag & 0x1;
+    if (cfg->stage == 1) {
+        /* Select stage1 translation table. */
+        tt = select_tt(cfg, addr);
+        if (!tt) {
+            if (cfg->record_faults) {
+                event.type = SMMU_EVT_F_TRANSLATION;
+                event.u.f_translation.addr = addr;
+                event.u.f_translation.rnw = flag & 0x1;
+            }
+            status = SMMU_TRANS_ERROR;
+            goto epilogue;
         }
-        status = SMMU_TRANS_ERROR;
-        goto epilogue;
-    }
+        granule_sz = tt->granule_sz;
+        tsz = tt->tsz;
 
-    page_mask = (1ULL << (tt->granule_sz)) - 1;
+    } else {
+        /* Stage2. */
+        granule_sz = cfg->s2cfg.granule_sz;
+        tsz = cfg->s2cfg.tsz;
+    }
+    /*
+     * TLB lookup looks for granule and input size for a translation stage,
+     * as only one stage is supported right now, choose the right values
+     * from the configuration.
+     */
+    page_mask = (1ULL << granule_sz) - 1;
     aligned_addr = addr & ~page_mask;
 
-    cached_entry = smmu_iotlb_lookup(bs, cfg, tt, aligned_addr);
+    SMMUTransTableInfo temp = {
+        .granule_sz = granule_sz,
+        .tsz = tsz,
+    };
+
+    cached_entry = smmu_iotlb_lookup(bs, cfg, &temp, aligned_addr);
     if (cached_entry) {
         if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
             status = SMMU_TRANS_ERROR;
-- 
2.39.2.637.g21b0678d19-goog


