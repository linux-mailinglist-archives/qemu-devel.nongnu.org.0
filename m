Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 400B340D14B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 03:38:38 +0200 (CEST)
Received: from localhost ([::1]:46624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQgMH-0002og-9I
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 21:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mQgEO-0006qK-08; Wed, 15 Sep 2021 21:30:29 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:37862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mQgEM-0004GY-6u; Wed, 15 Sep 2021 21:30:27 -0400
Received: by mail-qv1-xf35.google.com with SMTP id a12so3197396qvz.4;
 Wed, 15 Sep 2021 18:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E4cTJhDdTLXAMtGYBMI9JgRxBriEQsQoJGfBVqvbuaw=;
 b=cRlNv3QIF8Tmc3ulS7iqqCPvpg7eymLGsvBbj0pHYVbArogoSRRuMR4d9Ea+BE8EKJ
 y77EW1iZI5NMdYm24tOwqs06Qfp6Qe+lHedklxCGWtz36JQ4hWfLb0niVCBFZvhvd4gK
 L05sFNSyh0sTJskslmKgaQVQevk804fFKzkisKW3RE3N7L5gWpwLDpCsqvxybRkImgkN
 R4XWsX/VxE5xoGnCguOY1eUNojcAlLs7F7PuRj/xYLXHr3KbP2goYuJTyWlpw0heqNFp
 kyxIwg+7Et5HffmSYOKNy8PyXrwSyGJGNevZwM2C0Am0Ksd8d2i6Bo7naKx5wN6U98jA
 CiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E4cTJhDdTLXAMtGYBMI9JgRxBriEQsQoJGfBVqvbuaw=;
 b=cKRz3eYTXr0xwCWf/tueHDlK3sVycibqN91wI3o/ACskCbSyZrOJV2osEeST7zBRbF
 tLt5BHxe75Kugw2Xy/7jbYf3DRza1hsjK6zCxgtwo543pIoEYnWb7xKBAbMGSQ5gI7+i
 N+C8eISsZyJeUYLBwZc77bjfkHbAovB1qdKdhJ/dCXy7ixu3VMEZp6BMBimsmHQXpoig
 6hkAlXQuXUrU4tukiZVdZJJeJeu+PvZ6xPw3HSRYxFFAqdVpWG6j6vcvg0lfDo8Gf9sH
 sRQI3oYUESQzZWOqRyWb0ylFgw/3+JQK8Dnc3QSEB6b+lE7OHn8boVbzsUJaqww9tIRM
 c0kQ==
X-Gm-Message-State: AOAM532M2vwp7TMIFDy/JiSHsDBHdaIGycZPX6bFETEE/OxqOm1RjYAD
 NQNQS7siOnBWiUUlKpXOgB/Uh55ilcI=
X-Google-Smtp-Source: ABdhPJzn53WZ7DsBJs0LVWbEy89R75Y362T+JXjLuEzd+nU7VzBPcwW1mA52Hwx7D0t8YcQm+J1N5Q==
X-Received: by 2002:ad4:4a93:: with SMTP id h19mr2893175qvx.41.1631755824950; 
 Wed, 15 Sep 2021 18:30:24 -0700 (PDT)
Received: from rekt.COMFAST ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id 67sm1369417qkl.1.2021.09.15.18.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 18:30:24 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 4/7] spapr_numa.c: rename numa_assoc_array to
 FORM1_assoc_array
Date: Wed, 15 Sep 2021 22:30:01 -0300
Message-Id: <20210916013004.272059-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916013004.272059-1-danielhb413@gmail.com>
References: <20210916013004.272059-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introducing a new NUMA affinity, FORM2, requires a new mechanism to
switch between affinity modes after CAS. Also, we want FORM2 data
structures and functions to be completely separated from the existing
FORM1 code, allowing us to avoid adding new code that inherits the
existing complexity of FORM1.

The idea of switching values used by the write_dt() functions in
spapr_numa.c was already introduced in the previous patch, and
the same approach will be used when dealing with the FORM1 and FORM2
arrays.

We can accomplish that by that by renaming the existing numa_assoc_array
to FORM1_assoc_array, which now is used exclusively to handle FORM1 affinity
data. A new helper get_associativity() is then introduced to be used by the
write_dt() functions to retrieve the current ibm,associativity array of
a given node, after considering affinity selection that might have been
done during CAS. All code that was using numa_assoc_array now needs to
retrieve the array by calling this function.

This will allow for an easier plug of FORM2 data later on.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_hcall.c   |  1 +
 hw/ppc/spapr_numa.c    | 38 +++++++++++++++++++++++++-------------
 include/hw/ppc/spapr.h |  2 +-
 3 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 0e9a5b2e40..9056644890 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -17,6 +17,7 @@
 #include "kvm_ppc.h"
 #include "hw/ppc/fdt.h"
 #include "hw/ppc/spapr_ovec.h"
+#include "hw/ppc/spapr_numa.h"
 #include "mmu-book3s-v3.h"
 #include "hw/mem/memory-device.h"
 
diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 1755c9d772..39f9a73429 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -48,6 +48,15 @@ static int get_vcpu_assoc_size(SpaprMachineState *spapr)
     return get_numa_assoc_size(spapr) + 1;
 }
 
