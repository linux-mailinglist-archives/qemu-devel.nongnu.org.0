Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DD2416C66
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 08:55:14 +0200 (CEST)
Received: from localhost ([::1]:60316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTf73-0003vg-6v
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 02:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mTezG-0006R5-4x; Fri, 24 Sep 2021 02:47:13 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:57757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mTezE-00012t-17; Fri, 24 Sep 2021 02:47:09 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 38A6A580BD6;
 Fri, 24 Sep 2021 02:47:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 24 Sep 2021 02:47:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=BgKIxMdnsVmmI
 xDyotmdZxJG5MqI1WUheh9D1cwWwaE=; b=dfTkKG9/ja0sjM48WQzOgg5yFygY1
 W8H/UfITFNOmDR36DXyLkqXRDoAXBS01uxkBARRQwiv8GGtah1E+csbMvgh+vgIf
 5KToCrhqWh+bWx98FnqmxfgCD8yCvRkfNoCXjjXemV7lcKQGGLS9x8A75cl+SGF7
 1edS9kQ/sqChEzvH68iXxldFbQ6RZKq1PLNJGjA7ZOxtcT5VgrENPQ5nq7V2l1P5
 hohAEKT1SNBe6yu4TujzlsXm/MLiqZk0SThUPjfoQoOR274nf/gwBrrWVdCu9Z/n
 GMtzZT9R00WUfsOsBBQQrnXBcKMg8Io5OeH+2ypYby53G50gNQbFRCvFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=BgKIxMdnsVmmIxDyotmdZxJG5MqI1WUheh9D1cwWwaE=; b=Yv+p9r1A
 ZD9HOBPCvkxnDR0FG92rU+D7M4RMEsFDYY74iaDeiQ4AwfwvMjibLzDoqjkZX9My
 lfJChR7v3IbZyrFsH8FLS0Pi7zMNZJUp/luDzen9Czcx7JVkGIMSUxlHQ8xTOp/i
 SrG0gKObUm1N9TZUt2LO3VQxm/psD8/wVPWmutxcRf4iKCkeqfk/tb/WiOwtrK+s
 cZyp0mJM0QKIdsUKN+HSU2TkbV3kwm94Bw1VRiVShuetYzHdIHCp60zrBO6/IyCj
 AErDznKNwRcTRrTmp5/GLl/VO9lVJD/nVuCKOpVr1SheFRkbZM8T9t2UfObO10ls
 yxOZkFfpr2NdvA==
X-ME-Sender: <xms:a3RNYd8Vovg33d-QvwlG8QlNpvvEGTn4HCNleph7HCwRqDcPJ7O1QA>
 <xme:a3RNYRvGM1AzXNSpOLt8pUYQZ_mYbPv2_ihOChhEn4s8BkvaqSFR-WMnugfW2h-l_
 2tCxoJy2uzatUVjgUM>
X-ME-Received: <xmr:a3RNYbDzS6xN_9agaQHHAZ5KQGjaXzbsr86nUysbqJx8H9mHKP7of8GxdxkpgoBPDSV9b0xfi_xNr5yNKsl5VoqgYuJturcbASudLOjs4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:a3RNYRdOaiS3R_xxgeiyW54WC5QLtkxslNIH4aTVGp9fwKWcDPrQJA>
 <xmx:a3RNYSOu4y7N821HfzlE-_lFBz9BwZKd-6296xXBQ9lEPpnbfSmnqg>
 <xmx:a3RNYTkzj-hz6fWgsGqJpFLuVuv0OXF3dcEu9ras5VkrWHOMhhIDSg>
 <xmx:a3RNYZoiGzN90F3qNAgs6TPcN3Z1YxZEdbndeEEFXUpU5H2pj6IeHg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 02:47:05 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 1/3] hw/nvme: fix validation of ASQ and ACQ
Date: Fri, 24 Sep 2021 08:46:59 +0200
Message-Id: <20210924064701.283182-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924064701.283182-1-its@irrelevant.dk>
References: <20210924064701.283182-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
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
 Klaus Jensen <its@irrelevant.dk>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Address 0x0 is a valid address. Fix the admin submission and completion
queue address validation to not error out on this.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/nvme/ctrl.c       | 8 --------
 hw/nvme/trace-events | 2 --
 2 files changed, 10 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 6baf9e0420d5..ff784851137e 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5623,14 +5623,6 @@ static int nvme_start_ctrl(NvmeCtrl *n)
         trace_pci_nvme_err_startfail_sq();
         return -1;
     }
-    if (unlikely(!asq)) {
-        trace_pci_nvme_err_startfail_nbarasq();
-        return -1;
-    }
-    if (unlikely(!acq)) {
-        trace_pci_nvme_err_startfail_nbaracq();
-        return -1;
-    }
     if (unlikely(asq & (page_size - 1))) {
         trace_pci_nvme_err_startfail_asq_misaligned(asq);
         return -1;
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index 430eeb395b24..ff6cafd520df 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -159,8 +159,6 @@ pci_nvme_err_invalid_setfeat(uint32_t dw10) "invalid set features, dw10=0x%"PRIx
 pci_nvme_err_invalid_log_page(uint16_t cid, uint16_t lid) "cid %"PRIu16" lid 0x%"PRIx16""
 pci_nvme_err_startfail_cq(void) "nvme_start_ctrl failed because there are non-admin completion queues"
 pci_nvme_err_startfail_sq(void) "nvme_start_ctrl failed because there are non-admin submission queues"
-pci_nvme_err_startfail_nbarasq(void) "nvme_start_ctrl failed because the admin submission queue address is null"
-pci_nvme_err_startfail_nbaracq(void) "nvme_start_ctrl failed because the admin completion queue address is null"
 pci_nvme_err_startfail_asq_misaligned(uint64_t addr) "nvme_start_ctrl failed because the admin submission queue address is misaligned: 0x%"PRIx64""
 pci_nvme_err_startfail_acq_misaligned(uint64_t addr) "nvme_start_ctrl failed because the admin completion queue address is misaligned: 0x%"PRIx64""
 pci_nvme_err_startfail_page_too_small(uint8_t log2ps, uint8_t maxlog2ps) "nvme_start_ctrl failed because the page size is too small: log2size=%u, min=%u"
-- 
2.33.0


