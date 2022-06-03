Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 613EE53D28A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 21:57:47 +0200 (CEST)
Received: from localhost ([::1]:36764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxDQY-0000jf-G8
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 15:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDN3-0005nv-Gw; Fri, 03 Jun 2022 15:54:09 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:39513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDN2-00087h-0G; Fri, 03 Jun 2022 15:54:09 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 18E113200956;
 Fri,  3 Jun 2022 15:54:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 03 Jun 2022 15:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1654286044; x=
 1654372444; bh=QBBj2njkfYxOiPtM3wOafH9doUoU2v/0tk/PMzEf2+I=; b=C
 58zTJBrNktlq/VBpSj60Ml/L3IJcUzVauipMv79LdTfTU79/QJgHFm6uH/Sc0EI2
 HXom/Scg2U1zBhJfDRCV/bbnDWaaHHVZchpsdwt1Xzdn1fp9OQf9cyKrJX50piBa
 fdhzS/nhwhSTiKyfxoL1AS1Urt8IKLzMI9b9Kp+/pqqId6kJ+lw2jB4McuvRcO1k
 Cej95d78wziHt5AMMD25rwPBVaxaRn/3KtsuChId/5mLTurobnxZTkGncp9aXLft
 ReyzHq2iZh1tLGKGsu+Ai7RCUsg4fWkknES4/gnSFOsPYLsJ1spp0Ho0gVtL0ACQ
 By0Ep3VV2ZrmY0ZIGGzIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1654286044; x=1654372444; bh=QBBj2njkfYxOi
 PtM3wOafH9doUoU2v/0tk/PMzEf2+I=; b=sfkBeOEQ+fMjcC6CkOqev5E+zUqhr
 8HtyXST8Q/vQKA95tJJ5dA+yG3lzPEAj+8PBKInPo7u/0fsCtHIGhFMH/Dp/LwL1
 GhG4khlbuk20J3Aw9C6szNoNussA3fpz3wk8CtXV35qvDN0MV0MyWkqm5rO78LwB
 6UGoWOycE3EhF5H65Zi7SLlDfe9tNb3qzycx6uuWRnc0TbsR0G6VuikklMbsZOlL
 AJUJziRYsPo5DByjsH1Be6mahcZKW8es8SNqyzkyPuorl8/p+QyxOSiSv4T/Emmd
 DLkcEe4FJvf/+JL3w2VI4ZuXhxcNsO9d91xR9l4WAp9F4D5Ub9P4d6IaA==
X-ME-Sender: <xms:3GaaYhGPWiQTaVJrdNc1UHM4vNiWwoRyVROdggPDXabLHvNIuMAnpQ>
 <xme:3GaaYmVMusAm00l-I9Si7XRj_VOnoF6Mxyd5JB2KdWr12RPhfBg_44whQvqLeBabs
 E-d5KqDnd37TRFGbao>
X-ME-Received: <xmr:3GaaYjKdcWoozh9RI2r1m7xEzcs670puBiLTipFpUYXnEyXyTJMocsUziJTUs__FkE9QYpZ7fZuN3-hIDQ0N>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleeigddugedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:3GaaYnFGlvAx27qcghWTiYn5umsrAGrB5btE8gXlGdBsvJYuh89CcQ>
 <xmx:3GaaYnVItZ2T93F4k9kJ-xDL6ENhV-Ub5Eza8vw6GwZDmnpjxrTt8A>
 <xmx:3GaaYiOUC8j67bEgagzvqxWt9ZYFJDI_XgJgEQT4hmdsfoRFdJ_B0A>
 <xmx:3GaaYovCxpTSfwQtyGkBVnQzYYXMx9yj-NkpQqgtTaWOzgVUaUerLw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 15:54:02 -0400 (EDT)
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
 Dmitry Tikhov <ddtikhov@gmail.com>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 01/11] hw/nvme: fix narrowing conversion
Date: Fri,  3 Jun 2022 21:53:44 +0200
Message-Id: <20220603195354.705516-2-its@irrelevant.dk>
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

From: Dmitry Tikhov <ddtikhov@gmail.com>

Since nlbas is of type int, it does not work with large namespace size
values, e.g., 9 TB size of file backing namespace and 8 byte metadata
with 4096 bytes lbasz gives negative nlbas value, which is later
promoted to negative int64_t type value and results in negative
ns->moff which breaks namespace

Signed-off-by: Dmitry Tikhov <ddtikhov@gmail.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ns.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 324f53ea0cd1..af6504fad2d8 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -29,7 +29,8 @@ void nvme_ns_init_format(NvmeNamespace *ns)
 {
     NvmeIdNs *id_ns = &ns->id_ns;
     BlockDriverInfo bdi;
-    int npdg, nlbas, ret;
+    int npdg, ret;
+    int64_t nlbas;
 
     ns->lbaf = id_ns->lbaf[NVME_ID_NS_FLBAS_INDEX(id_ns->flbas)];
     ns->lbasz = 1 << ns->lbaf.ds;
@@ -42,7 +43,7 @@ void nvme_ns_init_format(NvmeNamespace *ns)
     id_ns->ncap = id_ns->nsze;
     id_ns->nuse = id_ns->ncap;
 
-    ns->moff = (int64_t)nlbas << ns->lbaf.ds;
+    ns->moff = nlbas << ns->lbaf.ds;
 
     npdg = ns->blkconf.discard_granularity / ns->lbasz;
 
-- 
2.36.1


