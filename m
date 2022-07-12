Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C21571018
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 04:21:20 +0200 (CEST)
Received: from localhost ([::1]:52180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB5WZ-0002Ly-9Y
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 22:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oB5PX-0000rz-JJ; Mon, 11 Jul 2022 22:14:04 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:47088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oB5PV-0007yH-Kt; Mon, 11 Jul 2022 22:14:03 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 t5-20020a17090a6a0500b001ef965b262eso6573811pjj.5; 
 Mon, 11 Jul 2022 19:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C4nHElRN8Z9bhFfHXmoqX/Uwi2blG90mk7XLJXN33h8=;
 b=lqySzhBIOCCmXpIIGuYmcMeF+HoNCvJmja2hzTyLnRkW1iddiLfQNhcmQiJlgLlEZZ
 Q8kKn0EdFrqgKFA0j9iQKzAisDz+gGNYRQaVmzcfEzerht8nimAbwHF32EKP4b5mswo0
 ziIaaLzFSuCkAsmZUaFQQALDKNQcDfEpFVfdQ1Y85Js9SYNxkGF1UaMAbaBhex4DVuu2
 iyiKhxMwVOgehPiMTnxi2jN/TbW6g5F5JEgXi316iHel4AuM1WF0m73ALDz4F0KTehoM
 uzG7Tsrj91eCSOzlMF8A8nWFT73SYMuniEK3UCPoC8WHn2DDxaQh12p1+hNHyvn4FEjY
 ydDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C4nHElRN8Z9bhFfHXmoqX/Uwi2blG90mk7XLJXN33h8=;
 b=GCn/DyblO5ljDz9MVwp6Z8PkCV8ppHg7WkeMdKPghzVYLzJyb9KGMzYIEdJ9iRJJih
 78Lix6XwspqomYZuTSbHbj4AEpyfKa1iIw3c7VFAC2g1D5mLyK5CYTRd1634nKQfU81k
 fjdqWuvX+bmgp61YiBMM+W15Sg/ZKkFKn9YkHPtpF+tzuqYvxyos8TPy2o1N9fexi1RW
 REeyMSdxC4g0HhAsFLpqZat5vifIPkmJTksE/6Wz2N0GNJFiDW8sh632Ih/8Li72OSrz
 3g+sLayU+33Z6t/wZDHhX/B0NRewb/uADX1J3j1OiyUI0500MjYddRMfncyDdaGmtxpZ
 tl8A==
X-Gm-Message-State: AJIora/JOzTyxbqCJyhgRxz/ycEm0LTVGP1Ki99Zb6ge9j5L+JgloyMw
 t+kT+7Mahcr6SAq5J4lE3v7yF8e++8cmu/1u
X-Google-Smtp-Source: AGRyM1vXEcMDGd99KyRoTf7kE6lY0l68tD20MU6moBy7YTCQ2EUi4R6L83SqAxCnLKauavILnIWfvg==
X-Received: by 2002:a17:90b:3b51:b0:1f0:5ebc:ac9 with SMTP id
 ot17-20020a17090b3b5100b001f05ebc0ac9mr893960pjb.229.1657592039759; 
 Mon, 11 Jul 2022 19:13:59 -0700 (PDT)
Received: from roots.. ([106.84.131.214]) by smtp.gmail.com with ESMTPSA id
 k22-20020aa79736000000b00528f9597fb3sm5430251pfg.197.2022.07.11.19.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 19:13:59 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Markus Armbruster <armbru@redhat.com>,
 dmitry.fomichev@wdc.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, hare@suse.de, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v4 2/9] qemu-io: add zoned block device operations.
Date: Tue, 12 Jul 2022 10:13:38 +0800
Message-Id: <20220712021345.8530-3-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712021345.8530-1-faithilikerun@gmail.com>
References: <20220712021345.8530-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Add zoned storage commands of the device: zone_open(zo), zone_close(zc),
zone_reset(zs), zone_report(zp), zone_finish(zf).

For example, it can be called by:
./build/qemu-io --image-opts driver=zoned_host_device, filename=/dev/nullb0
-c "zone_report 0 0 1"

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/io.c               |  57 ++++++++++++++++
 include/block/block-io.h |  13 ++++
 qemu-io-cmds.c           | 143 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 213 insertions(+)

