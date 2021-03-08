Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244A1330EB1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 13:52:31 +0100 (CET)
Received: from localhost ([::1]:46796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFN8-0001q4-2R
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 07:52:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvU-0003Q7-0N; Mon, 08 Mar 2021 07:23:56 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:32891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvP-00072K-P3; Mon, 08 Mar 2021 07:23:55 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 040A3FDB;
 Mon,  8 Mar 2021 07:23:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:23:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ybdQTlPIH05zX
 QGY8Sm/wtWArTqiArT3S1Le07QE56Q=; b=HNO0EKhLHsyH7GuCwuODGqOUJWh7p
 G4mfz9ti+DTRmby4xiiPJD9JnD8x5R9l/w7Dgj5ebYfGo7Vt3Dc5P4ciQCcxO3W9
 7u5xCceQcuwXAAPAtl8Evd5XyUL80fYm1lrxe52hSSQmqb3mSleexpT3OuzdEqk0
 XcWPdV6wXoo16IEh1R3YJqPCzXXHXH8I0dXNuI9lqxah2pQ3l34nz5fRQM9bWM0m
 9RqtI97eCiQCCUrymJ2Yhp42K/hLKzith8lb1QAntyV+8ukbhlv68SIdlap85E7C
 Pssb1KUx65NimGkKiPd0pPuzJOPIWjCa8bh8jGvlOR5q2vqJoLzEUrFxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ybdQTlPIH05zXQGY8Sm/wtWArTqiArT3S1Le07QE56Q=; b=PDeVbpAz
 +YwYM8/Qcz5XWvBPfSW83zmW7lSRU4VHOlb+N5yzp5Z9MC+F9DvamN5GOB3Lzk3C
 wp6XVsR3GHL8IK7OcsEjpT5OIRVujQqywakn1P9RvYnzNzOelsR2uFxDk50gP1U1
 1cSCweyhy7cuXSemuYr7//1Xb9HThCGezILI2kZaFyqV60ZvXdY9jOqdK1IicWKz
 t/rTTs04PUBfpSDjh41GBVXz3H066qfoFoGPgMCG8oI94HtfDXr0iSfe6b2Uvis8
 6/5oX4AU3BW0Ox+WhYrvrytHKAmViYvUhKjD2HSzGQnaLtFiuKSoF3hLB1exGFx+
 Mru7CTjT6ZT6bg==
X-ME-Sender: <xms:UxdGYAeYuNl4M5hNbRQpZD29xA1mYX9TQrAlF2BvndRSLAaFThcaBw>
 <xme:UxdGYCMhmQxqIFWLUdiBw17zIVX1hPsqrcgtgubKzBzyKquG9vxxwcbXCt_nMaQ2e
 0DvwUUrMhWLUNunVFc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeduie
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:UxdGYBjmnM66ySD4phSZE_Q5fwceP27Z9zjjmex0jIulBeASLNf1RQ>
 <xmx:UxdGYF_0iiIwpsWcZ8Mw5sL9D4ebT7FQ-5X396g4jG5S20c7rK7nLw>
 <xmx:UxdGYMsqj3IvQ1SaPmMpoRY1kBSSqtzl4_Wd4Apn7ppxF51FiSpqQQ>
 <xmx:UxdGYOLqUVO0fScpDhtoGcRSDxAraaEE68Wckk5GVH4iFixD85dS0oLZ91Y>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 076E21080059;
 Mon,  8 Mar 2021 07:23:45 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 20/38] hw/block/nvme: remove unnecessary endian conversion
Date: Mon,  8 Mar 2021 13:22:55 +0100
Message-Id: <20210308122313.286938-21-its@irrelevant.dk>
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Remove an unnecessary le_to_cpu conversion in Identify.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 01be8a1620be..ba07e6deef5f 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3413,7 +3413,7 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
 
-    switch (le32_to_cpu(c->cns)) {
+    switch (c->cns) {
     case NVME_ID_CNS_NS:
          /* fall through */
     case NVME_ID_CNS_NS_PRESENT:
-- 
2.30.1


