Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A972F1273
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 13:42:03 +0100 (CET)
Received: from localhost ([::1]:50506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kywWI-0005tS-KR
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 07:42:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kywNB-0002Th-Vg; Mon, 11 Jan 2021 07:32:38 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:48321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kywNA-0006tf-62; Mon, 11 Jan 2021 07:32:37 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2FBCC25D4;
 Mon, 11 Jan 2021 07:32:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 11 Jan 2021 07:32:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=adtGXhYc66V9Y
 uG6CN04y44WiSyTghbjeZIAb9k/xaM=; b=IGXtQfN2nbvJImRwguniR3m9it+Xl
 yeo0DKwCLLZGM9Lq3legn0VzXetR2pSV5ovfWg9lRfJD4w6fAhNgMIxdRWiUAYi3
 10lW+5+u3vfsk336ATWeK8+I5iM40HqYmlZghkIY7J8bqk6W5AjPQc2vnz0bySRc
 72yd3R/XkKwH2UjGaUxRzDwZkB8HWUqzOuNIYGbrSF2wSYMmXbi+jvOmZ5lgVhBV
 DbkiJ9qePO3cKGU2xYNpF9SJWS56GkQlPA0Yjalb65DXOMwJpX1n0PlpduzzCUbg
 FZZb3GgqqccNEaWHUkUTiFX1rnDwW6yMPhQ0tQzi40G5dfIXk+ESOzskQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=adtGXhYc66V9YuG6CN04y44WiSyTghbjeZIAb9k/xaM=; b=EbtdhqGx
 eK4x29o/Tg0ui+Zfzdm5Yfv+TFMGa/TIBdMXe9qfKXBLZeVbZSiqDPuh1LhM324B
 NsClr6ry4DcqthFirh5oUXpwa5/j/3kRxwLHNwMfwOdw8ZCOwgYgDB4ePQveAY5J
 q0IMm+cXOJyo/OtEazjiv7mAW8Kr660uS8+HAm7uaYKU/Dk8q4PqV74eOD4xvqNB
 1+zk6isb63RSWPjTxaah70XQ+DCLnaJiVwigscHKEytmENuqKShYUiwpVk54cXV0
 yJGBzOhoPmNEzhxwg8WbRTGbhlQnUN2ewaeub4RDl1sg1VlPEHyMgIL8QCakQ7g5
 pLbMU6/MIoEP1g==
X-ME-Sender: <xms:YUX8X110pP3K1Qf7WOlkrJHVlVXwVdbC6POYQnn6OufKSeadOll2Mw>
 <xme:YUX8X8E1Q_OZzRV9UntuE7NaxxiQWchnI8dunNk1cyvutBi48o8FKFkVhKDBL6umf
 SY4IQIvZMz9eBLn6UI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:YUX8X16hNdl3IkomfrhujpvKiSd_M7QjKxmQ73RHi-kKtvx9czwuGQ>
 <xmx:YUX8Xy2VWza82dp0dGDFhF31FrUXRfKLEOrRep-x7lcDBLkg-xEuww>
 <xmx:YUX8X4G2xDSEcIiV6ndXQrKkI-cJjpiN6Qz10zdYWqZXc5sha9S_Vw>
 <xmx:YUX8X9OOK0QfOMTAiAKcrC-aEnkX1amfY4Nnqe4DWGTiIER6_m0osw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9BBA3108005C;
 Mon, 11 Jan 2021 07:32:32 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] hw/block/nvme: remove unnecessary check for append
Date: Mon, 11 Jan 2021 13:32:23 +0100
Message-Id: <20210111123223.76248-7-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210111123223.76248-1-its@irrelevant.dk>
References: <20210111123223.76248-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

nvme_io_cmd already checks if the namespace supports the Zone Append
command, so the removed check is dead code.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index b3658595fe1b..1f175c7f8256 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1707,10 +1707,6 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
         }
 
         res->slba = nvme_advance_zone_wp(ns, zone, nlb);
-    } else if (append) {
-        trace_pci_nvme_err_invalid_opc(rw->opcode);
-        status = NVME_INVALID_OPCODE;
-        goto invalid;
     }
 
     data_offset = nvme_l2b(ns, slba);
-- 
2.30.0


