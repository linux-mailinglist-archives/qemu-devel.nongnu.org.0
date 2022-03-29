Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D874EA85B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 09:11:47 +0200 (CEST)
Received: from localhost ([::1]:33216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ614-0004E1-HT
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 03:11:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nZ5xQ-0002FA-LG
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 03:08:00 -0400
Received: from mga02.intel.com ([134.134.136.20]:60313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nZ5xO-0001Qy-1M
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 03:08:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648537678; x=1680073678;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=MTro/xVwIOfdQU2A6fMwa8zFgGtg+nX49zdddmArdP0=;
 b=NUQZiPiwYdcCOOmTaoH6pz/rO+MLZiYyVLPLRZU6MMZFSmlUifzxakk2
 3mF+sHQCd58qscV5ymnlIltibkWaLPW/ImYFws1s4ilKLgSzrtqefcosf
 wQ93qdxR7JtRMG+HSh3YC+C/+IgK/8RXvTA+NyWSeC8azGhrpBbDjX6vH
 NJKVv90aMwyOmJb5Mb549hzpXtURe6OocZQ2qZupuhdpsxKecjb82rB40
 5AviM6Te1ul8AYlrK1Oa8C8TAPhhNRqh2thA3wwGDmquE9vuuUG9W99H0
 gioB6avxeTqw1fuxcHsUzikuoRErDr8q+Y6XMIZWE2kqm/3xZP50EA22L Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="246669462"
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="246669462"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 00:07:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="502789440"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga003.jf.intel.com with ESMTP; 29 Mar 2022 00:07:53 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: xiaoguangrong.eric@gmail.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, qemu-devel@nongnu.org
Subject: [PATCH 1/2] NVDIMM: rename NVDIMM::label_size to NVDIMM::lsa_size
Date: Tue, 29 Mar 2022 15:07:42 +0800
Message-Id: <1648537663-126032-2-git-send-email-robert.hu@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648537663-126032-1-git-send-email-robert.hu@linux.intel.com>
References: <1648537663-126032-1-git-send-email-robert.hu@linux.intel.com>
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=robert.hu@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jingqi.liu@intel.com, dan.j.williams@intel.com,
 Robert Hoo <robert.hu@linux.intel.com>, robert.hu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per recent spec[1], change struct NVDIMMDevice::label_size semanteme to
describe the label's size in LSA (Label Storage Area). Instead, use new
'lsa_size' for the total size of LSA.

[1]: UEFI spec v2.9, "Label Storage Area Description" in section 13.19.

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
Reviewed-by: Liu, Jingqi <jingqi.liu@intel.com>
---
 docs/nvdimm.txt         |  4 ++--
 hw/acpi/nvdimm.c        | 14 +++++++-------
 hw/mem/nvdimm.c         | 22 +++++++++++-----------
 include/hw/mem/nvdimm.h |  4 ++--
 4 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/docs/nvdimm.txt b/docs/nvdimm.txt
index fd7773dc5a..90f7451646 100644
--- a/docs/nvdimm.txt
+++ b/docs/nvdimm.txt
@@ -90,9 +90,9 @@ Label
 
 QEMU v2.7.0 and later implement the label support for vNVDIMM devices.
 To enable label on vNVDIMM devices, users can simply add
-"label-size=$SZ" option to "-device nvdimm", e.g.
+"lsa-size=$SZ" option to "-device nvdimm", e.g.
 
- -device nvdimm,id=nvdimm1,memdev=mem1,label-size=128K
+ -device nvdimm,id=nvdimm1,memdev=mem1,lsa-size=128K
 
 Note:
 
diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 0d43da19ea..86de7baac7 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -655,7 +655,7 @@ static void nvdimm_dsm_label_size(NVDIMMDevice *nvdimm, hwaddr dsm_mem_addr)
     };
     uint32_t label_size, mxfer;
 
-    label_size = nvdimm->label_size;
+    label_size = nvdimm->lsa_size;
     mxfer = nvdimm_get_max_xfer_label_size();
 
     nvdimm_debug("label_size 0x%x, max_xfer 0x%x.\n", label_size, mxfer);
@@ -679,9 +679,9 @@ static uint32_t nvdimm_rw_label_data_check(NVDIMMDevice *nvdimm,
         return ret;
     }
 
-    if (nvdimm->label_size < offset + length) {
+    if (nvdimm->lsa_size < offset + length) {
         nvdimm_debug("position 0x%x is beyond label data (len = %" PRIx64 ").\n",
-                     offset + length, nvdimm->label_size);
+                     offset + length, nvdimm->lsa_size);
         return ret;
     }
 
@@ -775,7 +775,7 @@ static void nvdimm_dsm_device(NvdimmDsmIn *in, hwaddr dsm_mem_addr)
     if (!in->function) {
         uint32_t supported_func = 0;
 
-        if (nvdimm && nvdimm->label_size) {
+        if (nvdimm && nvdimm->lsa_size) {
             supported_func |= 0x1 /* Bit 0 indicates whether there is
                                      support for any functions other
                                      than function 0. */ |
@@ -796,19 +796,19 @@ static void nvdimm_dsm_device(NvdimmDsmIn *in, hwaddr dsm_mem_addr)
     /* Encode DSM function according to DSM Spec Rev1. */
     switch (in->function) {
     case 4 /* Get Namespace Label Size */:
-        if (nvdimm->label_size) {
+        if (nvdimm->lsa_size) {
             nvdimm_dsm_label_size(nvdimm, dsm_mem_addr);
             return;
         }
         break;
     case 5 /* Get Namespace Label Data */:
-        if (nvdimm->label_size) {
+        if (nvdimm->lsa_size) {
             nvdimm_dsm_get_label_data(nvdimm, in, dsm_mem_addr);
             return;
         }
         break;
     case 0x6 /* Set Namespace Label Data */:
-        if (nvdimm->label_size) {
+        if (nvdimm->lsa_size) {
             nvdimm_dsm_set_label_data(nvdimm, in, dsm_mem_addr);
             return;
         }
diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
index 7c7d777781..72cd3041ef 100644
--- a/hw/mem/nvdimm.c
+++ b/hw/mem/nvdimm.c
@@ -32,16 +32,16 @@
 #include "hw/mem/memory-device.h"
 #include "sysemu/hostmem.h"
 
-static void nvdimm_get_label_size(Object *obj, Visitor *v, const char *name,
+static void nvdimm_get_lsa_size(Object *obj, Visitor *v, const char *name,
                                   void *opaque, Error **errp)
 {
     NVDIMMDevice *nvdimm = NVDIMM(obj);
-    uint64_t value = nvdimm->label_size;
+    uint64_t value = nvdimm->lsa_size;
 
     visit_type_size(v, name, &value, errp);
 }
 
-static void nvdimm_set_label_size(Object *obj, Visitor *v, const char *name,
+static void nvdimm_set_lsa_size(Object *obj, Visitor *v, const char *name,
                                   void *opaque, Error **errp)
 {
     NVDIMMDevice *nvdimm = NVDIMM(obj);
@@ -62,7 +62,7 @@ static void nvdimm_set_label_size(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    nvdimm->label_size = value;
+    nvdimm->lsa_size = value;
 }
 
 static void nvdimm_get_uuid(Object *obj, Visitor *v, const char *name,
@@ -99,8 +99,8 @@ static void nvdimm_set_uuid(Object *obj, Visitor *v, const char *name,
 
 static void nvdimm_init(Object *obj)
 {
-    object_property_add(obj, NVDIMM_LABEL_SIZE_PROP, "int",
-                        nvdimm_get_label_size, nvdimm_set_label_size, NULL,
+    object_property_add(obj, NVDIMM_LSA_SIZE_PROP, "int",
+                        nvdimm_get_lsa_size, nvdimm_set_lsa_size, NULL,
                         NULL);
 
     object_property_add(obj, NVDIMM_UUID_PROP, "QemuUUID", nvdimm_get_uuid,
@@ -131,18 +131,18 @@ static void nvdimm_prepare_memory_region(NVDIMMDevice *nvdimm, Error **errp)
     align = memory_region_get_alignment(mr);
     size = memory_region_size(mr);
 
-    pmem_size = size - nvdimm->label_size;
+    pmem_size = size - nvdimm->lsa_size;
     nvdimm->label_data = memory_region_get_ram_ptr(mr) + pmem_size;
     pmem_size = QEMU_ALIGN_DOWN(pmem_size, align);
 
-    if (size <= nvdimm->label_size || !pmem_size) {
+    if (size <= nvdimm->lsa_size || !pmem_size) {
         HostMemoryBackend *hostmem = dimm->hostmem;
 
         error_setg(errp, "the size of memdev %s (0x%" PRIx64 ") is too "
                    "small to contain nvdimm label (0x%" PRIx64 ") and "
                    "aligned PMEM (0x%" PRIx64 ")",
                    object_get_canonical_path_component(OBJECT(hostmem)),
-                   memory_region_size(mr), nvdimm->label_size, align);
+                   memory_region_size(mr), nvdimm->lsa_size, align);
         return;
     }
 
@@ -209,7 +209,7 @@ static void nvdimm_unrealize(PCDIMMDevice *dimm)
 static void nvdimm_validate_rw_label_data(NVDIMMDevice *nvdimm, uint64_t size,
                                         uint64_t offset)
 {
-    assert((nvdimm->label_size >= size + offset) && (offset + size > offset));
+    assert((nvdimm->lsa_size >= size + offset) && (offset + size > offset));
 }
 
 static void nvdimm_read_label_data(NVDIMMDevice *nvdimm, void *buf,
@@ -238,7 +238,7 @@ static void nvdimm_write_label_data(NVDIMMDevice *nvdimm, const void *buf,
     }
 
     mr = host_memory_backend_get_memory(dimm->hostmem);
-    backend_offset = memory_region_size(mr) - nvdimm->label_size + offset;
+    backend_offset = memory_region_size(mr) - nvdimm->lsa_size + offset;
     memory_region_set_dirty(mr, backend_offset, size);
 }
 
diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index cf8f59be44..8e6a40dc7b 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -48,7 +48,7 @@
 #define TYPE_NVDIMM      "nvdimm"
 OBJECT_DECLARE_TYPE(NVDIMMDevice, NVDIMMClass, NVDIMM)
 
-#define NVDIMM_LABEL_SIZE_PROP "label-size"
+#define NVDIMM_LSA_SIZE_PROP   "lsa-size"
 #define NVDIMM_UUID_PROP       "uuid"
 #define NVDIMM_UNARMED_PROP    "unarmed"
 
@@ -62,7 +62,7 @@ struct NVDIMMDevice {
      * the size of label data in NVDIMM device which is presented to
      * guest via __DSM "Get Namespace Label Size" function.
      */
-    uint64_t label_size;
+    uint64_t lsa_size;
 
     /*
      * the address of label data which is read by __DSM "Get Namespace
-- 
2.31.1


