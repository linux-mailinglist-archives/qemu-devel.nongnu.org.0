Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D2E333BB4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 12:45:12 +0100 (CET)
Received: from localhost ([::1]:53062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJxH6-0008Oy-08
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 06:45:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJxFP-00072s-To
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:43:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJxFN-00038l-QZ
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:43:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615376605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=esKZYTxlC8yf8oyx0YniIsAHsZo45frlmoVawIo+xGw=;
 b=K20fKMaYLIgadnJkaLD2VZhuaHpAgUd6CsAGtOJrvCcJgj2mZS84MdVr2vUFSe1cRytxDS
 FegGKaL4f0Yq25MKl1HSyn/MrGnG+FGn4dJiB+7+HtPcljmllQ8c1T/zcX6y0USuyEmQSP
 CTTPGrjwgZuekLRoMlxD4d0Wij8BwcY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-dkEFPJXxOX2cmnn20euCdw-1; Wed, 10 Mar 2021 06:43:23 -0500
X-MC-Unique: dkEFPJXxOX2cmnn20euCdw-1
Received: by mail-ed1-f72.google.com with SMTP id i19so8252309edy.18
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 03:43:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=esKZYTxlC8yf8oyx0YniIsAHsZo45frlmoVawIo+xGw=;
 b=VnDgjfJJPs7SHThp5IWW8EDBSUNdwCyWQO8q/m8WQ/6k7ekda3wpSLNPG+WyQq9kc3
 +2XE4sni7GmJW9K9dlQn7NQAayNLUEnZ4C1xt1P4GxnknX4R1opKzj4U4En8QgGxmH8k
 srXl/CcRUq/mHkHhc2nGNlq6Cz2RdjZ1csTlbodX2cK401Ee6K+QKRbx4dhQVJcj/ou7
 3dgj4Nwai1YL8onWkRhS9+HcDCrEXqA2b/lIexeh9BeWB1lOUNvN/YHrdqiu1sMFHcgt
 yl2SjuUOXQGU+GSa9JznxvHjTQlcYL7npvRPInWzQvxhrP/AmmYbjU0GmGHEFLjrB+Q7
 5RhA==
X-Gm-Message-State: AOAM532qLh35tdKb/KmkGnCT9mWCWSfyW8DBH/vbHNkEH2PEBJ+iyajZ
 gFnXiRvpe8QjPBDL4pfec+4Ra0mLmJGaMwAjP50vaLfwoNNlJeaXXqioomKZ0Os/HSgLs2QlgU+
 MpnPpatFuNDveDCTuuZmVbNGimFVX/hcNoSQYgjxbYny4YeiXGdGlcQC70nKk3u1L
X-Received: by 2002:a17:906:73d5:: with SMTP id
 n21mr3297277ejl.8.1615376602463; 
 Wed, 10 Mar 2021 03:43:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvw9MsNHBzdwtjT88gKDHurhxCqXRr38gD9zlE6Ci4oY2eSJDvyjgiy7Ikgvgq3NnOPSCxbg==
X-Received: by 2002:a17:906:73d5:: with SMTP id
 n21mr3297253ejl.8.1615376602274; 
 Wed, 10 Mar 2021 03:43:22 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b6sm9480400ejb.8.2021.03.10.03.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 03:43:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] block: Introduce the 'zeroes-co' driver
Date: Wed, 10 Mar 2021 12:43:12 +0100
Message-Id: <20210310114314.1068957-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310114314.1068957-1-philmd@redhat.com>
References: <20210310114314.1068957-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Bandan Das <bsd@redhat.com>, Prasad J Pandit <ppandit@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'zeroes-co' block driver is almost a copy of the 'null-co'
block driver designed for performance testing, but targets
security needs, by always zero-initializing read accesses.
Write accesses are discarded.

