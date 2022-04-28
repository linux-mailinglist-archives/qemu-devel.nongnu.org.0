Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718A65137E4
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:12:30 +0200 (CEST)
Received: from localhost ([::1]:55994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5oj-000603-Hx
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K7-0005gi-Tw
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:52 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:55018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K5-0006Vf-UU
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:51 -0400
Received: by mail-wm1-x335.google.com with SMTP id bg25so3069218wmb.4
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zcbQ/6t+eYvR1xX9UosyZUxzrXgkRoMDs+Bnhnu9fZU=;
 b=ayPBz7wev04U0gyfsWegJY4IxoNpq8aOXEjEBJsgBXvQH19oM2o5dCs/s+pQU/A0Kd
 2uVyXJzc5qyHTIgFvYrgw+6gJn50Lxt59pzjY/57cb+CV43HrGgV8BDXGZRWiFmJhKRC
 gaFCjea9Afe01Mwm+5jbFxovkRsB6fkx4c2gk/N7D4ZQI32glZz7BtknUflDeEzGVZfy
 CVHCuD/NC5YCIHCrZ1SMdLAtugYhfcLqq8KaT0VR1M+9ZA6gzshUC8L1fvKXjhBxDscc
 B6ZhjZtimaRBRYolcoKypT8BkP8kddhkHjy6k9NtjebFV/4GEGrdna9EDiLy4fRYlM1Q
 oP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zcbQ/6t+eYvR1xX9UosyZUxzrXgkRoMDs+Bnhnu9fZU=;
 b=AV2gJNa4NKwoOl1q5vj9i3CxJjpCptjyjQnMEx/cOWdNsalFpRkVENDPBGdD26mWVT
 FHQw4stdfxiHMXHULMod7dELns/FICkzj97FNtwsAHo/AYfz3sw4pPal4WXDBJH528Fr
 LJaCeFLnhkLmI5jv7JkdYqduh1cbEBG2hTjPzfVBCpfa4FZW2trnoWyj8V3HT3NlxodM
 +azu5FeYLxfTpUqS4Rl3IGYSFXwtm5OGk6GWUVhY2x3zfzXYacID7vx3lPKqTLvUHopn
 thdNAw4P453fhSHMPM6B1EIbDWHaxztHFZOo7do4D1Syv3FDIVCQRPxHRofuW1LBb8/p
 dMWw==
X-Gm-Message-State: AOAM533f3J6ncrYS0TQQPQ9m/jWO/29XU9b+VSIJU2PxApzUkDspEUXs
 D86xUQi1MRDsy14vHBfH5floDWUFRan8mw==
X-Google-Smtp-Source: ABdhPJw7Vj7YXUOEYFk8QUG3t07P7UK13m+uCvwGYDIkF0BqabrEZVl5hUddaO1bknXy3RZpgbJbSg==
X-Received: by 2002:a7b:c7c2:0:b0:394:18b:4220 with SMTP id
 z2-20020a7bc7c2000000b00394018b4220mr8225812wmk.118.1651156848209; 
 Thu, 28 Apr 2022 07:40:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 50/54] hw/arm/smmuv3: Cache event fault record
Date: Thu, 28 Apr 2022 15:39:54 +0100
Message-Id: <20220428143958.2451229-51-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

The Record bit in the Context Descriptor tells the SMMU to report fault
events to the event queue. Since we don't cache the Record bit at the
moment, access faults from a cached Context Descriptor are never
reported. Store the Record bit in the cached SMMUTransCfg.

Fixes: 9bde7f0674fe ("hw/arm/smmuv3: Implement translate callback")
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20220427111543.124620-1-jean-philippe@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmuv3-internal.h     |  1 -
 include/hw/arm/smmu-common.h |  1 +
 hw/arm/smmuv3.c              | 14 +++++++-------
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index d1885ae3f25..6de52bbf4da 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -387,7 +387,6 @@ typedef struct SMMUEventInfo {
     SMMUEventType type;
     uint32_t sid;
     bool recorded;
-    bool record_trans_faults;
     bool inval_ste_allowed;
     union {
         struct {
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 706be3c6d0a..21e62342e92 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -71,6 +71,7 @@ typedef struct SMMUTransCfg {
     bool disabled;             /* smmu is disabled */
     bool bypassed;             /* translation is bypassed */
     bool aborted;              /* translation is aborted */
+    bool record_faults;        /* record fault events */
     uint64_t ttb;              /* TT base address */
     uint8_t oas;               /* output address width */
     uint8_t tbi;               /* Top Byte Ignore */
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 707eb430c23..8b1d8103dc8 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -527,7 +527,7 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
         trace_smmuv3_decode_cd_tt(i, tt->tsz, tt->ttb, tt->granule_sz, tt->had);
     }
 
-    event->record_trans_faults = CD_R(cd);
+    cfg->record_faults = CD_R(cd);
 
     return 0;
 
@@ -680,7 +680,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
 
     tt = select_tt(cfg, addr);
     if (!tt) {
-        if (event.record_trans_faults) {
+        if (cfg->record_faults) {
             event.type = SMMU_EVT_F_TRANSLATION;
             event.u.f_translation.addr = addr;
             event.u.f_translation.rnw = flag & 0x1;
@@ -696,7 +696,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     if (cached_entry) {
         if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
             status = SMMU_TRANS_ERROR;
-            if (event.record_trans_faults) {
+            if (cfg->record_faults) {
                 event.type = SMMU_EVT_F_PERMISSION;
                 event.u.f_permission.addr = addr;
                 event.u.f_permission.rnw = flag & 0x1;
@@ -720,28 +720,28 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
             event.u.f_walk_eabt.addr2 = ptw_info.addr;
             break;
         case SMMU_PTW_ERR_TRANSLATION:
-            if (event.record_trans_faults) {
+            if (cfg->record_faults) {
                 event.type = SMMU_EVT_F_TRANSLATION;
                 event.u.f_translation.addr = addr;
                 event.u.f_translation.rnw = flag & 0x1;
             }
             break;
         case SMMU_PTW_ERR_ADDR_SIZE:
-            if (event.record_trans_faults) {
+            if (cfg->record_faults) {
                 event.type = SMMU_EVT_F_ADDR_SIZE;
                 event.u.f_addr_size.addr = addr;
                 event.u.f_addr_size.rnw = flag & 0x1;
             }
             break;
         case SMMU_PTW_ERR_ACCESS:
-            if (event.record_trans_faults) {
+            if (cfg->record_faults) {
                 event.type = SMMU_EVT_F_ACCESS;
                 event.u.f_access.addr = addr;
                 event.u.f_access.rnw = flag & 0x1;
             }
             break;
         case SMMU_PTW_ERR_PERMISSION:
-            if (event.record_trans_faults) {
+            if (cfg->record_faults) {
                 event.type = SMMU_EVT_F_PERMISSION;
                 event.u.f_permission.addr = addr;
                 event.u.f_permission.rnw = flag & 0x1;
-- 
2.25.1


