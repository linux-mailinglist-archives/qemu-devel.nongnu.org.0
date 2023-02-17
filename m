Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D8669B246
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 19:18:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT5Jf-0000pt-Rm; Fri, 17 Feb 2023 13:18:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pT5Jd-0000mn-W8
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 13:18:38 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pT5Jc-0003gI-Ba
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 13:18:37 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PJKh255Rnz67ZcT;
 Sat, 18 Feb 2023 02:13:54 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Fri, 17 Feb 2023 18:18:33 +0000
To: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
CC: Ben Widawsky <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, Ira Weiny <ira.weiny@intel.com>, Gregory Price
 <gourry.memverge@gmail.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Mike Maslenkin <mike.maslenkin@gmail.com>, Markus
 Armbruster <armbru@redhat.com>, Dave Jiang <dave.jiang@intel.com>,
 <alison.schofield@intel.com>
Subject: [PATCH 1/6] hw/cxl: Move enum ret_code definition to cxl_device.h
Date: Fri, 17 Feb 2023 18:18:07 +0000
Message-ID: <20230217181812.26995-2-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230217181812.26995-1-Jonathan.Cameron@huawei.com>
References: <20230217181812.26995-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Needs tidy up and rename to something more generic now it is
in a header.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/cxl/cxl-mailbox-utils.c  | 28 ----------------------------
 include/hw/cxl/cxl_device.h | 28 ++++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index cc9c8b7380..d9bd5daa0d 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -64,34 +64,6 @@ enum {
         #define SET_LSA       0x3
 };
 
-/* 8.2.8.4.5.1 Command Return Codes */
-typedef enum {
-    CXL_MBOX_SUCCESS = 0x0,
-    CXL_MBOX_BG_STARTED = 0x1,
-    CXL_MBOX_INVALID_INPUT = 0x2,
-    CXL_MBOX_UNSUPPORTED = 0x3,
-    CXL_MBOX_INTERNAL_ERROR = 0x4,
-    CXL_MBOX_RETRY_REQUIRED = 0x5,
-    CXL_MBOX_BUSY = 0x6,
-    CXL_MBOX_MEDIA_DISABLED = 0x7,
-    CXL_MBOX_FW_XFER_IN_PROGRESS = 0x8,
-    CXL_MBOX_FW_XFER_OUT_OF_ORDER = 0x9,
-    CXL_MBOX_FW_AUTH_FAILED = 0xa,
-    CXL_MBOX_FW_INVALID_SLOT = 0xb,
-    CXL_MBOX_FW_ROLLEDBACK = 0xc,
-    CXL_MBOX_FW_REST_REQD = 0xd,
-    CXL_MBOX_INVALID_HANDLE = 0xe,
-    CXL_MBOX_INVALID_PA = 0xf,
-    CXL_MBOX_INJECT_POISON_LIMIT = 0x10,
-    CXL_MBOX_PERMANENT_MEDIA_FAILURE = 0x11,
-    CXL_MBOX_ABORTED = 0x12,
-    CXL_MBOX_INVALID_SECURITY_STATE = 0x13,
-    CXL_MBOX_INCORRECT_PASSPHRASE = 0x14,
-    CXL_MBOX_UNSUPPORTED_MAILBOX = 0x15,
-    CXL_MBOX_INVALID_PAYLOAD_LENGTH = 0x16,
-    CXL_MBOX_MAX = 0x17
-} ret_code;
-
 struct cxl_cmd;
 typedef ret_code (*opcode_handler)(struct cxl_cmd *cmd,
                                    CXLDeviceState *cxl_dstate, uint16_t *len);
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index edb9791bab..d01c6b29c5 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -82,6 +82,34 @@
     (CXL_DEVICE_CAP_REG_SIZE + CXL_DEVICE_STATUS_REGISTERS_LENGTH +     \
      CXL_MAILBOX_REGISTERS_LENGTH + CXL_MEMORY_DEVICE_REGISTERS_LENGTH)
 
+/* 8.2.8.4.5.1 Command Return Codes */
+typedef enum {
+    CXL_MBOX_SUCCESS = 0x0,
+    CXL_MBOX_BG_STARTED = 0x1,
+    CXL_MBOX_INVALID_INPUT = 0x2,
+    CXL_MBOX_UNSUPPORTED = 0x3,
+    CXL_MBOX_INTERNAL_ERROR = 0x4,
+    CXL_MBOX_RETRY_REQUIRED = 0x5,
+    CXL_MBOX_BUSY = 0x6,
+    CXL_MBOX_MEDIA_DISABLED = 0x7,
+    CXL_MBOX_FW_XFER_IN_PROGRESS = 0x8,
+    CXL_MBOX_FW_XFER_OUT_OF_ORDER = 0x9,
+    CXL_MBOX_FW_AUTH_FAILED = 0xa,
+    CXL_MBOX_FW_INVALID_SLOT = 0xb,
+    CXL_MBOX_FW_ROLLEDBACK = 0xc,
+    CXL_MBOX_FW_REST_REQD = 0xd,
+    CXL_MBOX_INVALID_HANDLE = 0xe,
+    CXL_MBOX_INVALID_PA = 0xf,
+    CXL_MBOX_INJECT_POISON_LIMIT = 0x10,
+    CXL_MBOX_PERMANENT_MEDIA_FAILURE = 0x11,
+    CXL_MBOX_ABORTED = 0x12,
+    CXL_MBOX_INVALID_SECURITY_STATE = 0x13,
+    CXL_MBOX_INCORRECT_PASSPHRASE = 0x14,
+    CXL_MBOX_UNSUPPORTED_MAILBOX = 0x15,
+    CXL_MBOX_INVALID_PAYLOAD_LENGTH = 0x16,
+    CXL_MBOX_MAX = 0x17
+} ret_code;
+
 typedef struct cxl_device_state {
     MemoryRegion device_registers;
 
-- 
2.37.2


