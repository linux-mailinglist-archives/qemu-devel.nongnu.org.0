Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF77E389F94
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:13:31 +0200 (CEST)
Received: from localhost ([::1]:58296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljdoA-0002Va-Rl
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1ljdhG-0001vG-JW
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:06:22 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:38222
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1ljdhD-0006HZ-JH
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:06:22 -0400
IronPort-Data: =?us-ascii?q?A9a23=3A5l5uAa75ECW9QtO5DVNx9AxRtO3FchMFZxGqfqr?=
 =?us-ascii?q?LsXjdYENShTIOnzBNUW3Xa67cY2f3fdh1aI6+8U8HvcfWxoUwSws5pCpnJ55og?=
 =?us-ascii?q?ZCbXIzGdC8cHM8zwvXrFRsht4NHAjX5BJhcokT0+1H9aNANkVEmjfvRHuelWba?=
 =?us-ascii?q?aUsxMbVQMpBkJ2EsLd9ER0tYAbeiRW2thiPuqyyHtEAbNNw1cbgr435m+RCZH5?=
 =?us-ascii?q?5wejt+3UmsWPpintHeG/5Uc4Ql2yauZdxMUSaEMdgK2qnqq8V23wo/Z109F5tK?=
 =?us-ascii?q?NmbC9fFAIQ6LJIE6FjX8+t6qK20AE/3JtlP1gcqd0hUR/0l1lm/h1ycdNtJ6xQ?=
 =?us-ascii?q?AEBMLDOmfgGTl9TFCQW0ahuoeeXfCDh7pPCp6HBWz62qxl0N2knOpAw9/Z+BHl?=
 =?us-ascii?q?K+LoTLzVlRgmOgv/zzL+lR+1EgMMlI8/2eoQFtRlIwT7YCfwrW4zrWajG5dZEm?=
 =?us-ascii?q?jw3g6hmBOvfYdYUbTNHdhnMYxRTfFwQDfoDcE2A7pXkW2QA7gvL+uxsuC6OpDG?=
 =?us-ascii?q?dGYPFaLL9EuFmj+0O9qpAml/7wg=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A8Pobqa0CylfdP4vyspsEFwqjBI4kLtp133Aq?=
 =?us-ascii?q?2lEZdPU1SL39qynKppkmPHDP5gr5J0tLpTntAsi9qBDnhPtICOsqTNSftWDd0Q?=
 =?us-ascii?q?PGEGgI1/qB/9SPIU3D398Y/aJhXow7M9foEGV95PyQ3CCIV/om3/mLmZrFudvj?=
X-IronPort-AV: E=Sophos;i="5.82,313,1613404800"; d="scan'208";a="108506779"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 May 2021 16:06:17 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 50AD74D0C4DD;
 Thu, 20 May 2021 16:06:17 +0800 (CST)
Received: from G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 20 May 2021 16:06:12 +0800
Received: from FNSTPC.g08.fujitsu.local (10.167.226.45) by
 G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Thu, 20 May 2021 16:06:13 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH 3/4] migration/rdma: destination: create the return patch
 after the first accept
Date: Thu, 20 May 2021 16:05:35 +0800
Message-ID: <20210520080536.16048-3-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520080536.16048-1-lizhijian@cn.fujitsu.com>
References: <20210520080536.16048-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: 50AD74D0C4DD.AF8B0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lizhijian@fujitsu.com
Received-SPF: neutral client-ip=183.91.158.132;
 envelope-from=lizhijian@fujitsu.com; helo=heian.cn.fujitsu.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=ham autolearn_force=no
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
Cc: Your Name <you@example.com>, qemu-devel@nongnu.org,
 Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Your Name <you@example.com>

