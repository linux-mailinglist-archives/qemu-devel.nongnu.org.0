Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F75F53D294
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 22:03:20 +0200 (CEST)
Received: from localhost ([::1]:45174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxDVu-0006Yj-Pu
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 16:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDNN-0006A6-0v; Fri, 03 Jun 2022 15:54:30 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:37487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDNL-0008Ak-Dz; Fri, 03 Jun 2022 15:54:28 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 40A283200957;
 Fri,  3 Jun 2022 15:54:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 03 Jun 2022 15:54:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1654286063; x=
 1654372463; bh=twXrR4+kEWradYjllXM/BQhALki6oX/J6c6EC4q9/4c=; b=B
 gws57zIFxkqNiVMQHEKb1BZv+QcJZ0L7irEKgMOoyBweTFyU/3/pyZovfoPTm3lD
 69mxGoTVYrLtP1vFsowDX+v4y9hTbQpoEe7hgBOKoHWvKa5F+kk3M4xtGmdaFBoP
 sg2wFh0HUWEgkrFOqwaJZDmeMCiu7wtMXs9AG96Tov/e8XRVEYpkDPgm80BlJz2P
 m9lDBCtZ2aK2NpF0o/L33iNA+TYPP3HjPrXAnRmMO9Iz9N7SUhg1SBdXy4t0pq6l
 sHwSQ9BFr9FC8Hl7ayTAAEjKuMVZqWX5wAhbl51gJyJm8NPUbAkjOccB24BEvGfr
 kr8Cn1lqQrTBsUk9KIzLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1654286063; x=1654372463; bh=twXrR4+kEWrad
 YjllXM/BQhALki6oX/J6c6EC4q9/4c=; b=UoFmC/HPUKq5OGgB+407eiNYFtgD0
 CuXhxboBehQ/pTeoRXaEX0y38eyeaQKyE6CbV0HAYnPv348HJqGD3MXjCsyMrdrP
 JcMmzHFQUunvpki4CwZsHhrQorQE1zJfG3JjQhcpv+Cxyp3fcNpDY1APL1BNJ8XI
 WgUmA5SBMXeTPE3PZko6aNKFqgSmc4xVzQRCitkqTuWc6R2IyCsVKt4kaZVQTvID
 SDuQbxpr5z6egxbpegZ3gp5nQIPBERG+ZOdrGD002NgvIdcEEfdWa9XsTVhyUlOi
 n0hFcmY0xbxz8EsQ9HOsuU+tdx4x3htSUrlZTrP9ghefS/KyCJtK5UNig==
X-ME-Sender: <xms:72aaYtJtox_9UXkkTUwU0pe7Nrq63cs2hWPQymWipTg4gGTtFLoDzg>
 <xme:72aaYpKKzu6fYXHsYLNUFNK3pR3LsZkkn0AJWZnfPEywW6mh7ycRyAsFwydgNCqRY
 Gctv-MrQq4kl-wtGes>
X-ME-Received: <xmr:72aaYluEaJDbdVb7Gu0u11aCKHt3dP_fli1SH26kDo2PCkWCjCDe8h_optCL1W0TnAa1dmZkAk-aFsUOuzh->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleeigddugedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:72aaYuaIMZYInaApYD2Dov7iL4HqU0QfG2mpbnuwOH7glkW-OC9FVQ>
 <xmx:72aaYkayYViKzaeOnJgbubovkcMsNG_p7htEs02A00cebfxe9GeCGQ>
 <xmx:72aaYiBoMvXF08Bxd-zoZdLgSJ5aoyzpx5UBDgktrlKQr2EN1fYgmg>
 <xmx:72aaYqySb8Z6M-nkcvmemE7ZgrL0q2KT9vFNA7EYkxuk9E8TIw3DTw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 15:54:21 -0400 (EDT)
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
Subject: [PULL 05/11] hw/nvme: enforce common serial per subsystem
Date: Fri,  3 Jun 2022 21:53:48 +0200
Message-Id: <20220603195354.705516-6-its@irrelevant.dk>
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

The Identify Controller Serial Number (SN) is the serial number for the
NVM subsystem and must be the same across all controller in the NVM
subsystem.

Enforce this.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/nvme.h   | 1 +
 hw/nvme/subsys.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 677381932569..e41771604f59 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -48,6 +48,7 @@ typedef struct NvmeSubsystem {
     DeviceState parent_obj;
     NvmeBus     bus;
     uint8_t     subnqn[256];
+    char        *serial;
 
     NvmeCtrl      *ctrls[NVME_MAX_CONTROLLERS];
     NvmeNamespace *namespaces[NVME_MAX_NAMESPACES + 1];
diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index fb58d639504e..691a90d20947 100644
--- a/hw/nvme/subsys.c
+++ b/hw/nvme/subsys.c
@@ -27,6 +27,13 @@ int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
         return -1;
     }
 
+    if (!subsys->serial) {
+        subsys->serial = g_strdup(n->params.serial);
+    } else if (strcmp(subsys->serial, n->params.serial)) {
+        error_setg(errp, "invalid controller serial");
+        return -1;
+    }
+
     subsys->ctrls[cntlid] = n;
 
     for (nsid = 1; nsid < ARRAY_SIZE(subsys->namespaces); nsid++) {
-- 
2.36.1


