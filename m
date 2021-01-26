Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB193033B6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 06:04:44 +0100 (CET)
Received: from localhost ([::1]:40010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4GWx-0005p8-EK
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 00:04:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=653775e38=dmitry.fomichev@wdc.com>)
 id 1l4GVG-0004UZ-Mx; Tue, 26 Jan 2021 00:02:58 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:37779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=653775e38=dmitry.fomichev@wdc.com>)
 id 1l4GVE-00071d-5N; Tue, 26 Jan 2021 00:02:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611637377; x=1643173377;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2xqzGNg8YFv3IDuzA9g+Xxo6ggjr7TLgWBd/SJdf3wU=;
 b=LWV1ESpLB9by3zIc72/2BM5F02B9DYMf1j6g+dR5GS5U4NmjPDF8ZD/T
 2oqrXTDF6cEmpKuRDqDp/R6YL8+hAp+b02CgJE3But52lc0ZrMLg2pPKP
 d1nK8bRv0e5wey7bOqtICNt+8MWx1sWCzCqIGTnh9tfLuTWNTKcNdtKBx
 7tX13nF9Z3QoXzKZz3wfuOgVhQyJchaM8G32zbrGftAMQ7Sr+u2T3OpN6
 W7boVgFkbDN16HPNrMZ9lZGSjDBz+FfsH/eC86Ctgparxopvhb9q9mCCP
 0gVSwu24vM/KL16aFzDkmTHf0i+UhrUy5maHeBsN5HRksuQD9mZaHRwS4 g==;
IronPort-SDR: pcqk3UehO+9zmOE1wNT1X8UFVKutqhyQe1BlDxP/GdoUHhEI8JA2kXO8Tl5uGUVUx6LLZMRKje
 mQTcZM+wqO7tfRjkVWcrc90R8HBgfIEOiElK1UzZRsGgaOVtxae+5SrRIc3rwTrGV7B5SqDyLT
 WBBZhtCWPqe5HD+6Mx4X4EZFwp4yR3MUMSC+ppx1/ucpsoVNJeQvuOF+L+EmBb3Lr244WXG5fZ
 50xUkXlAnEahKgeBrwhbS1J6SVeA2TxOzJQhanPO6IFj454H/HEuf2JWQ+GyIZ8DoxxqCnHOAL
 sn8=
X-IronPort-AV: E=Sophos;i="5.79,375,1602518400"; d="scan'208";a="159493363"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2021 13:02:55 +0800
IronPort-SDR: voYvmmCJHvxIRnkgMQeIj8BFVcYy8taS3M27AFhbpHRR+xDJjGWngHftrXb7nzsgohesKyZ5cr
 5/BvpKPHD9YEUOdnClvCajXSlJ7bQsbsslZYlX8cDr3a0Vg8JgVDaLG+XR9msN/mUrfckQja9C
 aCm2e6khBL1MQFbALcIAyP4Q98GvJ61wB2Yt4m6dZFSwSF9pSVqzYsG3dZ820CdddYGODiXOyK
 lsp2zqEB4vxnXxw3rHTdG0y9djqfifwhYkCWUJoKoT116G7p/VbVdyiI9HxNQys21y0v1S6rv5
 Td4W9li0X0RqvX4uuFeOqckw
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 20:47:21 -0800
IronPort-SDR: vaanmxd7t/gA1WVbHt9Y9DCR67RFY9dvGsrTN6aMKJB2OITiRJomy/S9vpDKWn3KHPj+imzUVA
 Pq0egGiwuq9G+xie6fsOxF3oyVuPvTkHz1g4tOWYND37utezTMhzNcfVf/d//t0ihwaA2uNLJp
 x5mKOo3dRrTfplx0TX0QHlZUrpdSzEPkhjbHRJ24f8ugBmTgFdGhTE0m74G/ggn7OetZUWG+fK
 kSEUjT964m+UnTYdNIVvzX6A9V5ZScHmjF9PsXlUraLQey8QHOxXr9sX2+/ijndguf+jpnWiHd
 5VM=
WDCIronportException: Internal
Received: from unknown (HELO redsun50.ssa.fujisawa.hgst.com) ([10.149.66.24])
 by uls-op-cesaip02.wdc.com with ESMTP; 25 Jan 2021 21:02:53 -0800
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: Klaus Jensen <k.jensen@samsung.com>, Keith Busch <kbusch@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/block/nvme: Check zone state before checking boundaries
Date: Tue, 26 Jan 2021 14:02:47 +0900
Message-Id: <20210126050248.9077-3-dmitry.fomichev@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210126050248.9077-1-dmitry.fomichev@wdc.com>
References: <20210126050248.9077-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=653775e38=dmitry.fomichev@wdc.com; helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Niklas Cassel <niklas.cassel@wdc.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The code in nvme_check_zone_write() first checks for zone boundary
condition violation and only after that it proceeds to verify that the
zone state is suitable the write to happen. This is not consistent with
nvme_check_zone_read() flow - in that function, zone state is checked
before making any boundary checks. Besides, checking that ZSLBA + NLB
does not cross the write boundary is now redundant for Zone Append and
only needs to be done for writes.

Move the check in the code to be performed for Write and Write Zeroes
commands only and to occur after zone state checks.

Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 hw/block/nvme.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 67538010ef..b712634c27 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1138,13 +1138,8 @@ static uint16_t nvme_check_zone_write(NvmeCtrl *n, NvmeNamespace *ns,
     uint64_t bndry = nvme_zone_wr_boundary(zone);
     uint16_t status;
 
-    if (unlikely(slba + nlb > bndry)) {
-        status = NVME_ZONE_BOUNDARY_ERROR;
-    } else {
-        status = nvme_check_zone_state_for_write(zone);
-    }
-
-    if (status != NVME_SUCCESS) {
+    status = nvme_check_zone_state_for_write(zone);
+    if (status) {
         trace_pci_nvme_err_zone_write_not_ok(slba, nlb, status);
     } else {
         assert(nvme_wp_is_valid(zone));
@@ -1158,10 +1153,14 @@ static uint16_t nvme_check_zone_write(NvmeCtrl *n, NvmeNamespace *ns,
                 trace_pci_nvme_err_append_too_large(slba, nlb, n->zasl);
                 status = NVME_INVALID_FIELD;
             }
-        } else if (unlikely(slba != zone->w_ptr)) {
-            trace_pci_nvme_err_write_not_at_wp(slba, zone->d.zslba,
-                                               zone->w_ptr);
-            status = NVME_ZONE_INVALID_WRITE;
+        } else {
+            if (unlikely(slba != zone->w_ptr)) {
+                trace_pci_nvme_err_write_not_at_wp(slba, zone->d.zslba,
+                                                   zone->w_ptr);
+                status = NVME_ZONE_INVALID_WRITE;
+            } else if (unlikely(slba + nlb > bndry)) {
+                status = NVME_ZONE_BOUNDARY_ERROR;
+            }
         }
     }
 
-- 
2.28.0


