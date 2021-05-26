Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51419392336
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 01:28:59 +0200 (CEST)
Received: from localhost ([::1]:46332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm2xO-00056p-9o
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 19:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lm2vY-0002eN-5H
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:27:04 -0400
Received: from mga01.intel.com ([192.55.52.88]:11254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lm2vW-0001y0-CC
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:27:03 -0400
IronPort-SDR: yhd/llg3pWzUY5nDQCqO+W3yIYuKHHiHSHxBJK5dEQvKvODohZNuQ1idfIviDpl91bZUCx/B6o
 VmLJ6taBi3qQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223801540"
X-IronPort-AV: E=Sophos;i="5.82,333,1613462400"; d="scan'208";a="223801540"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 16:26:56 -0700
IronPort-SDR: 4vSKM2Hg4hPsZBT8nK0WdupGoFsf8VqMAGn8EHWfEOqb0iK7k9QpCbr2ncLrGQVIWrZ19N3EF+
 qOyck7KksnwQ==
X-IronPort-AV: E=Sophos;i="5.82,333,1613462400"; d="scan'208";a="477188131"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 16:26:56 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 02/14] headers: Add udmabuf.h
Date: Wed, 26 May 2021 16:14:17 -0700
Message-Id: <20210526231429.1045476-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526231429.1045476-1-vivek.kasireddy@intel.com>
References: <20210526231429.1045476-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.88;
 envelope-from=vivek.kasireddy@intel.com; helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds udmabuf header to standard headers so that the
relevant udmabuf objects can be accessed in subsequent
patches.

Based-on-patch-by: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/standard-headers/linux/udmabuf.h | 32 ++++++++++++++++++++++++
 scripts/update-linux-headers.sh          |  3 +++
 2 files changed, 35 insertions(+)
 create mode 100644 include/standard-headers/linux/udmabuf.h

diff --git a/include/standard-headers/linux/udmabuf.h b/include/standard-headers/linux/udmabuf.h
new file mode 100644
index 0000000000..e19eb5b5ce
--- /dev/null
+++ b/include/standard-headers/linux/udmabuf.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _LINUX_UDMABUF_H
+#define _LINUX_UDMABUF_H
+
+#include "standard-headers/linux/types.h"
+
+#define UDMABUF_FLAGS_CLOEXEC	0x01
+
+struct udmabuf_create {
+	uint32_t memfd;
+	uint32_t flags;
+	uint64_t offset;
+	uint64_t size;
+};
+
+struct udmabuf_create_item {
+	uint32_t memfd;
+	uint32_t __pad;
+	uint64_t offset;
+	uint64_t size;
+};
+
+struct udmabuf_create_list {
+	uint32_t flags;
+	uint32_t count;
+	struct udmabuf_create_item list[];
+};
+
+#define UDMABUF_CREATE       _IOW('u', 0x42, struct udmabuf_create)
+#define UDMABUF_CREATE_LIST  _IOW('u', 0x43, struct udmabuf_create_list)
+
+#endif /* _LINUX_UDMABUF_H */
diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index 1050e36169..fea4d6eb65 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -34,6 +34,7 @@ cp_portable() {
     if
         grep '#include' "$f" | grep -v -e 'linux/virtio' \
                                      -e 'linux/types' \
+                                     -e 'linux/ioctl' \
                                      -e 'stdint' \
                                      -e 'linux/if_ether' \
                                      -e 'input-event-codes' \
@@ -66,6 +67,7 @@ cp_portable() {
         -e 's/__BITS_PER_LONG/HOST_LONG_BITS/' \
         -e '/\"drm.h\"/d' \
         -e '/sys\/ioctl.h/d' \
+        -e '/linux\/ioctl.h/d' \
         -e 's/SW_MAX/SW_MAX_/' \
         -e 's/atomic_t/int/' \
         -e 's/__kernel_long_t/long/' \
@@ -190,6 +192,7 @@ for i in "$tmpdir"/include/linux/*virtio*.h \
          "$tmpdir/include/linux/fuse.h" \
          "$tmpdir/include/linux/input.h" \
          "$tmpdir/include/linux/input-event-codes.h" \
+         "$tmpdir/include/linux/udmabuf.h" \
          "$tmpdir/include/linux/pci_regs.h" \
          "$tmpdir/include/linux/ethtool.h" \
          "$tmpdir/include/linux/const.h" \
-- 
2.30.2


