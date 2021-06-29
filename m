Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC1A3B780C
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 20:54:07 +0200 (CEST)
Received: from localhost ([::1]:42814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyIs2-0004hn-G3
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 14:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyIm6-00010m-J6; Tue, 29 Jun 2021 14:47:58 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:58081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyIm3-0005Ar-0G; Tue, 29 Jun 2021 14:47:58 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 7BDAF2B00A62;
 Tue, 29 Jun 2021 14:47:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 29 Jun 2021 14:47:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=DW+ph+y1RzB4w
 wyBvzo//f0iFMeM1exhdvDFCYgKCG0=; b=G+UXRFTNiuNvlj5Ye1X4bE7r1jstM
 wJwmZCmLounjtrhnsmaubIiwegJbjNQ0RIy1kG4w9Et5UZDxlgX9GRzpqP4D++4S
 ylXUNPOAUuWQ51sJyeFydCFyCRYwATB3I8p50rbly3KD97yXWnG6dyWS1FYhCvWQ
 W9FMXEuXDm9BStgnqtdaNNfxf3SvZK/DlZ44ovCi1T/iGZIa5TDqTKwLlNV9iRhJ
 YjzRwPKXPnoCB02YQXAtvbkBBkLjcGlx1+8zO6uPdaMhNjFsvezSCj4ujOp+YexG
 s9ulAbBzeEk5hFZJCVSekbnHLt5JYx1yQBJlssXiHrKGc+YFU7YLToY2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=DW+ph+y1RzB4wwyBvzo//f0iFMeM1exhdvDFCYgKCG0=; b=wpntxjZ9
 9Hjv7W0YbxkoHYnkR+yoxesPSElhT2t2khJ7ZiPUX6+wXt1qzpX9m1vxNct68ayo
 tZnGPLru2R8CkWvE7q9HCFMZpxK2vYLFs8YfIYTEpKID9JnYlXUAPfEVsw+bDqMk
 1I+GkBZGJ4k8yPSii+dqoimz4GBrKndgYComtsBFNzMNFV2mRY5BAqaYv3fsI/IB
 YyjC2jyF7MvhPSVu2Wv30mjbo/S7PBTDEuwcYJYi/WIiNMfGUeiBvnjFOFstZPe9
 Bdmh7PkjmsfJDxkzzdflBWnWRYs4E2G6F10TSy3sD4yvej/fg4z2qxytCOg/OOCt
 Su2B0pMg/kJ7iQ==
X-ME-Sender: <xms:1mrbYK3tC3PZLZdryGAkQsUDfOD8jc6KxC35IYJCanNMFSZ6n1UJBg>
 <xme:1mrbYNG8Dx2LHXIcbDJ4yVtG2KBUcM_An5o9XsrsSI93qOBzJ2pVeTOWrcypLBkYo
 0mI20QePeW-VvwPPlU>
X-ME-Received: <xmr:1mrbYC6DY8ktxWKB65QrgNzNr1m-8huLFm6pX2tTZL9bhSI9Rb1S8njd6s4jp1fefmJ5Xgx0yP-hXWqugRYiwsnWavQaPDNVSyD6w18wwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:1mrbYL2ahT7sh_fUZ90PsAwz2GMfWha2xBYnhuPoC-rFYbzevMgdUA>
 <xmx:1mrbYNF0aHC2a6E69XIOrp_UEpOkrVDMJPpSgImksCwsXSPgGs03Kg>
 <xmx:1mrbYE8fACXcnRRiwoQPQX3yI0We9bF3dx1koMKuqusB_hsb_3OCKA>
 <xmx:12rbYM-jqHPYl-SFwQMyZNlxIR7uAJlL-DTK9VDFxwZY49lhnxZphlJUmP8>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 14:47:49 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 01/23] hw/nvme: fix style
Date: Tue, 29 Jun 2021 20:47:21 +0200
Message-Id: <20210629184743.230173-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629184743.230173-1-its@irrelevant.dk>
References: <20210629184743.230173-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Identify command related functions style fix.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 0bcaf7192f99..40a7efcea914 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4291,7 +4291,7 @@ static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *req)
 }
 
 static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
-        bool active)
+                                     bool active)
 {
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
@@ -4326,7 +4326,7 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
 }
 
 static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req,
-        bool active)
+                                     bool active)
 {
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
@@ -4373,7 +4373,7 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req,
 }
 
 static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req,
-        bool active)
+                                         bool active)
 {
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
-- 
2.32.0


