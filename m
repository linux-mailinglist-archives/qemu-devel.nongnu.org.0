Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAD94CAB7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 11:24:14 +0200 (CEST)
Received: from localhost ([::1]:45198 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdtIj-00071t-65
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 05:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38508)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pizhenwei@bytedance.com>) id 1hdsqS-0006T5-5m
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:55:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pizhenwei@bytedance.com>) id 1hdsqP-0006aT-CZ
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:54:59 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:36980)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pizhenwei@bytedance.com>)
 id 1hdsqO-0006NU-QR
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:54:57 -0400
Received: by mail-pf1-x442.google.com with SMTP id 19so1285314pfa.4
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 01:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xVkd2C7jozt0zN9T2y4YYluovPXWmSBr7js0pW49C0o=;
 b=TRwwnpQO9VP2qNvzhco1dy9ZLD9gp/aaZoCX6phlG5UK9JVcKiolvJfE7l3qXAi1ro
 9b6ZC2ZkbEQcaV87ee8f7DZOz7NI0R19lYv09FPyk4OvSvQELlizo22mIsur1EgM7jfl
 4yRaSCMRzWSfhvgOCAVtdcZcWe+oq5/oba3hisqxBRa1pShOgMjsDJQb8OGmump5YWNm
 p/2meipNXzpHIDAe7z5pbMekMK/8XSuoCI1X7Z0N1e7V3hm50WZzUyijIpUm4apy6hqZ
 qGllI1KXc7wRkHahNK9MslOgT/6AUCddmlWJE+yraycmyp1I48TEeYAlCvkUmtO0kcPD
 z4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xVkd2C7jozt0zN9T2y4YYluovPXWmSBr7js0pW49C0o=;
 b=AYLxSFs9q/PUAemBDoaQrBx9z+tft+f25GDCBr4cYWw4DBn00FxNi1/agcZU9m9uqf
 wf+QbdrEz4w3BEtFqisTtRU+K+v/Z7x6yPeXXw2dECqiZJNXSNywM4NwUDU8XpmWtzfO
 4W9+PA2uEgdYpUdoXiUbo/piJWTyV96bq/e7PO6lJvt83JNz3Fn0+NcINn1HDQYFo1NY
 rRRg36nlyOu6gyxT/Y+8bmZPQPeezmGmtqz9dS9m/AH29BeWBYYqe6eIC9vYU4YzhTnQ
 SHRlv0IGvTsQSVEEIIfXpJ+ifRy6Fi80BD5u9dP5txAAQzHO5VySt/3CU2oTVW2ojhzF
 j73A==
X-Gm-Message-State: APjAAAULuHzVWOhWoEb/510Z8Elqc5F5Vo+ZwAoG5pefOvVnPUnZ6fYp
 Hotn/YVmCz82B8CN2VWY8pdqFQ==
X-Google-Smtp-Source: APXvYqx6dTppPQCyp2hrIPnXzMII4xuJk50bB9L6ByS8qQJ8AcYKQL+eM0XnddzrFWEmDGg2x1zuOQ==
X-Received: by 2002:a63:9d43:: with SMTP id i64mr11040721pgd.404.1561020881592; 
 Thu, 20 Jun 2019 01:54:41 -0700 (PDT)
Received: from always-ThinkPad-T480.bytedance.net ([61.120.150.76])
 by smtp.gmail.com with ESMTPSA id c11sm19240635pgg.2.2019.06.20.01.54.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 20 Jun 2019 01:54:41 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: kwolf@redhat.com,
	mreitz@redhat.com
Date: Thu, 20 Jun 2019 16:54:30 +0800
Message-Id: <1561020872-6214-2-git-send-email-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561020872-6214-1-git-send-email-pizhenwei@bytedance.com>
References: <1561020872-6214-1-git-send-email-pizhenwei@bytedance.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-devel] [PATCH 1/3] block/accounting: rename struct
 BlockLatencyHistogram
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
Cc: fam@euphon.net, qemu-block@nongnu.org, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, pizhenwei@bytedance.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename struct BlockLatencyHistogram to BlockHistogram, and rename
related functions name.
make this struct and functions be common, they can be used widely.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 block/accounting.c         | 31 ++++++++++++++++++-------------
 block/qapi.c               |  2 +-
 include/block/accounting.h |  8 ++++----
 3 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/block/accounting.c b/block/accounting.c
index 70a3d9a426..bb8148b6b1 100644
--- a/block/accounting.c
+++ b/block/accounting.c
@@ -94,13 +94,13 @@ void block_acct_start(BlockAcctStats *stats, BlockAcctCookie *cookie,
     cookie->type = type;
 }
 
-/* block_latency_histogram_compare_func:
+/* block_histogram_compare_func:
  * Compare @key with interval [@it[0], @it[1]).
  * Return: -1 if @key < @it[0]
  *          0 if @key in [@it[0], @it[1])
  *         +1 if @key >= @it[1]
  */
-static int block_latency_histogram_compare_func(const void *key, const void *it)
+static int block_histogram_compare_func(const void *key, const void *it)
 {
     uint64_t k = *(uint64_t *)key;
     uint64_t a = ((uint64_t *)it)[0];
@@ -109,8 +109,7 @@ static int block_latency_histogram_compare_func(const void *key, const void *it)
     return k < a ? -1 : (k < b ? 0 : 1);
 }
 
