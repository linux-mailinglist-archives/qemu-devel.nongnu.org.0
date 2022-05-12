Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AE15249F5
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 12:05:38 +0200 (CEST)
Received: from localhost ([::1]:59396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np5hQ-0002vh-IT
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 06:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1np59x-0002gj-HY; Thu, 12 May 2022 05:31:01 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:44929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1np59v-0007GJ-So; Thu, 12 May 2022 05:31:01 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id DB96C320095A;
 Thu, 12 May 2022 05:30:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 12 May 2022 05:30:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1652347857; x=1652434257; bh=EKsgih76VX
 WAmXJ4mLh3BVazC8IZm3tJolKye/7xR44=; b=lpZJULTEctAv204+ayOHaN4iRD
 0SHKszLJCFpwKKNO2CpaHkSqIHaFiuqOap/ELGw1zQf1/T8D0A2vemWRQjB8+/uO
 uxHm9Vr1CQzO28OkR3sxovF0hyNSFN8tdwnwybMF4kpaqN6orp17eYnitsFpfXZL
 y/3392ejiB7hkqvsF7e7XAV8jTdxe5uFAls4mKnzv6JjaayGvHroDR6N6YVX6gFR
 9Ox8a+eBdm/1a6g93Zcs3UlnpmQ+sUOg5987rSnM+rI6X6bZdICYakZ8mRHKeK/v
 UcEUNUpSdi6NbI54is1DsLzXXK+UxspG2VeMUM94RR0BpLf9MUET76JH7HJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1652347857; x=1652434257; bh=E
 Ksgih76VXWAmXJ4mLh3BVazC8IZm3tJolKye/7xR44=; b=BcY0az/rySRBfD0kH
 5t5rdRlQeG/Rlsn4hdw6920PLzQB0SXvCvnDo14yhAA7JjvgU1iXQjTW0dx9ca1j
 7VlWaY9tDusNNdvbB+0Wqkpzvh+3Uy2pMhAOEUPDLxPUxfmbLoPiTHRjG54NXOTB
 O2XF2GQ0zNHN/3RYar06sWIQfrgwKGAjyBTfgfrRPuq63AZNS1mRfHIA2YJxDGUj
 fiyxetE3JlTV4ZVakt/Yr72cYLP0Ee3ij3VUjWwsAcn5w4fqd4RVx0At9kDF7g9j
 oi7ZwFxS0m6sLsUH+Mbm4jSv0xsDjkCb4fiU7VMaXRqBNXQzeK19+rmok4eJs7m8
 5YtlQ==
X-ME-Sender: <xms:0dN8YnLJvyWOD_mRWkUYjpG5QPnT31bjLmluLNVf1l4ge1AY8O7EyA>
 <xme:0dN8YrJNszqnYpnGF9KHkbdXorGi4NfPiEXaY7IWrflMSOlhiTF5mUjUFgQGmLZ5o
 Ea_x9JTVN5JvLLLe7c>
X-ME-Received: <xmr:0dN8YvtYngnzYcd49ySvWo1WFKF1Ieow3SyrLd_89o8pD6ZSyu_xaQ7YaQHrXJQgYBvjCBn6zD4M9Jn40iSvhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpedtleduhfegleehleeltdejffefjedtleeuvdfgteevffegtedvveekheeiieekteen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhsse
 hirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:0dN8YgbRpFJF3CM-Xb0BumjE9bdpHMt1oa4CfBCYewG9EkTSn00w-Q>
 <xmx:0dN8YuYnxGXjdv-Z6XR5ClvEFP1ZtYI6zXmDGaUuZAeK8bUiO4Hnew>
 <xmx:0dN8YkA9TE19ewTLEKGhREpPZ9QP--GiiAHJKHKH8bVZcsvyHO21Rg>
 <xmx:0dN8YuEKx9CDa2bI1lhWjptdImiNuFSVlbd0Bhr_0nEO_baWmWHX5g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 05:30:56 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH] hw/nvme: clear aen mask on reset
Date: Thu, 12 May 2022 11:30:55 +0200
Message-Id: <20220512093055.726022-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The internally maintained AEN mask is not cleared on reset. Fix this.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 1e6e0fcad918..4c8200dfb859 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5889,6 +5889,7 @@ static void nvme_ctrl_reset(NvmeCtrl *n)
     }
 
     n->aer_queued = 0;
+    n->aer_mask = 0;
     n->outstanding_aers = 0;
     n->qs_created = false;
 }
-- 
2.36.0


