Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D58EC382850
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 11:29:48 +0200 (CEST)
Received: from localhost ([::1]:55036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liZZL-00040Z-Ox
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 05:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZO3-0003KY-TV; Mon, 17 May 2021 05:18:07 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:53207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZNx-0005lQ-TO; Mon, 17 May 2021 05:18:07 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id CE831250;
 Mon, 17 May 2021 05:17:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 17 May 2021 05:18:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=6L1kb0gYXdvfO
 3EJGF4b/9i9bG4hRwLVbSYaA0XKb4Q=; b=TeHuWRl72fhH2nMi8MBhBRCFknN4C
 QsRS3Dwv6LzjuQ8FX4hDl4/QBQkRBv63gEW1ZZmCSjDF5FdE29MBP+gxwoRHid2J
 ASq3nir1li0IhkoWIWak8gYVGzeZrJMRc/zpv/GwUmh8bFUo5NbP5FIqpm1UjnPz
 I66yxFRzn0+1eBkhvKzN6cZTdXVQtsFHHCpmjYzwOmGgbrh1T/tZ7fgOHwGlIlls
 LWB+5hV/mFYH0GUmWPq2cbSgYexijNGA9J4QisfXaSTIZYUozuto318wsVYrNSVt
 /z1Gl8HJRy+NUMKQhkqH36K7i7D+5geeSoCC/50hZ+mSqINZVSBQmxmow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=6L1kb0gYXdvfO3EJGF4b/9i9bG4hRwLVbSYaA0XKb4Q=; b=dfS+9yqs
 8/4V6DaWPR597W/COMGgweR09l+Fn9GHvrtnp5STZN+qmROpcyaozD7XwsD+RNIu
 sqHmDG0ORWZ6yHzSk/myMMmfPpw4uHBjjMYuffQVqUiDRVPRwDmFAPwDPeQy95Pn
 m8NQzdnALZCfscCPCWmSu+gIcG0Z7DMaFHOpUH2sldeHM2585KiV3sxMy2eEqP3k
 wCxejCRf9SsMuimXM3Cuh/NTYwZCZwEWvnVOjy7lFe+CjsaNmVwl1RM87XX+yqbX
 g1/nBS735xcIa3NjV//+L81+XPASXbV/SRkaZsQLDW3kvMxHBpq+o4RDEUKl8li5
 tlo8qmIHtxq5ww==
X-ME-Sender: <xms:xzSiYMWWht3yGU6I6dKyPdxhcuaTgeBjnpjmB-vgJRy0lWv5B0L7pw>
 <xme:xzSiYAlMVVn_9hNvvvipKLenKL0U8f3yCBzfn33XBJEine8xAFbY_lmkBgAzcZGjE
 D4hOMUc9Xm-9HtYkQs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeihedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:xzSiYAbOTYlFk_xJfCIjeJh6Ejf4knAX05Hcgy643lQJtpAFM6MZZA>
 <xmx:xzSiYLWIpcNmPkwUqDeHReB5hjT88GXQkCOQF1Wv7xKxqtLMd6UkCw>
 <xmx:xzSiYGmXbT_8hAq_3rkvWIfxQkJOMD4v3Wfh3w7TUMO3Wg5Ws5Q6rQ>
 <xmx:xzSiYA5ExEoDyT9uSXusCZHNaCZ1PJO-ZaxTcQUjSGdLDUEMCGSnCE7RhsI>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 05:17:57 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 05/20] hw/block/nvme: function formatting fix
Date: Mon, 17 May 2021 11:17:22 +0200
Message-Id: <20210517091737.841787-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517091737.841787-1-its@irrelevant.dk>
References: <20210517091737.841787-1-its@irrelevant.dk>
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

nvme_map_addr_pmr function arguments not aligned, fix that.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 14c24f9b0866..79a087a41ce8 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -576,7 +576,7 @@ static uint16_t nvme_map_addr_cmb(NvmeCtrl *n, QEMUIOVector *iov, hwaddr addr,
 }
 
 static uint16_t nvme_map_addr_pmr(NvmeCtrl *n, QEMUIOVector *iov, hwaddr addr,
-    size_t len)
+                                  size_t len)
 {
     if (!len) {
         return NVME_SUCCESS;
-- 
2.31.1


