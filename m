Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE203033D5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 06:07:56 +0100 (CET)
Received: from localhost ([::1]:45612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Ga3-0008HM-Uy
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 00:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=653775e38=dmitry.fomichev@wdc.com>)
 id 1l4GVK-0004ar-AF; Tue, 26 Jan 2021 00:03:02 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:37779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=653775e38=dmitry.fomichev@wdc.com>)
 id 1l4GVI-00071d-43; Tue, 26 Jan 2021 00:03:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611637381; x=1643173381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DmTUrqYYwUpxdJYIRerxbN/Gkdmpgr5jd5TqXbBcEyU=;
 b=nDXy51pq+SDundHy+zJFxdcHudC/e6MIgLiL9TkNVE4WLrAotUaTPnks
 Jc/rfAD+WiYyKkT9RCdXedxl4Ab0IlwLbK4MyPzfA5j8OH8o4Ik2PrOlp
 Jvb3hsBdxuLIs3mdAJzFZw/2B2l62uzVEF25r3py8kNsHTMhtqsBx6WQD
 xgRO0MPYyFWaCK7qTfQP+2O/szkzlfzy8sk/yWVw1SYnvk1+4GBmK5IX8
 VIdnGCam54Hs6YJDmpNDGecH6qbfGEAfQizQZJoMU5bNmwevhAIfqj8FZ
 GqUMgWUOYkka0ZW86qrD5jEnBAKXOj2VhTAdC/oXnQDOHOR3TsIw1w0NL A==;
IronPort-SDR: sJys/COk46y1BSJ7a5KMzW6NL0AhTO4G2chiNfmTFka6sMRp+OhcDJ6iTumoCvqZttyfKBFuml
 3xkx2u3gHEuywgYT8QM9+MM/D2MdTa34BM6i0LwE1VOoX6V+nav6Mz8G5AymOxQCCeVvGWuO7r
 4NbG2HjTvl/CjI8sZKHld7y7ekBu76xda7Y8NyTbZ28R1IdyuPhmT9Zlsp4T4bPyR29xflW1S4
 1THUpwAga+nGagaxxQz8Y/b1yS1ZVCCFk1RRg/cPI7NQFfJi/jm49L2LV4a4FRklN0MjF/i8uf
 oOI=
X-IronPort-AV: E=Sophos;i="5.79,375,1602518400"; d="scan'208";a="159493365"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2021 13:03:00 +0800
IronPort-SDR: Om6iSOPGGa2uy/m2x19u2ATNPGYP1LKTmgjPNh/VL3i9oZa1325sjoRf7n3nu5K8L068mxXKdD
 1lyaklCH6NxUv8VZ4VmHuLH0XXsFeyJ0L8KnixAxQZ0Mt95HyMvMKNfLBFvOgmiWWgMNT2OWMk
 XWjCi/D8x/h6xd4Q2aAiwjgw8k3KTXlIARJoVrj8xTYpWxBAKih8WDh5VV71j+fMhWp9NWygwM
 qBAkVHWmChrzCIa9QC6pXcG0SJmgErmUkUO7l3R7u6rTt3i5mTDCr13Qj7wMxl/e7dOOBgNMKn
 Ojs9294DKWN+2y/svn1Lgh81
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 20:47:26 -0800
IronPort-SDR: cKDfX0HMx+NBDLYBCBlf4J8ChoPhmB2sG8SLhp8X1onjcgKv5R7dj3m2zVWtHnDISdkuuaGvpZ
 WLbHhu2O6cJJtRgvnJKq63MG+xMoqUDdxigiHRjl+SQqX/QneahET/AL9OeZW+atf4hYqTfm/x
 4RCMdO8kFvq/b8/3MdWhmT9o1B2wGplOP52SfT3txwwnWrpoDX2qMMAuTtjL9ScMn4fEKD0nkz
 ZskcF9VzJLgH/jLzn+Kn/ackMintaUfryB9ECiL/6UesPazsplXv09kBffks8bPdUhRQTMCBgm
 q+U=
WDCIronportException: Internal
Received: from unknown (HELO redsun50.ssa.fujisawa.hgst.com) ([10.149.66.24])
 by uls-op-cesaip02.wdc.com with ESMTP; 25 Jan 2021 21:02:55 -0800
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: Klaus Jensen <k.jensen@samsung.com>, Keith Busch <kbusch@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/block/nvme: Add trace events for zone boundary
 violations
Date: Tue, 26 Jan 2021 14:02:48 +0900
Message-Id: <20210126050248.9077-4-dmitry.fomichev@wdc.com>
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

