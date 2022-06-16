Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5795A54DF9D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 13:01:53 +0200 (CEST)
Received: from localhost ([::1]:43472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1nG4-0001iJ-2T
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 07:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjq-0001qX-C9
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:34 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:33746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjo-0001vR-3f
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:33 -0400
Received: by mail-lf1-x12c.google.com with SMTP id c2so1579095lfk.0
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pWGCHW+lQRAJRjV07RDQFguV/KMNn0rs6neHhcaYk04=;
 b=8DbDXN7G445MA2lSQqCCcpR5QjleIGwltnWZfl0wrNPbmxaEuHaOL3lEwpI45a7iYj
 J9xzHRm/H7PgUfVt9gCODinKmoMHbqpKBFiBtd++anPQxkZTAqlGTRWfJH/ABDbQTjNw
 8u2jTA4GDFimzb8jWpAyAHbHspgzPxzMwkV13O63sU47WmUX+uV9tncicRHvOY2gVKBx
 VV7Bpiyvk9snbonKkuHdMiH8VVFJNH3P8/u8/i1nVNJMvwY09kFSmItY9MpEXLaL1533
 8OhCSsLqLceM3VrlNpu1TnSoVmEn+cpkTq/MCTp9a7dItauguM431QvHWSpUiOKwYHA3
 hr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pWGCHW+lQRAJRjV07RDQFguV/KMNn0rs6neHhcaYk04=;
 b=GqWeKtHMYjXrIutdxoKFWZHBNvwSXTq2GPRUO8napeMsfHUdG/fUojdFIubK9/Hz9e
 cLKc4he+95/xx6/I9WkFoV1f3hCOh4baTtKcNudcqTvVSw5C7CKu2J+ZYb4mffT3wt8N
 SnFyflCI6QBbbBVpVJ2cadabIlSkR+I6Gth1ipv2ojcekloKV/mf9n0T+2a4gYij98vx
 Y+SjMNKHRLGSITnDtPbMrVpuQVbWTJlRJ5C63OGQRR/YPQJfSCOsQYGT+eB5QpKw0EdT
 AXHwzSPjfD86SRi9yz8Plia4WFKAxackQ+ArIJ62gYpnPO6sCvz3+esc/IbRNx3YvEAW
 s4Yg==
X-Gm-Message-State: AJIora/qVF4rnwRtf55bzvLi7Xm7fRWIZB6vt4fA0fAA4b/0cAImrztC
 jaKDH/zMJ4Zyojddwh9rKJ73V9takiJZldas
X-Google-Smtp-Source: AGRyM1tZSzWWx4jHGOoQMv2tPqvCxNkY2RLTbk8ZmEfWKw9Oy7TqT5BlJp/hMl1NrNvnu2R3pZe4Qg==
X-Received: by 2002:a19:a417:0:b0:479:15ef:4ded with SMTP id
 q23-20020a19a417000000b0047915ef4dedmr2192149lfc.225.1655375309718; 
 Thu, 16 Jun 2022 03:28:29 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a199158000000b0047255d21128sm182581lfj.87.2022.06.16.03.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:28:29 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH v3 13/17] migration/snapshot: Block layer support in
 qemu-snapshot
Date: Thu, 16 Jun 2022 13:28:07 +0300
Message-Id: <20220616102811.219007-14-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102811.219007-1-nikita.lapshin@openvz.org>
References: <20220616102811.219007-1-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Nikita Lapshin <nikita.lapshin@openvz.org>

This commit enables few functions to simplify block layer work
for qemu-snapshot tool.

Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
---
 include/qemu-snapshot.h      |   3 +
 migration/meson.build        |   1 +
 migration/qemu-snapshot-io.c | 112 +++++++++++++++++++++++++++++++++++
 3 files changed, 116 insertions(+)
 create mode 100644 migration/qemu-snapshot-io.c

diff --git a/include/qemu-snapshot.h b/include/qemu-snapshot.h
index 8e548e7630..be2557f6a0 100644
--- a/include/qemu-snapshot.h
+++ b/include/qemu-snapshot.h
@@ -62,4 +62,7 @@ StateLoadCtx *get_load_context(void);
 int coroutine_fn save_state_main(StateSaveCtx *s);
 int coroutine_fn load_state_main(StateLoadCtx *s);
 
