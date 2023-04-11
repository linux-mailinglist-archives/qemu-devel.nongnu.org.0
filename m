Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E50D96DE476
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 21:06:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmJIc-0005G0-6s; Tue, 11 Apr 2023 15:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pmJIX-0005D6-OM; Tue, 11 Apr 2023 15:04:57 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pmJIW-0006yI-7x; Tue, 11 Apr 2023 15:04:57 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 5CD5B5C00CB;
 Tue, 11 Apr 2023 15:04:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 11 Apr 2023 15:04:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1681239895; x=
 1681326295; bh=aMix3scYUqGc4zr+bKvg2cWR/anAOTqshN6fswmSMk8=; b=g
 Kgt979VtcJ04pdhky1u8DadQlWWGf16H81BeIxAxGvJvDEZxUd6dXamZ18sAHqP9
 Cgd7ryycy/mq98wXsytwLNgeII9XF1fAU5NwOBlaQElDoEic7wr3Vt9YxIi7pPF5
 EHulapM61GVJtEGVO7K3dX02nhaT3fpHOi4vl4VyegH60/8ATFxdnH+QlSWJN5Gq
 P52VjyXTA2TmjVp2UArdD/PrYfecLMXqfhbYBjjSu0zw9nWMpG5um4xxs3TxMJDP
 euLJaAx50eGxPmQci8FXtYtePgaGfTutHNGPmfrYd6jyza3Vow6kc6h5pMYT3tLZ
 8QSyLkcDnGIq+t2V7bUFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1681239895; x=
 1681326295; bh=aMix3scYUqGc4zr+bKvg2cWR/anAOTqshN6fswmSMk8=; b=H
 wGNnpfhW1oPonTepCqdFrb+rg8i8+79vD3AuDF2A8+rugU2uHtFTzEoS5M+WwSQ7
 v/sOPQLprez6dhwVSMBZlRvEBvbjI2hKtFgSGIABpVCxlpMRsDJTQEGUDxonrzp8
 NcL9SXrtIXuZftydNK5Mxr3jpo1FUgg9wGo2NJItYMJKrPNKtEpJ1oGzd9GedqT/
 hhgh9MitRmIzJQERgF+P5WoNdCI+1dJd4VrVgexKyueyIpE9HxKgvZYxak6H9E1G
 Wbs56+cfm7+lUy63bWUvQ+TQSF219rktzrdaJiUEk63aEKBHVVIbNTpSGMlnCFtd
 /RUnoljmoGBv0mC71u5tQ==
X-ME-Sender: <xms:V681ZJxpTnplMf0kgLAJBd7GBaK47Jkt6swkaoCv8BxDdsf5xqJ7ug>
 <xme:V681ZJQ7C3LUFWHN3bXTB5B8eJxNCR_aBKdPio5_Z250a0zW6U5NOxuCbhdBb7i6A
 KgZQ-y8_l7n7uKsUD0>
X-ME-Received: <xmr:V681ZDWuH-LJ3HQmfFMei2c3yFB9xg5OMkm2lqM5AgnjH2T6mI0IiHhShWHiw9THE6TSksnEyl6icwshXyAorOkF66ckgGk6rbKFvJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekgedgudeffecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:V681ZLg2wJEioOjHSTqcWeOfyAXhlo6V_y3j7zpF_qu335Tm07U3ig>
 <xmx:V681ZLBg5P2o4G9vpLIWXBiqBlUnnxTOcL80crf3INKocNAIvvHC4w>
 <xmx:V681ZELnQYwnlKCcuHLNg3ALDXqo49IdX48RBhTxllti0OJWxHlizg>
 <xmx:V681ZG_XNZHy02kKsbVeEnrA5y9sL0MzoNty1nesnFtXERI7TzELjQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Apr 2023 15:04:53 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 2/2] hw/nvme: fix memory leak in nvme_dsm
Date: Tue, 11 Apr 2023 21:04:48 +0200
Message-Id: <20230411190448.64863-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411190448.64863-1-its@irrelevant.dk>
References: <20230411190448.64863-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=861; i=k.jensen@samsung.com;
 h=from:subject; bh=0ctaNjbuspyu1pxA8Fawk+Nhcex6GmKSaN1dHe45Ed8=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGQ1r09kfx6xj9GjyDrRuDpWiHTJuBdh76VIb
 /wbsOI5xyI5g4kBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJkNa9PAAoJEE3hrzFt
 Tw3p/koH/jM1hHpWVFPiMOIy3lfvbbGd2ZvCLhvf6EykrMD01Cfx/TKBbsTjsBRZDorUlua8A1y
 o7yBOntqwlw3vIB0fRGAFVkGxXdA2tyDnAmlCWvh1mcINPL0TzMYfK/u3r+WmRJlK5d64rZCuMk
 bezPPI1kEleSe47deSPEDfHvJB7o4rizryN9ptitmm+cphmSyyBUz1uWEijQRME4KoRV6/nDJpy
 QFLa1F3Xz8yT4Vh02hxYI2KONOX5nWVXyiDXL9Zoa+x3+Yge3QUDU2MPrInqLzzlMUwLeFCY30Z
 gJp+fPhocD9GULMudDYtgF6/g2OI51CQHn0RdeCBHqtXNXM5c4MhManM
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
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

The iocb (and the allocated memory to hold LBA ranges) leaks if reading
the LBA ranges fails.

Fix this by adding a free and an unref of the iocb.

Reported-by: Coverity (CID 1508281)
Fixes: d7d1474fd85d ("hw/nvme: reimplement dsm to allow cancellation")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 8b7be1420912..ac24eeb5ed5a 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -2619,6 +2619,9 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
         status = nvme_h2c(n, (uint8_t *)iocb->range, sizeof(NvmeDsmRange) * nr,
                           req);
         if (status) {
+            g_free(iocb->range);
+            qemu_aio_unref(iocb);
+
             return status;
         }
 
-- 
2.39.2


