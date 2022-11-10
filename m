Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD0E623C5C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 08:07:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot1d7-0003pH-4f; Thu, 10 Nov 2022 02:05:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ot1d4-0003mX-MU; Thu, 10 Nov 2022 02:05:38 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ot1d3-0007ng-0a; Thu, 10 Nov 2022 02:05:38 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 38DE55C01BF;
 Thu, 10 Nov 2022 02:05:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 10 Nov 2022 02:05:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1668063936; x=
 1668150336; bh=lIi2rlxIFNm5veKlUeKyLl6pPgOUP34LygI19juBMRU=; b=C
 gEZN7/Kczw9VgvJgzOdjFwqPMon8+NtELC7XskBrs7Xtoi43WfeBaz+ltrzA2Pkq
 BboaRlmzN404sy321hO+yE6+NR0EcJ8VnqHttIt0ISESxfrQGhwvrulAlpduEKiH
 I8Fuhk1jOmTDSdfaoNrBuYraHkvHw5Dmkj8Xm4esnjXYpTl6UXApchr0lPi0bj4d
 u2o+hLGCb/DiiBzAsRSY1FfgnnBPlwOqW7/+auUeoE8z95ekqRSj3Nm4eTyc1mg8
 JFqS4IVexusM5/qNsvNIhAo8HPq7FN9saBz2MgpRMZvVWyHJTfHVEANg9HwoyDjX
 DBEx3/GIW/CT4kXZkN1sA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1668063936; x=1668150336; bh=lIi2rlxIFNm5v
 eKlUeKyLl6pPgOUP34LygI19juBMRU=; b=tEpRm5lXjkKFIpmEXaAksaEHov5N0
 0ajydTZ9rS1h5Lon+dwDpT3JSJrkikoGvwFLrJ4RXvIl/8Zqm3jx9Yo/l+JQqwz9
 31bBLcoef1aG47hEPVCkKrBEWWJOPFoXQ487MDBS0dHs6G/x235+QCR4qisBidJI
 A4wc8F30/oBJojF8gCiFWrKuB5OR1000r+SEHi9Ds3VaJ+Y3zsnplaKurDE+8P7x
 +cyOBM3PZ42npgOHTgNi+J68faR8lKtzFLsdmid3ekuryQkuATQQ3u1DzbHrXlW+
 tI4HtC1uDOaj/ERE/Yk+KORXP+VrmDwDWPOKmJowI5xPWKgN+LM3HWRuQ==
X-ME-Sender: <xms:wKJsY0osCckCUp7d7fSp8DRdzVt1Y92i0GyLoOcoI0Q7aECtfSFAqQ>
 <xme:wKJsY6pz4B4JjKbCt9i2jOt7QvL4vWQF9AkaR_tm7bZ3vuuPho-WT4zc8hhafZxSt
 b6qUvzppieg-Mv9Z9M>
X-ME-Received: <xmr:wKJsY5NTlNGw9tX_s5RhgtIHw2WK6rW2fHlTzfgSm__feu6e6JoNr8n4-qK7bZkLECJV8xGDibliL5jsy5w_7xnVtEk-Q-gsNS0opA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeefgddutdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:wKJsY74TpUmnzilPAyxCZd3yXIVSlHZpnCedxm_C5w2c4_BWz5DAGg>
 <xmx:wKJsYz7gcd5gZwP1-gf0sruyA7HgVx-mCWDQK4jNISf1fSpsBe-XYA>
 <xmx:wKJsY7jKAgRxor7SDLQdkI_CIIkIAvlut3o8DEE8gqDoK7k6F_-Zrw>
 <xmx:wKJsY1nPhLrcu4zC4WxMYHgm9LfsYxK5a30cPc6acmF9YGgQ-88vsQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 02:05:34 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH for-7.2 v2 6/6] hw/nvme: fix numzrwa handling
Date: Thu, 10 Nov 2022 08:05:23 +0100
Message-Id: <20221110070523.36290-7-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110070523.36290-1-its@irrelevant.dk>
References: <20221110070523.36290-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083; i=k.jensen@samsung.com;
 h=from:subject; bh=VqS4AN8VMNaJmboaDyO3t8DRKwpW38vAxFoaJjbBQxk=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGNsorPmfMppj8m/gC96bxKv7kJcVvilAtWjsuyU
 AsYAXoZZzYkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjbKKzAAoJEE3hrzFtTw3prv
 kH/2jyIUcLnaTddEbMi667QFz15OC1Pfempw8QoavnIRPoDkSoUnMi5AISf0/Cizs3kkJkFKUgWS1O
 v/u0cVnB/wvtZxx6639C0pN2z/4CDMFuVujjLPKEb0+LpsR13yCt4EoT0+0/cWs+oMa5LUgdmnrpO1
 K/wZhiBcqKuaG4QZnY83eynpnAlMe/apUNwLC8t8KN8Z03AumB76dws2+yEsjQxtBAsJogF2cOKAbY
 DqJIl2MLS4sjfMZSD8qMvZB7JrguUAER1ztjchCYUpJZSJP871C+tnEL2ECaUvsg0g8s6a2lQrzzLU
 YWXOTfGJ3bVVVkuuZpnjVT/AcHSPAkavCqCK1g
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Number of ZRWA Resources should be initialized to Max Active Resources,
and not the total number of zones.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 8 ++------
 hw/nvme/ns.c   | 4 ++--
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 6f217c3951bd..b47289ecf16a 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1778,9 +1778,7 @@ static uint16_t nvme_zrm_finish(NvmeNamespace *ns, NvmeZone *zone)
 
         if (zone->d.za & NVME_ZA_ZRWA_VALID) {
             zone->d.za &= ~NVME_ZA_ZRWA_VALID;
-            if (ns->params.numzrwa) {
-                ns->zns.numzrwa++;
-            }
+            ns->zns.numzrwa++;
         }
 
         /* fallthrough */
@@ -1820,9 +1818,7 @@ static uint16_t nvme_zrm_reset(NvmeNamespace *ns, NvmeZone *zone)
         nvme_aor_dec_active(ns);
 
         if (zone->d.za & NVME_ZA_ZRWA_VALID) {
-            if (ns->params.numzrwa) {
-                ns->zns.numzrwa++;
-            }
+            ns->zns.numzrwa++;
         }
 
         /* fallthrough */
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 62a1f97be010..6beeacca94ea 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -286,7 +286,7 @@ static void nvme_ns_init_zoned(NvmeNamespace *ns)
 
     if (ns->params.zrwas) {
         ns->zns.numzrwa = ns->params.numzrwa ?
-            ns->params.numzrwa : ns->num_zones;
+            ns->params.numzrwa : ns->params.max_active_zones;
 
         ns->zns.zrwas = ns->params.zrwas >> ns->lbaf.ds;
         ns->zns.zrwafg = ns->params.zrwafg >> ns->lbaf.ds;
@@ -294,7 +294,7 @@ static void nvme_ns_init_zoned(NvmeNamespace *ns)
         id_ns_z->ozcs |= NVME_ID_NS_ZONED_OZCS_ZRWASUP;
         id_ns_z->zrwacap = NVME_ID_NS_ZONED_ZRWACAP_EXPFLUSHSUP;
 
-        id_ns_z->numzrwa = cpu_to_le32(ns->params.numzrwa);
+        id_ns_z->numzrwa = cpu_to_le32(ns->zns.numzrwa - 1);
         id_ns_z->zrwas = cpu_to_le16(ns->zns.zrwas);
         id_ns_z->zrwafg = cpu_to_le16(ns->zns.zrwafg);
     }
-- 
2.38.1


