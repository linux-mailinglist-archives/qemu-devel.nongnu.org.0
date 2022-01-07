Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB36487B87
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:38:42 +0100 (CET)
Received: from localhost ([::1]:49288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5tCL-0007Bz-Cl
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:38:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5swB-0005HV-Iy
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:59 -0500
Received: from [2a00:1450:4864:20::42d] (port=40680
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw9-0007uT-ND
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:59 -0500
Received: by mail-wr1-x42d.google.com with SMTP id l10so12335014wrh.7
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=nrjSzW77KGQ8JhRHJTSWpfcO9Xr9m/zITVHl0Oc0V5I=;
 b=BecUOnAqsUNC528QW/iQNED+TRROnLy10QPtXJLBhbSHF/ac6QyEWB/sxBIsQ7uMrR
 wS5D54qSt820ldKspItY4dhsrISd4P4NgaawM15LJrTetELzsM9I6psZcAuapAjBsK8F
 CbG6HmkgYA2N1Sa2mGg2meK3LL7Fj5IuyvAEzO38T4zS+LA3k2Mt+Fp+q3YaFu0N5YIy
 3XkrRFKQNqGUmej0z3xmlqizhzh5AqPa7bYNk7JYn8/oeztuNoeG56pYmezOKEG4w9a5
 NemNb4dBhHbd2iwCHj+SdB31MkEn5APOB62lELYHk9SUXdva0f5fbANLKz89C+FViw/W
 md+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nrjSzW77KGQ8JhRHJTSWpfcO9Xr9m/zITVHl0Oc0V5I=;
 b=5bWnCR2JajseX0zJXfhXbqyDe33kkBd8Izfy8mTPb/d9bwF/7PkcJ+DFE680z+zgna
 NXPSU4lbfAOajbk9HoZrZ3TL8f7GAFOBB0kmpY+BwqgjAK52Fcmjj6WooO9kFuspb2q1
 1eE0lCjeM29U2quFN2RBCMpkeMiTNzPtSwF4DchQgOikxRdXu07R8/BTe1FgyT5ESuSw
 mYKMHcSE7hxBnZ6uftku3h/V8MoB2h/ZqlKZ3JP2kXSGoDMlh1UIxcVblmmMWpwn8iff
 H0EGPZBCAOqSTH8sjzt85x51pHDnRiZPlR1cPxxHa1kIY7uADF9e2u4m0yhhM7/U0fJy
 DWUQ==
X-Gm-Message-State: AOAM531T0g/T62UbSY7ysXvWYJ+OikozOLKZEkdaEFIFxBTvM/FniHVB
 ycOsikdmxdcdRa6AKT8kd+h2UQa1yTGpTw==
X-Google-Smtp-Source: ABdhPJxneAcoalAqghrdeQmrESz8vqah0JQ3iW6UCDHLngpwY7zwEuc9J0NhRY2ehPoIeU7D/h3dVw==
X-Received: by 2002:adf:d0d0:: with SMTP id z16mr8645828wrh.417.1641576113075; 
 Fri, 07 Jan 2022 09:21:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id i6sm6060219wrf.79.2022.01.07.09.21.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 09:21:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/19] hw/intc/arm_gicv3_its: Rename max_l2_entries to
 num_l2_entries
Date: Fri,  7 Jan 2022 17:21:38 +0000
Message-Id: <20220107172142.2651911-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107172142.2651911-1-peter.maydell@linaro.org>
References: <20220107172142.2651911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

In several places we have a local variable max_l2_entries which is
the number of entries which will fit in a level 2 table.  The
calculations done on this value are correct; rename it to
num_l2_entries to fit the convention we're using in this code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/arm_gicv3_its.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 95c1914eb32..fa3cdb57554 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -74,7 +74,7 @@ static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t *cte,
     uint64_t value;
     bool valid_l2t;
     uint32_t l2t_id;
-    uint32_t max_l2_entries;
+    uint32_t num_l2_entries;
 
     if (s->ct.indirect) {
         l2t_id = icid / (s->ct.page_sz / L1TABLE_ENTRY_SIZE);
@@ -88,12 +88,12 @@ static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t *cte,
             valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
 
             if (valid_l2t) {
-                max_l2_entries = s->ct.page_sz / s->ct.entry_sz;
+                num_l2_entries = s->ct.page_sz / s->ct.entry_sz;
 
                 l2t_addr = value & ((1ULL << 51) - 1);
 
                 *cte =  address_space_ldq_le(as, l2t_addr +
-                                    ((icid % max_l2_entries) * GITS_CTE_SIZE),
+                                    ((icid % num_l2_entries) * GITS_CTE_SIZE),
                                     MEMTXATTRS_UNSPECIFIED, res);
            }
        }
@@ -176,7 +176,7 @@ static uint64_t get_dte(GICv3ITSState *s, uint32_t devid, MemTxResult *res)
     uint64_t value;
     bool valid_l2t;
     uint32_t l2t_id;
-    uint32_t max_l2_entries;
+    uint32_t num_l2_entries;
 
     if (s->dt.indirect) {
         l2t_id = devid / (s->dt.page_sz / L1TABLE_ENTRY_SIZE);
@@ -190,12 +190,12 @@ static uint64_t get_dte(GICv3ITSState *s, uint32_t devid, MemTxResult *res)
             valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
 
             if (valid_l2t) {
-                max_l2_entries = s->dt.page_sz / s->dt.entry_sz;
+                num_l2_entries = s->dt.page_sz / s->dt.entry_sz;
 
                 l2t_addr = value & ((1ULL << 51) - 1);
 
                 value =  address_space_ldq_le(as, l2t_addr +
-                                   ((devid % max_l2_entries) * GITS_DTE_SIZE),
+                                   ((devid % num_l2_entries) * GITS_DTE_SIZE),
                                    MEMTXATTRS_UNSPECIFIED, res);
             }
         }
@@ -416,7 +416,7 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
     uint64_t l2t_addr;
     bool valid_l2t;
     uint32_t l2t_id;
-    uint32_t max_l2_entries;
+    uint32_t num_l2_entries;
     uint64_t cte = 0;
     MemTxResult res = MEMTX_OK;
 
@@ -450,12 +450,12 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
         valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
 
         if (valid_l2t) {
-            max_l2_entries = s->ct.page_sz / s->ct.entry_sz;
+            num_l2_entries = s->ct.page_sz / s->ct.entry_sz;
 
             l2t_addr = value & ((1ULL << 51) - 1);
 
             address_space_stq_le(as, l2t_addr +
-                                 ((icid % max_l2_entries) * GITS_CTE_SIZE),
+                                 ((icid % num_l2_entries) * GITS_CTE_SIZE),
                                  cte, MEMTXATTRS_UNSPECIFIED, &res);
         }
     } else {
@@ -521,7 +521,7 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
     uint64_t l2t_addr;
     bool valid_l2t;
     uint32_t l2t_id;
-    uint32_t max_l2_entries;
+    uint32_t num_l2_entries;
     uint64_t dte = 0;
     MemTxResult res = MEMTX_OK;
 
@@ -556,12 +556,12 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
         valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
 
         if (valid_l2t) {
-            max_l2_entries = s->dt.page_sz / s->dt.entry_sz;
+            num_l2_entries = s->dt.page_sz / s->dt.entry_sz;
 
             l2t_addr = value & ((1ULL << 51) - 1);
 
             address_space_stq_le(as, l2t_addr +
-                                 ((devid % max_l2_entries) * GITS_DTE_SIZE),
+                                 ((devid % num_l2_entries) * GITS_DTE_SIZE),
                                  dte, MEMTXATTRS_UNSPECIFIED, &res);
         }
     } else {
-- 
2.25.1


