Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E5961C71
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 11:34:42 +0200 (CEST)
Received: from localhost ([::1]:39778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkQ2j-0001rX-M6
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 05:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47856)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pizhenwei@bytedance.com>) id 1hkQ0w-0000s6-MH
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 05:32:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pizhenwei@bytedance.com>) id 1hkQ0u-000553-Lc
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 05:32:50 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:39810)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pizhenwei@bytedance.com>)
 id 1hkQ0s-000525-J5
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 05:32:48 -0400
Received: by mail-pl1-x644.google.com with SMTP id b7so7953714pls.6
 for <qemu-devel@nongnu.org>; Mon, 08 Jul 2019 02:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FJXIlK+69aNv2aDNGdU+aI20EoP4M3xQmlBMOMtoYhk=;
 b=q3/iwZPKunDeUSQgvQLpVsUUEP0oRxVC1av6anVGb/uMQq5fMPkYSc7fgyPePvFVyt
 YpvouLGnxnPDw7OBR4H4eujJuHrTlBQguNr5AqLcn4K4lwDYeMN5HzwmmVorqS85kIce
 OBOj98LfA2hCCpmGZhl6wW8bH7jyqDiB1s2OjzYjZ/sJCSNTk4FtLSZRard/eW/cZGLa
 Lc9L8dAdNrEHTeFSrItkS3I6zIv/xcpa6gB6fd9xS7K+1lyHJ/BEZjQx3hj+GR848Kcn
 e/RnjN+rp+/TsY4VEM98KaQwZQdOj8pWaCQgWHEO5Ms50FrFbKhxjILrw2/hnqgC8kq3
 E6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FJXIlK+69aNv2aDNGdU+aI20EoP4M3xQmlBMOMtoYhk=;
 b=MIyHnz6a1+G8Ep2jNUj2yvw9Y9HXs/APwzPsUYPyISZSD5m1h28l7OEt8qUgNFgrh/
 Fn8nofuV5WYRaH3x+h2P5xr8Q5uoGkROddCI/yTrP2W8mUV9nhRGvICJvs+ZTgcA33Pi
 7SHrnohlh+bDrznGFnkvVutyj8WaWOcj0KuTSgRTDPLxjBeLqWhZsFm86/blJ/5dskAT
 jYq6vjj428Zsux5eHYmKFGaWDug6ETJImpGnPdKoMK6v7treCoBTUkYRq47su/tkG3SH
 tc1PH8PEFsvwyEDdErV4Htcyju/k/buNDrS743ODSKuNUKC28zyZDAn+cY7BUPeElcXL
 YzIQ==
X-Gm-Message-State: APjAAAUG2RdcLaEsd+PwcmblDAUqGIBE7Ho3qoSFD9IW3ooGHpfi8PZ0
 y/Tpzcu3venYGcxT0ObCWijsMQ==
X-Google-Smtp-Source: APXvYqyCPUQX74hlMfQO0Vh9LYnf/kKhTLfVn16l1u84PNs/D7MM49d94KkJLgSWKiexoaXpAfHKtQ==
X-Received: by 2002:a17:902:684:: with SMTP id
 4mr23295792plh.138.1562578363281; 
 Mon, 08 Jul 2019 02:32:43 -0700 (PDT)
Received: from always-ThinkPad-T480.bytedance.net ([61.120.150.76])
 by smtp.gmail.com with ESMTPSA id q7sm236504pff.2.2019.07.08.02.32.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 08 Jul 2019 02:32:42 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: kwolf@redhat.com,
	vsementsov@virtuozzo.com,
	eblake@redhat.com
Date: Mon,  8 Jul 2019 17:32:29 +0800
Message-Id: <1562578349-12333-4-git-send-email-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562578349-12333-1-git-send-email-pizhenwei@bytedance.com>
References: <1562578349-12333-1-git-send-email-pizhenwei@bytedance.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-devel] [PATCH v2 3/3] qapi: make block histogram interface
 common
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, pizhenwei@bytedance.com,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Modify command 'block-latency-histogram-set' to 'block-histogram-set'
and modify struct 'BlockLatencyHistogramInfo' to struct
'BlockHistogramInfo', this makes block histogram interface common to
use.