destination side:
$ build/qemu-system-x86_64 -enable-kvm -netdev tap,id=hn0,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown -device e1000,netdev=hn0,mac=50:52:54:00:11:22 -boot c -drive if=none,file=./Fedora-rdma-server-migration.qcow2,id=drive-virtio-disk0 -device virtio-blk-pci,bus=pci.0,addr=0x4,drive=drive-virtio-disk0,id=virtio-disk0 -m 2048 -smp 2 -device piix3-usb-uhci -device usb-tablet -monitor stdio -vga qxl -spice streaming-video=filter,port=5902,disable-ticketing -incoming rdma:192.168.1.10:8888
(qemu) migrate_set_capability postcopy-ram on
(qemu)
dest_init RDMA Device opened: kernel name rocep1s0f0 uverbs device name uverbs0, infiniband_verbs class device path /sys/class/infiniband_verbs/uverbs0, infiniband class device path /sys/class/infiniband/rocep1s0f0, transport: (2) Ethernet
Segmentation fault (core dumped)

 (gdb) bt
 #0  qemu_rdma_accept (rdma=0x0) at ../migration/rdma.c:3272
 #1  rdma_accept_incoming_migration (opaque=0x0) at     ../migration/rdma.c:3986
 #2  0x0000563c9e51f02a in aio_dispatch_handler
     (ctx=ctx@entry=0x563ca0606010, node=0x563ca12b2150) at ../util/aio-posix.c:329
 #3  0x0000563c9e51f752 in aio_dispatch_handlers (ctx=0x563ca0606010) at      ../util/aio-posix.c:372
 #4  aio_dispatch (ctx=0x563ca0606010) at ../util/aio-posix.c:382
 #5  0x0000563c9e4f4d9e in aio_ctx_dispatch (source=<optimized out>,      callback=<optimized out>, user_data=<optimized out>)    at ../util/async.c:306
 #6  0x00007fe96ef3fa9f in g_main_context_dispatch () at      /lib64/libglib-2.0.so.0
 #7  0x0000563c9e4ffeb8 in glib_pollfds_poll () at     ../util/main-loop.c:231
 #8  os_host_main_loop_wait (timeout=12188789) at     ../util/main-loop.c:254
 #9  main_loop_wait (nonblocking=nonblocking@entry=0) at     ../util/main-loop.c:530
 #10 0x0000563c9e3c7211 in qemu_main_loop () at     ../softmmu/runstate.c:725
 #11 0x0000563c9dfd46fe in main (argc=<optimized out>, argv=<optimized     out>, envp=<optimized out>) at ../softmmu/main.c:50

The rdma return path will not be created when qemu incoming is starting
since migrate_copy() is false at that moment, then a  NULL return path
rdma was referenced if the user enabled postcopy later.

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 migration/rdma.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 651534e825..3b228c46eb 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -316,6 +316,7 @@ typedef struct RDMALocalBlocks {
 typedef struct RDMAContext {
     char *host;
     int port;
+    const char *host_port;
 
     RDMAWorkRequestData wr_data[RDMA_WRID_MAX];
 
@@ -2648,6 +2649,7 @@ static void *qemu_rdma_data_init(const char *host_port, Error **errp)
         if (!inet_parse(addr, host_port, NULL)) {
             rdma->port = atoi(addr->port);
             rdma->host = g_strdup(addr->host);
+            rdma->host_port = host_port;
         } else {
             ERROR(errp, "bad RDMA migration address '%s'", host_port);
             g_free(rdma);
@@ -3276,6 +3278,7 @@ static int qemu_rdma_accept(RDMAContext *rdma)
                                             .private_data = &cap,
                                             .private_data_len = sizeof(cap),
                                          };
+    RDMAContext *rdma_return_path = NULL;
     struct rdma_cm_event *cm_event;
     struct ibv_context *verbs;
     int ret = -EINVAL;
@@ -3291,6 +3294,20 @@ static int qemu_rdma_accept(RDMAContext *rdma)
         goto err_rdma_dest_wait;
     }
 
+    /*
+     * initialize the RDMAContext for return path for postcopy after first
+     * connection is accepted.
+     */
+    if (migrate_postcopy() && !rdma->is_return_path) {
+        rdma_return_path = qemu_rdma_data_init(rdma->host_port, NULL);
+        if (rdma_return_path == NULL) {
+            rdma_ack_cm_event(cm_event);
+            goto err_rdma_dest_wait;
+        }
+
+        qemu_rdma_return_path_dest_init(rdma_return_path, rdma);
+    }
+
     memcpy(&cap, cm_event->param.conn.private_data, sizeof(cap));
 
     network_to_caps(&cap);
@@ -3406,6 +3423,7 @@ static int qemu_rdma_accept(RDMAContext *rdma)
 err_rdma_dest_wait:
     rdma->error_state = ret;
     qemu_rdma_cleanup(rdma);
+    g_free(rdma_return_path);
     return ret;
 }
 
@@ -4048,17 +4066,6 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
 
     trace_rdma_start_incoming_migration_after_rdma_listen();
 
-    /* initialize the RDMAContext for return path */
-    if (migrate_postcopy()) {
-        rdma_return_path = qemu_rdma_data_init(host_port, &local_err);
-
-        if (rdma_return_path == NULL) {
-            goto cleanup_rdma;
-        }
-
-        qemu_rdma_return_path_dest_init(rdma_return_path, rdma);
-    }
-
     qemu_set_fd_handler(rdma->channel->fd, rdma_accept_incoming_migration,
                         NULL, (void *)(intptr_t)rdma);
     return;
-- 
2.30.2




