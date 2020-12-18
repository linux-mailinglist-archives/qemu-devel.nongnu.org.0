Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5E22DE1B4
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:03:32 +0100 (CET)
Received: from localhost ([::1]:51622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDXn-0003Yy-I8
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:03:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDCk-0003LA-RM
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:41:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDCi-0004ax-OY
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:41:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608288103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oL9B5pHuDTvl/C4Q0ubbRuu7tz9UoMdEJ0xwOaoJb38=;
 b=XgrtMmdyAYnGSvQl0oprEx0nQCKzSNZ84OmvWWYJ3zILWeRPUclTUOTHWU1jmgxQPDnobU
 NkxPpl1c5My7kmgk0AQDsEfT70UXz5qyqnzQi909jaIjB8J9EWNCXxp6aDm6jV4vj/vYFO
 oGbqkM0wgcH+ogAsqdAlUE5DGn0HwuE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-byaIMiSXOv6Kyb0wnH5i0Q-1; Fri, 18 Dec 2020 05:41:41 -0500
X-MC-Unique: byaIMiSXOv6Kyb0wnH5i0Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47D10107ACE4;
 Fri, 18 Dec 2020 10:41:39 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-200.ams2.redhat.com
 [10.36.114.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4545D60C15;
 Fri, 18 Dec 2020 10:41:37 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, aiyutao@huawei.com, peter.maydell@linaro.org,
 vgoyal@redhat.com, lersek@redhat.com, alex.chen@huawei.com,
 armbru@redhat.com, tu.guoyi@h3c.com
Subject: [PULL 06/15] virtiofsd: make the debug log timestamp on stderr more
 human-readable
Date: Fri, 18 Dec 2020 10:41:08 +0000
Message-Id: <20201218104117.199096-7-dgilbert@redhat.com>
In-Reply-To: <20201218104117.199096-1-dgilbert@redhat.com>
References: <20201218104117.199096-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laszlo Ersek <lersek@redhat.com>

The current timestamp format doesn't help me visually notice small jumps
in time ("small" as defined on human scale, such as a few seconds or a few
ten seconds). Replace it with a local time format where such differences
stand out.

Before:

> [13316826770337] [ID: 00000004] unique: 62, opcode: RELEASEDIR (29), nodeid: 1, insize: 64, pid: 1
> [13316826778175] [ID: 00000004]    unique: 62, success, outsize: 16
> [13316826781156] [ID: 00000004] virtio_send_msg: elem 0: with 1 in desc of length 16
> [15138279317927] [ID: 00000001] virtio_loop: Got VU event
> [15138279504884] [ID: 00000001] fv_queue_set_started: qidx=1 started=0
> [15138279519034] [ID: 00000003] fv_queue_thread: kill event on queue 1 - quitting
> [15138280876463] [ID: 00000001] fv_remove_watch: TODO! fd=9
> [15138280897381] [ID: 00000001] virtio_loop: Waiting for VU event
> [15138280946834] [ID: 00000001] virtio_loop: Got VU event
> [15138281175421] [ID: 00000001] virtio_loop: Waiting for VU event
> [15138281182387] [ID: 00000001] virtio_loop: Got VU event
> [15138281189474] [ID: 00000001] virtio_loop: Waiting for VU event
> [15138309321936] [ID: 00000001] virtio_loop: Unexpected poll revents 11
> [15138309434150] [ID: 00000001] virtio_loop: Exit

(Notice how you don't (easily) notice the gap in time after
"virtio_send_msg", and especially the amount of time passed is hard to
estimate.)

After:

> [2020-12-08 06:43:22.58+0100] [ID: 00000004] unique: 51, opcode: RELEASEDIR (29), nodeid: 1, insize: 64, pid: 1
> [2020-12-08 06:43:22.58+0100] [ID: 00000004]    unique: 51, success, outsize: 16
> [2020-12-08 06:43:22.58+0100] [ID: 00000004] virtio_send_msg: elem 0: with 1 in desc of length 16
> [2020-12-08 06:43:29.34+0100] [ID: 00000001] virtio_loop: Got VU event
> [2020-12-08 06:43:29.34+0100] [ID: 00000001] fv_queue_set_started: qidx=1 started=0
> [2020-12-08 06:43:29.34+0100] [ID: 00000003] fv_queue_thread: kill event on queue 1 - quitting
> [2020-12-08 06:43:29.34+0100] [ID: 00000001] fv_remove_watch: TODO! fd=9
> [2020-12-08 06:43:29.34+0100] [ID: 00000001] virtio_loop: Waiting for VU event
> [2020-12-08 06:43:29.34+0100] [ID: 00000001] virtio_loop: Got VU event
> [2020-12-08 06:43:29.34+0100] [ID: 00000001] virtio_loop: Waiting for VU event
> [2020-12-08 06:43:29.34+0100] [ID: 00000001] virtio_loop: Got VU event
> [2020-12-08 06:43:29.34+0100] [ID: 00000001] virtio_loop: Waiting for VU event
> [2020-12-08 06:43:29.37+0100] [ID: 00000001] virtio_loop: Unexpected poll revents 11
> [2020-12-08 06:43:29.37+0100] [ID: 00000001] virtio_loop: Exit

Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Laszlo Ersek <lersek@redhat.com>
Message-Id: <20201208055043.31548-1-lersek@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 12de321745..e61cc56530 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3284,18 +3284,38 @@ static void setup_nofile_rlimit(unsigned long rlimit_nofile)
 static void log_func(enum fuse_log_level level, const char *fmt, va_list ap)
 {
     g_autofree char *localfmt = NULL;
+    struct timespec ts;
+    struct tm tm;
+    char sec_fmt[sizeof "2020-12-07 18:17:54"];
+    char zone_fmt[sizeof "+0100"];
 
     if (current_log_level < level) {
         return;
     }
 
     if (current_log_level == FUSE_LOG_DEBUG) {
-        if (!use_syslog) {
-            localfmt = g_strdup_printf("[%" PRId64 "] [ID: %08ld] %s",
-                                       get_clock(), syscall(__NR_gettid), fmt);
-        } else {
+        if (use_syslog) {
+            /* no timestamp needed */
             localfmt = g_strdup_printf("[ID: %08ld] %s", syscall(__NR_gettid),
                                        fmt);
+        } else {
+            /* try formatting a broken-down timestamp */
+            if (clock_gettime(CLOCK_REALTIME, &ts) != -1 &&
+                localtime_r(&ts.tv_sec, &tm) != NULL &&
+                strftime(sec_fmt, sizeof sec_fmt, "%Y-%m-%d %H:%M:%S",
+                         &tm) != 0 &&
+                strftime(zone_fmt, sizeof zone_fmt, "%z", &tm) != 0) {
+                localfmt = g_strdup_printf("[%s.%02ld%s] [ID: %08ld] %s",
+                                           sec_fmt,
+                                           ts.tv_nsec / (10L * 1000 * 1000),
+                                           zone_fmt, syscall(__NR_gettid),
+                                           fmt);
+            } else {
+                /* fall back to a flat timestamp */
+                localfmt = g_strdup_printf("[%" PRId64 "] [ID: %08ld] %s",
+                                           get_clock(), syscall(__NR_gettid),
+                                           fmt);
+            }
         }
         fmt = localfmt;
     }
@@ -3416,6 +3436,9 @@ int main(int argc, char *argv[])
     struct lo_map_elem *reserve_elem;
     int ret = -1;
 
+    /* Initialize time conversion information for localtime_r(). */
+    tzset();
+
     /* Don't mask creation mode, kernel already did that */
     umask(0);
 
-- 
2.29.2


