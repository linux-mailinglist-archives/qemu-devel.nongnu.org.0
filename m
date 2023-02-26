Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2DF6A3467
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 23:09:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWPAr-0002Rm-0u; Sun, 26 Feb 2023 17:07:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3DNj7YwgKCtEF9BFGx2x3BB381.zB9D19H-01I18ABA3AH.BE3@flex--smostafa.bounces.google.com>)
 id 1pWPAm-0002PV-FD
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:07:13 -0500
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3DNj7YwgKCtEF9BFGx2x3BB381.zB9D19H-01I18ABA3AH.BE3@flex--smostafa.bounces.google.com>)
 id 1pWPAk-0003uX-3A
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:07:11 -0500
Received: by mail-wm1-x349.google.com with SMTP id
 n15-20020a05600c500f00b003dd07ce79c8so2108306wmr.1
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 14:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=ZaWmgGAGcYO7s+WalFe3/fZGOIM7AA9SlREYy/ajjq4=;
 b=NBqcJShOSxQ/UQmkRU6bJnOnEXEWhqf8mQoMImMBLdEGbXNQZbYG9zoygxxpzQ9Ztw
 5MMFgPAPxEGvvTlbisSDDnKTrGEeRtezPtjlDz9hiMowmAk0Ts2OVZ3cYorqhpfi8IC/
 Dwbkrj624sv9/HmRd/Ky+JHaqLMp6HLMwalQ8jdxXPy0HwowX6I9RyMnvdlI3i35Xt6J
 usaKo7Wuq/v/f/uY6jryFh3oInOznIHkfqF4ltk8xEVckC4ckt1ZhzCXy5eY+NO7vy0b
 7H2v5/mY1PkRmXi2aBwrYnC3gBuL4Xiwe5Zl7URNQrOaajw++V7z3rDyDzaTWUstGqA4
 +pNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ZaWmgGAGcYO7s+WalFe3/fZGOIM7AA9SlREYy/ajjq4=;
 b=0pUIdwbOd5nsycNtSv1mh7x4iN/5AEPF8d01S/BYXC2qBkeaz4NsCowL4ZKscADvGt
 RiSR2ySRn4pMd46wjzGFprl902rAGXu04OkZ018XRTK9jofE/DlWIgvKWKy8rlcag965
 +A1wjEnB6LBEO5dnnRBg7ebMYepGHAdfLbu+H1a7y8ggHBoh+V+blTV79iLbwOZT+GtA
 FlacwGeWg8lzwUmCWFMvLcyuE5u4Tnub7oZdRfCgw0NqhMMC/CawmX11icsbiG6sPgQC
 yLSNLLE3z1FNEU5MfG71bwn1gxME2tDwkIX3tYgubmpaUpXhyp27rDS6Ph/reVqd1MM7
 uJXw==
X-Gm-Message-State: AO0yUKUhShRSCVBhSFMKi7XrsMvPKkSPWmV6+qChEeSow2PpTVzN5B8r
 rfxzSVFfSxKD6znLkarP7vSlWU7jNpx1j1P4b+df3gxDSh09CGK8bf2JwXKavEEMGk0jbkH9I58
 eYZAD8CJTrMOjTUG1A/jgU4fWlPM6H6UEl2MO1cgpWGYNQliR9Y93+ka1nNLElWoRZA==
X-Google-Smtp-Source: AK7set8MVo/bRrmCFaC0mI5xI/ESDfS4dJcTgeiN1HL9MPVVxI2TFBZyhAb66NwSkCAstozm7DNZo5295FAlig==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:1c95:b0:3eb:3998:8bed with SMTP
 id k21-20020a05600c1c9500b003eb39988bedmr1094347wms.1.1677449228069; Sun, 26
 Feb 2023 14:07:08 -0800 (PST)
Date: Sun, 26 Feb 2023 22:06:42 +0000
In-Reply-To: <20230226220650.1480786-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230226220650.1480786-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Message-ID: <20230226220650.1480786-4-smostafa@google.com>
Subject: [RFC PATCH v2 03/11] hw/arm/smmuv3: Refactor stage-1 PTW
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3DNj7YwgKCtEF9BFGx2x3BB381.zB9D19H-01I18ABA3AH.BE3@flex--smostafa.bounces.google.com;
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

