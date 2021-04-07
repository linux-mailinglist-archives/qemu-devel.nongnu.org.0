Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4D5356381
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 07:51:48 +0200 (CEST)
Received: from localhost ([::1]:44452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU16R-0004CZ-N5
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 01:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lU11Z-00028Q-Sw; Wed, 07 Apr 2021 01:46:46 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:51555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lU11W-00050j-Rz; Wed, 07 Apr 2021 01:46:45 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1308D5C00EC;
 Wed,  7 Apr 2021 01:46:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 07 Apr 2021 01:46:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Ehl9uwxhCdQZ3
 X9GgRyTHcKkodPcs+CwbWNeqBnyNNU=; b=F/ppx1GcYZLEB7roQVVQfnpo4V8Cp
 6jZQ31S8Tl502O98w+jtt9K9cYsavH0q7NXAb0WKEmJ0qEyq//I2yqrbxFP4kzck
 ZE1mZUdovftjX9Px7q+iCM9YGvpUNI0rkv0Ye1u1zg5LOkGd9z5Bml19xLrsgMS5
 hIu0BkMhtA3S0iuYCvVeftOW02WTbejjPmIR+IK9l/5IaFCsGH1p3W044J8sSy+/
 wLaNalNIvifMzT2WvPSYedHkg70l75BH1Hp1/WWSEE8Z+myKTv+z+V/8jSJSHLx/
 o/VFosim3hrYwpHhNV7MgkxlXlx4fDsnGdy7ddMJ+Y9GWJlVNfhvpqj2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Ehl9uwxhCdQZ3X9GgRyTHcKkodPcs+CwbWNeqBnyNNU=; b=KJruq+uA
 QEwUg0gxkSBAwTjt9u3X20FHjV6Yx28o0BHXHLr+BZ1TJ9Iewt/Vgj3K1Jww4cLf
 o2FJHxJASQLuK2iCRlII9tYNGqQEuHRKdaNVs8SpiTcYjFndMUnJwud0YZfgBViA
 dWXINtEHDw3NhbqkHgd5yNMXCvwzbZOrOp2LZIE2xj+7ZpiV7KpEDeQKScDvcM6Z
 2HVw4BH5BYupc5jL3DIa86TUGU9d4vwa4wEyOH6OXzneJ8YnCGzVUZY4/EftwdAx
 kJU+UAHlP8Bh86w/JoT3vivloNWw+BK7/rSFyNykGbIfl6NjZuOg9dP0rN2Jyxlb
 B2/6zG8PJPstiQ==
X-ME-Sender: <xms:QUdtYFlLIbwitq0WrcbXGPuSQu4cHXJAGK6azgUPArRsT6sjqMhFGg>
 <xme:QUdtYA0n4e-rF_6SbwSwAwSc1lmdRUj4_9S14HirdqUXRGrpy5SnROZYhie5u5oMj
 CKh6TinJykzKkmGf9o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejiedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:QUdtYLqmT6kliuefzw4cE4m6R7P15xDK7LpL9TDNQTslwNxN_XarqA>
 <xmx:QUdtYFmFEOtkx0T1dRmguTlssSEhmNhtXmfa7Dcdorlno8Vw_dx1Lg>
 <xmx:QUdtYD2BJkbYQcLGXn9Nw0dBOT7kQqm8sYxZ6ev7FY5-rt9l9BnCcg>
 <xmx:QkdtYImOxi5fVb1GoV5o6pFW1zxnmGGeGxgAiMoBBbdhAf7f6_WzcA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id A1CC9108005F;
 Wed,  7 Apr 2021 01:46:40 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.0 v2 02/10] hw/block/nvme: fix missing string
 representation for ns attachment
Date: Wed,  7 Apr 2021 07:46:27 +0200
Message-Id: <20210407054635.189440-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210407054635.189440-1-its@irrelevant.dk>
References: <20210407054635.189440-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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


