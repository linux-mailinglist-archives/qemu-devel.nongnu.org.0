Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B086D2FBC
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 12:51:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piYoW-0000pr-2V; Sat, 01 Apr 2023 06:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3YgwoZAgKCkMxrtxyfkflttlqj.htrvjrz-ij0jqstslsz.twl@flex--smostafa.bounces.google.com>)
 id 1piYoK-0000mz-1F
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 06:50:16 -0400
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3YgwoZAgKCkMxrtxyfkflttlqj.htrvjrz-ij0jqstslsz.twl@flex--smostafa.bounces.google.com>)
 id 1piYoH-0003Cy-Oj
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 06:50:15 -0400
Received: by mail-ed1-x549.google.com with SMTP id
 c11-20020a509f8b000000b00501e2facf47so35242241edf.16
 for <qemu-devel@nongnu.org>; Sat, 01 Apr 2023 03:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680346210;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=aoEvNafhxZOatcPvV6YjPDrKeOQ8MVO471UhdyqdjDU=;
 b=Heckz0rXgtPtVIAiowogkrohVNwd4PsJawnKHWu6OXU4pCbwMrfkC5xdiGuOXSaQwa
 xxp6OPRlOLXtnXNWwY1rgHqSXiPr2lpmAuFfIM9Hb3CQgTtAKqr2IdQ5ZYmP6bjQPl59
 qC7cUa1xXkDT2r9fDHQFBEBVMceyiY3SOtbu4KtVQwFItez55ptu0lyASEttgCuzCO7P
 uMcNhfdUIvO0vqNt6Kujlo684YMg2R/gPDQMLdc9gLEKhqusHY6vInW1Cz7zpdnRBGw7
 cKLkfq7p2T+wkWJeew0/GEK8TFoOGbLYOQVlgfU03aA/BImolXqkZ0T8dR7eJjqQjM/l
 odEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680346210;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aoEvNafhxZOatcPvV6YjPDrKeOQ8MVO471UhdyqdjDU=;
 b=36RAlja5lGcsfR6fb5EN0wPOzOadaXXB/A43Qd1m2SXeCVwpl2ojeKMZhFQ12GZlww
 7rYzZCm3e45TMuz6ydO5g84Ud+QJW/65xdR1VIM+xn4+SZyDkp1cJFaZ3HPMrPaZb4Lu
 VadozgGZSZxme+LjeI2pxv4/fdgD1iZzfkf694lytaZSqNF+LoH5L9DVXXGpelAlCAmI
 ACdVmnXaTHBadN7tEMcBXjtZx3ulnwjMPcJhzAf/2XBKBoKSATz5tC0X9mVP4i4SGU89
 mmS1DDH7lIKuNYWPQHLyyFhn8By+r7tdRwP9Rg3ALKMFo7KrQPV6NzOheNTR8FJCTbpe
 5t5g==
X-Gm-Message-State: AAQBX9fCLFGOPDF88req9XaVWtg9sgsx0FL8/A2Nb3XNeWlf+PS7dnL2
 KUAxVpyRqvvH2QF/3ZYOyrQ+MsAMFA5WiS0RTvpxHKsow/Bk0/gSsxiVHLUGJ61Iitqdk42QC3f
 rRGGOTPbYsm7suUx/kJp84aZwhCHE140AXcEOdd2Bl2dzowo5zxx6H0f7z6Kp+sg4Ow==
X-Google-Smtp-Source: AKy350ZKEwNTUVIqiaUET6Cfokx8oMr31bWIgrcLz3YcuOg/wUO4HQaxZDqRfBjlJMVDwAsR6eqGONhU2nxjhg==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a17:907:3908:b0:947:7be7:e554 with SMTP
 id so8-20020a170907390800b009477be7e554mr3766530ejc.7.1680346210336; Sat, 01
 Apr 2023 03:50:10 -0700 (PDT)
Date: Sat,  1 Apr 2023 10:49:49 +0000
In-Reply-To: <20230401104953.1325983-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230401104953.1325983-1-smostafa@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230401104953.1325983-7-smostafa@google.com>
Subject: [RFC PATCH v3 06/10] hw/arm/smmuv3: Make TLB lookup work for stage-2
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::549;
 envelope-from=3YgwoZAgKCkMxrtxyfkflttlqj.htrvjrz-ij0jqstslsz.twl@flex--smostafa.bounces.google.com;
 helo=mail-ed1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
Changes in v3:
- Rename temp to tt_combined and move to top.
- Collected Reviewed-by tag.
Changes in v2:
- check if S1 is enabled(not supported) when reading S1 TT.
---
 hw/arm/smmuv3.c | 44 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 0f5429aed8..a1f4a4f902 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -727,6 +727,9 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
     STE ste;
     CD cd;
 
+    /* ASID defaults to -1 (if s1 is not supported). */
+    cfg->asid = -1;
+
     ret = smmu_find_ste(s, sid, &ste, event);
     if (ret) {
         return ret;
@@ -824,6 +827,11 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         .addr_mask = ~(hwaddr)0,
         .perm = IOMMU_NONE,
     };
+    /*
+     * Combined attributes used for TLB lookup, as only one stage is supported,
+     * it will hold attributes based on the enabled stage.
+     */
+    SMMUTransTableInfo tt_combined;
 
     qemu_mutex_lock(&s->mutex);
 
@@ -852,21 +860,35 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
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
+        tt_combined.granule_sz = tt->granule_sz;
+        tt_combined.tsz = tt->tsz;
 
-    page_mask = (1ULL << (tt->granule_sz)) - 1;
+    } else {
+        /* Stage2. */
+        tt_combined.granule_sz = cfg->s2cfg.granule_sz;
+        tt_combined.tsz = cfg->s2cfg.tsz;
+    }
+    /*
+     * TLB lookup looks for granule and input size for a translation stage,
+     * as only one stage is supported right now, choose the right values
+     * from the configuration.
+     */
+    page_mask = (1ULL << tt_combined.granule_sz) - 1;
     aligned_addr = addr & ~page_mask;
 
-    cached_entry = smmu_iotlb_lookup(bs, cfg, tt, aligned_addr);
+    cached_entry = smmu_iotlb_lookup(bs, cfg, &tt_combined, aligned_addr);
     if (cached_entry) {
         if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
             status = SMMU_TRANS_ERROR;
-- 
2.40.0.348.gf938b09366-goog