Currently 'BlockHistogramType' supports 'latency', it works as same
as the old command 'block-latency-histogram-set'. New enum 'size'
allows QEMU to fill histogram by block I/O size in byte.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/qapi.c         |  11 +++++-
 blockdev.c           |  33 +++++++++++++----
 qapi/block-core.json | 101 +++++++++++++++++++++++++++++++--------------------
 3 files changed, 95 insertions(+), 50 deletions(-)

diff --git a/block/qapi.c b/block/qapi.c
index 9d9b2f1927..c778b2c376 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -416,11 +416,11 @@ static uint64List *uint64_list(uint64_t *list, int size)
 }
 
 static void bdrv_histogram_stats(BlockHistogram *hist, bool *not_null,
-                                 BlockLatencyHistogramInfo **info)
+                                 BlockHistogramInfo **info)
 {
     *not_null = hist->bins != NULL;
     if (*not_null) {
-        *info = g_new0(BlockLatencyHistogramInfo, 1);
+        *info = g_new0(BlockHistogramInfo, 1);
 
         (*info)->boundaries = uint64_list(hist->boundaries, hist->nbins - 1);
         (*info)->bins = uint64_list(hist->bins, hist->nbins);
@@ -502,6 +502,13 @@ static void bdrv_query_blk_stats(BlockDeviceStats *ds, BlockBackend *blk)
     bdrv_histogram_stats(&stats->latency_histogram[BLOCK_ACCT_FLUSH],
                          &ds->has_flush_latency_histogram,
                          &ds->flush_latency_histogram);
+    bdrv_histogram_stats(&stats->size_histogram[BLOCK_ACCT_READ],
+                         &ds->has_rd_size_histogram, &ds->rd_size_histogram);
+    bdrv_histogram_stats(&stats->size_histogram[BLOCK_ACCT_WRITE],
+                         &ds->has_wr_size_histogram, &ds->wr_size_histogram);
+    bdrv_histogram_stats(&stats->size_histogram[BLOCK_ACCT_FLUSH],
+                         &ds->has_flush_size_histogram,
+                         &ds->flush_size_histogram);
 }
 
 static BlockStats *bdrv_query_bds_stats(BlockDriverState *bs,
diff --git a/blockdev.c b/blockdev.c
index 5d6a13dea9..82240ae8c5 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -4507,8 +4507,9 @@ void qmp_x_blockdev_set_iothread(const char *node_name, StrOrNull *iothread,
     aio_context_release(old_context);
 }
 
-void qmp_block_latency_histogram_set(
+void qmp_block_histogram_set(
     const char *id,
+    BlockHistogramType type,
     bool has_boundaries, uint64List *boundaries,
     bool has_boundaries_read, uint64List *boundaries_read,
     bool has_boundaries_write, uint64List *boundaries_write,
@@ -4517,24 +4518,42 @@ void qmp_block_latency_histogram_set(
 {
     BlockBackend *blk = qmp_get_blk(NULL, id, errp);
     BlockAcctStats *stats;
+    void (*clear_func)(BlockAcctStats *stats);
+    int (*set_func)(BlockAcctStats *stats, enum BlockAcctType type,
+                    uint64List *boundaries);
     int ret;
 
     if (!blk) {
         return;
     }
 
+    switch (type) {
+    case BLOCK_HISTOGRAM_TYPE_LATENCY: {
+        clear_func = block_latency_histograms_clear;
+        set_func = block_latency_histogram_set;
+        break;
+    }
+    case BLOCK_HISTOGRAM_TYPE_SIZE: {
+        clear_func = block_size_histograms_clear;
+        set_func = block_size_histogram_set;
+        break;
+    }
+    default:
+        error_setg(errp, "Unsupported block histogram type");
+        return;
+    }
+
     stats = blk_get_stats(blk);
 
     if (!has_boundaries && !has_boundaries_read && !has_boundaries_write &&
         !has_boundaries_flush)
     {
-        block_latency_histograms_clear(stats);
+        clear_func(stats);
         return;
     }
 
     if (has_boundaries || has_boundaries_read) {
-        ret = block_latency_histogram_set(
-            stats, BLOCK_ACCT_READ,
+        ret = set_func(stats, BLOCK_ACCT_READ,
             has_boundaries_read ? boundaries_read : boundaries);
         if (ret) {
             error_setg(errp, "Device '%s' set read boundaries fail", id);
@@ -4543,8 +4562,7 @@ void qmp_block_latency_histogram_set(
     }
 
     if (has_boundaries || has_boundaries_write) {
-        ret = block_latency_histogram_set(
-            stats, BLOCK_ACCT_WRITE,
+        ret = set_func(stats, BLOCK_ACCT_WRITE,
             has_boundaries_write ? boundaries_write : boundaries);
         if (ret) {
             error_setg(errp, "Device '%s' set write boundaries fail", id);
@@ -4553,8 +4571,7 @@ void qmp_block_latency_histogram_set(
     }
 
     if (has_boundaries || has_boundaries_flush) {
-        ret = block_latency_histogram_set(
-            stats, BLOCK_ACCT_FLUSH,
+        ret = set_func(stats, BLOCK_ACCT_FLUSH,
             has_boundaries_flush ? boundaries_flush : boundaries);
         if (ret) {
             error_setg(errp, "Device '%s' set flush boundaries fail", id);
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 0d43d4f37c..b3b8d714d3 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -533,12 +533,12 @@
            'flags': ['Qcow2BitmapInfoFlags'] } }
 
 ##
-# @BlockLatencyHistogramInfo:
+# @BlockHistogramInfo:
 #
-# Block latency histogram.
+# Block histogram.
 #
-# @boundaries: list of interval boundary values in nanoseconds, all greater
-#              than zero and in ascending order.
+# @boundaries: list of interval boundary values, all greater than zero and in
+#              ascending order.
 #              For example, the list [10, 50, 100] produces the following
 #              histogram intervals: [0, 10), [10, 50), [50, 100), [100, +inf).
 #
@@ -555,57 +555,72 @@
 #         +------------------
 #             10   50   100
 #
-# Since: 4.0
+# Since: 4.1
 ##
-{ 'struct': 'BlockLatencyHistogramInfo',
+{ 'struct': 'BlockHistogramInfo',
   'data': {'boundaries': ['uint64'], 'bins': ['uint64'] } }
 
 ##
-# @block-latency-histogram-set:
+# @BlockHistogramType:
 #
-# Manage read, write and flush latency histograms for the device.
+# An enumeration of block histogram type.
 #
-# If only @id parameter is specified, remove all present latency histograms
-# for the device. Otherwise, add/reset some of (or all) latency histograms.
+# @latency: The histogram is filled by block I/O latency in nanosecond.
+#
+# @size: The histogram is filled by block I/O size in byte.
+#
+# Since: 4.1
+##
+{ 'enum': 'BlockHistogramType', 'data': [ 'latency', 'size' ] }
+
+##
+# @block-histogram-set:
+#
+# Manage read, write and flush @BlockHistogramType histograms for the device.
+#
+# If only @id and @type parameter are specified, remove all present @type
+# histograms for the device. Otherwise, add/reset some of (or all) @type
+# histograms.
 #
 # @id: The name or QOM path of the guest device.
 #
+# @type: The type @BlockHistogramType of histogram.
+#
 # @boundaries: list of interval boundary values (see description in
-#              BlockLatencyHistogramInfo definition). If specified, all
-#              latency histograms are removed, and empty ones created for all
-#              io types with intervals corresponding to @boundaries (except for
-#              io types, for which specific boundaries are set through the
-#              following parameters).
+#              BlockHistogramInfo definition). If specified, all histograms
+#              are removed, and empty ones created for all io types with
+#              intervals corresponding to @boundaries (except for io types
+#              for which specific boundaries are set through the following
+#              parameters).
 #
-# @boundaries-read: list of interval boundary values for read latency
-#                   histogram. If specified, old read latency histogram is
-#                   removed, and empty one created with intervals
-#                   corresponding to @boundaries-read. The parameter has higher
-#                   priority then @boundaries.
+# @boundaries-read: list of interval boundary values for read histogram. If
+#                   specified, old read histogram is removed, and empty one
+#                   created with intervals corresponding to @boundaries-read.
+#                   The parameter has higher priority then @boundaries.
 #
-# @boundaries-write: list of interval boundary values for write latency
-#                    histogram.
+# @boundaries-write: list of interval boundary values for write histogram.
 #
-# @boundaries-flush: list of interval boundary values for flush latency
-#                    histogram.
+# @boundaries-flush: list of interval boundary values for flush histogram.
 #
 # Returns: error if device is not found or any boundary arrays are invalid.
 #
-# Since: 4.0
+# Since: 4.1
 #
-# Example: set new histograms for all io types with intervals
+# Example: set new latency histograms for all io types with intervals
 # [0, 10), [10, 50), [50, 100), [100, +inf):
 #
-# -> { "execute": "block-latency-histogram-set",
+# -> { "execute": "block-histogram-set",
 #      "arguments": { "id": "drive0",
+#                     "type":"latency",
 #                     "boundaries": [10, 50, 100] } }
 # <- { "return": {} }
 #
-# Example: set new histogram only for write, other histograms will remain
-# not changed (or not created):
+# Example: set new latency histogram only for write, other histograms will
+# remain not changed (or not created):
 #
-# -> { "execute": "block-latency-histogram-set",
+# -> { "execute": "block-histogram-set",
 #      "arguments": { "id": "drive0",
+#                     "type":"latency",
 #                     "boundaries-write": [10, 50, 100] } }
 # <- { "return": {} }
 #
@@ -613,20 +628,23 @@
 #   read, flush: [0, 10), [10, 50), [50, 100), [100, +inf)
 #   write: [0, 1000), [1000, 5000), [5000, +inf)
 #
-# -> { "execute": "block-latency-histogram-set",
+# -> { "execute": "block-histogram-set",
 #      "arguments": { "id": "drive0",
+#                     "type":"latency",
 #                     "boundaries": [10, 50, 100],
 #                     "boundaries-write": [1000, 5000] } }
 # <- { "return": {} }
 #
 # Example: remove all latency histograms:
 #
-# -> { "execute": "block-latency-histogram-set",
-#      "arguments": { "id": "drive0" } }
+# -> { "execute": "block-histogram-set",
+#      "arguments": { "id": "drive0"
+#                     "type":"latency"} }
 # <- { "return": {} }
 ##
-{ 'command': 'block-latency-histogram-set',
+{ 'command': 'block-histogram-set',
   'data': {'id': 'str',
+           'type': 'BlockHistogramType',
            '*boundaries': ['uint64'],
            '*boundaries-read': ['uint64'],
            '*boundaries-write': ['uint64'],
@@ -912,11 +930,11 @@
 # @timed_stats: Statistics specific to the set of previously defined
 #               intervals of time (Since 2.5)
 #
-# @rd_latency_histogram: @BlockLatencyHistogramInfo. (Since 4.0)
+# @rd_latency_histogram: @BlockHistogramInfo. (Since 4.1)
 #
-# @wr_latency_histogram: @BlockLatencyHistogramInfo. (Since 4.0)
+# @wr_latency_histogram: @BlockHistogramInfo. (Since 4.1)
 #
-# @flush_latency_histogram: @BlockLatencyHistogramInfo. (Since 4.0)
+# @flush_latency_histogram: @BlockHistogramInfo. (Since 4.1)
 #
 # Since: 0.14.0
 ##
@@ -931,9 +949,12 @@
            'invalid_wr_operations': 'int', 'invalid_flush_operations': 'int',
            'account_invalid': 'bool', 'account_failed': 'bool',
            'timed_stats': ['BlockDeviceTimedStats'],
-           '*rd_latency_histogram': 'BlockLatencyHistogramInfo',
-           '*wr_latency_histogram': 'BlockLatencyHistogramInfo',
-           '*flush_latency_histogram': 'BlockLatencyHistogramInfo' } }
+           '*rd_latency_histogram': 'BlockHistogramInfo',
+           '*wr_latency_histogram': 'BlockHistogramInfo',
+           '*flush_latency_histogram': 'BlockHistogramInfo',
+           '*rd_size_histogram': 'BlockHistogramInfo',
+           '*wr_size_histogram': 'BlockHistogramInfo',
+           '*flush_size_histogram': 'BlockHistogramInfo' } }
 
 ##
 # @BlockStats:
-- 
2.11.0


