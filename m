Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2099354670
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 20:00:29 +0200 (CEST)
Received: from localhost ([::1]:42666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTTWT-0003Gd-UA
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 14:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTTRI-00011t-Cg; Mon, 05 Apr 2021 13:55:04 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:36081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTTRG-0000IO-Nc; Mon, 05 Apr 2021 13:55:04 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F12B85C00D7;
 Mon,  5 Apr 2021 13:55:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 05 Apr 2021 13:55:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=r4Kx5yHncDaFC
 CeQfjaWCXjNC0YTb7c5XEvtDNV5O3M=; b=QXjUBw7vUAFu6E3k0WRml9Qmr5MTo
 ykDGYgqflr4ICbcVbmIexan0mx92zVwwnBV6whUpiTbVv1BDRYbAIojP7AHTrko4
 cT9QQuG6axBdztsvO69qjDZRiZX3KhqgLGlvTrysY3nAsJMR3UCaC8nCvOrJ6luA
 NVm8UOkWa7KFGCkpwAqWfEFdjOmeKJ2ECMwoW7OssTIOUUHVbrzYffRl4Kx1aYt1
 mqQKOcIJyLL2Kwm176Ikm30/eG07n9N9gNytujE4g3qVZkeRq6czc2/TXBcxF06N
 0YEDWFapBOzm9N6fPy6++oTBaI7lVz4X67TxVrNE6YgNrFEMbX2whGpgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=r4Kx5yHncDaFCCeQfjaWCXjNC0YTb7c5XEvtDNV5O3M=; b=HdUeo0AG
 6hgRdy94FJheTqzX9NkAyy/XaZeNumHZfOw4iMN4hizhDFLNx8IsW55dn/ivrgRB
 KVsZ5PQef2tSeM81qmupUc5UbySYn7mx7P1IQ4V/J+a+U0gV66trLRRvXbHzq0Sv
 edkbRErmO2wEQo9O80hAcZcZ1wLsPNfwjfXZ9D43n6OoGiOEqWIAqAdU4oghBJt7
 nxJW/sIlHiRPeHToabkYLiDdca7u6jZNseDP65eYVIilXOhHvJUDZbnUxGDqc1dT
 AjCNm53QkWyRJAlRDmJjFWev0NWgH/2R04Jbv3+q0LqL07IjkHal8bPHjU2tZwMi
 U/hN1zwYRCHQ3w==
X-ME-Sender: <xms:9U5rYAGflptdfj_Acn_fec9hywzI0Uu-Mrspu3Zqb7FNqmYjNPUJ0A>
 <xme:9U5rYJW13kziVxhy4NME4jn5tgrRgs6-gKmRwD1Wjpu487X1x8gwqZgtak01QPWgq
 nr0Fkc4uOrWgSYzhMI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejvddguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepud
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:9U5rYKKGs2R5HzhyTcJcsJnBemtVOg1aC9Avh-iS_EYwrF2MtaTcyQ>
 <xmx:9U5rYCFLoQn1pdTFp5nkD51sWm9DC9TyAlrk_VRSDkY1C1MYWh2m1w>
 <xmx:9U5rYGVn3B-IBbrtj1pi7DYZkYArzYZ1LvZbMz1bNSFnvF14xr9yIw>
 <xmx:9U5rYBHP5FsScCJluiMNohXnd_8EwpvyMtoZGVppnFc4OeDi1vNeeg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id ACB5F240054;
 Mon,  5 Apr 2021 13:54:59 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v2 2/8] hw/block/nvme: fix missing string
 representation for ns attachment
Date: Mon,  5 Apr 2021 19:54:46 +0200
Message-Id: <20210405175452.37578-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210405175452.37578-1-its@irrelevant.dk>
References: <20210405175452.37578-1-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add the missing nvme_adm_opc_str entry for the Namespace Attachment
command.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/block/nvme.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 5b0031b11db2..9edc86d79e98 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -86,6 +86,7 @@ static inline const char *nvme_adm_opc_str(uint8_t opc)
     case NVME_ADM_CMD_SET_FEATURES:     return "NVME_ADM_CMD_SET_FEATURES";
     case NVME_ADM_CMD_GET_FEATURES:     return "NVME_ADM_CMD_GET_FEATURES";
     case NVME_ADM_CMD_ASYNC_EV_REQ:     return "NVME_ADM_CMD_ASYNC_EV_REQ";
+    case NVME_ADM_CMD_NS_ATTACHMENT:    return "NVME_ADM_CMD_NS_ATTACHMENT";
     case NVME_ADM_CMD_FORMAT_NVM:       return "NVME_ADM_CMD_FORMAT_NVM";
     default:                            return "NVME_ADM_CMD_UNKNOWN";
     }
-- 
2.31.1


