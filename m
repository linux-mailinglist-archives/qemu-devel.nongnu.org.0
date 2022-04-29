Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524035144D6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 10:50:46 +0200 (CEST)
Received: from localhost ([::1]:58788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkMKq-0007VA-TS
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 04:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nkM4U-0000Rt-Pt; Fri, 29 Apr 2022 04:33:50 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:36799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nkM4S-00059s-Bz; Fri, 29 Apr 2022 04:33:50 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7D6A85C0187;
 Fri, 29 Apr 2022 04:33:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 29 Apr 2022 04:33:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1651221227; x=
 1651307627; bh=IUnmQk2ZcnOUJLjs6iqtBhsaTbqcje3lEORpS3f3peM=; b=n
 Slj0t+3R9rxyA5YiUOusOXGuumtJqErpZL46Q4MUGWs2QaFoJgRhRIU2Y5BxZlug
 koprtSJ/TyvXW0ZpulfoZExyrogdAmho0XSyXvZ+oZTNTgsoweRV9+/9QAcuNrnI
 f/GShxAzHaqhkStgSdib4/hWYQXHbQ1lCZUr62UtsnEAcWdnxhnfeyRRzhOXn0Lb
 704E6w4fr/Lr7kc88PQcoZzEk15fYD/4+R2Hg03CcXytz8hjU+hws54IrtLcfTCY
 zJ2ES41X3Rg2YdpsEd87h5Q1yhx/P7AixeWXQFbXu3CLNuEVNuHg0SEriWc7Kbgf
 oag1Xo+UQujUlRIKB0YcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651221227; x=1651307627; bh=IUnmQk2ZcnOUJLjs6iqtBhsaTbqcje3lEOR
 pS3f3peM=; b=lVfg68CWXUiiDlJF6z0eh3LWB933egEIUQ/Kc0jRWOaqSh9JZpZ
 PnNjRl4vjyC3OLsrUrAb8wl2wRawAE3lPDCHmGNYhVuuBiWhXSnbUxsAszgJHfq/
 KQCYO5S0YP33KUmqdBbWn2wRAQDXFgmS3rSh1Ns4wUL+dYMvioJnx3pMuS0Q5gmp
 Je+ZRFDrg6cYSyVfjU9uPdv8V+FpaC5I/2F7BFhn78G94cpZXZBtFcrzRpmG+oCF
 Zza58igWtbfoe17yZ8SZE/J2UsEkbOkZ4UEbbehF8N4ACKNJ0BU3ryHutkQ3vPSB
 K+KW6UR/HsOJLjYdPBTduMJ6Rrads0YxZrA==
X-ME-Sender: <xms:66JrYhtNEDEHwgkNImfpK-rsSVj_GbVOBL802zOZ_o-g3ihivhZbEg>
 <xme:66JrYqcyEVD7tWMon_2hX0xLGDh7smORrIlGuVpJCc4pFRR_8OKFLp6jwOj7nr_1H
 qe0BzWMIjB5YWpg_RM>
X-ME-Received: <xmr:66JrYkzzKAbFnmCuyoeKdhuMuG7BXKRqQY2-VXzLOecqKt6QCDq4XYuzjdxs7xbT8ID_dKNkI-V6yJgtx82u>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudelgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedujedu
 geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:66JrYoNL-eCCRS9M5-w6QL_iOcRGOZxRKvH5OLEP271_2oATN8DtTw>
 <xmx:66JrYh-dBDe93YAhtsfYR0aPpgkMhveLk-QwfrLBa5XLE0WV2cPZ2A>
 <xmx:66JrYoVcm83zFE7YPAHaJbYaGgijtJ_tkx-IZsx2pOwkWPX7YINr-A>
 <xmx:66JrYgZTVIa_LVUBkZeiYzyF6_j7fLPhsWA8PLacj1CxdGXOWcBFcA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Apr 2022 04:33:45 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/5] hw/nvme: do not auto-generate uuid
Date: Fri, 29 Apr 2022 10:33:34 +0200
Message-Id: <20220429083336.2201286-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429083336.2201286-1-its@irrelevant.dk>
References: <20220429083336.2201286-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Keith Busch <kbusch@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Christoph Hellwig <hch@lst.de>
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
2.35.1