In preparation for adding stage-2 support, rename smmu_ptw_64 to
smmu_ptw_64_s1 and refactor some of the code so it can be reused in
stage-2 page table walk.

Remove AA64 check from PTW as decode_cd already ensures that AA64 is
used, otherwise it faults with C_BAD_CD.

A stage member is added to SMMUPTWEventInfo to differentiate
between stage-1 and stage-2 ptw faults.

Add stage argument to trace_smmu_ptw_level be consistent with other
trace events.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
Changes in v2:
- Refactor common functions to be use in stage-2.
- Add stage to SMMUPTWEventInfo.
- Remove AA64 check.
---
 hw/arm/smmu-common.c         | 27 ++++++++++-----------------
 hw/arm/smmuv3.c              |  2 ++
 hw/arm/trace-events          |  2 +-
 include/hw/arm/smmu-common.h | 15 ++++++++++++---
 4 files changed, 25 insertions(+), 21 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 0a5a60ca1e..b49c1affdb 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -264,7 +264,7 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_ad=
dr_t iova)
 }
=20
 /**
- * smmu_ptw_64 - VMSAv8-64 Walk of the page tables for a given IOVA
+ * smmu_ptw_64_s1 - VMSAv8-64 Walk of the page tables for a given IOVA
  * @cfg: translation config
  * @iova: iova to translate
  * @perm: access type
@@ -276,9 +276,9 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_ad=
dr_t iova)
  * Upon success, @tlbe is filled with translated_addr and entry
  * permission rights.
  */
