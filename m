Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C8A330FB8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:41:52 +0100 (CET)
Received: from localhost ([::1]:46084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJG8t-0005zP-Es
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:41:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEwH-0003uy-GN; Mon, 08 Mar 2021 07:24:45 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:59205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEwF-0007Ec-V8; Mon, 08 Mar 2021 07:24:45 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 6943536DC;
 Mon,  8 Mar 2021 07:24:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:24:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Gcw/g+GsiTRXS
 NcHgsCWC8LWRvOT5TBhsmz4OdUQamE=; b=xhACST0B8//ZxI7/TdXikgVMnP9mZ
 Mx+Hm4znZRwpddmvCcUMwTYgh4t1T1GMeSF0YPOhPoODNJNsExi69YbMN7Fk4k0s
 83BTnEjKtCcrp010a396BGNF6xtostkqyvToGDmQbGeWKSenFhLTlNMZO3SX8vXk
 lrCDamWGG0fdtIqk35oex+2kDw3y2yNagxYAmm2NABVcl51smtJKYTAXJLa97T81
 sshsCd6nGkb0bNZoS56yrUQgvGV/Aycw7LTpy5m21VAiFUJqkVHeG/Eh8wmbdPrW
 67Tvv6Nf0IK2DY4hAQKUtx9o48sY5zjJLe9udoD9dDSM3IKJMLxFFXnxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Gcw/g+GsiTRXSNcHgsCWC8LWRvOT5TBhsmz4OdUQamE=; b=k367UFCa
 a30owsKzqLoGTghbf676H74T/83ayRJONqb2tRpGzEHoExEK6rzD/csBgVLSPgUZ
 /+l+vIJMbjVcbVVB/BDg/rl+3x8b3fXQy1IKXlkKD3uUJ9FgKWhsF6aQkQf22fVd
 j75ruuvrhkX9ra9BjGX2RMBq6MmQ+nNf3/65mdCKtfcVyOsgkDM8dSkyHtjA2/Ac
 1QYwNREJRSkkH5kticPsTJZIdn7QciH0bUhZ91VpdXWjdsgY1H2AmzPEpyTmfxsW
 klhJJxTHMiHVsixaPnwRx8ti0lRYszPtcY3a8QKua+83fSEaGgfndxkW99//41bg
 nw1hvztJa9Do1w==
X-ME-Sender: <xms:ZxdGYAuxUa-m7VGVjshJhuySN8QE7O-R_PkfCRPuheAbt_oai6upFw>
 <xme:ZxdGYLRRHKSICW-tJ9Z3q4EdvbXoJ41lDeDWQZM9SZ_-doKXyzghy2-dVzrosEEkU
 _mwJgmm0msL4hlT9QM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvje
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ZxdGYGO3p2g0XUISkwT3R-2cMuw89x8RmDFTI_iKb0fhUfztOKmncQ>
 <xmx:ZxdGYAZVBnYCn9FfpG5-YyCoTZWlTR5CjfiqSpaig8rokDJe8So1kg>
 <xmx:ZxdGYAyriA6UNVoTd7Qj-uW6rwomxyyf9b2oCiKavRJEFYFQ7-Ia0w>
 <xmx:aBdGYJdjhORwSir7TeFrPxiVQqKybsl4kpXy485YTm5Jbuy4ey3w3kcyrUA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 90A3C1080066;
 Mon,  8 Mar 2021 07:24:06 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 33/38] hw/block/nvme: fix allocated namespace list to 256
Date: Mon,  8 Mar 2021 13:23:08 +0100
Message-Id: <20210308122313.286938-34-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122313.286938-1-its@irrelevant.dk>
References: <20210308122313.286938-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Minwoo Im <minwoo.im.dev@gmail.com>

Expand allocated namespace list (subsys->namespaces) to have 256 entries
which is a value lager than at least NVME_MAX_NAMESPACES which is for
attached namespace list in a controller.

Allocated namespace list should at least larger than attached namespace
list.

	n->num_namespaces = NVME_MAX_NAMESPACES;

The above line will set the NN field by id->nn so that the subsystem
should also prepare at least this number of namespace list entries.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-subsys.h | 2 +-
 hw/block/nvme.h        | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
index 574774390c4c..8a0732b22316 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -14,7 +14,7 @@
     OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
 
 #define NVME_SUBSYS_MAX_CTRLS   32
-#define NVME_SUBSYS_MAX_NAMESPACES  32
+#define NVME_SUBSYS_MAX_NAMESPACES  256
 
 typedef struct NvmeCtrl NvmeCtrl;
 typedef struct NvmeNamespace NvmeNamespace;
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index cd8d40634411..85a7b5a14f4e 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -10,6 +10,12 @@
 #define NVME_DEFAULT_ZONE_SIZE   (128 * MiB)
 #define NVME_DEFAULT_MAX_ZA_SIZE (128 * KiB)
 
+/*
+ * Subsystem namespace list for allocated namespaces should be larger than
+ * attached namespace list in a controller.
+ */
+QEMU_BUILD_BUG_ON(NVME_MAX_NAMESPACES > NVME_SUBSYS_MAX_NAMESPACES);
+
 typedef struct NvmeParams {
     char     *serial;
     uint32_t num_queues; /* deprecated since 5.1 */
-- 
2.30.1


