Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E3E68AF19
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 10:46:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObb4-00053C-SE; Sun, 05 Feb 2023 04:46:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3snrfYwgKCks5z156nsnt11tyr.p1z3rz7-qr8ry010t07.14t@flex--smostafa.bounces.google.com>)
 id 1pObaT-0004UE-OV
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:45:36 -0500
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3snrfYwgKCks5z156nsnt11tyr.p1z3rz7-qr8ry010t07.14t@flex--smostafa.bounces.google.com>)
 id 1pObaP-0001R1-MU
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:45:27 -0500
Received: by mail-wm1-x34a.google.com with SMTP id
 d18-20020a05600c34d200b003df901ab982so4578253wmq.4
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 01:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=2CjEW12YQc4PAqBVbc5JOXA4JecVktebW01or/u1RTY=;
 b=rq9w7JyVHEGJhUXpMWqud+wZfRYmsSib7Ellmo5cXYim5u/2S6dP84qoRX085/X8Sv
 dw1ocZZt8Ka0rwBuKVYJlQ0x4xo4ROkL9m/rxJXgunZcQ6yfmBqrvQojs+8jc9ao766X
 xoA44wS2Im6k8u+yjdeYjsjdIiv1N6DehPCaAjObVg1CD4eZ6i9b8Vde8mXof9XgE0vv
 bkdQt+xd4jIp+viwPrqiv9Iz/MfL7gAy312Jr7x9FDkg06n7ajVmRdCYI+haEWmnqrTE
 W+kBN+lf/7K+qYr/34PwGy6FOFuc1DMT+VSnAi38l1KgVDcAUBKYcRyigK7lbzHkN4Nj
 bgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2CjEW12YQc4PAqBVbc5JOXA4JecVktebW01or/u1RTY=;
 b=moYXDYYA08Qmli0RFmWFiqjZMwxykkPfGyys8yr/k2rlczh8Mj1Mui9IbaplgqzMbc
 FtixfUeHkMvBswqQfkYfly/LuUuqeN04DotH4wUKYp5OV+GiekPWlSuj9ZiJU8gyLpo3
 gZb323SoB0n1Brg3RZahV6+QXn/7fI4FqZTSlpMOGj1hxtfwNx3FzwF2wWvgdXj6HBkM
 gLc20+gs4KN8KTgA4GfSGvbjj6M+cuOeXZX+YozNqGjpdi5TRzdyRurJsC1WzLqkopou
 ndNqfDUIBsRiKbLDcvjscoXo1hxhLtkRm6g4LETQeTxtTb/coVHwh14D1AUyITj5lle7
 drjg==
X-Gm-Message-State: AO0yUKUS6soP3PdqevCUBTZoJSLKLyOiHnHuhlbxYj3aBWrs3nmE2IM4
 eERoK7qDAyS+C3e8L+SsupWnT35gbAcih651oXSUkcQ3knPrhtvT0aW1aNvvsL1Vlec+ci3uCnL
 6GOrv6hno4PPwE409a5WzCYbcU2frLh6NkUufp3IUGTON74/WckSHJgUIeMrF5tzx8w==
X-Google-Smtp-Source: AK7set+R8pLYm3qNJy+xHOn7Tz+Pvf+FrZdIO5v4zwEf7KgEbT+7+L0S+HrNW87h3VM1uDuVfZh0iGNIM0vfxg==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:556a:b0:3dc:5001:e01 with SMTP
 id ja10-20020a05600c556a00b003dc50010e01mr1047458wmb.194.1675590322501; Sun,
 05 Feb 2023 01:45:22 -0800 (PST)
Date: Sun,  5 Feb 2023 09:44:05 +0000
In-Reply-To: <20230205094411.793816-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230205094411.793816-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230205094411.793816-11-smostafa@google.com>
Subject: [RFC PATCH 10/16] hw/arm/smmuv3: Make TLB lookup work for stage-2
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::34a;
 envelope-from=3snrfYwgKCks5z156nsnt11tyr.p1z3rz7-qr8ry010t07.14t@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x34a.google.com
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
---
 hw/arm/smmuv3.c | 44 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index c18460a4ff..769c735697 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -653,6 +653,8 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
         return ret;
     }
 
+    /* ASID defaults to -1 if s1 is not supported. */
+    cfg->asid = -1;
     if (cfg->aborted || cfg->bypassed || !STAGE1_SUPPORTED(s->features)) {
         return 0;
     }
@@ -733,6 +735,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     SMMUTLBEntry *cached_entry = NULL;
     SMMUTransTableInfo *tt;
     SMMUTransCfg *cfg = NULL;
+    uint8_t granule_sz, tsz;
     IOMMUTLBEntry entry = {
         .target_as = &address_space_memory,
         .iova = addr,
@@ -764,21 +767,40 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         goto epilogue;
     }
 
-    tt = select_tt(cfg, addr);
-    if (!tt) {
-        if (cfg->record_faults) {
-            event.type = SMMU_EVT_F_TRANSLATION;
-            event.u.f_translation.addr = addr;
-            event.u.f_translation.rnw = flag & 0x1;
+    if (STAGE1_SUPPORTED(s->features)) {
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
2.39.1.519.gcb327c4b5f-goog


