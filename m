Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1AB6DF191
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 12:05:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmXLP-0004Zn-Kl; Wed, 12 Apr 2023 06:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pmXLN-0004Ys-4N; Wed, 12 Apr 2023 06:04:49 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pmXLL-0005O0-F3; Wed, 12 Apr 2023 06:04:48 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 6169D320099C;
 Wed, 12 Apr 2023 06:04:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 12 Apr 2023 06:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1681293885; x=1681380285; bh=tphiNIweYkcl0zw7aRQKO+uVS
 BQX157Xly3CeKDLTkI=; b=pStjvbZm8bN6oSHk1w0xcnjJZce7pfcJNQe4MlbPm
 JuqMn/ZBrfvuBtwcHeZtdQXssvViUUC0Hr2DeHhc9uZdrGBBujd0uRVL63I3fIfV
 qaGS69VVOKkHjIzOftTdXIWv2IAQRWPxFujv8zkLvKjlqfuPovZxKvEG95iuxg+d
 TGgEhcgt1+ryohHI7l/fNhIvj8yyLt1B2wvnYb4T5PYTZ0S9vFogi9Y06j1ESU3m
 ZZ8kyMcFmMjW0LQm1u2Xux6H5vBZh3ZoQvLiFtK6KMAalO619Z0B8D8nmUZz96No
 k0n6E4mTnVT8jjHkFBmxo4cXUcp+5yX1wRYw3vxYfDdfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1681293885; x=1681380285; bh=tphiNIweYkcl0zw7aRQKO+uVSBQX157Xly3
 CeKDLTkI=; b=gy+HKHmF+Bq2vU5895eO0m109Gjnb6cGAYtXY7QIMVIzxZBXRUY
 WHMATxTFOFrFN3ZeuGZzpzELXRIVodrqoaJWRmY7qXbK8JQPjODaB6WuSQA7LiBL
 Kc0vd2wdqm993dRbvy/R5lGUBBOtjlUuCasZh7llG3qRooV3TxRx5lSVBHuAIpo0
 IMZodKdzBL/iC/zdWL76T0RCbXQ/72EJVTVVrm/MJ+HWsXoq+nRnjmH3Joilx5hg
 Vx5Zg7bN+1xNKytEdtmAJwVcDK7bwN0srWawBh7MyV9wB6/VZ5SxX9ElLtnjP9Cr
 BWmv1SFfMfsOO9mceeRv39vMvW7Nuumw5lw==
X-ME-Sender: <xms:PII2ZJolsrGf_yRDtG35Prr38l2coFWO1OM7VXC4-mcyJKr3RDqFEQ>
 <xme:PII2ZLp6kDR_5ySOx3il3GFko9eowBLEKluxC1VUJ8besInQyxrxmrxpaGdqQmp15
 DTPS6stzCmCnmJPIcA>
X-ME-Received: <xmr:PII2ZGO1n5b6FrRx4Y4s1X-daNs3fqGPu8l2YRqvJ_ighuuZj0PBpY5Ksk5A9day5ZKSd-Nmk4rZ__xSR7yWFYu9HBcEIurg-_j2cJ4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekiedgvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeefvedtueetueduffevgffgtdeftdeuleffhfeigeffkeegfeejfeffteej
 iefhvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:PII2ZE6ZHvVO6W7dv92GX5HMEFt0eX07T_sF41oWtHvdXD2Q_bbcPw>
 <xmx:PII2ZI4e7w-UGr8mWUHf_v5iehKi6U6_WK6GlxooGfL0Y-7pIBNjxA>
 <xmx:PII2ZMgyEm7BPl64Zs90APIPK4_8hQvc1_Sa9POgeLAIxi0C6ou9xg>
 <xmx:PYI2ZCQpElpKOvrlpmidLtk9GSv2sRNE2ovtk1zxxmiFFxDPVsP9bw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Apr 2023 06:04:43 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL for-8.0 2/2] hw/nvme: fix memory leak in nvme_dsm
Date: Wed, 12 Apr 2023 12:04:36 +0200
Message-Id: <20230412100436.94038-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412100436.94038-1-its@irrelevant.dk>
References: <20230412100436.94038-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=919; i=k.jensen@samsung.com;
 h=from:subject; bh=dg013DH4rtfyR99vmVe1/pFSn0W94O6mRsVtwz4hrB4=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGQ2gjRS/N3diqeTkCG2NeIwS+F48zNIrUeRN
 MVs2QT1JDv6bIkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJkNoI0AAoJEE3hrzFt
 Tw3pKbIH/29GRL5qd3bhOWQs8M5d9bUm42T7pGl7rICO07oATZ1qu08PJKWryvhiWikhV/4keTh
 dZQ8v390BKbhBMyOifUlt85avAVXsivXFRxMkYQM6RuubW7B7x0GdESfjqfDuvvpY7co9sVuTy8
 mQ6Unohb9RlRi7r8LDVW5KxPJr8MmyJkI9i2LG4wy+MutGx33rMXc53lJ2vd56CZ5Q3CAJZHgN8
 7n8B4R2mtElpgNBF/hqOP5Y9zo9IsEecem6MaKTIvYVvh8j/qhhi/lBtM25F0GI2Myqa84APFI1
 aQJ0gCY7fMXV7E5ZFrCT0VHb+7F5cla/UteDZR7eiCW/nKhmeTPGK6wM
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


