Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BB34715B3
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:31:43 +0100 (CET)
Received: from localhost ([::1]:35568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw85r-0006Un-1P
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:31:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mo-00050m-WD
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:12:00 -0500
Received: from [2a00:1450:4864:20::435] (port=38594
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mg-0006Ff-Qz
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:55 -0500
Received: by mail-wr1-x435.google.com with SMTP id q3so20333743wru.5
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fauFLGdzeAATmDF9gAqqL5XkI2O2hmApgmwaQGRzSzw=;
 b=AlE7D7GbLHI79jzFrXAfny3wEJ7RB15j5jdR6T1DzOzG7fQOp6QBV/xup+mzbrG9BJ
 e48/T12479lqywsqNfkKE1PdU8Pqrl05oGF2roKo1Qr1ubW2lCUsaKGYGRgb9TTzBF6/
 B5HnTV6hZUcfTZnmZca5r+02j2rSUyWfpuqBhuxv0Rq72buvq4qjbKdKmi6Vd0Gjwr9O
 5GQIxzhlbwaFRFBb+YBr3FoiSVvb7bu8WvjenbFBB5iRCdFlZtpnQgTurk5qe2yRYrsw
 xASLEAYdnCNv3XykGx5IcCZeioH0UoM1rXjAdW3xeA7ajYaFTtQAzyOLDcDTd88FhnRQ
 uQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fauFLGdzeAATmDF9gAqqL5XkI2O2hmApgmwaQGRzSzw=;
 b=LlILOSRhAORFkEHcyEumFZxJrp3GaLfztAHHiyUHJWQmAC493M5xfOQCXnVi933fh+
 3uy2LJdKYs1mWKFlhzbZf3qJkIvnTfNGu+s76KD/jt8/M0GpGI5fIYhioGryA+vBkC5l
 HZIJsfNZ8qEtQhskNiB0hhUJgHRHVZCe/mA0k/LF8IyP5lu/qrDIEU9/AsIjClz5DAxy
 F9+K7cdkaktybOwKNXb8S5apgfBqhOBhSSEOnXIzNf0uZs0UIgLr0fIVK+vSdtvdjBaP
 YTeD/UtFb/Qg0fgHFJZJYmho2LCMrvYwYDkYV/RD9VUWGkr6046qneUkdR5M0RdG84rT
 CZ0A==
X-Gm-Message-State: AOAM531d0T39Q+TmRUADN3tYbtTSO5X3C3D2WmRmeS1lJ0i+0tuJRhvf
 j6vzC8ISAI3jnRQv0SaJObJNlm6AsY1pNw==
X-Google-Smtp-Source: ABdhPJx+w2Ew7zIYDVX6bR6/h8l888MDhiIcbnVWL76aui+J+KZrlze1XnJJTpCXTvPjrsiuAt2m8g==
X-Received: by 2002:a5d:5912:: with SMTP id v18mr21247343wrd.144.1639249909532; 
 Sat, 11 Dec 2021 11:11:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 15/26] hw/intc/arm_gicv3_its: Rename max_l2_entries to
 num_l2_entries
Date: Sat, 11 Dec 2021 19:11:24 +0000
Message-Id: <20211211191135.1764649-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In several places we have a local variable max_l2_entries which is
the number of entries which will fit in a level 2 table.  The
calculations done on this value are correct; rename it to
num_l2_entries to fit the convention we're using in this code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 7b50d3a29f0..e4105282b57 100644
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


