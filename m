Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF68F41209E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 19:55:10 +0200 (CEST)
Received: from localhost ([::1]:58706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSNVV-0001hI-M4
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 13:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mSNQg-0001xK-5N; Mon, 20 Sep 2021 13:50:10 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:34440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mSNQd-0008V5-17; Mon, 20 Sep 2021 13:50:09 -0400
Received: by mail-qv1-xf31.google.com with SMTP id w8so5633758qvu.1;
 Mon, 20 Sep 2021 10:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PiDQQT6ZqdXBwxIl3NFs1BC3Ipyj4GbLr8G5EIo4GXQ=;
 b=UZGa0q+OUeQHeiV0v/TJZUbyjkHPitmQ319L8mb2Iij7NKVEEEGHYtRGFWCNLjyf6T
 SyPG6BPgNkU2J4SyrUZRz6UELI5PkOygScaE2W/K0EE06Nchzq+Soo+b23CFWOOGT8Y7
 3KQW5lKP+cnRbbo5/9OtckxGuLNbOTmMmX48v4WiREpMKNONcj20uJ3LMZsZFHumUezl
 mvy8XOZWRhsIQRBPrE7oyOOIS50X09NoQ4qCBowiGDwrYdnQV22hxpUHwmM+VJGCS3P1
 dNCfQiDYPV9fnlwopHom+Ip06sQ+RQpqmHQp9NDUhkpA423Jj4aJYUGmgtoh5Zz6p5Ya
 fK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PiDQQT6ZqdXBwxIl3NFs1BC3Ipyj4GbLr8G5EIo4GXQ=;
 b=7urG0a2kG8lBiN34/hlaEVGVFEXgr76znN3hoI2mc19UctcLMUAj0bDNvkfIv4tvJL
 cmRQXAE1Ga3K4ghu+lWQIe6cvzpnDKx10wo8QOtccLs3Vs1jgSJAbwKZM+2k7JYOZUJh
 /vtNHeZOlYbsDSBTS4JTbxn/1Tx6oWOowDcHTsjeYBdt0HX678RqTQ8sngk5ukmxkwaF
 g4U5F4z/v7aQOQzDEmEH5YJLtZATY1JQCSPspeA6BRz+iFVV+qnxqT3owTKgv1hzYBCv
 rR8mILYV23mddEECKQJGMcpEZq5spSVhRKcx0mHBYNefBctVFrpj+MrQMOi7KpkrcQL1
 F90A==
X-Gm-Message-State: AOAM532m78ebR6x5oushqeFNgZ5l3wKw56oth1thix+jQHHpd3cC5gAH
 ZFWt81lPNbDgkkyON5b4nMGnJkqk7cQ=
X-Google-Smtp-Source: ABdhPJx1SJ/BpLGlkH1N1kqY3TfhWwunUc0SoM9OCIi3g5tjM2hVQy9Iyk9o2J47xapIr017gQmeeA==
X-Received: by 2002:ad4:456e:: with SMTP id o14mr26667590qvu.15.1632160205618; 
 Mon, 20 Sep 2021 10:50:05 -0700 (PDT)
Received: from rekt.COMFAST ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id l28sm6073614qkl.127.2021.09.20.10.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 10:50:05 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 4/7] spapr_numa.c: rename numa_assoc_array to
 FORM1_assoc_array
Date: Mon, 20 Sep 2021 14:49:44 -0300
Message-Id: <20210920174947.556324-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920174947.556324-1-danielhb413@gmail.com>
References: <20210920174947.556324-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf31.google.com
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
index 08e2d6aed8..dce9ce987a 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -46,6 +46,15 @@ static int get_vcpu_assoc_size(SpaprMachineState *spapr)
     return get_numa_assoc_size(spapr) + 1;
 }
 
+/*
+ * Retrieves the ibm,associativity array of NUMA node 'node_id'
+ * for the current NUMA affinity.
+ */
+static const uint32_t *get_associativity(SpaprMachineState *spapr, int node_id)
+{
+    return spapr->FORM1_assoc_array[node_id];
+}
+
 static bool spapr_numa_is_symmetrical(MachineState *ms)
 {
     int src, dst;
@@ -124,7 +133,7 @@ static void spapr_numa_define_FORM1_domains(SpaprMachineState *spapr)
      */
     for (i = 1; i < nb_numa_nodes; i++) {
         for (j = 1; j < FORM1_DIST_REF_POINTS; j++) {
-            spapr->numa_assoc_array[i][j] = cpu_to_be32(i);
+            spapr->FORM1_assoc_array[i][j] = cpu_to_be32(i);
         }
     }
 
@@ -176,8 +185,8 @@ static void spapr_numa_define_FORM1_domains(SpaprMachineState *spapr)
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
@@ -204,8 +213,8 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
      * 'i' will be a valid node_id set by the user.
      */
     for (i = 0; i < nb_numa_nodes; i++) {
-        spapr->numa_assoc_array[i][0] = cpu_to_be32(FORM1_DIST_REF_POINTS);
-        spapr->numa_assoc_array[i][FORM1_DIST_REF_POINTS] = cpu_to_be32(i);
+        spapr->FORM1_assoc_array[i][0] = cpu_to_be32(FORM1_DIST_REF_POINTS);
+        spapr->FORM1_assoc_array[i][FORM1_DIST_REF_POINTS] = cpu_to_be32(i);
     }
 
     /*
@@ -219,15 +228,15 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
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
@@ -259,14 +268,17 @@ void spapr_numa_associativity_init(SpaprMachineState *spapr,
 void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
                                        int offset, int nodeid)
 {
+    const uint32_t *associativity = get_associativity(spapr, nodeid);
+
     _FDT((fdt_setprop(fdt, offset, "ibm,associativity",
-                      spapr->numa_assoc_array[nodeid],
+                      associativity,
                       get_numa_assoc_size(spapr) * sizeof(uint32_t))));
 }
 
 static uint32_t *spapr_numa_get_vcpu_assoc(SpaprMachineState *spapr,
                                            PowerPCCPU *cpu)
 {
+    const uint32_t *associativity = get_associativity(spapr, cpu->node_id);
     int max_distance_ref_points = get_max_dist_ref_points(spapr);
     int vcpu_assoc_size = get_vcpu_assoc_size(spapr);
     uint32_t *vcpu_assoc = g_new(uint32_t, vcpu_assoc_size);
@@ -280,7 +292,7 @@ static uint32_t *spapr_numa_get_vcpu_assoc(SpaprMachineState *spapr,
      */
     vcpu_assoc[0] = cpu_to_be32(max_distance_ref_points + 1);
     vcpu_assoc[vcpu_assoc_size - 1] = cpu_to_be32(index);
-    memcpy(vcpu_assoc + 1, spapr->numa_assoc_array[cpu->node_id] + 1,
+    memcpy(vcpu_assoc + 1, associativity + 1,
            (vcpu_assoc_size - 2) * sizeof(uint32_t));
 
     return vcpu_assoc;
@@ -319,10 +331,10 @@ int spapr_numa_write_assoc_lookup_arrays(SpaprMachineState *spapr, void *fdt,
     cur_index += 2;
     for (i = 0; i < nr_nodes; i++) {
         /*
-         * For the lookup-array we use the ibm,associativity array,
-         * from numa_assoc_array. without the first element (size).
+         * For the lookup-array we use the ibm,associativity array of the
+         * current NUMA affinity, without the first element (size).
          */
-        uint32_t *associativity = spapr->numa_assoc_array[i];
+        const uint32_t *associativity = get_associativity(spapr, i);
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


