Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31B74B4432
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 09:34:02 +0100 (CET)
Received: from localhost ([::1]:33652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJWo5-0000mj-P9
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 03:34:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nJWPF-00038o-2U; Mon, 14 Feb 2022 03:08:21 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:42697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nJWPD-0007X5-8s; Mon, 14 Feb 2022 03:08:20 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 7C4C12B001E3;
 Mon, 14 Feb 2022 03:08:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 14 Feb 2022 03:08:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=dDcC9RWWToGabc
 yYbYZAPPfmTkp1ESis0HbzBRxiX9k=; b=opB7V0VInk3uDnJqLGzgTmr4G0/2ko
 0dHL3Swa9KE0DAekF08lvic3RwKVwO31NaUyQub/HEygAiF42A+KSHzl41mF9y8V
 b8KXAweyqGg2uDzTfRM09q14NpMIue66/5x/8j7z7OM3VK9gb6fTcPoGtvxQkPzk
 5WiuzDtsaBuGQ9asBi3Vz3sDD5pWx8YcMnhA4Cdb41R7wykP9QMpv81L5dpc7ThR
 gXrZoaH7877CIJG0hQHLnnzebwSRIB5FDs6pqrcLQoIZDDo7fzVNrqkurtO5Az+2
 mNrn2gYGYkSvYXaKaNOw+Ei600ftzjo8sqnhEam7rL8qYxhxIZbgNtLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=dDcC9RWWToGabcyYbYZAPPfmTkp1ESis0HbzBRxiX
 9k=; b=DCiAVU0Vo4WXU6h1UhA6bLmASyidSwf8mJj0lLMBoZkO33P9blEPMo9si
 88X8KHF87hPGk5hZrxPV/dkKR87dIp9WlKplVONooRY8QxGwZuFLDF32EfX6AC54
 jwRX2s2ATqE5fbBanoE4oAw+RcGwRyPgL1zuh+/kPlG/2UdJjkR1961I5xi4dZcf
 llEukTxi5G+ar4jyCDMHusSiT8L5/iLAnXzhpdPu/sjSnSFtQA2vn9TX3RsDWwQe
 ERhjGiJMZxXduu0Us2R2yPQC3MnAE0ZSWpqf9hLw8ppkjrMVfG2IDDoqWSiR66l+
 5WiYqybraoznSDvrH3rnGX5anx3oA==
X-ME-Sender: <xms:7w0KYk7UKdyW9LgymTU2DIBegWWh_0G72RJwI7O1etgaySFht-BHeg>
 <xme:7w0KYl6Va_Z7NFL8OGscIZ4mltTDw-v7IZadV7QIh8k9dLOZODd0kgBvkhJhbcOpq
 FLEE8P-BURFWuXZ0hw>
X-ME-Received: <xmr:7w0KYjdlCcLlQQkcNNHdwzs_xuECwJTOZYVQEpJFfw5438C6u1xjdZ8iw11H-fVEFFbgEoUa7YWwCkVXZ8rNiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjedugdduudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepteevuedugeevieehgeeileeufeetvddtkeetfeelgeehudfhjeeuledvhfff
 tdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:7w0KYpLuhlQxE55Y5331h4Q_HVImAqEg6Lr9t-NI2j-2L_g7anW0KA>
 <xmx:7w0KYoKEpv4wSCIUX53ZedbMiT3Ou7VY7fgI5ua5wEiEp8ZdSTiEDw>
 <xmx:7w0KYqzTsWx84Md5Vbffq6DeLdMciXBA4vfexeYCyTqpzHV5V_hFyQ>
 <xmx:8A0KYlA7n1CZ7IuVqpBt6ODb7vCwLfHQQLvuUeIFUKEfsRcmmXUTA51R3vY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Feb 2022 03:08:13 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 3/6] hw/nvme/ctrl: Pass buffers as 'void *' types
Date: Mon, 14 Feb 2022 09:07:58 +0100
Message-Id: <20220214080801.13627-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220214080801.13627-1-its@irrelevant.dk>
References: <20220214080801.13627-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Klaus Jensen <its@irrelevant.dk>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

These buffers can be anything, not an array of chars,
so use the 'void *' type for them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 10 +++++-----
 hw/nvme/nvme.h |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 12e1fcda7c85..4344405e5939 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1162,7 +1162,7 @@ static uint16_t nvme_tx_interleaved(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr,
     return NVME_SUCCESS;
 }
 
-static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr, uint32_t len,
+static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, void *ptr, uint32_t len,
                         NvmeTxDirection dir)
 {
     assert(sg->flags & NVME_SG_ALLOC);
@@ -1199,7 +1199,7 @@ static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr, uint32_t len,
     return NVME_SUCCESS;
 }
 
-static inline uint16_t nvme_c2h(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+static inline uint16_t nvme_c2h(NvmeCtrl *n, void *ptr, uint32_t len,
                                 NvmeRequest *req)
 {
     uint16_t status;
@@ -1212,7 +1212,7 @@ static inline uint16_t nvme_c2h(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
     return nvme_tx(n, &req->sg, ptr, len, NVME_TX_DIRECTION_FROM_DEVICE);
 }
 
-static inline uint16_t nvme_h2c(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+static inline uint16_t nvme_h2c(NvmeCtrl *n, void *ptr, uint32_t len,
                                 NvmeRequest *req)
 {
     uint16_t status;
@@ -1225,7 +1225,7 @@ static inline uint16_t nvme_h2c(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
     return nvme_tx(n, &req->sg, ptr, len, NVME_TX_DIRECTION_TO_DEVICE);
 }
 
-uint16_t nvme_bounce_data(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+uint16_t nvme_bounce_data(NvmeCtrl *n, void *ptr, uint32_t len,
                           NvmeTxDirection dir, NvmeRequest *req)
 {
     NvmeNamespace *ns = req->ns;
@@ -1241,7 +1241,7 @@ uint16_t nvme_bounce_data(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
     return nvme_tx(n, &req->sg, ptr, len, dir);
 }
 
-uint16_t nvme_bounce_mdata(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+uint16_t nvme_bounce_mdata(NvmeCtrl *n, void *ptr, uint32_t len,
                            NvmeTxDirection dir, NvmeRequest *req)
 {
     NvmeNamespace *ns = req->ns;
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 83ffabade4cf..38f3ebf7f6c0 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -495,9 +495,9 @@ static inline uint16_t nvme_cid(NvmeRequest *req)
 }
 
 void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns);
-uint16_t nvme_bounce_data(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+uint16_t nvme_bounce_data(NvmeCtrl *n, void *ptr, uint32_t len,
                           NvmeTxDirection dir, NvmeRequest *req);
-uint16_t nvme_bounce_mdata(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+uint16_t nvme_bounce_mdata(NvmeCtrl *n, void *ptr, uint32_t len,
                            NvmeTxDirection dir, NvmeRequest *req);
 void nvme_rw_complete_cb(void *opaque, int ret);
 uint16_t nvme_map_dptr(NvmeCtrl *n, NvmeSg *sg, size_t len,
-- 
2.35.1


