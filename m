Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A025B68AF20
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 10:48:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObaD-0003lC-RB; Sun, 05 Feb 2023 04:45:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3nnrfYwgKCjclfhlmTYTZhhZeX.VhfjXfn-WXoXeghgZgn.hkZ@flex--smostafa.bounces.google.com>)
 id 1pOba8-0003gv-1A
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:45:08 -0500
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3nnrfYwgKCjclfhlmTYTZhhZeX.VhfjXfn-WXoXeghgZgn.hkZ@flex--smostafa.bounces.google.com>)
 id 1pOba6-0001B5-1v
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:45:07 -0500
Received: by mail-wm1-x34a.google.com with SMTP id
 d14-20020a05600c34ce00b003dd07ce79c8so5014627wmq.1
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 01:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=oZmVbGTM1GrVSDIJ7xJyWQW2x7fLoxHdZgxSqMELtoo=;
 b=Fi2u5moWNgChc+gmWxLvDu2+LkatRAoQchz3NaL2TVwS8jNEPy/RJuGR4js5jsknEY
 DHTq2IPjiP+po/Uul3CGDkIKAdKH9wJ2XYgkZ4g4rthAH4CvR6MCrG7h2YDqRLEbeqz7
 ZsuUN2dk2Qg1aMcTx5+4ZFS7y21zWJuGHaSQHZQSDJPERqN/JAtDwKiPn1w9nWwub2zP
 uCJQw42GVc8xkJBz+Bw+TJQZDGSBExy7BHphfLd0vGRtGOb2Tp1a6WtsiU1NHlW3m10x
 vkkKmpGrRo2Jvg4QvEX6+hTqNZ59oJZMjtzX3mmmeYDgDtmu6AKzopHT9MRT357+OLuo
 Ih1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oZmVbGTM1GrVSDIJ7xJyWQW2x7fLoxHdZgxSqMELtoo=;
 b=UJJ3WJjfAPux6AjashC8GoR7CvDwLZ6nIzGQczkqabQwF5DFEoXJyX4wPZddxWszDk
 8hlt2TjkWdkgJeis3Pks3/g0mZwvaG6XXlLMZ9m2ukmzTAB9gIYuW3EHeg+AC5HHcDFy
 33XpZV8842fCcrBXfp30dptqKD+463GlSP3nRd602t/Jbo9dtuXUJfgrRaBJSzjerDlO
 gvY/fSQEKrYIofiKNTWkbxVGYVZZQiBbcvn/KlU1T30D42jJGnEuU80IjUcuqHlpkcL+
 FScCdXhO9IGf74MT9iu3CFOMurqUh46c5NfstHhZKFxifJWpJ6OIDqjNcE2tjoRkoCa8
 Gk/A==
X-Gm-Message-State: AO0yUKVfu9hZ168VD3e2qynL7kIik+clqpanSKhP5VFDSg49oqOLh8UV
 2eXYYQqoNh3bESagX5pe4xlSjzFfMVrwzIyC8DFumv3txv7uPqctaQxMwVt2AILuOBXPey52xuU
 eVK2nNL51tuzoN8mVBHWxVH6bOdxhLTU0Wc5qtXQZ//wpzeJQIUXfrZwtliz4zyN2rA==
X-Google-Smtp-Source: AK7set8m3ASYFm6Pb82s1XECENuieouCOanbKv0i+B9tyMgvh/7LytUp9CoEpcHbp90HDp++aoH6yIqaAQKpBA==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:198f:b0:3dc:58f0:e94d with SMTP
 id t15-20020a05600c198f00b003dc58f0e94dmr686402wmq.30.1675590302357; Sun, 05
 Feb 2023 01:45:02 -0800 (PST)
Date: Sun,  5 Feb 2023 09:44:02 +0000
In-Reply-To: <20230205094411.793816-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230205094411.793816-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230205094411.793816-8-smostafa@google.com>
Subject: [RFC PATCH 07/16] hw/arm/smmuv3: Check validity of stage-2 page table
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::34a;
 envelope-from=3nnrfYwgKCjclfhlmTYTZhhZeX.VhfjXfn-WXoXeghgZgn.hkZ@flex--smostafa.bounces.google.com;
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

Check if with the configured start level, ia_bits and granularity we
can have a valid page table as described in ARM ARM D8.2 Translation
process.
The idea is to see for the highest possible number of IPA bits, how
many concatenated tables we would need, if it is more than 16, then
this is not possible.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 6633fe40fa..c49b341287 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -341,6 +341,28 @@ static int smmu_get_cd(SMMUv3State *s, STE *ste, uint32_t ssid,
     return 0;
 }
 
+/*
+ * Return true if s2 page table config is valid.
+ * This checks with the configured start level, ia_bits and granularity we can
+ * have a valid page table as described in ARM ARM D8.2 Translation process.
+ * The idea here is to see for the highest possible number of IPA bits, how
+ * many concatenated tables we would need, if it is more than 16, then this is
+ * not possible.
+ */
+static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
+{
+    int level = get_start_level(sl0, gran);
+    uint64_t ia_bits = 64 - t0sz;
+    uint64_t mx = (1ULL << ia_bits) - 1;
+    int nr_concat = pgd_idx(level, gran, mx) + 1;
+
+    if (nr_concat > SMMU_MAX_S2_CONCAT) {
+        return false;
+    }
+
+    return true;
+}
+
 /* Returns < 0 in case of invalid STE, 0 otherwise */
 static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
                       STE *ste, SMMUEventInfo *event)
@@ -407,6 +429,13 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
             goto bad_ste;
         }
 
+        if (!s2_pgtable_config_valid(cfg->s2cfg.sl0, cfg->s2cfg.tsz,
+                                     cfg->s2cfg.granule_sz)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "SMMUv3 STE stage 2 config not valid!\n");
+            goto bad_ste;
+        }
+
         /* This is still here as stage 2 has not been fully enabled yet. */
         qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
         goto bad_ste;
-- 
2.39.1.519.gcb327c4b5f-goog


