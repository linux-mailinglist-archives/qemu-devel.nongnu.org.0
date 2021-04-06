Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E2A355D3F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 22:52:04 +0200 (CEST)
Received: from localhost ([::1]:35998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTsg7-0004kK-4T
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 16:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTsat-0002Ag-LG; Tue, 06 Apr 2021 16:46:39 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:38651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTsar-0001XE-11; Tue, 06 Apr 2021 16:46:39 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id DC7671400;
 Tue,  6 Apr 2021 16:46:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 06 Apr 2021 16:46:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Ehl9uwxhCdQZ3
 X9GgRyTHcKkodPcs+CwbWNeqBnyNNU=; b=tm8aKelECeNHhZxs/811RAi2xYoE3
 uaQf7nUe/1M/1bO84OzqNTONIZAzUFBGgErfusbTWjqeHuzjmGPYYmbGXmq15qoW
 WgjKaOWX5eoFAtvIjKCOK9o5TpSrf9jkghBGZ9M6jbX6rOqTK8cItOJByN+/jwuV
 VmtQVF/QZIvM+qyh4XZ7bb6Yu9xzl6X4xGjRdUTHhuhkfZeOpK4mimt3XhY5CdYs
 FgGZL/ZAxjnpWlR0n1Pe1+NFU8JtUZbpJx3XTJ7s+OuOWApriLtPgUKeyst31bWW
 iFGEusNWRSA08dYdu3ah2YXDGPlPLo977paeK0kyOB6VlTfL3K96Hakcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Ehl9uwxhCdQZ3X9GgRyTHcKkodPcs+CwbWNeqBnyNNU=; b=XcgkRjdD
 4a+/2W/xJeoU7ij0+E0gjYTUKmeAuaYqZpFsUm66BcaVbf1V65FT/q6ILBen8Ism
 vGeF00Y+PYr7xVNvrqG/Chn2QrB2a7mcbbj8kOlhMZs04Vq5ac1zir9BktogBWuU
 mQZd1wFShoIclUc4j0pkalbbg72DHXS4KZ0j7UV1mw8hswLUcF1aJ7CU8AZbfJaA
 q5Y/OFDu44tgHYSvxF/Qv4KQoeVagm8CPQ9X6yxPuYmz8rN4IW4E33Fv4ApcaMac
 bQON5qAjIw7RBqmn/R+5QWG1QhFfxYz2zRFDxTRdjQpvtCR0eb19wXSMEQ6gzIue
 Pa9QsOdr8WcLJA==
X-ME-Sender: <xms:qshsYOJwLc4l95Wu5nbBrawdAb5IqtNH7G05G9nesyYT94U0F47G6A>
 <xme:qshsYHsYI3ILm7NlSRnnUjnk7e_hXFUKAC6ScPyIFdJDhLblFAuNhJ3R1bE7pb2zB
 45iRW9SuBaynF8NIV4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejhedguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:qshsYFDVH9S1i8pmjpn2zhgt3ZIKsFvf_FRa-A58p24Zl45HYg4QHA>
 <xmx:qshsYPPrmWRpv7kKDU1ibs1TTbUNIMI4r-UGfio6EMv6KQyr7ZSUJA>
 <xmx:qshsYNDJ_o2kwG4BLelfOVp-8VTjei4s06Osf7seVCmI1fq8VlM0aw>
 <xmx:qshsYDcL-Rdajp0sNPy9q_bU1hEAQkmlYhWqv0ioZyhti3uPCotztRTdpcE>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0BD8424005C;
 Tue,  6 Apr 2021 16:46:32 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.0 2/7] hw/block/nvme: fix missing string representation
 for ns attachment
Date: Tue,  6 Apr 2021 22:46:22 +0200
Message-Id: <20210406204627.140812-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406204627.140812-1-its@irrelevant.dk>
References: <20210406204627.140812-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.27; envelope-from=its@irrelevant.dk;
 helo=wnew2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add the missing nvme_adm_opc_str entry for the Namespace Attachment
command.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
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


