Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FA03482CA
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:22:52 +0100 (CET)
Received: from localhost ([::1]:34688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPA1j-0006Tw-9n
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lP9of-0007r2-Sr; Wed, 24 Mar 2021 16:09:22 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:40591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lP9oc-0008MD-H7; Wed, 24 Mar 2021 16:09:21 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 961ED13D1;
 Wed, 24 Mar 2021 16:09:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 24 Mar 2021 16:09:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=HBpbcH/dT4xNc
 8sZRqKXldT5tYOnlJF6MfI5uZ/zs4Q=; b=JPQCzd0Ue2g/oIonW3ikYgvV0zf1Z
 ouwG2J829D4NV4TPhFaB93Z7cs8ACSMJLj8m7zHYuhuC15JsQeRiVWZl9AubtMJb
 Wf0hPDSSVjAGWVjiNOZuZL5gkhb2RLsB8KGKnAWRmm+wS0jbzMIDW/vpsT09L3ip
 tABfNhLZ3B+A6JD0sFaYKQMEDZJ5NYknbzHjk1OVJiyIbLk844Akhc6cAsQGWSHl
 C2gwp6p75ppMHiWeKQ4rGoKCHHYnd/FGo9ofzUVHrSw5nzSMpI7Pv71bYiw89eYe
 4y5IgXyy2VteigbOr+pQ879aI3J4mRV4LAJDVaRp1FyQsiOCFPBfJ1C+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=HBpbcH/dT4xNc8sZRqKXldT5tYOnlJF6MfI5uZ/zs4Q=; b=vlRisD/K
 IozDHuqcTXF/cefFxkPzu9ml1DpkO5tA+Gcv7thCJAs8mS9IncPqXCX6AKD1TMAV
 48rxSoD9+2swwAo5vUPf8dWGLXHdHDc0uvMSr6mwk4zu95c58AtYrRpmqCKVJliL
 1LCstBp5G+hEZGOiOftCyOwKwwCtVUM9GsdfbGDb4AUhYJRLRaZQwxxyf+ME9xed
 /Ni/gdbUn+2ZZ6oryL+LuOx8gzy1DHGtwhT7wav8Fj9KQS2cZgh+3DFCW1wdbv6B
 sSdOWPgEbEtAsznrZG61reEqVK2/iG+VYoUBymvgc5lHtbcb4VyVMENMyn/Snnu5
 U5VqHnjUuoDp4Q==
X-ME-Sender: <xms:apxbYKHn_hjHq44-hCZbHb1QLHhgDEj9fM1LH-jEwJnMBDhgrn7f4w>
 <xme:apxbYLTGhDdztPXV_UsTV6tAan4UfLGPNcHIUC7C2l6UQsvIKmHkDK8cQjtQixPdo
 uBwvnWmSCFRHt9r2Ek>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegkedgudefudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:apxbYBBII9XzJewDLhqtqwrCBuC0NbHvoWFXYQPu_787h37WF-zhMQ>
 <xmx:apxbYL37LoPRkx3c5lhtKgBofOITUBDEncK2g8GlYYlLwYScAIuBUw>
 <xmx:apxbYPUGaBj3jnKJQdRuXcvxksYjQ7lhUxYDKmD92hMEjkvVIFI3JQ>
 <xmx:a5xbYAaUCar12XBAtty9W34R1n2sCx0dzi6Qz79ZubIXY_i7nI-J4A>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1E8511080069;
 Wed, 24 Mar 2021 16:09:13 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 2/7] hw/block/nvme: fix missing string representation
 for ns attachment
Date: Wed, 24 Mar 2021 21:09:02 +0100
Message-Id: <20210324200907.408996-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210324200907.408996-1-its@irrelevant.dk>
References: <20210324200907.408996-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add the missing nvme_adm_opc_str entry for the Namespace Attachment
command.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
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
2.31.0