diff --git a/block/io.c b/block/io.c
index 1e9bf09a49..a760be0131 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3243,6 +3243,63 @@ out:
     return co.ret;
 }
 
+int bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
+                        int64_t *nr_zones,
+                        BlockZoneDescriptor *zones)
+{
+    BlockDriver *drv = bs->drv;
+    CoroutineIOCompletion co = {
+            .coroutine = qemu_coroutine_self(),
+    };
+    IO_CODE();
+
+    bdrv_inc_in_flight(bs);
+    if (!drv || (!drv->bdrv_co_zone_report)) {
+        co.ret = -ENOTSUP;
+        goto out;
+    }
+
+    if (drv->bdrv_co_zone_report) {
+        co.ret = drv->bdrv_co_zone_report(bs, offset, nr_zones, zones);
+    } else {
+        co.ret = -ENOTSUP;
+        goto out;
+        qemu_coroutine_yield();
+    }
+
+out:
+    bdrv_dec_in_flight(bs);
+    return co.ret;
+}
+
+int bdrv_co_zone_mgmt(BlockDriverState *bs, enum zone_op op,
+        int64_t offset, int64_t len)
+{
+    BlockDriver *drv = bs->drv;
+    CoroutineIOCompletion co = {
+            .coroutine = qemu_coroutine_self(),
+    };
+    IO_CODE();
+
+    bdrv_inc_in_flight(bs);
+    if (!drv || (!drv->bdrv_co_zone_mgmt)) {
+        co.ret = -ENOTSUP;
+        goto out;
+    }
+
+    if (drv->bdrv_co_zone_mgmt) {
+        co.ret = drv->bdrv_co_zone_mgmt(bs, op, offset, len);
+    } else {
+        co.ret = -ENOTSUP;
+        goto out;
+        qemu_coroutine_yield();
+    }
+
+out:
+    bdrv_dec_in_flight(bs);
+    return co.ret;
+}
+
 void *qemu_blockalign(BlockDriverState *bs, size_t size)
 {
     IO_CODE();
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 053a27141a..a0ae140452 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -80,6 +80,13 @@ int bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf);
 /* Ensure contents are flushed to disk.  */
 int coroutine_fn bdrv_co_flush(BlockDriverState *bs);
 
