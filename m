Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A28364B12
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:18:13 +0200 (CEST)
Received: from localhost ([::1]:32978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYaLU-0007cY-72
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZQ-0000RB-TU; Mon, 19 Apr 2021 15:28:32 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:34051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZH-0005JA-2r; Mon, 19 Apr 2021 15:28:32 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 1D92F21C1;
 Mon, 19 Apr 2021 15:28:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 19 Apr 2021 15:28:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=cx0nOlhhLFrvV
 LRCjnZJMGkAC5mOLl2er8M78PgU0Hs=; b=cCCNgPQucYAt+BJPHfr7V2o1G9uIs
 SNslINldqttHFJBgzdpxJ/oR5dfRr/WlMML/EfcfAv3kP0z4RaZNdNORuOjSHHE8
 NevdzKTNV6EBahIPPDuM278583NluwJKFeClV+ewRAk43xyJTTSEg5eP8+HhqrVD
 iIr6Pb/JeUfY1Osg9o8L+Uj9joOFrjnPm/roHxSeRb4KB+5BDt7XhP0SXW6uvy09
 FpO7DQj6zscUS+kuKTvGg/2cdF6E6KU8i3A6PkBkZAr2TuLqeGnddmIWTQQLgEP2
 tz4y2wGUnTZSbi5jzn6EPFHWnr3V4wl4UNCjmyUTrUzK3Gwub8n93SpPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=cx0nOlhhLFrvVLRCjnZJMGkAC5mOLl2er8M78PgU0Hs=; b=Q5jJsWCS
 grJLCL9xBpJb7cFsKW5IpMZf9TmZER19ZdZeOZ/JDi4rKu6ZZ2fs9JnYjLD7n6vV
 MgvQ/trTklkhYTTLqI4KgilvVWw/ffvv+Docr4NY7TGNtqB4oxWIAiE661WnlP+H
 B1e4JR0klrAh9/nJ+fsXwSn0AlQJ5FWtur5MjgSUYLa1SfcRrrchVeVu5R0YxlM7
 a2ZXajFOCBRTmP9PhP319YIYi3Pf5xwGVrXyd7KvNlev1+Z34D9yNStxyB1Rgzi+
 vDKBqsNfyim6J2OipDc9QO03s3fQWHVvDmR3joRAI6zdtQHWRbF6d7ir/g/hyFOL
 ghsTvWgDaVDcSw==
X-ME-Sender: <xms:09l9YIIjUNYb0GyKqFL7Zpgdkfy3rzeLSRsrwW4ljdqOfvtfs6mkUg>
 <xme:09l9YMfVdVU5ssLMwsPOnowPcVPgjSUFF-GVRNG_RsvhF2my_6T8-WmoFaJyKpdG8
 7eNTegd74O_844Yk34>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:09l9YH2CRcKfAUadlmSBH_khzPoqsPn29W7GQtRyaH5ISoOa0f37nA>
 <xmx:09l9YNjU4o15pLGDCzOYluUcjOoC47E5tntFburCBJ83ci6ZWN9f0w>
 <xmx:09l9YFS4bPAGQd1Wj4ge6-GpStm9YqJX_D2zSLKirqDd8hmoHL1_xw>
 <xmx:09l9YACSQdZ2cU5M3zdEN9OwgtPS3XrK2iLsdNQLHGKchA62ppBOKw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 166331080057;
 Mon, 19 Apr 2021 15:28:17 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/14] hw/block/nvme: remove irrelevant zone resource checks
Date: Mon, 19 Apr 2021 21:27:59 +0200
Message-Id: <20210419192801.62255-13-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419192801.62255-1-its@irrelevant.dk>
References: <20210419192801.62255-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

It is not an error to report more active/open zones supported than the
number of zones in the namespace.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 84f602652354..2041d8138420 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -210,19 +210,6 @@ static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
-    if (ns->params.max_open_zones > ns->num_zones) {
-        error_setg(errp,
-                   "max_open_zones value %u exceeds the number of zones %u",
-                   ns->params.max_open_zones, ns->num_zones);
-        return -1;
-    }
-    if (ns->params.max_active_zones > ns->num_zones) {
-        error_setg(errp,
-                   "max_active_zones value %u exceeds the number of zones %u",
-                   ns->params.max_active_zones, ns->num_zones);
-        return -1;
-    }
-
     if (ns->params.max_active_zones) {
         if (ns->params.max_open_zones > ns->params.max_active_zones) {
             error_setg(errp, "max_open_zones (%u) exceeds max_active_zones (%u)",
-- 
2.31.1