+/*
+ * Retrieves the ibm,associativity array of NUMA node 'node_id'
+ * for the current NUMA affinity.
+ */
+static uint32_t *get_associativity(SpaprMachineState *spapr, int node_id)
+{
+    return spapr->FORM1_assoc_array[node_id];
+}
+
 static bool spapr_numa_is_symmetrical(MachineState *ms)
 {
     int src, dst;
@@ -126,7 +135,7 @@ static void spapr_numa_define_FORM1_domains(SpaprMachineState *spapr)
      */
     for (i = 1; i < nb_numa_nodes; i++) {
         for (j = 1; j < FORM1_DIST_REF_POINTS; j++) {
-            spapr->numa_assoc_array[i][j] = cpu_to_be32(i);
+            spapr->FORM1_assoc_array[i][j] = cpu_to_be32(i);
         }
     }
 
@@ -178,8 +187,8 @@ static void spapr_numa_define_FORM1_domains(SpaprMachineState *spapr)
              * and going up to 0x1.
              */
             for (i = n_level; i > 0; i--) {
-                assoc_src = spapr->numa_assoc_array[src][i];
-                spapr->numa_assoc_array[dst][i] = assoc_src;
+                assoc_src = spapr->FORM1_assoc_array[src][i];
+                spapr->FORM1_assoc_array[dst][i] = assoc_src;
             }
         }
     }
@@ -206,8 +215,8 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
      * 'i' will be a valid node_id set by the user.
      */
     for (i = 0; i < nb_numa_nodes; i++) {
-        spapr->numa_assoc_array[i][0] = cpu_to_be32(FORM1_DIST_REF_POINTS);
-        spapr->numa_assoc_array[i][FORM1_DIST_REF_POINTS] = cpu_to_be32(i);
+        spapr->FORM1_assoc_array[i][0] = cpu_to_be32(FORM1_DIST_REF_POINTS);
+        spapr->FORM1_assoc_array[i][FORM1_DIST_REF_POINTS] = cpu_to_be32(i);
     }
 
     /*
@@ -221,15 +230,15 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
     max_nodes_with_gpus = nb_numa_nodes + NVGPU_MAX_NUM;
 
     for (i = nb_numa_nodes; i < max_nodes_with_gpus; i++) {
-        spapr->numa_assoc_array[i][0] = cpu_to_be32(FORM1_DIST_REF_POINTS);
+        spapr->FORM1_assoc_array[i][0] = cpu_to_be32(FORM1_DIST_REF_POINTS);
 
         for (j = 1; j < FORM1_DIST_REF_POINTS; j++) {
             uint32_t gpu_assoc = smc->pre_5_1_assoc_refpoints ?
                                  SPAPR_GPU_NUMA_ID : cpu_to_be32(i);
-            spapr->numa_assoc_array[i][j] = gpu_assoc;
+            spapr->FORM1_assoc_array[i][j] = gpu_assoc;
         }
 
-        spapr->numa_assoc_array[i][FORM1_DIST_REF_POINTS] = cpu_to_be32(i);
+        spapr->FORM1_assoc_array[i][FORM1_DIST_REF_POINTS] = cpu_to_be32(i);
     }
 
     /*
@@ -261,8 +270,10 @@ void spapr_numa_associativity_init(SpaprMachineState *spapr,
 void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
                                        int offset, int nodeid)
 {
+    uint32_t *associativity = get_associativity(spapr, nodeid);
+
     _FDT((fdt_setprop(fdt, offset, "ibm,associativity",
-                      spapr->numa_assoc_array[nodeid],
+                      associativity,
                       get_numa_assoc_size(spapr) * sizeof(uint32_t))));
 }
 
@@ -272,6 +283,7 @@ static uint32_t *spapr_numa_get_vcpu_assoc(SpaprMachineState *spapr,
     int max_distance_ref_points = get_max_dist_ref_points(spapr);
     int vcpu_assoc_size = get_vcpu_assoc_size(spapr);
     uint32_t *vcpu_assoc = g_new(uint32_t, vcpu_assoc_size);
+    uint32_t *associativity = get_associativity(spapr, cpu->node_id);
     int index = spapr_get_vcpu_id(cpu);
 
     /*
@@ -282,7 +294,7 @@ static uint32_t *spapr_numa_get_vcpu_assoc(SpaprMachineState *spapr,
      */
     vcpu_assoc[0] = cpu_to_be32(max_distance_ref_points + 1);
     vcpu_assoc[vcpu_assoc_size - 1] = cpu_to_be32(index);
-    memcpy(vcpu_assoc + 1, spapr->numa_assoc_array[cpu->node_id] + 1,
+    memcpy(vcpu_assoc + 1, associativity + 1,
            (vcpu_assoc_size - 2) * sizeof(uint32_t));
 
     return vcpu_assoc;
@@ -321,10 +333,10 @@ int spapr_numa_write_assoc_lookup_arrays(SpaprMachineState *spapr, void *fdt,
     cur_index += 2;
     for (i = 0; i < nr_nodes; i++) {
         /*
-         * For the lookup-array we use the ibm,associativity array,
-         * from numa_assoc_array. without the first element (size).
+         * For the lookup-array we use the ibm,associativity array of the
+         * current NUMA affinity, without the first element (size).
          */
-        uint32_t *associativity = spapr->numa_assoc_array[i];
+        uint32_t *associativity = get_associativity(spapr, i);
         memcpy(cur_index, ++associativity,
                sizeof(uint32_t) * max_distance_ref_points);
         cur_index += max_distance_ref_points;
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 814e087e98..6b3dfc5dc2 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -249,7 +249,7 @@ struct SpaprMachineState {
     unsigned gpu_numa_id;
     SpaprTpmProxy *tpm_proxy;
 
-    uint32_t numa_assoc_array[NUMA_NODES_MAX_NUM][FORM1_NUMA_ASSOC_SIZE];
+    uint32_t FORM1_assoc_array[NUMA_NODES_MAX_NUM][FORM1_NUMA_ASSOC_SIZE];
 
     Error *fwnmi_migration_blocker;
 };
-- 
2.31.1


