Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1454E563E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:21:01 +0100 (CET)
Received: from localhost ([::1]:60396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX3jI-0005Sf-7T
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:21:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3PS-0005UU-1o
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:00:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3PP-0005Sg-UF
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:00:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648051227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xvxKd+YpYeqxtFjVqXz46oyvhvuknte8d+CaRxj4JqQ=;
 b=b0ziH5BXQ/98/F435+f9bsd1BqCl27z6DDwP9o9hCiYLYnjwE+mOQocR2qTqE0QXDWTmWj
 pR9X/lnb81LXC8Ad/U929F4rdHIMq679sVT4aKcdsxElOvVid6NotTO0dj90j6dMhycHi0
 pLDxv9fu1ptcePY0X+moqFJ6cPqo1HA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-V7Z0nFqFMFuOaQe1l1CUEA-1; Wed, 23 Mar 2022 12:00:25 -0400
X-MC-Unique: V7Z0nFqFMFuOaQe1l1CUEA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40508185A794;
 Wed, 23 Mar 2022 16:00:25 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C9FD58059A;
 Wed, 23 Mar 2022 16:00:23 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 21/32] include: move C/util-related declarations to cutils.h
Date: Wed, 23 Mar 2022 19:57:32 +0400
Message-Id: <20220323155743.1585078-22-marcandre.lureau@redhat.com>
In-Reply-To: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu-common.h          | 20 --------------------
 include/qemu/cutils.h          | 20 ++++++++++++++++++++
 hw/dma/xlnx_dpdma.c            |  2 +-
 hw/usb/ccid-card-passthru.c    |  2 +-
 hw/usb/dev-smartcard-reader.c  |  2 +-
 hw/usb/redirect.c              |  2 +-
 hw/virtio/vhost-vdpa.c         |  2 +-
 net/announce.c                 |  2 +-
 tests/qtest/npcm7xx_rng-test.c |  2 +-
 util/hexdump.c                 |  2 +-
 10 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 5f53a0e11287..08f40a9d1ed3 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -54,26 +54,6 @@ const char *qemu_get_vm_name(void);
 void os_setup_early_signal_handling(void);
 int os_parse_cmd_args(int index, const char *optarg);
 
-/*
- * Hexdump a line of a byte buffer into a hexadecimal/ASCII buffer
- */
-#define QEMU_HEXDUMP_LINE_BYTES 16 /* Number of bytes to dump */
-#define QEMU_HEXDUMP_LINE_LEN 75   /* Number of characters in line */
-void qemu_hexdump_line(char *line, unsigned int b, const void *bufptr,
-                       unsigned int len, bool ascii);
-
-/*
- * Hexdump a buffer to a file. An optional string prefix is added to every line
- */
-
-void qemu_hexdump(FILE *fp, const char *prefix,
-                  const void *bufptr, size_t size);
-
-/*
- * helper to parse debug environment variables
- */
-int parse_debug_env(const char *name, int max, int initial);
-
 void page_size_init(void);
 
 #endif
diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index 320543950c4c..2137e6526087 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -214,4 +214,24 @@ static inline const char *yes_no(bool b)
      return b ? "yes" : "no";
 }
 
+/*
+ * helper to parse debug environment variables
+ */
+int parse_debug_env(const char *name, int max, int initial);
+
+/*
+ * Hexdump a line of a byte buffer into a hexadecimal/ASCII buffer
+ */
+#define QEMU_HEXDUMP_LINE_BYTES 16 /* Number of bytes to dump */
+#define QEMU_HEXDUMP_LINE_LEN 75   /* Number of characters in line */
+void qemu_hexdump_line(char *line, unsigned int b, const void *bufptr,
+                       unsigned int len, bool ascii);
+
+/*
+ * Hexdump a buffer to a file. An optional string prefix is added to every line
+ */
+
+void qemu_hexdump(FILE *fp, const char *prefix,
+                  const void *bufptr, size_t size);
+
 #endif
diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
index 2d7eae72cd23..dd66be5265df 100644
--- a/hw/dma/xlnx_dpdma.c
+++ b/hw/dma/xlnx_dpdma.c
@@ -23,7 +23,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
+#include "qemu/cutils.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/dma/xlnx_dpdma.h"
diff --git a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
index fa3040fb7154..f530ab2565cb 100644
--- a/hw/usb/ccid-card-passthru.c
+++ b/hw/usb/ccid-card-passthru.c
@@ -9,7 +9,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
+#include "qemu/cutils.h"
 #include "qemu/units.h"
 #include <libcacard.h>
 #include "chardev/char-fe.h"
diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
index 91ffd9f8ae8d..28164d89be27 100644
--- a/hw/usb/dev-smartcard-reader.c
+++ b/hw/usb/dev-smartcard-reader.c
@@ -37,7 +37,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
+#include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 8692ea256109..3bc4dee7fed9 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -26,7 +26,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
+#include "qemu/cutils.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu/timer.h"
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 2075f336e2ad..b25c8ef799a7 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -20,10 +20,10 @@
 #include "hw/virtio/vhost-shadow-virtqueue.h"
 #include "hw/virtio/vhost-vdpa.h"
 #include "exec/address-spaces.h"
+#include "qemu/cutils.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
 #include "trace.h"
-#include "qemu-common.h"
 #include "qapi/error.h"
 
 /*
diff --git a/net/announce.c b/net/announce.c
index 3b9e2f1f14e8..62c60192a3cf 100644
--- a/net/announce.c
+++ b/net/announce.c
@@ -7,7 +7,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
+#include "qemu/cutils.h"
 #include "net/announce.h"
 #include "net/net.h"
 #include "qapi/clone-visitor.h"
diff --git a/tests/qtest/npcm7xx_rng-test.c b/tests/qtest/npcm7xx_rng-test.c
index 797f832e53a1..35b1c1f5f6d2 100644
--- a/tests/qtest/npcm7xx_rng-test.c
+++ b/tests/qtest/npcm7xx_rng-test.c
@@ -20,7 +20,7 @@
 
 #include "libqtest-single.h"
 #include "qemu/bitops.h"
-#include "qemu-common.h"
+#include "qemu/cutils.h"
 
 #define RNG_BASE_ADDR   0xf000b000
 
diff --git a/util/hexdump.c b/util/hexdump.c
index 2c105a884620..9921114b3c75 100644
--- a/util/hexdump.c
+++ b/util/hexdump.c
@@ -14,7 +14,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
+#include "qemu/cutils.h"
 
 void qemu_hexdump_line(char *line, unsigned int b, const void *bufptr,
                        unsigned int len, bool ascii)
-- 
2.35.1.273.ge6ebfd0e8cbb