-static int smmu_ptw_64(SMMUTransCfg *cfg,
-                       dma_addr_t iova, IOMMUAccessFlags perm,
-                       SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
+static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
+                          dma_addr_t iova, IOMMUAccessFlags perm,
+                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
 {
     dma_addr_t baseaddr, indexmask;
     int stage =3D cfg->stage;
@@ -291,14 +291,14 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
     }
=20
     granule_sz =3D tt->granule_sz;
-    stride =3D granule_sz - 3;
+    stride =3D SMMU_STRIDE(granule_sz);
     inputsize =3D 64 - tt->tsz;
     level =3D 4 - (inputsize - 4) / stride;
-    indexmask =3D (1ULL << (inputsize - (stride * (4 - level)))) - 1;
+    indexmask =3D SMMU_IDXMSK(inputsize, stride, level);
     baseaddr =3D extract64(tt->ttb, 0, 48);
     baseaddr &=3D ~indexmask;
=20
-    while (level <=3D 3) {
+    while (level < SMMU_LEVELS) {
         uint64_t subpage_size =3D 1ULL << level_shift(level, granule_sz);
         uint64_t mask =3D subpage_size - 1;
         uint32_t offset =3D iova_level_offset(iova, inputsize, level, gran=
ule_sz);
@@ -309,7 +309,7 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
         if (get_pte(baseaddr, offset, &pte, info)) {
                 goto error;
         }
-        trace_smmu_ptw_level(level, iova, subpage_size,
+        trace_smmu_ptw_level(stage, level, iova, subpage_size,
                              baseaddr, offset, pte);
=20
         if (is_invalid_pte(pte) || is_reserved_pte(pte, level)) {
@@ -358,6 +358,7 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
     info->type =3D SMMU_PTW_ERR_TRANSLATION;
=20
 error:
+    info->stage =3D 1;
     tlbe->entry.perm =3D IOMMU_NONE;
     return -EINVAL;
 }
@@ -376,15 +377,7 @@ error:
 int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
              SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
 {
-    if (!cfg->aa64) {
-        /*
-         * This code path is not entered as we check this while decoding
-         * the configuration data in the derived SMMU model.
-         */
-        g_assert_not_reached();
-    }
-
-    return smmu_ptw_64(cfg, iova, perm, tlbe, info);
+    return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
 }
=20
 /**
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 270c80b665..4e90343996 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -716,6 +716,8 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion=
 *mr, hwaddr addr,
     cached_entry =3D g_new0(SMMUTLBEntry, 1);
=20
     if (smmu_ptw(cfg, aligned_addr, flag, cached_entry, &ptw_info)) {
+        /* All faults from PTW has S2 field. */
+        event.u.f_walk_eabt.s2 =3D (ptw_info.stage =3D=3D 2);
         g_free(cached_entry);
         switch (ptw_info.type) {
         case SMMU_PTW_ERR_WALK_EABT:
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 2dee296c8f..205ac04573 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -5,7 +5,7 @@ virt_acpi_setup(void) "No fw cfg or ACPI disabled. Bailing =
out."
=20
 # smmu-common.c
 smmu_add_mr(const char *name) "%s"
-smmu_ptw_level(int level, uint64_t iova, size_t subpage_size, uint64_t bas=
eaddr, uint32_t offset, uint64_t pte) "level=3D%d iova=3D0x%"PRIx64" subpag=
e_sz=3D0x%zx baseaddr=3D0x%"PRIx64" offset=3D%d =3D> pte=3D0x%"PRIx64
+smmu_ptw_level(int stage, int level, uint64_t iova, size_t subpage_size, u=
int64_t baseaddr, uint32_t offset, uint64_t pte) "stage=3D%d level=3D%d iov=
a=3D0x%"PRIx64" subpage_sz=3D0x%zx baseaddr=3D0x%"PRIx64" offset=3D%d =3D> =
pte=3D0x%"PRIx64
 smmu_ptw_invalid_pte(int stage, int level, uint64_t baseaddr, uint64_t pte=
addr, uint32_t offset, uint64_t pte) "stage=3D%d level=3D%d base@=3D0x%"PRI=
x64" pte@=3D0x%"PRIx64" offset=3D%d pte=3D0x%"PRIx64
 smmu_ptw_page_pte(int stage, int level,  uint64_t iova, uint64_t baseaddr,=
 uint64_t pteaddr, uint64_t pte, uint64_t address) "stage=3D%d level=3D%d i=
ova=3D0x%"PRIx64" base@=3D0x%"PRIx64" pte@=3D0x%"PRIx64" pte=3D0x%"PRIx64" =
page address =3D 0x%"PRIx64
 smmu_ptw_block_pte(int stage, int level, uint64_t baseaddr, uint64_t ptead=
dr, uint64_t pte, uint64_t iova, uint64_t gpa, int bsize_mb) "stage=3D%d le=
vel=3D%d base@=3D0x%"PRIx64" pte@=3D0x%"PRIx64" pte=3D0x%"PRIx64" iova=3D0x=
%"PRIx64" block address =3D 0x%"PRIx64" block size =3D %d MiB"
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 2deead08d6..1ada792122 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -23,9 +23,17 @@
 #include "hw/pci/pci.h"
 #include "qom/object.h"
=20
-#define SMMU_PCI_BUS_MAX      256
-#define SMMU_PCI_DEVFN_MAX    256
-#define SMMU_PCI_DEVFN(sid)   (sid & 0xFF)
+#define SMMU_PCI_BUS_MAX                    256
+#define SMMU_PCI_DEVFN_MAX                  256
+#define SMMU_PCI_DEVFN(sid)                 (sid & 0xFF)
+
+#define SMMU_LEVELS                         4
+
+#define SMMU_STRIDE(gran)                   ((gran) - SMMU_LEVELS + 1)
+#define SMMU_BIT_LVL(isz, strd, lvl)        ((isz) - (strd) * \
+                                             (SMMU_LEVELS - (lvl)))
+#define SMMU_IDXMSK(isz, strd, lvl)         ((1ULL << \
+                                             SMMU_BIT_LVL(isz, strd, lvl))=
 - 1)
=20
 /*
  * Page table walk error types
@@ -40,6 +48,7 @@ typedef enum {
 } SMMUPTWEventType;
=20
 typedef struct SMMUPTWEventInfo {
+    int stage;
     SMMUPTWEventType type;
     dma_addr_t addr; /* fetched address that induced an abort, if any */
 } SMMUPTWEventInfo;
--=20
2.39.2.637.g21b0678d19-goog


