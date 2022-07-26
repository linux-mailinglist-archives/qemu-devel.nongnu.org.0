Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A29581AE4
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:18:16 +0200 (CEST)
Received: from localhost ([::1]:60800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGR0R-0001oT-C3
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQ4-00069f-Pt
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:40:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQPx-00050D-Gb
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658864432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wm9tRtc/l3bnnSUQgHT6lQeiNh5OiDryPaWVqdA+A3w=;
 b=TPDecPRaHTuOPTox5pfnBXgX2DXH+rHMNgnthLAf1jCzqJGsKWS3O6XScuDIfMo2l4guCj
 zBgbANS56Np3XmhHH823n4wnUlNbsM8JpMMvTEDp3I6/afhNubdp2CBSV1dQvJ4CBTB66O
 lFFaCv40hT8a+ilrx6q7ldd1EF/gIwk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-14zKmBBjOZqERixc6isqjA-1; Tue, 26 Jul 2022 15:40:31 -0400
X-MC-Unique: 14zKmBBjOZqERixc6isqjA-1
Received: by mail-wm1-f69.google.com with SMTP id
 v18-20020a05600c215200b003a2fea66b7cso5689287wml.4
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=wm9tRtc/l3bnnSUQgHT6lQeiNh5OiDryPaWVqdA+A3w=;
 b=ZlgALvRwRF8P0GZ6EjVvAM2B1qjz2TSpQfPRES485drMM17hAChxpH9h6MXO33/+C+
 XfRFjdop87B7fVBmjWFco9WPeJXq+97Bhv+gN6ERLfc1ijMfjos3XYgkX9GoA8xIdH5T
 +PDGvg6/+GTw1ENrrsq/CkY5jmnabDs6X+jRWkvfdMQ0RC0KS7xTRd2hpIKaE1/Z8ByP
 9J1hp0uHyMI0h4jthbjnFpWR0KiTLrbxPj8iHYKfOnpVOv9HBkjEXkHPFOTCMHd08kmK
 6ff/toNe3nnJ2cu582Ut1JRRsCu92LA42olEz2URs/BKnfZ3gVn/gKAZZ+1P0kM+Te5J
 ZHVw==
X-Gm-Message-State: AJIora84Bmj0OdT5mDKqgk6FuGVAOw+M3uWfV35AmOfL3LhDhQKYxxWN
 nFuKOk9j/S86fhrQrWuM4GwFdzjvjym39Gr30H5rtu7sQL6/I4SCgJkFnUYKpB/5OMb/un6zQ9a
 YiksLsUJa0kK7X8zF79eMq9rDL8JUKdUR4EFcXmdTGXimorY67Z1cSx+pAME/
X-Received: by 2002:adf:fbc6:0:b0:21e:3960:45b3 with SMTP id
 d6-20020adffbc6000000b0021e396045b3mr11425004wrs.92.1658864429991; 
 Tue, 26 Jul 2022 12:40:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uUZwjy2OXAeRJV+tcVpMsOP8FCq81DxQ4+TEXBBmqt56oXP8xN6VtlRrrs5BoGbDH/FaqfMA==
X-Received: by 2002:adf:fbc6:0:b0:21e:3960:45b3 with SMTP id
 d6-20020adffbc6000000b0021e396045b3mr11424979wrs.92.1658864429376; 
 Tue, 26 Jul 2022 12:40:29 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7424:0:3d16:86dc:de54:5671])
 by smtp.gmail.com with ESMTPSA id
 ib13-20020a05600ca14d00b003a31ba538c2sm18195558wmb.40.2022.07.26.12.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:40:28 -0700 (PDT)
Date: Tue, 26 Jul 2022 15:40:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Robert Hoo <robert.hu@linux.intel.com>, Jingqi Liu <jingqi.liu@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 David Hildenbrand <david@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Subject: [PULL 01/16] acpi/nvdimm: Define trace events for NVDIMM and
 substitute nvdimm_debug()
Message-ID: <20220726193858.177462-2-mst@redhat.com>
References: <20220726193858.177462-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726193858.177462-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Robert Hoo <robert.hu@linux.intel.com>

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
Message-Id: <20220704085852.330005-1-robert.hu@linux.intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/mem/nvdimm.h |  8 --------
 hw/acpi/nvdimm.c        | 35 ++++++++++++++++-------------------
 hw/acpi/trace-events    | 13 +++++++++++++
 3 files changed, 29 insertions(+), 27 deletions(-)

diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index cf8f59be44..acf887c83d 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -29,14 +29,6 @@
 #include "hw/acpi/aml-build.h"
 #include "qom/object.h"
 
-#define NVDIMM_DEBUG 0
-#define nvdimm_debug(fmt, ...)                                \
-    do {                                                      \
-        if (NVDIMM_DEBUG) {                                   \
-            fprintf(stderr, "nvdimm: " fmt, ## __VA_ARGS__);  \
-        }                                                     \
-    } while (0)
-
 /*
  * The minimum label data size is required by NVDIMM Namespace
  * specification, see the chapter 2 Namespaces:
diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 5f85b16327..31e46df0bd 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -35,6 +35,7 @@
 #include "hw/nvram/fw_cfg.h"
 #include "hw/mem/nvdimm.h"
 #include "qemu/nvdimm-utils.h"
+#include "trace.h"
 
 /*
  * define Byte Addressable Persistent Memory (PM) Region according to
@@ -550,8 +551,8 @@ static void nvdimm_dsm_func_read_fit(NVDIMMState *state, NvdimmDsmIn *in,
 
     fit = fit_buf->fit;
 
-    nvdimm_debug("Read FIT: offset 0x%x FIT size 0x%x Dirty %s.\n",
-                 read_fit->offset, fit->len, fit_buf->dirty ? "Yes" : "No");
+    trace_acpi_nvdimm_read_fit(read_fit->offset, fit->len,
+                               fit_buf->dirty ? "Yes" : "No");
 
     if (read_fit->offset > fit->len) {
         func_ret_status = NVDIMM_DSM_RET_STATUS_INVALID;
@@ -658,7 +659,7 @@ static void nvdimm_dsm_label_size(NVDIMMDevice *nvdimm, hwaddr dsm_mem_addr)
     label_size = nvdimm->label_size;
     mxfer = nvdimm_get_max_xfer_label_size();
 
-    nvdimm_debug("label_size 0x%x, max_xfer 0x%x.\n", label_size, mxfer);
+    trace_acpi_nvdimm_label_info(label_size, mxfer);
 
     label_size_out.func_ret_status = cpu_to_le32(NVDIMM_DSM_RET_STATUS_SUCCESS);
     label_size_out.label_size = cpu_to_le32(label_size);
@@ -674,20 +675,18 @@ static uint32_t nvdimm_rw_label_data_check(NVDIMMDevice *nvdimm,
     uint32_t ret = NVDIMM_DSM_RET_STATUS_INVALID;
 
     if (offset + length < offset) {
-        nvdimm_debug("offset 0x%x + length 0x%x is overflow.\n", offset,
-                     length);
+        trace_acpi_nvdimm_label_overflow(offset, length);
         return ret;
     }
 
     if (nvdimm->label_size < offset + length) {
-        nvdimm_debug("position 0x%x is beyond label data (len = %" PRIx64 ").\n",
-                     offset + length, nvdimm->label_size);
+        trace_acpi_nvdimm_label_oversize(offset + length, nvdimm->label_size);
         return ret;
     }
 
     if (length > nvdimm_get_max_xfer_label_size()) {
-        nvdimm_debug("length (0x%x) is larger than max_xfer (0x%x).\n",
-                     length, nvdimm_get_max_xfer_label_size());
+        trace_acpi_nvdimm_label_xfer_exceed(length,
+                                            nvdimm_get_max_xfer_label_size());
         return ret;
     }
 
@@ -710,8 +709,8 @@ static void nvdimm_dsm_get_label_data(NVDIMMDevice *nvdimm, NvdimmDsmIn *in,
     get_label_data->offset = le32_to_cpu(get_label_data->offset);
     get_label_data->length = le32_to_cpu(get_label_data->length);
 
-    nvdimm_debug("Read Label Data: offset 0x%x length 0x%x.\n",
-                 get_label_data->offset, get_label_data->length);
+    trace_acpi_nvdimm_read_label(get_label_data->offset,
+                                 get_label_data->length);
 
     status = nvdimm_rw_label_data_check(nvdimm, get_label_data->offset,
                                         get_label_data->length);
@@ -749,8 +748,8 @@ static void nvdimm_dsm_set_label_data(NVDIMMDevice *nvdimm, NvdimmDsmIn *in,
     set_label_data->offset = le32_to_cpu(set_label_data->offset);
     set_label_data->length = le32_to_cpu(set_label_data->length);
 
-    nvdimm_debug("Write Label Data: offset 0x%x length 0x%x.\n",
-                 set_label_data->offset, set_label_data->length);
+    trace_acpi_nvdimm_write_label(set_label_data->offset,
+                                  set_label_data->length);
 
     status = nvdimm_rw_label_data_check(nvdimm, set_label_data->offset,
                                         set_label_data->length);
@@ -821,7 +820,7 @@ static void nvdimm_dsm_device(NvdimmDsmIn *in, hwaddr dsm_mem_addr)
 static uint64_t
 nvdimm_dsm_read(void *opaque, hwaddr addr, unsigned size)
 {
-    nvdimm_debug("BUG: we never read _DSM IO Port.\n");
+    trace_acpi_nvdimm_read_io_port();
     return 0;
 }
 
@@ -832,7 +831,7 @@ nvdimm_dsm_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
     NvdimmDsmIn *in;
     hwaddr dsm_mem_addr = val;
 
-    nvdimm_debug("dsm memory address 0x%" HWADDR_PRIx ".\n", dsm_mem_addr);
+    trace_acpi_nvdimm_dsm_mem_addr(dsm_mem_addr);
 
     /*
      * The DSM memory is mapped to guest address space so an evil guest
@@ -846,12 +845,10 @@ nvdimm_dsm_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
     in->function = le32_to_cpu(in->function);
     in->handle = le32_to_cpu(in->handle);
 
-    nvdimm_debug("Revision 0x%x Handler 0x%x Function 0x%x.\n", in->revision,
-                 in->handle, in->function);
+    trace_acpi_nvdimm_dsm_info(in->revision, in->handle, in->function);
 
     if (in->revision != 0x1 /* Currently we only support DSM Spec Rev1. */) {
-        nvdimm_debug("Revision 0x%x is not supported, expect 0x%x.\n",
-                     in->revision, 0x1);
+        trace_acpi_nvdimm_invalid_revision(in->revision);
         nvdimm_dsm_no_payload(NVDIMM_DSM_RET_STATUS_UNSUPPORT, dsm_mem_addr);
         goto exit;
     }
diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
index 2250126a22..eb60b04f9b 100644
--- a/hw/acpi/trace-events
+++ b/hw/acpi/trace-events
@@ -70,3 +70,16 @@ acpi_erst_reset_out(unsigned record_count) "record_count %u"
 acpi_erst_post_load(void *header, unsigned slot_size) "header: 0x%p slot_size %u"
 acpi_erst_class_init_in(void)
 acpi_erst_class_init_out(void)
+
+# nvdimm.c
+acpi_nvdimm_read_fit(uint32_t offset, uint32_t len, const char *dirty) "Read FIT: offset 0x%" PRIx32 " FIT size 0x%" PRIx32 " Dirty %s"
+acpi_nvdimm_label_info(uint32_t label_size, uint32_t mxfer) "label_size 0x%" PRIx32 ", max_xfer 0x%" PRIx32
+acpi_nvdimm_label_overflow(uint32_t offset, uint32_t length) "offset 0x%" PRIx32 " + length 0x%" PRIx32 " is overflow"
+acpi_nvdimm_label_oversize(uint32_t pos, uint64_t size) "position 0x%" PRIx32 " is beyond label data (len = %" PRIu64 ")"
+acpi_nvdimm_label_xfer_exceed(uint32_t length, uint32_t max_xfer) "length (0x%" PRIx32 ") is larger than max_xfer (0x%" PRIx32 ")"
+acpi_nvdimm_read_label(uint32_t offset, uint32_t length) "Read Label Data: offset 0x%" PRIx32 " length 0x%" PRIx32
+acpi_nvdimm_write_label(uint32_t offset, uint32_t length) "Write Label Data: offset 0x%" PRIx32 " length 0x%" PRIx32
+acpi_nvdimm_read_io_port(void) "Alert: we never read _DSM IO Port"
+acpi_nvdimm_dsm_mem_addr(uint64_t dsm_mem_addr) "dsm memory address 0x%" PRIx64
+acpi_nvdimm_dsm_info(uint32_t revision, uint32_t handle, uint32_t function) "Revision 0x%" PRIx32 " Handle 0x%" PRIx32 " Function 0x%" PRIx32
+acpi_nvdimm_invalid_revision(uint32_t revision) "Revision 0x%" PRIx32 " is not supported, expect 0x1"
-- 
MST


