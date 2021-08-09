Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0363E442B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 12:48:23 +0200 (CEST)
Received: from localhost ([::1]:37434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD2pR-0004ww-Kx
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 06:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mD2kq-0002CC-SO; Mon, 09 Aug 2021 06:43:37 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:54771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mD2kn-0007ZJ-7N; Mon, 09 Aug 2021 06:43:36 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5A2035C00F4;
 Mon,  9 Aug 2021 06:43:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 09 Aug 2021 06:43:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=pqglz+B5fVsRQ/jkv6/+7dhP8a
 WS20/MPoxN9gMehGM=; b=C28zAtXbHYqvt+e/C4Ug/qdV4z7HUnt9VH0aSOpGAV
 OoqUWyJdVRi3r1yXs0OgBjn6pHBcbFevZd69aII3qvXjSB9UYiSUipPOs/AfZ2di
 quq8n4tiHYtMhvRAXbH5n+t0RseZJiEtLS34v3L6M+/s8V/1hDR8hCJquLZaGXMt
 ErSGr0yz+G3z2iJIhyW8EVqxOVECXshB1RUz2bibDaJwzXwiNS3TsTS8R9y5clr6
 II9cYYnuoIC/ohLuPZsWZQbJTJ+LyDidc1qU4yL24Gc5L7br013QIjRhibqTKNQZ
 zL4lLVCTPyjeEhMXIuntsyU2Rmzlb5xQeF8fWzBcDcKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=pqglz+B5fVsRQ/jkv
 6/+7dhP8aWS20/MPoxN9gMehGM=; b=ZodEh1NpnLfSRwHkAK0ExHctY0gKp6Kth
 0qsaXajrX/pUI0d7O7J7IlLM36Z4c598fjz+onMYzP0Q0Vj6yzbCn4zYffelOTwI
 Rcn+RsbVa7KlBH14X1Cc1m3kwQKa3h7zM38IEnhNHmUp2/xWC2EOAz/g12EEIi8T
 qsH9Q19ffZwQ5ZA9915S8J8PUCl1cTvgUvXFnzzhPJTtFxRX2bZ3vci+MhC4OqE1
 /dUetsTOE8mILRi0BO3MMos7y7ELQjcPL6mQ3i0CkdNA0aWLCHS2UzseRdoRODTe
 I05G9GRhuOOYkzp6egp/TOWrw7aoQ8IXrfArO+D59C5+576iKEX7A==
X-ME-Sender: <xms:zwYRYcpJWPBNw2JhzPIEwm-cVlp--t1dB09-CsItcXSeIPPgmldAYQ>
 <xme:zwYRYSoDESJju9osoKUxLp2Mf736SJQP6tcgNzofbu4jnoqVtcBHyaSx8JlIbtSCN
 Tay_4g_hlpaWfUKoAc>
X-ME-Received: <xmr:zwYRYRNtLhgjYmZk32vuRfqy6iPYtJ1Z-161RBzin1oB0y-yqXxtEVYWYrGMOiHHSiH16d5FFkOvYkGjXbVF2WIhfODwNLlBsCXM1svO9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjeejgdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepmfhlrghushculfgv
 nhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvghrnh
 epfeevledvieekudeuffetgeegfeehvdffffejueeuleduhedvgeejveejhfdtteehnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtshesih
 hrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:zwYRYT7vKk6vQtqOb9FDm7V_Rs5bdrR1xXmtMjiz5cBpyduvmmqo_w>
 <xmx:zwYRYb5VpWh7sCg3yIOFBVuPKGmK9UhvQ7zxLxU7tjs7oXxIDtDYKg>
 <xmx:zwYRYTjSfGl9eTkB5lcnXI9CTaa0Q5-xY94OlW0tcZw2KqHDSYsWaQ>
 <xmx:0QYRYe2_rDWCmb1t3yPt2FfLfnueFSIt8EIRpZLr_ve0M1tPTT55pQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Aug 2021 06:43:26 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/nvme: fix missing variable initializers
Date: Mon,  9 Aug 2021 12:43:24 +0200
Message-Id: <20210809104324.49434-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Coverity found that 'uuid', 'csi' and 'eui64' are uninitialized. While
we set most of the fields, we do not explicitly set the rsvd2 field in
the NvmeIdNsDescr header.

Fix this by explicitly zero-initializing the variables.

Reported-by: Coverity (CID 1458835, 1459295 and 1459580)
Fixes: 6870cfb8140d ("hw/nvme: namespace parameter for EUI-64")
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 43dfaeac9f54..6baf9e0420d5 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4663,15 +4663,15 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
     struct {
         NvmeIdNsDescr hdr;
         uint8_t v[NVME_NIDL_UUID];
-    } QEMU_PACKED uuid;
+    } QEMU_PACKED uuid = {};
     struct {
         NvmeIdNsDescr hdr;
         uint64_t v;
-    } QEMU_PACKED eui64;
+    } QEMU_PACKED eui64 = {};
     struct {
         NvmeIdNsDescr hdr;
         uint8_t v;
-    } QEMU_PACKED csi;
+    } QEMU_PACKED csi = {};
 
     trace_pci_nvme_identify_ns_descr_list(nsid);
 
-- 
2.32.0


