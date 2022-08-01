Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C6F586259
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 03:44:19 +0200 (CEST)
Received: from localhost ([::1]:41340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIKTi-0002yL-MO
	for lists+qemu-devel@lfdr.de; Sun, 31 Jul 2022 21:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oIKJv-0004BN-92; Sun, 31 Jul 2022 21:34:20 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:43004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oIKJt-0000fq-Ft; Sun, 31 Jul 2022 21:34:10 -0400
Received: by mail-pg1-x52c.google.com with SMTP id i71so2899474pge.9;
 Sun, 31 Jul 2022 18:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=STp8BitGJRh7BHonoM/wiLh8qdiBzBp/kI1Nm1IuscI=;
 b=UkMQZa+AsoeHAvbyx3YJF8klbEmAI2I0BXYdhyM0eRoNuNgc2ipfipt35DkrQb0RZG
 opvwyeVQTrpOOuJ4TbjFmZI6j3FsHt5XYTF28X1qDWvyNOKkLjfMByVcGS3OoTzt3JIg
 layLSu8+mG3So28lkU16WYU0x9cAkZQ9znv49ettD52ID0gb4pqOks1jZ/2pWK2emAu1
 P/fxYIJvb66xtA7IYeN2hkxu8MfCH03sx0xOk/T7xPYmXLodKPHYyfLv7FXdqkJnkECW
 7rRYnjYCJbdXPgZMRIeTo3hp6HNmVtWz3gtm94Hjz1pgz3/oN849dAHdprVh2JCAvS3j
 1+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=STp8BitGJRh7BHonoM/wiLh8qdiBzBp/kI1Nm1IuscI=;
 b=bqY7DVfeZrQZtvMy61ipUB6S02D1a7Q19oS13bYsSCzJt9JAZRSeDOOduPZgO8vUBn
 y7q5ku+xMVTZA3uL7TeHHHdcl3i516mQDEPS5OaHMzUfZ6s/Wu5JxGAdGkhHUDSnRZ9e
 jGl1QDnwTGaA939zXwTDMeoukD4fGI1bqwY69kIFvZH1U7XCWT2/g3wm7DdTocgaOnSD
 3FEAvT0Y3fXh62kLaDBtfxwUXm3bBLgzETM/LKc4ryQv72bWGIe/WkVTlTBtUuXIJiPB
 VN6mx8YBG8a5qJDHX+rgI9rB9ef0ovSaRuB81IJikN2wfJ/SLbnnQftLJ1lTouVCXPKR
 6caQ==
X-Gm-Message-State: AJIora/JFK5lRR3kvKO03Jnf1sVEQ4TS8dI1Zb6BCH0p2icnON9x3yWK
 zF0rgBzAfA+DvA6qQpsHhRJ8rqiy/asjGjFT
X-Google-Smtp-Source: AGRyM1vK/5A/bvqkvCgzKCwOYy5cJ9bDeOK51xZCMyeIo283ywvyo6Mr/a3pKzNPSECZ+VCFn9qlSA==
X-Received: by 2002:a63:c04:0:b0:41a:ff05:a863 with SMTP id
 b4-20020a630c04000000b0041aff05a863mr11416607pgl.513.1659317646529; 
 Sun, 31 Jul 2022 18:34:06 -0700 (PDT)
Received: from roots.. ([106.84.131.7]) by smtp.gmail.com with ESMTPSA id
 l185-20020a6391c2000000b0041bf7924fc4sm1530970pge.13.2022.07.31.18.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 18:34:06 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, dmitry.fomichev@wdc.com, hare@suse.de,
 stefanha@redhat.com, mst@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, fam@euphon.net, kwolf@redhat.com, hreitz@redhat.com,
 eblake@redhat.com, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v5 09/11] qemu-io: add zoned block device operations.
Date: Mon,  1 Aug 2022 09:33:59 +0800
Message-Id: <20220801013359.10702-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x52c.google.com
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

Add zoned storage commands of the device: zone_report(zrp), zone_open(zo),
zone_close(zc), zone_reset(zrs), zone_finish(zf).

For example, to test zone_report, use following command:
$ ./build/qemu-io --image-opts driver=zoned_host_device, filename=/dev/nullb0
-c "zrp offset nr_zones"

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/io.c     |  24 ++-------
 qemu-io-cmds.c | 144 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 148 insertions(+), 20 deletions(-)

diff --git a/block/io.c b/block/io.c
index a4625fb0e1..de9ec1d740 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3209,19 +3209,11 @@ int bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
     IO_CODE();
 
     bdrv_inc_in_flight(bs);
-    if (!drv || (!drv->bdrv_co_zone_report)) {
+    if (!drv || !drv->bdrv_co_zone_report) {
         co.ret = -ENOTSUP;
         goto out;
     }
-
-    if (drv->bdrv_co_zone_report) {
-        co.ret = drv->bdrv_co_zone_report(bs, offset, nr_zones, zones);
-    } else {
-        co.ret = -ENOTSUP;
-        goto out;
-        qemu_coroutine_yield();
-    }
-
+    co.ret = drv->bdrv_co_zone_report(bs, offset, nr_zones, zones);
 out:
     bdrv_dec_in_flight(bs);
     return co.ret;
@@ -3237,19 +3229,11 @@ int bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
     IO_CODE();
 
     bdrv_inc_in_flight(bs);
-    if (!drv || (!drv->bdrv_co_zone_mgmt)) {
+    if (!drv || !drv->bdrv_co_zone_mgmt) {
         co.ret = -ENOTSUP;
         goto out;
     }
-
-    if (drv->bdrv_co_zone_mgmt) {
-        co.ret = drv->bdrv_co_zone_mgmt(bs, op, offset, len);
-    } else {
-        co.ret = -ENOTSUP;
-        goto out;
-        qemu_coroutine_yield();
-    }
-
+    co.ret = drv->bdrv_co_zone_mgmt(bs, op, offset, len);
 out:
     bdrv_dec_in_flight(bs);
     return co.ret;
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 952dc940f1..5a215277c7 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -1712,6 +1712,145 @@ static const cmdinfo_t flush_cmd = {
     .oneline    = "flush all in-core file state to disk",
 };
 
+static int zone_report_f(BlockBackend *blk, int argc, char **argv)
+{
+    int ret;
+    int64_t offset;
+    unsigned int nr_zones;
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
+        .altname = "zrp",
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
+    ret = blk_zone_mgmt(blk, BLK_ZO_OPEN, offset, len);
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
+    ret = blk_zone_mgmt(blk, BLK_ZO_CLOSE, offset, len);
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
+    ret = blk_zone_mgmt(blk, BLK_ZO_FINISH, offset, len);
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
+    ret = blk_zone_mgmt(blk, BLK_ZO_RESET, offset, len);
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
@@ -2504,6 +2643,11 @@ static void __attribute((constructor)) init_qemuio_commands(void)
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
2.37.1


