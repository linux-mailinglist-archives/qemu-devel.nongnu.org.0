Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAB153D29B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 22:06:40 +0200 (CEST)
Received: from localhost ([::1]:53332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxDZ9-0003lC-5G
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 16:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDNW-0006V2-Ab; Fri, 03 Jun 2022 15:54:38 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:48699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDNU-0008BR-Pz; Fri, 03 Jun 2022 15:54:38 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id DDAAA3200953;
 Fri,  3 Jun 2022 15:54:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 03 Jun 2022 15:54:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1654286073; x=
 1654372473; bh=Cd7INMBLuY9KTFyd/Zs/QQw6R9xcWyFf4pF78s2B6GU=; b=Z
 srASI7JUsE8tOBJNVVhc7GaEbh4TBuu0z4OFNtC43pT0IVssk1w9VoFDJYks+XTT
 Xd2mArlvW7X8NOVmf24vl+drUFW3a6nZXcyhp+KuApFVV3VvDTu0no6SMR8PId/3
 D9arDRmD447Ozoqb6y7aSCZaXkYfIznNG97kxd0UKKrCsFgDISAlZz/FiWws552d
 5L5/IQTd48muFL6pn00x/Yx+kdPL+Cc/CsTZnUZqAXoLA9s6zVc1v7H0WHV15voa
 yhl2tNqZs/Bp89xu068BebYvrh/QE0tzTBdCKeGCtpwF5iVZAMdtgtwqOzSgXkrf
 b3gUZHpWNr9u+ENjuzt2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1654286073; x=1654372473; bh=Cd7INMBLuY9KT
 Fyd/Zs/QQw6R9xcWyFf4pF78s2B6GU=; b=zZ6AlW3Xg3NM/TcSwV78QHSge3M/j
 kDQvtYqMo35mDLF+aMgwLatGzKJzV3/3YFjZ4cOVnXJIGCb1uup6/wRGe1ioUoQ7
 ZecJAVAJG/ULwgSfzA4C1mWE4+jqHAWhhVhnNCZxfrdp5fVVaeLoGNhnE+A/n1Sb
 T3zN5VUu05TTo81C6aOOzxftF+XbW78Q9oK75BcEzkOY+3b0BafC4OucTy04h59s
 2QWaA5L6aJ5mXUhzZed/+ED0MBozw6bawDJO7Bnjb/Knba124NqpLXxSzgCavm5X
 YCqUyfWW3AW3gWQENJqCEYlU7b91RKtxaKi7JT+qj91D6gNLB0nQTxFNQ==
X-ME-Sender: <xms:-WaaYlaXisCTUFKO7xQJZ4sy2WIdlqc6wSzLnOTO7iIW1jhHQRDfhA>
 <xme:-WaaYsbPN95jyK0uXoj76inkkjAMJTfWjn92R4u2icY2a8qtCOIHB5neoz2C98lf9
 r_erkarbEE0nQSqOfk>
X-ME-Received: <xmr:-WaaYn-zV_hVKx5zADWnOrwx-iDo2-v91VpZGTwBR-DMh0XIbW_w1MltJjWRQtVjoP5RscuaWLc0NyY9aAk8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleeigddugedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:-WaaYjrzkmgSm6V5n6G57tpGYv8htTNaLT-N6OzzlpEDolrLFTJfIA>
 <xmx:-WaaYgpw005r76D5NsfLMbvw0O5Cbxa-q40ZtQeVPGk0p_eB0Q_P2Q>
 <xmx:-WaaYpRMzvyAxxuA5LfcIGhFtveDzTmMtECbwi1XT8c2WqSrLtADFA>
 <xmx:-WaaYrBx6glb1UvilzLncJmGpVqH8_f5Pl-EYImBHflQoHpugZnRkA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 15:54:30 -0400 (EDT)
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
 Klaus Jensen <k.jensen@samsung.com>, Christoph Hellwig <hch@lst.de>
Subject: [PULL 07/11] hw/nvme: do not auto-generate uuid
Date: Fri,  3 Jun 2022 21:53:50 +0200
Message-Id: <20220603195354.705516-8-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603195354.705516-1-its@irrelevant.dk>
References: <20220603195354.705516-1-its@irrelevant.dk>
MIME-Version: 1.0
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

From: Klaus Jensen <k.jensen@samsung.com>

Do not default to generate an UUID for namespaces if it is not
explicitly specified.

This is a technically a breaking change in behavior. However, since the
UUID changes on every VM launch, it is not spec compliant and is of
little use since the UUID cannot be used reliably anyway and the
behavior prior to this patch must be considered buggy.

Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ns.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 06a04131f192..1b9c9d11567f 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -614,7 +614,7 @@ static Property nvme_ns_props[] = {
     DEFINE_PROP_BOOL("detached", NvmeNamespace, params.detached, false),
     DEFINE_PROP_BOOL("shared", NvmeNamespace, params.shared, true),
     DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
-    DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
+    DEFINE_PROP_UUID_NODEFAULT("uuid", NvmeNamespace, params.uuid),
     DEFINE_PROP_UINT64("eui64", NvmeNamespace, params.eui64, 0),
     DEFINE_PROP_UINT16("ms", NvmeNamespace, params.ms, 0),
     DEFINE_PROP_UINT8("mset", NvmeNamespace, params.mset, 0),
-- 
2.36.1


