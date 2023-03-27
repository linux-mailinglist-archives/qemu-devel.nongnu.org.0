Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C73716CAB96
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 19:10:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgqMJ-0004hM-V2; Mon, 27 Mar 2023 13:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pgqM8-0004H5-NE; Mon, 27 Mar 2023 13:10:04 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pgqM6-0006AY-4L; Mon, 27 Mar 2023 13:10:04 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id C82513200981;
 Mon, 27 Mar 2023 13:09:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 27 Mar 2023 13:09:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1679936996; x=
 1680023396; bh=mQvIYD/e/q3Puo/9of3k/I1ku0w9UbsK+M4+27YdQUY=; b=U
 ERs4T/1f8kgi++zL/6M9bGA//d/6GK133Q2XHzaS9iHFzYD7GzfUdEQgfbX4n/FQ
 du4jDYBR41SLrPzO+QBFFoNWVcXOu4px88fbv6C9aZE5Q5zleSWk26WYJrWUh+RB
 hD0aaa7+OsmUiMg90R9e6DsnjL6gkuIDxaPNIMsXLlPbLhXmHf93DOHwjRDMh0r/
 9cjDYnxJIyO0BxE5RHgPU7XF4bUluYWyJC2EQsXsQJXomyMauboDRADy00bB0eek
 2ZrttkKcclFKAx0j1zxYbMIDUYid2PkQLhQ5d9T+WKlppJJerIDLpDlHMNP0btXU
 B7TlaEU5mb6TlQ7No8W2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679936996; x=
 1680023396; bh=mQvIYD/e/q3Puo/9of3k/I1ku0w9UbsK+M4+27YdQUY=; b=C
 XVv3Wh2x32whHjr5reWdz3/4eNGi9Ug3uaNNOiaLp8NDJx1cG1eS33X8U1JvSykB
 m5F6l0jDwgycPgoQ+0AmPDUsoDIUgx8u+Qlek0j9ORnN9hqWiWpXlyS/CPWb88+k
 7kaQeH1Rs8YAhmM+nkYo2T0y5uiX3l4LmNU8TjqidhrF62QfDFtck+lqduIDaFN+
 SHuX/rfJDZWj6uda7NDRbRc1TjUkTh4MlM0YvZLCnda5ad4vAm9eRItZN0EgBVmf
 rsOJdULKU/VXTazcY8jncrvpa5p+IexPitYC48r7c9nC3oltiDthyHE/OVDoMMDX
 SsgRtpn26s+eJh7pI8idQ==
X-ME-Sender: <xms:5M0hZG6q_edAvWORG3mUxLyeDmbDqxjpvTAG_dRPzNNwnwXwFrzQ6g>
 <xme:5M0hZP6AfnccMIXJS6weJgum5GB3b0-5GOUyhj5KZLTUlkpwgZY6fHUqG4JNJnBqm
 s1HisDmGjldsoKwBTA>
X-ME-Received: <xmr:5M0hZFd4Sa62EQYvHf8hkgqSoan6XUu-okECSbI8g2pqsPnsqqHtzLuHZciz7LTktawdUWLxDNbHZtaA760wi3vb81Bf-DpSnYuYLT4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehvddgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:5M0hZDLTfd4DzGU7w-PN-ajekWkZ94PwcqR-4l1PWu-c-9zmYPhIAA>
 <xmx:5M0hZKKcrRG-pbrGmvezi3r0Rmnqqr47akCvAgjevDM_ejSXjTTXYw>
 <xmx:5M0hZEzZ4-NuB5IzNt6FldFW0ov9UwJMq8CeQRDYAgqesK9fGlf2rw>
 <xmx:5M0hZHCbHCLGLEphLAjInq_oJGplPRc77YmvkxCE6A30NkHEzr7BkQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Mar 2023 13:09:54 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Klaus Jensen <k.jensen@samsung.com>, Jim Harris <james.r.harris@intel.com>
Subject: [PULL 2/2] hw/nvme: fix missing DNR on compare failure
Date: Mon, 27 Mar 2023 19:09:44 +0200
Message-Id: <20230327170944.57033-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327170944.57033-1-its@irrelevant.dk>
References: <20230327170944.57033-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569; i=k.jensen@samsung.com;
 h=from:subject; bh=os38Xj7WvGjGVhRwSYDfcy2fhOw5hCYLx7/Yt8fjVCE=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGQhzdfszkCtHrXR+/QqeCQCUCMCKax3wsRGO
 0LktljCMWcGb4kBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJkIc3XAAoJEE3hrzFt
 Tw3pdqIH/3GRRekT52TYOdKdCNJaTi//ytIi1hhsqvR0H080A1XXfiIRjjhS93KopYrlu8AUPp5
 L511YfsPUyeM4fM94GkvsegpClgPcqIVTGIlG2aYL2wDLMamlxEewZRZs/1Jm3Ws8WjrtDkKiJ0
 UlayeQNNhud9Q6l4b8V8TOdm6VOSBDjQWbLUEKkjqymE2jIXaKsTSu6kv+PHKWMWkoZlMFqgr/m
 4DjR3bnA8FcgI6qW/5CkYj50Q1k/u/vLnmrPVoLhTs0tn0yUz4ftc2KUoP+oAj2mTBOZvMb8dZB
 PhYEez/LLUYEFeCdfs6/U43BKulv8nHTdk+kKa7LsjvJe57N8//wJab4
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Klaus Jensen <k.jensen@samsung.com>

Even if the host is somehow using compare to do compare-and-write, the
host should be notified immediately about the compare failure and not
have to wait for the driver to potentially retry the command.

Fixes: 0a384f923f51 ("hw/block/nvme: add compare command")
Reported-by: Jim Harris <james.r.harris@intel.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 291009545f03..8b7be1420912 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -2378,7 +2378,7 @@ static void nvme_compare_mdata_cb(void *opaque, int ret)
 
         for (bufp = buf; mbufp < end; bufp += ns->lbaf.ms, mbufp += ns->lbaf.ms) {
             if (memcmp(bufp + pil, mbufp + pil, ns->lbaf.ms - pil)) {
-                req->status = NVME_CMP_FAILURE;
+                req->status = NVME_CMP_FAILURE | NVME_DNR;
                 goto out;
             }
         }
@@ -2387,7 +2387,7 @@ static void nvme_compare_mdata_cb(void *opaque, int ret)
     }
 
     if (memcmp(buf, ctx->mdata.bounce, ctx->mdata.iov.size)) {
-        req->status = NVME_CMP_FAILURE;
+        req->status = NVME_CMP_FAILURE | NVME_DNR;
         goto out;
     }
 
@@ -2436,7 +2436,7 @@ static void nvme_compare_data_cb(void *opaque, int ret)
     }
 
     if (memcmp(buf, ctx->data.bounce, ctx->data.iov.size)) {
-        req->status = NVME_CMP_FAILURE;
+        req->status = NVME_CMP_FAILURE | NVME_DNR;
         goto out;
     }
 
-- 
2.39.2