Add three new trace events to be raised in case of zone boundary
violations during Read, Write(Zeroes) and Zone Append.

Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 hw/block/nvme.c       | 8 ++++++--
 hw/block/trace-events | 3 +++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index b712634c27..4059bd72e6 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1148,6 +1148,8 @@ static uint16_t nvme_check_zone_write(NvmeCtrl *n, NvmeNamespace *ns,
                 trace_pci_nvme_err_append_not_at_start(slba, zone->d.zslba);
                 status = NVME_INVALID_FIELD;
             } else if (unlikely(zone->w_ptr + nlb > bndry)) {
+                trace_pci_nvme_err_append_across_boundary(slba, nlb,
+                                                          zone->w_ptr, bndry);
                 status = NVME_ZONE_BOUNDARY_ERROR;
             } else if (nvme_l2b(ns, nlb) > (n->page_size << n->zasl)) {
                 trace_pci_nvme_err_append_too_large(slba, nlb, n->zasl);
@@ -1159,6 +1161,7 @@ static uint16_t nvme_check_zone_write(NvmeCtrl *n, NvmeNamespace *ns,
                                                    zone->w_ptr);
                 status = NVME_ZONE_INVALID_WRITE;
             } else if (unlikely(slba + nlb > bndry)) {
+                trace_pci_nvme_err_write_across_boundary(slba, nlb, bndry);
                 status = NVME_ZONE_BOUNDARY_ERROR;
             }
         }
@@ -1200,9 +1203,10 @@ static uint16_t nvme_check_zone_read(NvmeNamespace *ns, uint64_t slba,
 
     status = nvme_check_zone_state_for_read(zone);
     if (status != NVME_SUCCESS) {
-        ;
+        trace_pci_nvme_err_zone_read_not_ok(slba, nlb, status);
     } else if (unlikely(end > bndry)) {
         if (!ns->params.cross_zone_read) {
+            trace_pci_nvme_err_read_across_boundary(slba, nlb, bndry);
             status = NVME_ZONE_BOUNDARY_ERROR;
         } else {
             /*
@@ -1213,6 +1217,7 @@ static uint16_t nvme_check_zone_read(NvmeNamespace *ns, uint64_t slba,
                 zone++;
                 status = nvme_check_zone_state_for_read(zone);
                 if (status != NVME_SUCCESS) {
+                    trace_pci_nvme_err_zone_read_not_ok(slba, nlb, status);
                     break;
                 }
             } while (end > nvme_zone_rd_boundary(ns, zone));
@@ -1624,7 +1629,6 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
     if (ns->params.zoned) {
         status = nvme_check_zone_read(ns, slba, nlb);
         if (status != NVME_SUCCESS) {
-            trace_pci_nvme_err_zone_read_not_ok(slba, nlb, status);
             goto invalid;
         }
     }
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 955ee4860f..18bbe560fc 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -127,6 +127,9 @@ pci_nvme_err_unaligned_zone_cmd(uint8_t action, uint64_t slba, uint64_t zslba) "
 pci_nvme_err_invalid_zone_state_transition(uint8_t action, uint64_t slba, uint8_t attrs) "action=0x%"PRIx8", slba=%"PRIu64", attrs=0x%"PRIx32""
 pci_nvme_err_write_not_at_wp(uint64_t slba, uint64_t zone, uint64_t wp) "writing at slba=%"PRIu64", zone=%"PRIu64", but wp=%"PRIu64""
 pci_nvme_err_append_not_at_start(uint64_t slba, uint64_t zone) "appending at slba=%"PRIu64", but zone=%"PRIu64""
+pci_nvme_err_append_across_boundary(uint64_t slba, uint32_t nlb, uint64_t wp, uint64_t bndry) "slba=%"PRIu64", nlb=%"PRIu32", w_ptr=%"PRIu64", bndry=%"PRIu64""
+pci_nvme_err_write_across_boundary(uint64_t slba, uint32_t nlb, uint64_t bndry) "slba=%"PRIu64", nlb=%"PRIu32", bndry=%"PRIu64""
+pci_nvme_err_read_across_boundary(uint64_t slba, uint32_t nlb, uint64_t bndry) "slba=%"PRIu64", nlb=%"PRIu32", bndry=%"PRIu64""
 pci_nvme_err_zone_write_not_ok(uint64_t slba, uint32_t nlb, uint32_t status) "slba=%"PRIu64", nlb=%"PRIu32", status=0x%"PRIx16""
 pci_nvme_err_zone_read_not_ok(uint64_t slba, uint32_t nlb, uint32_t status) "slba=%"PRIu64", nlb=%"PRIu32", status=0x%"PRIx16""
 pci_nvme_err_append_too_large(uint64_t slba, uint32_t nlb, uint8_t zasl) "slba=%"PRIu64", nlb=%"PRIu32", zasl=%"PRIu8""
-- 
2.28.0


