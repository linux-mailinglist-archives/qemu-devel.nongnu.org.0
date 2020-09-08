Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FB7260A1C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 07:33:48 +0200 (CEST)
Received: from localhost ([::1]:37190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFWGJ-0007Ot-Lu
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 01:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kFW3r-0006tK-Pv; Tue, 08 Sep 2020 01:20:56 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37349 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kFW3p-00065x-V7; Tue, 08 Sep 2020 01:20:55 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Bltkv6Jmkz9sW3; Tue,  8 Sep 2020 15:20:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1599542407;
 bh=lcJl+18AADR+U6YFsMe0OcdCykc44CX/5zvHrK7DkR0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c7fm2uoGpER5oD+5kN4oiYuUgUujuUiQzjS8ANiV0JKND+E8u5wF6KEEpu0H3Hmri
 RjvAv47gXLkkZqDYLUCTfDnjOqI7VjDeh1+wDZWL+4/wgZ7rNxfgwYPC1Hc156L3kR
 vDgzLWeLyjCoXonqHwZ5raVeudkm6v4T4pekmPPc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 26/33] ppc/spapr_nvdimm: turn spapr_dt_nvdimm() static
Date: Tue,  8 Sep 2020 15:19:46 +1000
Message-Id: <20200908051953.1616885-27-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200908051953.1616885-1-david@gibson.dropbear.id.au>
References: <20200908051953.1616885-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 01:19:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, bauerman@linux.ibm.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

This function is only used inside spapr_nvdimm.c.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20200901125645.118026-3-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_nvdimm.c         | 22 +++++++++++-----------
 include/hw/ppc/spapr_nvdimm.h |  1 -
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index 95cbc30528..5188e2f503 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -106,16 +106,6 @@ void spapr_add_nvdimm(DeviceState *dev, uint64_t slot, Error **errp)
     }
 }
 
-int spapr_pmem_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
-                           void *fdt, int *fdt_start_offset, Error **errp)
-{
-    NVDIMMDevice *nvdimm = NVDIMM(drc->dev);
-
-    *fdt_start_offset = spapr_dt_nvdimm(fdt, 0, nvdimm);
-
-    return 0;
-}
-
 void spapr_create_nvdimm_dr_connectors(SpaprMachineState *spapr)
 {
     MachineState *machine = MACHINE(spapr);
@@ -127,7 +117,7 @@ void spapr_create_nvdimm_dr_connectors(SpaprMachineState *spapr)
 }
 
 
-int spapr_dt_nvdimm(void *fdt, int parent_offset,
+static int spapr_dt_nvdimm(void *fdt, int parent_offset,
                            NVDIMMDevice *nvdimm)
 {
     int child_offset;
@@ -184,6 +174,16 @@ int spapr_dt_nvdimm(void *fdt, int parent_offset,
     return child_offset;
 }
 
+int spapr_pmem_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
+                           void *fdt, int *fdt_start_offset, Error **errp)
+{
+    NVDIMMDevice *nvdimm = NVDIMM(drc->dev);
+
+    *fdt_start_offset = spapr_dt_nvdimm(fdt, 0, nvdimm);
+
+    return 0;
+}
+
 void spapr_dt_persistent_memory(void *fdt)
 {
     int offset = fdt_subnode_offset(fdt, 0, "persistent-memory");
diff --git a/include/hw/ppc/spapr_nvdimm.h b/include/hw/ppc/spapr_nvdimm.h
index fd1736634c..10a6d9dbbc 100644
--- a/include/hw/ppc/spapr_nvdimm.h
+++ b/include/hw/ppc/spapr_nvdimm.h
@@ -27,7 +27,6 @@ QEMU_BUILD_BUG_ON(SPAPR_MINIMUM_SCM_BLOCK_SIZE % SPAPR_MEMORY_BLOCK_SIZE);
 
 int spapr_pmem_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
                            void *fdt, int *fdt_start_offset, Error **errp);
-int spapr_dt_nvdimm(void *fdt, int parent_offset, NVDIMMDevice *nvdimm);
 void spapr_dt_persistent_memory(void *fdt);
 void spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
                            uint64_t size, Error **errp);
-- 
2.26.2


