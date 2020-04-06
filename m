Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442FB19F7B9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Apr 2020 16:15:56 +0200 (CEST)
Received: from localhost ([::1]:60860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLSXa-0008B8-S8
	for lists+qemu-devel@lfdr.de; Mon, 06 Apr 2020 10:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55937)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anthony.perard@citrix.com>) id 1jLSLn-0005gl-M2
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 10:03:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anthony.perard@citrix.com>) id 1jLSLm-0007PL-7O
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 10:03:43 -0400
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175]:65287)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <anthony.perard@citrix.com>)
 id 1jLSLi-0007Nb-VD; Mon, 06 Apr 2020 10:03:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586181818;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EEshw7iunLfDK0/dpc5kHUSg2CNL4OfRL0BhwgBTPaA=;
 b=P79XvjmU1LS2RjsASuFmcfjdZQrrcfVCoTW0pPd0fDBdplfaKKqti5u6
 0kxGpp+oActTeGezs6i/kwlkl3WHIWeMyy9U3Anc8SqlmnkugN0Q7W7/6
 B2PYm5rGH7G2imEa+tmM3DAWe2Eh5oEEBtNQRyYWYGwJKPIDAJ/Igywjf U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9MrkKpqrOxmbABMEeQD23ezG2y0rspYc7sVNOVR8yJg58ralCaIY2RCz60VQkbDU5tHapZQcWP
 1TkP4qAgGWf8oyzgFUOq7VrQJLgd3s49bPrSqjERNw6iwf/4PP3Rc/voNOGhrTR259UK5k4tsE
 67HkjHkD2zIHr8y5qI3FuzHTjykg/9SHmwbuE6jN9t748FIXdmbPgZ1JrurLl5h94Afd2QS4s2
 tWC3yTh8b1QjOn25r5m699zLhUF7Zruxhi0JxGGng/UMFOWm6qJF2eCebMMuhgQm21SPo71NKE
 ofI=
X-SBRS: 2.7
X-MesageID: 15642675
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,351,1580792400"; d="scan'208";a="15642675"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 for-5.0] xen-block: Fix double qlist remove and request leak
Date: Mon, 6 Apr 2020 15:02:17 +0100
Message-ID: <20200406140217.1441858-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200406105954.GT4088@perard.uk.xensource.com>
References: <20200406105954.GT4088@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 216.71.155.175
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>, qemu-stable@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit a31ca6801c02 ("qemu/queue.h: clear linked list pointers on
remove") revealed that a request was removed twice from a list, once
in xen_block_finish_request() and a second time in
xen_block_release_request() when both function are called from
xen_block_complete_aio(). But also, the `requests_inflight' counter is
decreased twice, and thus became negative.

This is a bug that was introduced in bfd0d6366043, where a `finished'
list was removed.

That commit also introduced a leak of request in xen_block_do_aio().
That function calls xen_block_finish_request() but the request is
never released after that.

To fix both issue, we do two changes:
- we squash finish_request() and release_request() together as we want
  to remove a request from 'inflight' list to add it to 'freelist'.
- before releasing a request, we need to let now the result to the
  other end, thus we should call xen_block_send_response() before
  releasing a request.

The first change fix the double QLIST_REMOVE() as we remove the extra
call. The second change makes the leak go away because if we want to
call finish_request(), we need to call a function that do all of
finish, send response, and release.

Fixes: bfd0d6366043 ("xen-block: improve response latency")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/block/dataplane/xen-block.c | 48 ++++++++++++----------------------
 1 file changed, 16 insertions(+), 32 deletions(-)

diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
index 288a87a814ad..5f8f15778ba5 100644
--- a/hw/block/dataplane/xen-block.c
+++ b/hw/block/dataplane/xen-block.c
@@ -64,6 +64,8 @@ struct XenBlockDataPlane {
     AioContext *ctx;
 };
 
+static int xen_block_send_response(XenBlockRequest *request);
+
 static void reset_request(XenBlockRequest *request)
 {
     memset(&request->req, 0, sizeof(request->req));
@@ -115,23 +117,26 @@ static XenBlockRequest *xen_block_start_request(XenBlockDataPlane *dataplane)
     return request;
 }
 
-static void xen_block_finish_request(XenBlockRequest *request)
+static void xen_block_complete_request(XenBlockRequest *request)
 {
     XenBlockDataPlane *dataplane = request->dataplane;
 
-    QLIST_REMOVE(request, list);
-    dataplane->requests_inflight--;
-}
+    if (xen_block_send_response(request)) {
+        Error *local_err = NULL;
 
-static void xen_block_release_request(XenBlockRequest *request)
-{
-    XenBlockDataPlane *dataplane = request->dataplane;
+        xen_device_notify_event_channel(dataplane->xendev,
+                                        dataplane->event_channel,
+                                        &local_err);
+        if (local_err) {
+            error_report_err(local_err);
+        }
+    }
 
     QLIST_REMOVE(request, list);
+    dataplane->requests_inflight--;
     reset_request(request);
     request->dataplane = dataplane;
     QLIST_INSERT_HEAD(&dataplane->freelist, request, list);
-    dataplane->requests_inflight--;
 }
 
 /*
@@ -246,7 +251,6 @@ static int xen_block_copy_request(XenBlockRequest *request)
 }
 
 static int xen_block_do_aio(XenBlockRequest *request);
-static int xen_block_send_response(XenBlockRequest *request);
 
 static void xen_block_complete_aio(void *opaque, int ret)
 {
@@ -286,7 +290,6 @@ static void xen_block_complete_aio(void *opaque, int ret)
     }
 
     request->status = request->aio_errors ? BLKIF_RSP_ERROR : BLKIF_RSP_OKAY;
-    xen_block_finish_request(request);
 
     switch (request->req.operation) {
     case BLKIF_OP_WRITE:
@@ -306,17 +309,8 @@ static void xen_block_complete_aio(void *opaque, int ret)
     default:
         break;
     }
-    if (xen_block_send_response(request)) {
-        Error *local_err = NULL;
 
-        xen_device_notify_event_channel(dataplane->xendev,
-                                        dataplane->event_channel,
-                                        &local_err);
-        if (local_err) {
-            error_report_err(local_err);
-        }
-    }
-    xen_block_release_request(request);
+    xen_block_complete_request(request);
 
     if (dataplane->more_work) {
         qemu_bh_schedule(dataplane->bh);
@@ -420,8 +414,8 @@ static int xen_block_do_aio(XenBlockRequest *request)
     return 0;
 
 err:
-    xen_block_finish_request(request);
     request->status = BLKIF_RSP_ERROR;
+    xen_block_complete_request(request);
     return -1;
 }
 
@@ -575,17 +569,7 @@ static bool xen_block_handle_requests(XenBlockDataPlane *dataplane)
                 break;
             };
 
-            if (xen_block_send_response(request)) {
-                Error *local_err = NULL;
-
-                xen_device_notify_event_channel(dataplane->xendev,
-                                                dataplane->event_channel,
-                                                &local_err);
-                if (local_err) {
-                    error_report_err(local_err);
-                }
-            }
-            xen_block_release_request(request);
+            xen_block_complete_request(request);
             continue;
         }
 
-- 
Anthony PERARD


