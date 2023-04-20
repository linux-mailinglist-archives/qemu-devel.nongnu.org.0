Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD166E8FF6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:21:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRPH-00033X-Da; Thu, 20 Apr 2023 06:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=4670623b3=Mark.Syms@citrix.com>)
 id 1ppRPF-00033L-0s
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:20:49 -0400
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=4670623b3=Mark.Syms@citrix.com>)
 id 1ppRPC-0001nP-Rc
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:20:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1681986046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MULDkdNFZurv6NiIbs1+xdg+sYuQspr9nF1H9kICi2I=;
 b=cQHvO+yU6nkqmXQ69vPDMXruQv+wOGF5e2KFuiH2407LEPyvUuVf59Su
 rgIXrxxlFpM8k+67x8iQeqzGGpCus5baG6T5wnsG5c7L0v010ZWhOGyjZ
 SZfdI9E15XtI8CFjM8Fcp2WQoKFUxuhJNjxIQumbXE8uaUmExZVH5Wu7h M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 106259391
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:CD1G2KycRb9U0fLWNmZ6t+chxirEfRIJ4+MujC+fZmUNrF6WrkUCy
 zcaXGiAaP6NZWv3KYglOdjio0JV6JDczIVrSwVrpSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRiP6gT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUwT/
 NcyEhVQUj24odC1wrCYROxLoMt2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+Nj2P8NQZJrUm9rqsr+WnDigd21dABNfKMIoLQGJQOzx/wS
 mTu5GXZAFJHCPekwjPf0WmAiOieoDiiYddHfFG/3qEz2wDCroAJMzUPWF6m5PW0lEO6c9RYL
 UMS52wpt6da3FewUtD3Uhm8oXiFlh0RQdxdF6s98g7l4rLd/gKxFmUCCDlbZ7QOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRVLufgddE1FDuYO65thu0FSWFI0L/LOJYsPdNGz56
 BqwiXUCqo41v80J1Ya1+HfhjGf5znTWdTLZ9jk7T0r8sFMgO9/9Pt34gbTIxa0eddjEFzFtq
 FBBwpHDt75WUPlhgQTXGI0w8KeVC+Fp2dE2qXpmBNEf+juk4BZPlqgAsWgldC+F3ivpEAIFg
 XM/WisLvve/xFPwMcdKj3uZUqzGN5TIG9X/TezzZdFTeJV3fwLv1HgwNRfBhTG3zxJ2z/5X1
 XKnnSGEVC9yNEia5GDuG7d1PUEDnUjSOl8/tbiklk/6gNJylVaeSKsfMUvmU93VGJis+V2Pm
 /4Gbpvi9vmqeLGmCsUh2dJJfA9iwLlSLcyelvG7gcbZeFA8RDp8WqGOqV7jEqQ895loei7z1
 inVcidlJJDX3BUr9S3ihqhfVY7S
IronPort-HdrOrdr: A9a23:PvRYTqkxb7zZj4WHIUG/ma5hwlnpDfI93DAbv31ZSRFFG/Fw9v
 rCoB1/73SftN9/YgBCpTn+AtjjfZqxz/BICOoqUYtKPjOHhILAFugL0WKI+VLd8kPFl9K13J
 0QFpRDNA==
X-Talos-CUID: 9a23:gfxRNWMiEAtfL+5DdXRu32QuP50ZX0b7/nTSIWy2DEFPR+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AgYyXdQ4V/S92jm6AoAS2narPxoxz4oSsSx0xuq4?=
 =?us-ascii?q?NspOnLgB+PGagl22OF9o=3D?=
X-IronPort-AV: E=Sophos;i="5.99,212,1677560400"; d="scan'208";a="106259391"
To: <qemu-devel@nongnu.org>
CC: <sstabellini@kernel.org>, <anthony.perard@citrix.com>, <paul@xen.org>,
 <xen-devel@lists.xenproject.org>, Mark Syms <mark.syms@citrix.com>
Subject: [PATCH 0/1] Updated: Ensure PV ring is drained on disconenct
Date: Thu, 20 Apr 2023 11:20:14 +0100
Message-ID: <20230420102014.647446-1-mark.syms@citrix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230329105344.3465706-2-mark.syms@citrix.com>
References: <20230329105344.3465706-2-mark.syms@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.145.155;
 envelope-from=prvs=4670623b3=Mark.Syms@citrix.com;
 helo=esa3.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Reply-to:  Mark Syms <mark.syms@citrix.com>
From:  Mark Syms via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Updated patch to address intermittent SIGSEGV on domain disconnect/shutdown.

Mark Syms (1):
  Ensure the PV ring is drained on disconnect

 hw/block/dataplane/xen-block.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

-- 
2.40.0

From 21724baa15a72534d98aa2653e9ec39e83559319 Mon Sep 17 00:00:00 2001
From: Mark Syms <mark.syms@citrix.com>
Date: Thu, 20 Apr 2023 11:08:34 +0100
Subject: [PATCH 1/1] Ensure the PV ring is drained on disconnect

Also ensure all pending AIO is complete.

Signed-off-by: Mark Syms <mark.syms@citrix.com>
---
 hw/block/dataplane/xen-block.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
index 734da42ea7..d9da4090bf 100644
--- a/hw/block/dataplane/xen-block.c
+++ b/hw/block/dataplane/xen-block.c
@@ -523,6 +523,10 @@ static bool xen_block_handle_requests(XenBlockDataPlane *dataplane)
 
     dataplane->more_work = 0;
 
+    if (dataplane->sring == 0) {
+        return done_something;
+    }
+
     rc = dataplane->rings.common.req_cons;
     rp = dataplane->rings.common.sring->req_prod;
     xen_rmb(); /* Ensure we see queued requests up to 'rp'. */
@@ -666,14 +670,35 @@ void xen_block_dataplane_destroy(XenBlockDataPlane *dataplane)
 void xen_block_dataplane_stop(XenBlockDataPlane *dataplane)
 {
     XenDevice *xendev;
+    XenBlockRequest *request, *next;
 
     if (!dataplane) {
         return;
     }
 
+    /* We're about to drain the ring. We can cancel the scheduling of any
+     * bottom half now */
+    qemu_bh_cancel(dataplane->bh);
+
+    /* Ensure we have drained the ring */
+    aio_context_acquire(dataplane->ctx);
+    do {
+        xen_block_handle_requests(dataplane);
+    } while (dataplane->more_work);
+    aio_context_release(dataplane->ctx);
+
+    /* Now ensure that all inflight requests are complete */
+    while (!QLIST_EMPTY(&dataplane->inflight)) {
+        QLIST_FOREACH_SAFE(request, &dataplane->inflight, list, next) {
+            blk_aio_flush(request->dataplane->blk, xen_block_complete_aio,
+                        request);
+        }
+    }
+
     xendev = dataplane->xendev;
 
     aio_context_acquire(dataplane->ctx);
+
     if (dataplane->event_channel) {
         /* Only reason for failure is a NULL channel */
         xen_device_set_event_channel_context(xendev, dataplane->event_channel,
@@ -684,12 +709,6 @@ void xen_block_dataplane_stop(XenBlockDataPlane *dataplane)
     blk_set_aio_context(dataplane->blk, qemu_get_aio_context(), &error_abort);
     aio_context_release(dataplane->ctx);
 
-    /*
-     * Now that the context has been moved onto the main thread, cancel
-     * further processing.
-     */
-    qemu_bh_cancel(dataplane->bh);
-
     if (dataplane->event_channel) {
         Error *local_err = NULL;
 
-- 
2.40.0


