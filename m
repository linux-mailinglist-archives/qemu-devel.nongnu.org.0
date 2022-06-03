Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE4553D299
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 22:04:01 +0200 (CEST)
Received: from localhost ([::1]:46496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxDWa-0007SI-3p
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 16:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDNq-0007Eo-Fc; Fri, 03 Jun 2022 15:54:59 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:54219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDNo-0008DF-Pz; Fri, 03 Jun 2022 15:54:58 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D50EB320096D;
 Fri,  3 Jun 2022 15:54:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 03 Jun 2022 15:54:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1654286092; x=
 1654372492; bh=4one0BcLs904Z7IHHedCkaTbGDZICC0tN5jiBZUvycY=; b=W
 8GkYwO/visLBnZhUHjp8oAHwcv6YHM/JtTRV2koVrw+I4KAiLOCM6GBSfS9txrBg
 sE3UGl0r20Uxovm3gCGa++RI8lRQF5G1Rqr3Elc0KbLEZMGSRfnA43eKh72ruRCg
 h1uaW0FJ3s+32tFBmhjkjgYASBn6T3rzEVZ3xER8cV5Nd+mJt706s8Zm7zMY8yxz
 1kus3A/wuAhbUufzakGDZ/Kv8isqREg11YuIHsH4Q6a9L8dirTvkZzQOEJOtR7Ay
 Dqq6o+NHCFgZknlyljrdysyVEb/yrQZWBRhyNqrTSzZZnYzRDZkXzQf1Uccgd1GC
 MdkhZcp1Bcw11s/GP9anQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1654286092; x=
 1654372492; bh=4one0BcLs904Z7IHHedCkaTbGDZICC0tN5jiBZUvycY=; b=E
 BGpHhIhxtUpg86TplLFzD8IFBLezxW/nALr6+0NLJccY50sW6+bzVlh43aowlmmm
 1rAMhG5vLXbkwFp04Juztr3Da7xsoQ+qhp8caijYznYR5qjQZ8wNte4Bq9tR0Hxk
 65bHhvIaFIUgY5XwYBSVyaPIy0tM8WT+arvR+sEujmaMPvoCM4PaLuzBBTFy96dw
 4Osszx7O+MKJHWq1hh9Tjy9o8Csc60DW7zVTvC88D1zEEP6wzTtzHY5csVQBwW1c
 myiM+QvMtuJqWnQxqjPh5hr8r3BRapH0a3+xmkYIWbBl2aaYz1T8YV15+fN4I8s4
 v5ChCcZpfFv4nt22QQncg==
X-ME-Sender: <xms:DGeaYlhLsedD931JcdSABYPPIj1lS0lPgn0SXk8lK_OVfL4D9MNBcg>
 <xme:DGeaYqBARP1_4M2_RaQgeY2Y1ZW77So2IXD1b8jun6gwq2FU1IyqQCtAjL55P1cQs
 h_B-NduWmRwyNnPCF8>
X-ME-Received: <xmr:DGeaYlGc_3JBmUlU1ZCz70s6nTJK3A-om3n_S2JQLX8W_G6gdQNfirQvcqke7WY8S3gL1UBgBDp_IwSVal1L>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleeigddugeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeefvedtueetueduffevgffgtdeftdeuleffhfeigeffkeegfeejfeffteej
 iefhvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:DGeaYqTA1ToaZQGH_a_9-4omzMnt9id9Kr4kvTpY2QWXdvb590AOUA>
 <xmx:DGeaYiwiiiPxulNT9BoFdQvhrk1A-U_HTnS8xxq0rmKw1_A06M4vpQ>
 <xmx:DGeaYg6x-mUux7aveifWuMJG1OUPwi8fIPb94WAgqVyIBPguF-lOsQ>
 <xmx:DGeaYnL45xVkGaB4oBx8HLxOyQFvF8UT3uSO1zdoLXPTHRBtITcEYg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 15:54:49 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Yanan Wang <wangyanan55@huawei.com>, Hanna Reitz <hreitz@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 Dmitry Tikhov <d.tihov@yadro.com>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 11/11] hw/nvme: add new command abort case
Date: Fri,  3 Jun 2022 21:53:54 +0200
Message-Id: <20220603195354.705516-12-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603195354.705516-1-its@irrelevant.dk>
References: <20220603195354.705516-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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

From: Dmitry Tikhov <d.tihov@yadro.com>

NVMe command set specification for end-to-end data protection formatted
namespace states:

    o If the Reference Tag Check bit of the PRCHK field is set to ‘1’ and
      the namespace is formatted for Type 3 protection, then the
      controller:
          ▪ should not compare the protection Information Reference Tag
            field to the computed reference tag; and
          ▪ may ignore the ILBRT and EILBRT fields. If a command is
            aborted as a result of the Reference Tag Check bit of the
            PRCHK field being set to ‘1’, then that command should be
            aborted with a status code of Invalid Protection Information,
            but may be aborted with a status code of Invalid Field in
            Command.

Currently qemu compares reftag in the nvme_dif_prchk function whenever
Reference Tag Check bit is set in the command. For type 3 namespaces
however, caller of nvme_dif_prchk - nvme_dif_check does not increment
reftag for each subsequent logical block. That way commands incorporating
more than one logical block for type 3 formatted namespaces with reftag
check bit set, always fail with End-to-end Reference Tag Check Error.
Comply with spec by handling case of set Reference Tag Check
bit in the type 3 formatted namespace.

Fixes: 146f720c5563 ("hw/block/nvme: end-to-end data protection")
Signed-off-by: Dmitry Tikhov <d.tihov@yadro.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/dif.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/nvme/dif.c b/hw/nvme/dif.c
index 62d885f83ea4..63c44c86ab55 100644
--- a/hw/nvme/dif.c
+++ b/hw/nvme/dif.c
@@ -26,6 +26,11 @@ uint16_t nvme_check_prinfo(NvmeNamespace *ns, uint8_t prinfo, uint64_t slba,
         return NVME_INVALID_PROT_INFO | NVME_DNR;
     }
 
+    if ((NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) == NVME_ID_NS_DPS_TYPE_3) &&
+        (prinfo & NVME_PRINFO_PRCHK_REF)) {
+        return NVME_INVALID_PROT_INFO;
+    }
+
     return NVME_SUCCESS;
 }
 
-- 
2.36.1