+QEMUFile *qemu_fopen_bdrv_vmstate(BlockDriverState *bs, int is_writable);
+void qemu_fsplice(QEMUFile *f_dst, QEMUFile *f_src, size_t size);
+size_t qemu_fsplice_tail(QEMUFile *f_dst, QEMUFile *f_src);
 #endif /* QEMU_SNAPSHOT_H */
diff --git a/migration/meson.build b/migration/meson.build
index 13498a6db3..3a04576c30 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -9,6 +9,7 @@ migration_files = files(
   'yank_functions.c',
   'migration.c',
   'qemu-snapshot.c',
+  'qemu-snapshot-io.c'
 )
 softmmu_ss.add(migration_files)
 
diff --git a/migration/qemu-snapshot-io.c b/migration/qemu-snapshot-io.c
new file mode 100644
index 0000000000..904cb92c84
--- /dev/null
+++ b/migration/qemu-snapshot-io.c
@@ -0,0 +1,112 @@
+/*
+ * QEMU External Snapshot Utility
+ *
+ * Copyright Virtuozzo GmbH, 2021
+ *
+ * Authors:
+ *  Andrey Gruzdev   <andrey.gruzdev@virtuozzo.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later. See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/coroutine.h"
+#include "sysemu/block-backend.h"
+#include "migration/qemu-file.h"
+#include "qemu-snapshot.h"
+
+static ssize_t bdrv_vmstate_get_buffer(void *opaque, uint8_t *buf, int64_t pos,
+                                       size_t size, Error **errp)
+{
+    return bdrv_load_vmstate((BlockDriverState *) opaque, buf, pos, size);
+}
+
+static ssize_t bdrv_vmstate_writev_buffer(void *opaque, struct iovec *iov,
+        int iovcnt, int64_t pos, Error **errp)
+{
+    QEMUIOVector qiov;
+    int res;
+
+    qemu_iovec_init_external(&qiov, iov, iovcnt);
+
+    res = bdrv_writev_vmstate((BlockDriverState *) opaque, &qiov, pos);
+    if (res < 0) {
+        return res;
+    }
+
+    return qiov.size;
+}
+
+static int bdrv_vmstate_fclose(void *opaque, Error **errp)
+{
+    return bdrv_flush((BlockDriverState *) opaque);
+}
+
+static const QEMUFileOps bdrv_vmstate_read_ops = {
+    .get_buffer = bdrv_vmstate_get_buffer,
+    .close      = bdrv_vmstate_fclose,
+};
+
+static const QEMUFileOps bdrv_vmstate_write_ops = {
+    .writev_buffer  = bdrv_vmstate_writev_buffer,
+    .close          = bdrv_vmstate_fclose,
+};
+
+/* Create QEMUFile to access vmstate stream on QCOW2 image */
+QEMUFile *qemu_fopen_bdrv_vmstate(BlockDriverState *bs, int is_writable)
+{
+    if (is_writable) {
+        return qemu_fopen_ops(bs, &bdrv_vmstate_write_ops, true);
+    }
+
+    return qemu_fopen_ops(bs, &bdrv_vmstate_read_ops, true);
+}
+
+/* Move number of bytes from the source QEMUFile to destination */
+void qemu_fsplice(QEMUFile *f_dst, QEMUFile *f_src, size_t size)
+{
+    size_t rest = size;
+
+    while (rest) {
+        uint8_t *ptr = NULL;
+        size_t req_size;
+        size_t count;
+
+        req_size = MIN(rest, INPLACE_READ_MAX);
+        count = qemu_peek_buffer(f_src, &ptr, req_size, 0);
+        qemu_file_skip(f_src, count);
+
+        qemu_put_buffer(f_dst, ptr, count);
+        rest -= count;
+    }
+}
+
+/*
+ * Move data from source QEMUFile to destination
+ * until EOF is reached on source.
+ */
+size_t qemu_fsplice_tail(QEMUFile *f_dst, QEMUFile *f_src)
+{
+    bool eof = false;
+    size_t res = 0;
+
+    while (!eof) {
+        const size_t size = INPLACE_READ_MAX;
+        uint8_t *buffer = NULL;
+        size_t count;
+
+        count = qemu_peek_buffer(f_src, &buffer, size, 0);
+        qemu_file_skip(f_src, count);
+
+        /* Reached EOF on source? */
+        if (count != size) {
+            eof = true;
+        }
+
+        qemu_put_buffer(f_dst, buffer, count);
+        res += count;
+    }
+
+    return res;
+}
-- 
2.31.1


