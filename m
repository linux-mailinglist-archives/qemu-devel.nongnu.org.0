Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 733513324BF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:10:02 +0100 (CET)
Received: from localhost ([::1]:60554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbBF-0006Yf-FD
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:09:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJanz-0008OZ-E0; Tue, 09 Mar 2021 06:45:39 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:52073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJanx-0000Jd-G8; Tue, 09 Mar 2021 06:45:39 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 35FE12711;
 Tue,  9 Mar 2021 06:45:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:45:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=RBzvJrr8fa3LF
 kTLuZP2K9V1LWoxzVtfWByZdu/YYZM=; b=LsghLgyGhawImL/IaxaITmxL+zdOz
 Pmfu210SO7dVHOiMsavCLCZEKuswm1RDi6+AiLa5PPNtjS/lDoc4wCZaG2agWf/+
 /1BiNb1BsVeOMizdyX9eA1XHH4hc/Cd9dGmTakvBjSmxKs5Sb/PMtIiPZ4Pv/+4c
 70a8hg2LnXAsB/zFxpwAUi68fXWOZMbt81+mIZWGPW13USoWpzBEwTYktm3xpqTe
 Wp1lZ7nvO4JWShdk7I9RMsQ7/BsJUX1rkPUTe6pUpUaUgnga3yYtVvaoJcnTCB1Q
 mtVGOXIfLoOhlW+mfK72Y6ztMLAndEAjTaMIs559WtmVmM+oaGqP9lt4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=RBzvJrr8fa3LFkTLuZP2K9V1LWoxzVtfWByZdu/YYZM=; b=NtDsBJho
 Zrr3RZAloyVEah0F6/VSNFHB9GLNmJXElud2XrHMoHdtagLnUhN9BqW1Q5jzaVbS
 qEcH2zuns3JeB5NMt2lgJYF84nFnjGIiZVTO1SO2vNaMSymA46eL6R6mb3I2cbhm
 aJcQkv/pXTV1++WWf3o7eTEP1hVtyAkPIGqHZAwb8n9+BROYl4VWJ9h5ku/tx4Wj
 n8pWC98Gd+h9j0zyG5TvjwWGWseavQdrTTifuxp4fhAtbgPQ4plCArEEsrqz66en
 rfd4iekcQrk0ZTVdcb+PQGKd4bZCP0acvmOpKfW/8H5oRY61EW1K04fGVc1kzcm4
 bJVuDotHMeQHeg==
X-ME-Sender: <xms:3l9HYAEUBqQg7-qnh_JUFCxWkkYs8r-vPR7jC4TPzmI4IUSV2huPXw>
 <xme:3l9HYJWGceP1-hab2jiDsk6C9tPHBDJuZY1mmr3pZgqkwaBiCzC_azbbfNcFbeOiM
 WMT6rax_fLIID641-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeelne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:3l9HYKKD_BQashipVWHFonkieUXQzmGqeY0MgUJq7OhYnTxUbCpxmw>
 <xmx:3l9HYCEEA-g7OxHSOxW7SS-GbjzP8V0uz1VdiZC1pWNT6WNELhm8nA>
 <xmx:3l9HYGUsricZi2Gg1GbzleNUlqMQbKspq8zjtUKsEJ2k8JPnfZFqZQ>
 <xmx:3l9HYKqYO-qj18Czd6QPM4L8ZeIR_o69OwtceENiDlytufuwY7eMTR774fo>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3FD24240054;
 Tue,  9 Mar 2021 06:45:33 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 12/38] hw/block/nvme: fix Close Zone
Date: Tue,  9 Mar 2021 12:44:46 +0100
Message-Id: <20210309114512.536489-13-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309114512.536489-1-its@irrelevant.dk>
References: <20210309114512.536489-1-its@irrelevant.dk>
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
 qemu-block@nongnu.org, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dmitry Fomichev <dmitry.fomichev@wdc.com>

Implicitly and Explicitly Open zones can be closed by Close Zone
management function. This got broken by a recent commit ("hw/block/nvme:
refactor zone resource management") and now such commands fail with
Invalid Zone State Transition status.

Modify nvm_zrm_close() function to make Close Zone work correctly.

Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index ab4723ff319a..56ef07b74d27 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1319,14 +1319,13 @@ static uint16_t nvme_zrm_finish(NvmeNamespace *ns, NvmeZone *zone)
 static uint16_t nvme_zrm_close(NvmeNamespace *ns, NvmeZone *zone)
 {
     switch (nvme_get_zone_state(zone)) {
-    case NVME_ZONE_STATE_CLOSED:
-        return NVME_SUCCESS;
-
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
         nvme_aor_dec_open(ns);
         nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_CLOSED);
         /* fall through */
+    case NVME_ZONE_STATE_CLOSED:
+        return NVME_SUCCESS;
 
     default:
         return NVME_ZONE_INVAL_TRANSITION;
-- 
2.30.1


