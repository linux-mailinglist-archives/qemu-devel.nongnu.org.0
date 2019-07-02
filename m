Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E665D30D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 17:38:56 +0200 (CEST)
Received: from localhost ([::1]:54554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiKrv-0001ej-H3
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 11:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58460)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hiKNR-0006ON-Oo
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:07:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hiKNP-0000G1-Qe
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:07:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33580)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hiKNP-0000FN-B7
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:07:23 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9EEC330842B1;
 Tue,  2 Jul 2019 15:07:22 +0000 (UTC)
Received: from redhat.com (ovpn-124-209.rdu2.redhat.com [10.10.124.209])
 by smtp.corp.redhat.com (Postfix) with SMTP id 72BA01992E;
 Tue,  2 Jul 2019 15:07:21 +0000 (UTC)
Date: Tue, 2 Jul 2019 11:07:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190619094907.10131-4-pagupta@redhat.com>
References: <20190702150606.24851-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190702150606.24851-1-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 02 Jul 2019 15:07:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 07/22] virtio-pmem: sync linux headers
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Pankaj Gupta <pagupta@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pankaj Gupta <pagupta@redhat.com>

Sync linux headers for virtio pmem.

Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
Message-Id: <20190619094907.10131-4-pagupta@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/standard-headers/linux/virtio_ids.h  |  1 +
 include/standard-headers/linux/virtio_pmem.h | 35 ++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 include/standard-headers/linux/virtio_pmem.h

diff --git a/include/standard-headers/linux/virtio_ids.h b/include/standard-headers/linux/virtio_ids.h
index 6d5c3b2d4f..32b2f94d1f 100644
--- a/include/standard-headers/linux/virtio_ids.h
+++ b/include/standard-headers/linux/virtio_ids.h
@@ -43,5 +43,6 @@
 #define VIRTIO_ID_INPUT        18 /* virtio input */
 #define VIRTIO_ID_VSOCK        19 /* virtio vsock transport */
 #define VIRTIO_ID_CRYPTO       20 /* virtio crypto */
+#define VIRTIO_ID_PMEM         27 /* virtio pmem */
 
 #endif /* _LINUX_VIRTIO_IDS_H */
diff --git a/include/standard-headers/linux/virtio_pmem.h b/include/standard-headers/linux/virtio_pmem.h
new file mode 100644
index 0000000000..7a3e2fe524
--- /dev/null
+++ b/include/standard-headers/linux/virtio_pmem.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Definitions for virtio-pmem devices.
+ *
+ * Copyright (C) 2019 Red Hat, Inc.
+ *
+ * Author(s): Pankaj Gupta <pagupta@redhat.com>
+ */
+
+#ifndef _UAPI_LINUX_VIRTIO_PMEM_H
+#define _UAPI_LINUX_VIRTIO_PMEM_H
+
+#include <linux/types.h>
+#include <linux/virtio_types.h>
+#include <linux/virtio_ids.h>
+#include <linux/virtio_config.h>
+
+struct virtio_pmem_config {
+	__le64 start;
+	__le64 size;
+};
+
+#define VIRTIO_PMEM_REQ_TYPE_FLUSH      0
+
+struct virtio_pmem_resp {
+	/* Host return status corresponding to flush request */
+	__virtio32 ret;
+};
+
+struct virtio_pmem_req {
+	/* command type */
+	__virtio32 type;
+};
+
+#endif
-- 
MST