+/* Report zone information of zone block device. */
+int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
+                                     int64_t *nr_zones,
+                                     BlockZoneDescriptor *zones);
+int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, zone_op op,
+                                   int64_t offset, int64_t len);
+
 int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
 bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
 int bdrv_block_status(BlockDriverState *bs, int64_t offset,
@@ -289,6 +296,12 @@ bdrv_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
 int generated_co_wrapper
 bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
 
+int generated_co_wrapper
+blk_zone_report(BlockBackend *blk, int64_t offset, int64_t *nr_zones,
+                BlockZoneDescriptor *zones);
+int generated_co_wrapper
+blk_zone_mgmt(BlockBackend *blk, enum zone_op op, int64_t offset, int64_t len);
+
 /**
  * bdrv_parent_drained_begin_single:
  *
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 2f0d8ac25a..a88fa322d2 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -1706,6 +1706,144 @@ static const cmdinfo_t flush_cmd = {
     .oneline    = "flush all in-core file state to disk",
 };
 
+static int zone_report_f(BlockBackend *blk, int argc, char **argv)
+{
+    int ret;
+    int64_t offset, nr_zones;
+
+    ++optind;
+    offset = cvtnum(argv[optind]);
+    ++optind;
+    nr_zones = cvtnum(argv[optind]);
+
+    g_autofree BlockZoneDescriptor *zones = NULL;
+    zones = g_new(BlockZoneDescriptor, nr_zones);
+    ret = blk_zone_report(blk, offset, &nr_zones, zones);
+    if (ret < 0) {
+        printf("zone report failed: %s\n", strerror(-ret));
+    } else {
+        for (int i = 0; i < nr_zones; ++i) {
+            printf("start: 0x%" PRIx64 ", len 0x%" PRIx64 ", "
+                   "cap"" 0x%" PRIx64 ",wptr 0x%" PRIx64 ", "
+                   "zcond:%u, [type: %u]\n",
+                   zones[i].start, zones[i].length, zones[i].cap, zones[i].wp,
+                   zones[i].cond, zones[i].type);
+        }
+    }
+    return ret;
+}
+
+static const cmdinfo_t zone_report_cmd = {
+        .name = "zone_report",
+        .altname = "zp",
+        .cfunc = zone_report_f,
+        .argmin = 2,
+        .argmax = 2,
+        .args = "offset number",
+        .oneline = "report zone information",
+};
+
+static int zone_open_f(BlockBackend *blk, int argc, char **argv)
+{
+    int ret;
+    int64_t offset, len;
+    ++optind;
+    offset = cvtnum(argv[optind]);
+    ++optind;
+    len = cvtnum(argv[optind]);
+    ret = blk_zone_mgmt(blk, zone_open, offset, len);
+    if (ret < 0) {
+        printf("zone open failed: %s\n", strerror(-ret));
+    }
+    return ret;
+}
+
+static const cmdinfo_t zone_open_cmd = {
+        .name = "zone_open",
+        .altname = "zo",
+        .cfunc = zone_open_f,
+        .argmin = 2,
+        .argmax = 2,
+        .args = "offset len",
+        .oneline = "explicit open a range of zones in zone block device",
+};
+
+static int zone_close_f(BlockBackend *blk, int argc, char **argv)
+{
+    int ret;
+    int64_t offset, len;
+    ++optind;
+    offset = cvtnum(argv[optind]);
+    ++optind;
+    len = cvtnum(argv[optind]);
+    ret = blk_zone_mgmt(blk, zone_close, offset, len);
+    if (ret < 0) {
+        printf("zone close failed: %s\n", strerror(-ret));
+    }
+    return ret;
+}
+
+static const cmdinfo_t zone_close_cmd = {
+        .name = "zone_close",
+        .altname = "zc",
+        .cfunc = zone_close_f,
+        .argmin = 2,
+        .argmax = 2,
+        .args = "offset len",
+        .oneline = "close a range of zones in zone block device",
+};
+
+static int zone_finish_f(BlockBackend *blk, int argc, char **argv)
+{
+    int ret;
+    int64_t offset, len;
+    ++optind;
+    offset = cvtnum(argv[optind]);
+    ++optind;
+    len = cvtnum(argv[optind]);
+    ret = blk_zone_mgmt(blk, zone_finish, offset, len);
+    if (ret < 0) {
+        printf("zone finish failed: %s\n", strerror(-ret));
+    }
+    return ret;
+}
+
+static const cmdinfo_t zone_finish_cmd = {
+        .name = "zone_finish",
+        .altname = "zf",
+        .cfunc = zone_finish_f,
+        .argmin = 2,
+        .argmax = 2,
+        .args = "offset len",
+        .oneline = "finish a range of zones in zone block device",
+};
+
+static int zone_reset_f(BlockBackend *blk, int argc, char **argv)
+{
+    int ret;
+    int64_t offset, len;
+    ++optind;
+    offset = cvtnum(argv[optind]);
+    ++optind;
+    len = cvtnum(argv[optind]);
+    ret = blk_zone_mgmt(blk, zone_reset, offset, len);
+    if (ret < 0) {
+        printf("zone reset failed: %s\n", strerror(-ret));
+    }
+    return ret;
+}
+
+static const cmdinfo_t zone_reset_cmd = {
+        .name = "zone_reset",
+        .altname = "zrs",
+        .cfunc = zone_reset_f,
+        .argmin = 2,
+        .argmax = 2,
+        .args = "offset len",
+        .oneline = "reset a zone write pointer in zone block device",
+};
+
+
 static int truncate_f(BlockBackend *blk, int argc, char **argv);
 static const cmdinfo_t truncate_cmd = {
     .name       = "truncate",
@@ -2498,6 +2636,11 @@ static void __attribute((constructor)) init_qemuio_commands(void)
     qemuio_add_command(&aio_write_cmd);
     qemuio_add_command(&aio_flush_cmd);
     qemuio_add_command(&flush_cmd);
+    qemuio_add_command(&zone_report_cmd);
+    qemuio_add_command(&zone_open_cmd);
+    qemuio_add_command(&zone_close_cmd);
+    qemuio_add_command(&zone_finish_cmd);
+    qemuio_add_command(&zone_reset_cmd);
     qemuio_add_command(&truncate_cmd);
     qemuio_add_command(&length_cmd);
     qemuio_add_command(&info_cmd);
-- 
2.36.1


