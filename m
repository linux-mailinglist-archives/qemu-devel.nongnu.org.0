Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37217308599
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 07:22:22 +0100 (CET)
Received: from localhost ([::1]:39040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5NAj-0007ic-4a
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 01:22:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l5N6W-00079f-HH; Fri, 29 Jan 2021 01:18:00 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:38971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l5N6T-0002Rw-CO; Fri, 29 Jan 2021 01:18:00 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 436A45C01C0;
 Fri, 29 Jan 2021 01:17:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 29 Jan 2021 01:17:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=344IEAyjcFkakRpaOBl0EmipEa
 TdoHaIDap0MAbEFdI=; b=RcVqj1W1TLIx1bnlC6U5OMHFJF219Xr5NzyqWT+jl3
 3GoT9Y9CDPLHLl7gERbUDSbWCeiybOhj2afLtaZ0PI8PuBL/styE2lzss9OEd431
 4MFchJ3NlrIbrV43EKtve/7gZ5JKaOAVyknqUJbUFimBLxUppoG4OEJpbfv5Iq8k
 cY2WogsJnAiPe/WLsyswtC9/aJxBU4QbkuWzxKjRgEpEmlS8Cm/1H+pGa7BqXJ8+
 HvD7756lGm/ToMLWsswZyYYWbEKzWS5sev+5+nQVhH76NmgqP6b+aVJhek8sOvQS
 o2WL3b1Lauuzovap8ShNO18S8RicxfML8Ddh8CglIiMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=344IEAyjcFkakRpaO
 Bl0EmipEaTdoHaIDap0MAbEFdI=; b=PyCMMAa+S8IQxEchKhBMBaf05SmYEMG0w
 EGwZY92xFS6gafCVOzKzKKDgPVvuBSxKlzPbGE2ctQUOxbKw3drvPcAAvHWSzizg
 MxVVDpwD9qf6lsDUygZMgeuQkoSglMAsZZzE9hKhUWkh6b4gJmwa8LsKUWWRwpHo
 dH3lLxE4vZR+G7i11ajMrgIoHYWp/kV/lWaiXN1mq/EwBbpf1N72EYrbG0oSBX5d
 DygmLb10G+6Sw6pCEtLVZzwqWdki/53xyoPV3fFf+TWzoVSQ2cQa07uu5y14Fcg3
 PztmBOqBuPeOt/KHoulOrqbQJZbcuRHrxvGxdkqs2h+NlawPfhDGQ==
X-ME-Sender: <xms:kagTYHBprgX9zfwnR0ppZHhIe_x0i_IYbli-xGDS04_WRfpjR9c_vw>
 <xme:kagTYNigM7nK0eFdweD2-KluyYI9FubtmzA6ChknMKja_yN1_gRiRu6Vnt_GseUR8
 dBvZBf3C2c61RpcLak>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedugdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepmfhlrghushculfgv
 nhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvghrnh
 epfeevledvieekudeuffetgeegfeehvdffffejueeuleduhedvgeejveejhfdtteehnecu
 kfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:kagTYCnk_cuvkOQc62jUFaawEkO4XPPYyvpuVG222I1_nWuzhZdS0A>
 <xmx:kagTYJxnxh4NFU6MeP0OfkP8fB1z5UuoAXqPXSQcEEQ-OwcjLd8UwA>
 <xmx:kagTYMQJpGNY8KFP4HEF1uuGilM7jlUml8I13qDwjPZq19qtcoLU5A>
 <xmx:kqgTYBIG4Nsf0zUFwnA9nbfrbXamw0l5g68qhNeeHwUGblBABmNLQA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 62CFF24005E;
 Fri, 29 Jan 2021 01:17:52 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/block/nvme: refactor zone state check for read
Date: Fri, 29 Jan 2021 07:17:49 +0100
Message-Id: <20210129061749.551411-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Align with nvme_check_zone_write.

Remove unnecessary storing status value and return at the end of the
function, if error occurs return immediately if applicable.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 8ac997735041..1dbd6ec129ae 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1210,7 +1210,7 @@ static uint16_t nvme_check_zone_write(NvmeCtrl *n, NvmeNamespace *ns,
 
 static uint16_t nvme_check_zone_state_for_read(NvmeZone *zone)
 {
-    uint16_t status;
+    uint64_t zslba = zone->d.zslba;
 
     switch (nvme_get_zone_state(zone)) {
     case NVME_ZONE_STATE_EMPTY:
@@ -1219,16 +1219,13 @@ static uint16_t nvme_check_zone_state_for_read(NvmeZone *zone)
     case NVME_ZONE_STATE_FULL:
     case NVME_ZONE_STATE_CLOSED:
     case NVME_ZONE_STATE_READ_ONLY:
-        status = NVME_SUCCESS;
-        break;
+        return NVME_SUCCESS;
     case NVME_ZONE_STATE_OFFLINE:
-        status = NVME_ZONE_OFFLINE;
-        break;
+        trace_pci_nvme_err_zone_is_offline(zslba);
+        return NVME_ZONE_OFFLINE;
     default:
         assert(false);
     }
-
-    return status;
 }
 
 static uint16_t nvme_check_zone_read(NvmeNamespace *ns, uint64_t slba,
@@ -1241,10 +1238,10 @@ static uint16_t nvme_check_zone_read(NvmeNamespace *ns, uint64_t slba,
 
     status = nvme_check_zone_state_for_read(zone);
     if (status) {
-        ;
+        return status;
     } else if (unlikely(end > bndry)) {
         if (!ns->params.cross_zone_read) {
-            status = NVME_ZONE_BOUNDARY_ERROR;
+            return NVME_ZONE_BOUNDARY_ERROR;
         } else {
             /*
              * Read across zone boundary - check that all subsequent
@@ -1254,7 +1251,7 @@ static uint16_t nvme_check_zone_read(NvmeNamespace *ns, uint64_t slba,
                 zone++;
                 status = nvme_check_zone_state_for_read(zone);
                 if (status) {
-                    break;
+                    return status;
                 }
             } while (end > nvme_zone_rd_boundary(ns, zone));
         }
-- 
2.30.0