-static void block_latency_histogram_account(BlockLatencyHistogram *hist,
-                                            int64_t latency_ns)
+static void block_histogram_account(BlockHistogram *hist, int64_t val)
 {
     uint64_t *pos;
 
@@ -120,28 +119,26 @@ static void block_latency_histogram_account(BlockLatencyHistogram *hist,
     }
 
 
-    if (latency_ns < hist->boundaries[0]) {
+    if (val < hist->boundaries[0]) {
         hist->bins[0]++;
         return;
     }
 
-    if (latency_ns >= hist->boundaries[hist->nbins - 2]) {
+    if (val >= hist->boundaries[hist->nbins - 2]) {
         hist->bins[hist->nbins - 1]++;
         return;
     }
 
-    pos = bsearch(&latency_ns, hist->boundaries, hist->nbins - 2,
+    pos = bsearch(&val, hist->boundaries, hist->nbins - 2,
                   sizeof(hist->boundaries[0]),
-                  block_latency_histogram_compare_func);
+                  block_histogram_compare_func);
     assert(pos != NULL);
 
     hist->bins[pos - hist->boundaries + 1]++;
 }
 
-int block_latency_histogram_set(BlockAcctStats *stats, enum BlockAcctType type,
-                                uint64List *boundaries)
+static int block_histogram_set(BlockHistogram *hist, uint64List *boundaries)
 {
-    BlockLatencyHistogram *hist = &stats->latency_histogram[type];
     uint64List *entry;
     uint64_t *ptr;
     uint64_t prev = 0;
@@ -170,12 +167,20 @@ int block_latency_histogram_set(BlockAcctStats *stats, enum BlockAcctType type,
     return 0;
 }
 
+int block_latency_histogram_set(BlockAcctStats *stats, enum BlockAcctType type,
+                                uint64List *boundaries)
+{
+    BlockHistogram *hist = &stats->latency_histogram[type];
+
+    return block_histogram_set(hist, boundaries);
+}
+
 void block_latency_histograms_clear(BlockAcctStats *stats)
 {
     int i;
 
     for (i = 0; i < BLOCK_MAX_IOTYPE; i++) {
-        BlockLatencyHistogram *hist = &stats->latency_histogram[i];
+        BlockHistogram *hist = &stats->latency_histogram[i];
         g_free(hist->bins);
         g_free(hist->boundaries);
         memset(hist, 0, sizeof(*hist));
@@ -204,7 +209,7 @@ static void block_account_one_io(BlockAcctStats *stats, BlockAcctCookie *cookie,
         stats->nr_ops[cookie->type]++;
     }
 
-    block_latency_histogram_account(&stats->latency_histogram[cookie->type],
+    block_histogram_account(&stats->latency_histogram[cookie->type],
                                     latency_ns);
 
     if (!failed || stats->account_failed) {
diff --git a/block/qapi.c b/block/qapi.c
index 917435f022..f3a84f776e 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -415,7 +415,7 @@ static uint64List *uint64_list(uint64_t *list, int size)
     return out_list;
 }
 
-static void bdrv_latency_histogram_stats(BlockLatencyHistogram *hist,
+static void bdrv_latency_histogram_stats(BlockHistogram *hist,
                                          bool *not_null,
                                          BlockLatencyHistogramInfo **info)
 {
diff --git a/include/block/accounting.h b/include/block/accounting.h
index d1f67b10dd..270fddb69c 100644
--- a/include/block/accounting.h
+++ b/include/block/accounting.h
@@ -46,7 +46,7 @@ struct BlockAcctTimedStats {
     QSLIST_ENTRY(BlockAcctTimedStats) entries;
 };
 
-typedef struct BlockLatencyHistogram {
+typedef struct BlockHistogram {
     /* The following histogram is represented like this:
      *
      * 5|           *
@@ -57,7 +57,7 @@ typedef struct BlockLatencyHistogram {
      *  +------------------
      *      10   50   100
      *
-     * BlockLatencyHistogram histogram = {
+     * BlockHistogram histogram = {
      *     .nbins = 4,
      *     .boundaries = {10, 50, 100},
      *     .bins = {3, 1, 5, 2},
@@ -74,7 +74,7 @@ typedef struct BlockLatencyHistogram {
     uint64_t *boundaries; /* @nbins-1 numbers here
                              (all boundaries, except 0 and +inf) */
     uint64_t *bins;
-} BlockLatencyHistogram;
+} BlockHistogram;
 
 struct BlockAcctStats {
     QemuMutex lock;
@@ -88,7 +88,7 @@ struct BlockAcctStats {
     QSLIST_HEAD(, BlockAcctTimedStats) intervals;
     bool account_invalid;
     bool account_failed;
-    BlockLatencyHistogram latency_histogram[BLOCK_MAX_IOTYPE];
+    BlockHistogram latency_histogram[BLOCK_MAX_IOTYPE];
 };
 
 typedef struct BlockAcctCookie {
-- 
2.11.0