Suggested-by: Fam Zheng <fam@euphon.net>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/zeroes.c    | 306 ++++++++++++++++++++++++++++++++++++++++++++++
 block/meson.build |   1 +
 2 files changed, 307 insertions(+)
 create mode 100644 block/zeroes.c

diff --git a/block/zeroes.c b/block/zeroes.c
new file mode 100644
index 00000000000..7256b6d02ee
--- /dev/null
+++ b/block/zeroes.c
@@ -0,0 +1,306 @@
+/*
+ * Zeroes block driver
+ *
+ * Based on block/null.c
+ *
+ * Copyright (C) 2021 Red Hat, Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qstring.h"
+#include "qemu/module.h"
+#include "qemu/option.h"
+#include "block/block_int.h"
+#include "sysemu/replay.h"
+
+#define NULL_OPT_LATENCY "latency-ns"
+
+typedef struct {
+    int64_t length;
+    int64_t latency_ns;
+} BDRVZeroesState;
+
+static QemuOptsList runtime_opts = {
+    .name = "zeroes",
+    .head = QTAILQ_HEAD_INITIALIZER(runtime_opts.head),
+    .desc = {
+        {
+            .name = BLOCK_OPT_SIZE,
+            .type = QEMU_OPT_SIZE,
+            .help = "size of the zeroes block",
+        },
+        {
+            .name = NULL_OPT_LATENCY,
+            .type = QEMU_OPT_NUMBER,
+            .help = "nanoseconds (approximated) to wait "
+                    "before completing request",
+        },
+        { /* end of list */ }
+    },
+};
+
+static void zeroes_co_parse_filename(const char *filename, QDict *options,
+                                     Error **errp)
+{
+    /*
+     * This functions only exists so that a zeroes-co:// filename
+     * is accepted with the zeroes-co driver.
+     */
+    if (strcmp(filename, "zeroes-co://")) {
+        error_setg(errp, "The only allowed filename for this driver is "
+                         "'zeroes-co://'");
+        return;
+    }
+}
+
+static void zeroes_aio_parse_filename(const char *filename, QDict *options,
+                                      Error **errp)
+{
+    /*
+     * This functions only exists so that a zeroes-aio:// filename
+     * is accepted with the zeroes-aio driver.
+     */
+    if (strcmp(filename, "zeroes-aio://")) {
+        error_setg(errp, "The only allowed filename for this driver is "
+                         "'zeroes-aio://'");
+        return;
+    }
+}
+
+static int zeroes_file_open(BlockDriverState *bs, QDict *options,
+                            int flags, Error **errp)
+{
+    QemuOpts *opts;
+    BDRVZeroesState *s = bs->opaque;
+    int ret = 0;
+
+    opts = qemu_opts_create(&runtime_opts, NULL, 0, &error_abort);
+    qemu_opts_absorb_qdict(opts, options, &error_abort);
+    s->length = qemu_opt_get_size(opts, BLOCK_OPT_SIZE, 0);
+    if (s->length < 0) {
+        error_setg(errp, "%s is invalid", BLOCK_OPT_SIZE);
+        ret = -EINVAL;
+    }
+    s->latency_ns = qemu_opt_get_number(opts, NULL_OPT_LATENCY, 0);
+    if (s->latency_ns < 0) {
+        error_setg(errp, "%s is invalid", NULL_OPT_LATENCY);
+        ret = -EINVAL;
+    }
+    qemu_opts_del(opts);
+    bs->supported_write_flags = BDRV_REQ_FUA;
+    return ret;
+}
+
+static int64_t zeroes_getlength(BlockDriverState *bs)
+{
+    BDRVZeroesState *s = bs->opaque;
+    return s->length;
+}
+
+static coroutine_fn int zeroes_co_common(BlockDriverState *bs)
+{
+    BDRVZeroesState *s = bs->opaque;
+
+    if (s->latency_ns) {
+        qemu_co_sleep_ns(QEMU_CLOCK_REALTIME, s->latency_ns);
+    }
+    return 0;
+}
+
+static coroutine_fn int zeroes_co_preadv(BlockDriverState *bs,
+                                         uint64_t offset, uint64_t bytes,
+                                         QEMUIOVector *qiov, int flags)
+{
+    qemu_iovec_memset(qiov, 0, 0, bytes);
+
+    return zeroes_co_common(bs);
+}
+
+static coroutine_fn int zeroes_co_pwritev(BlockDriverState *bs,
+                                          uint64_t offset, uint64_t bytes,
+                                          QEMUIOVector *qiov, int flags)
+{
+    return zeroes_co_common(bs);
+}
+
+static coroutine_fn int zeroes_co_flush(BlockDriverState *bs)
+{
+    return zeroes_co_common(bs);
+}
+
+typedef struct {
+    BlockAIOCB common;
+    QEMUTimer timer;
+} ZeroesAIOCB;
+
+static const AIOCBInfo zeroes_aiocb_info = {
+    .aiocb_size = sizeof(ZeroesAIOCB),
+};
+
+static void zeroes_bh_cb(void *opaque)
+{
+    ZeroesAIOCB *acb = opaque;
+    acb->common.cb(acb->common.opaque, 0);
+    qemu_aio_unref(acb);
+}
+
+static void zeroes_timer_cb(void *opaque)
+{
+    ZeroesAIOCB *acb = opaque;
+    acb->common.cb(acb->common.opaque, 0);
+    timer_deinit(&acb->timer);
+    qemu_aio_unref(acb);
+}
+
+static inline BlockAIOCB *zeroes_aio_common(BlockDriverState *bs,
+                                            BlockCompletionFunc *cb,
+                                            void *opaque)
+{
+    ZeroesAIOCB *acb;
+    BDRVZeroesState *s = bs->opaque;
+
+    acb = qemu_aio_get(&zeroes_aiocb_info, bs, cb, opaque);
+    /* Only emulate latency after vcpu is running. */
+    if (s->latency_ns) {
+        aio_timer_init(bdrv_get_aio_context(bs), &acb->timer,
+                       QEMU_CLOCK_REALTIME, SCALE_NS,
+                       zeroes_timer_cb, acb);
+        timer_mod_ns(&acb->timer,
+                     qemu_clock_get_ns(QEMU_CLOCK_REALTIME) + s->latency_ns);
+    } else {
+        replay_bh_schedule_oneshot_event(bdrv_get_aio_context(bs),
+                                         zeroes_bh_cb, acb);
+    }
+    return &acb->common;
+}
+
+static BlockAIOCB *zeroes_aio_preadv(BlockDriverState *bs,
+                                   uint64_t offset, uint64_t bytes,
+                                   QEMUIOVector *qiov, int flags,
+                                   BlockCompletionFunc *cb,
+                                   void *opaque)
+{
+    qemu_iovec_memset(qiov, 0, 0, bytes);
+
+    return zeroes_aio_common(bs, cb, opaque);
+}
+
+static BlockAIOCB *zeroes_aio_pwritev(BlockDriverState *bs,
+                                      uint64_t offset, uint64_t bytes,
+                                      QEMUIOVector *qiov, int flags,
+                                      BlockCompletionFunc *cb,
+                                      void *opaque)
+{
+    return zeroes_aio_common(bs, cb, opaque);
+}
+
+static BlockAIOCB *zeroes_aio_flush(BlockDriverState *bs,
+                                    BlockCompletionFunc *cb,
+                                    void *opaque)
+{
+    return zeroes_aio_common(bs, cb, opaque);
+}
+
+static int zeroes_reopen_prepare(BDRVReopenState *reopen_state,
+                                 BlockReopenQueue *queue, Error **errp)
+{
+    return 0;
+}
+
+static int coroutine_fn zeroes_co_block_status(BlockDriverState *bs,
+                                               bool want_zero, int64_t offset,
+                                               int64_t bytes, int64_t *pnum,
+                                               int64_t *map,
+                                               BlockDriverState **file)
+{
+    *pnum = bytes;
+    *map = offset;
+    *file = bs;
+
+    return BDRV_BLOCK_OFFSET_VALID | BDRV_BLOCK_ZERO;
+}
+
+static void zeroes_refresh_filename(BlockDriverState *bs)
+{
+    const QDictEntry *e;
+
+    for (e = qdict_first(bs->full_open_options); e;
+         e = qdict_next(bs->full_open_options, e))
+    {
+        /* These options can be ignored */
+        if (strcmp(qdict_entry_key(e), "filename") &&
+            strcmp(qdict_entry_key(e), "driver") &&
+            strcmp(qdict_entry_key(e), NULL_OPT_LATENCY))
+        {
+            return;
+        }
+    }
+
+    snprintf(bs->exact_filename, sizeof(bs->exact_filename),
+             "%s://", bs->drv->format_name);
+}
+
+static int64_t zeroes_allocated_file_size(BlockDriverState *bs)
+{
+    return 0;
+}
+
+static const char *const zeroes_strong_runtime_opts[] = {
+    BLOCK_OPT_SIZE,
+
+    NULL
+};
+
+static BlockDriver bdrv_zeroes_co = {
+    .format_name            = "zeroes-co",
+    .protocol_name          = "zeroes-co",
+    .instance_size          = sizeof(BDRVZeroesState),
+
+    .bdrv_file_open         = zeroes_file_open,
+    .bdrv_parse_filename    = zeroes_co_parse_filename,
+    .bdrv_getlength         = zeroes_getlength,
+    .bdrv_get_allocated_file_size = zeroes_allocated_file_size,
+
+    .bdrv_co_preadv         = zeroes_co_preadv,
+    .bdrv_co_pwritev        = zeroes_co_pwritev,
+    .bdrv_co_flush_to_disk  = zeroes_co_flush,
+    .bdrv_reopen_prepare    = zeroes_reopen_prepare,
+
+    .bdrv_co_block_status   = zeroes_co_block_status,
+
+    .bdrv_refresh_filename  = zeroes_refresh_filename,
+    .strong_runtime_opts    = zeroes_strong_runtime_opts,
+};
+
+static BlockDriver bdrv_zeroes_aio = {
+    .format_name            = "zeroes-aio",
+    .protocol_name          = "zeroes-aio",
+    .instance_size          = sizeof(BDRVZeroesState),
+
+    .bdrv_file_open         = zeroes_file_open,
+    .bdrv_parse_filename    = zeroes_aio_parse_filename,
+    .bdrv_getlength         = zeroes_getlength,
+    .bdrv_get_allocated_file_size = zeroes_allocated_file_size,
+
+    .bdrv_aio_preadv        = zeroes_aio_preadv,
+    .bdrv_aio_pwritev       = zeroes_aio_pwritev,
+    .bdrv_aio_flush         = zeroes_aio_flush,
+    .bdrv_reopen_prepare    = zeroes_reopen_prepare,
+
+    .bdrv_co_block_status   = zeroes_co_block_status,
+
+    .bdrv_refresh_filename  = zeroes_refresh_filename,
+    .strong_runtime_opts    = zeroes_strong_runtime_opts,
+};
+
+static void bdrv_zeroes_init(void)
+{
+    bdrv_register(&bdrv_zeroes_co);
+    bdrv_register(&bdrv_zeroes_aio);
+}
+
+block_init(bdrv_zeroes_init);
diff --git a/block/meson.build b/block/meson.build
index d21990ec95a..661d84118fb 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -40,6 +40,7 @@
   'vmdk.c',
   'vpc.c',
   'write-threshold.c',
+  'zeroes.c',
 ), zstd, zlib, gnutls)
 
 softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('blkreplay.c'))
-- 
2.26.2


