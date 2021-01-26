Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EF13033B5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 06:04:41 +0100 (CET)
Received: from localhost ([::1]:39806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4GWu-0005jw-6U
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 00:04:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=653775e38=dmitry.fomichev@wdc.com>)
 id 1l4GVD-0004R2-SV; Tue, 26 Jan 2021 00:02:55 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:37780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=653775e38=dmitry.fomichev@wdc.com>)
 id 1l4GVC-00072U-5X; Tue, 26 Jan 2021 00:02:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611637375; x=1643173375;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PazIAxzY1coeVGKSvAemX3zmcaI4GM9KFwOf0jflDUk=;
 b=LQpCv6+sQ+dYIpEAOGuwfI37prdMKO/RNJlDfxoXInqZdT+4lXlIr309
 qROEc3kwNEwrxrbyclQAFenHrsG1OwpPYA30iyTYdxCec48Qr3nUzlOgW
 RNZKSf8tOYvLWCZzCmpHkGcMgt1SScAVrrZRF8b0x+IiXybYbV/wSJGUM
 94MGAgRflQMUNxpRMfIW4lw6/9v+5ZR40tLPIwhjec5lsDNjqeedgd6j4
 6rrB4BgGQYGWrIGrEpcoD7ve6PMDH94FcJsqalAyZlaxrZ3HhtQVHG92j
 XmHJ1LBlUxhm9GZEu+iY8LPWNwTYmvITEcxaK1zzKS/QObWHNHLJYKK0M A==;
IronPort-SDR: e8yeI+TLli1VsKfEp5Xo2kzgl9T7NIm0/EMLs01feHsS8gBBe4RCjOwH1z8ShpaboQwqyPLujb
 eaVGpfyPiqKr2mMYn85jNs0PdlTqK6cXBj0TLWUZf5itiNqxVKkjArhk+O2RQT1hML8fae4HTy
 df+wWS1aFhQRRtfaTO51Gtw1lqMgkxr5TPGtsS6UmjuZFPjUKT9nIU+BK0A7NO4fkuq4Ej1Mal
 MO4tK5tftUJC9bLrz9neD5ULcdSQd/VqIlEjA1hItZKYs1vl6S5Ph35zLc+S4K+q94l3UZQC1N
 DBU=
X-IronPort-AV: E=Sophos;i="5.79,375,1602518400"; d="scan'208";a="159493361"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2021 13:02:53 +0800
IronPort-SDR: /0yg73+OCfHB8VP0/zo3S55FZJ13WFKfzF/uKox+pU9TSneSGDwQbTSsoY27rJJXR48nyBdlME
 HENe0+rMiJAIz0qfYbD2zpJnGw9pgYEFcO2GifeOCKE//WQ8UB+NpWELiA61TwY35zVXDgxmn2
 DlIrZZDC2KFzucXRHWIHZeKM3WYQqDrSbVXAQ1o7AhCEa/YIg8GN4Zj01HdcVEXILX7yFzB9Pq
 jn8MgD8S20Bsu3tkw2t4bHuu+6hyXFvHcqnZJz6406WL+jS/LjPD5hSl7g4WgtdEEAfbm6oXWg
 ajevpxCgXWqCMPupfxIsgDOd
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 20:47:19 -0800
IronPort-SDR: P8LlA+BZzfBTOBfvKQp/NQ4ZBybgm3MMgNu8pnyrYJPSo1cg5Dp1Q6V4koV0n8BM87x808E+4X
 yWjQbSKMiY6yOlaq1/XUbPuL5Wlw4Fc0pXyQ4ZKL7irLPHVZWxMFSn6rTE1t3wf/8rpXPCjYE+
 S/0FriLYLcwRt0/KDH6cmW8ZuHhcIqPbdbJhT4FslyH7IgIAGmS70NAF2uqpgry5cG33TM5wLM
 pMq1bAtsjTJ42VZXY6Gvn3KPFf8zfbNDJGeRSOmMUgJQDB/6czvUQZ7IW463GD1TUzIRtq/nv9
 y/I=
WDCIronportException: Internal
Received: from unknown (HELO redsun50.ssa.fujisawa.hgst.com) ([10.149.66.24])
 by uls-op-cesaip02.wdc.com with ESMTP; 25 Jan 2021 21:02:51 -0800
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: Klaus Jensen <k.jensen@samsung.com>, Keith Busch <kbusch@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/block/nvme: Check for zone boundary during append
Date: Tue, 26 Jan 2021 14:02:46 +0900
Message-Id: <20210126050248.9077-2-dmitry.fomichev@wdc.com>
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

It is observed that with the existing code it is possible to keep
appending to a zone indefinitely. To fix, add the missing check to
verify that the zone append is not going to write beyond zone capacity.

Reported-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 hw/block/nvme.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index f64676a930..67538010ef 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1135,9 +1135,10 @@ static uint16_t nvme_check_zone_write(NvmeCtrl *n, NvmeNamespace *ns,
                                       NvmeZone *zone, uint64_t slba,
                                       uint32_t nlb, bool append)
 {
+    uint64_t bndry = nvme_zone_wr_boundary(zone);
     uint16_t status;
 
-    if (unlikely((slba + nlb) > nvme_zone_wr_boundary(zone))) {
+    if (unlikely(slba + nlb > bndry)) {
         status = NVME_ZONE_BOUNDARY_ERROR;
     } else {
         status = nvme_check_zone_state_for_write(zone);
@@ -1151,8 +1152,9 @@ static uint16_t nvme_check_zone_write(NvmeCtrl *n, NvmeNamespace *ns,
             if (unlikely(slba != zone->d.zslba)) {
                 trace_pci_nvme_err_append_not_at_start(slba, zone->d.zslba);
                 status = NVME_INVALID_FIELD;
-            }
-            if (nvme_l2b(ns, nlb) > (n->page_size << n->zasl)) {
+            } else if (unlikely(zone->w_ptr + nlb > bndry)) {
+                status = NVME_ZONE_BOUNDARY_ERROR;
+            } else if (nvme_l2b(ns, nlb) > (n->page_size << n->zasl)) {
                 trace_pci_nvme_err_append_too_large(slba, nlb, n->zasl);
                 status = NVME_INVALID_FIELD;
             }
-- 
2.28.0


