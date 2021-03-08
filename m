Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F0D330E93
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 13:43:33 +0100 (CET)
Received: from localhost ([::1]:36442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFER-0005Wx-UY
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 07:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvD-00038U-6N; Mon, 08 Mar 2021 07:23:39 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:38111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvB-0006xK-El; Mon, 08 Mar 2021 07:23:38 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 4B456360D;
 Mon,  8 Mar 2021 07:23:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:23:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=bR+fanWf+dIkK
 /GND6Y0TO4ON08GdOQMLxn5ZGXb0aQ=; b=mVSEUVGRUoyWgh25h9j+p/iJaFZ6g
 Ds5nqkomb8uNPMpCsEbzj/YjQfOzQ+7dduyQjkPYYrzsUZIxpndt4QQb8lPsZ54R
 2cHg+UHYpVwoBv5gFH1XBg+HOK+ibRhc3G7zTqVVSVmWHsKQ5B9dMCxgro5ZSlS7
 vXOlLZSXEc9TWBwkBjtARlxoKCJe6hHGwUSFKTddWYHCBCvADDr8G/kLgMsO7bUQ
 99LJ8y0qjT1/COaqDDBzf7mk8aCvycZYcsbW31c3vNtpxBy7wkubhVXaPZEY8Vr+
 6mjkc58w5LdmVlPyxPt4jtmqL6MqnTTzHzihq6d2zI+ME4jPMlvzw7Afg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=bR+fanWf+dIkK/GND6Y0TO4ON08GdOQMLxn5ZGXb0aQ=; b=ASPmND/6
 9P9RNeSfEQkl+TzsRnIGjgVN0UfXzlXylJVuzvmKZ9vv89VZ+moJ3ofEbKUYG/a0
 6s+fr+Hmer4zUx3KZ1tyAJnfjGv4nxzjSPxPeDpoi52vOYmCGk7kq6RpKfUP4kEg
 AL4GUEnXmpSUY0wj3KYjK1LSYXRT3rWL5xtDu6Eb1QZFIIEFEVvkkvserENXtJFY
 6euwNnWD1Z7s1TZ/ukxThBKcEKRVRTVb5vd3OUx/n4NDC4X+RXoRRAVliDj1E9RF
 HIUgPNTMwBVL7TcoQBOu6CqiBDeFVFI9Jmt9MHt7624UuwgSU1c7l0ZAES4OEYFY
 7LH5WEDj3OezDQ==
X-ME-Sender: <xms:RhdGYHe4--A49HW6RlwemUE5dqa28xNFe6yxKjmOAkLpOsiIGjuvqw>
 <xme:RhdGYNOQknqVYVUodXJw_Mm632GQE3ecdEFwxTK5Wx1hBuSJnMid8q4DBEFvGi-A3
 Lysw3evidIBCz5i03c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeelne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:RhdGYAiUaVLFuMFwLaWR769P8cooFQnjLDK0H6-UzhoWTtIjAYchIw>
 <xmx:RhdGYI-jNp7fCFVxTV2sV-axgvaLcWm65RfgcxKsYzopi4p7Xu65KQ>
 <xmx:RhdGYDviTXrcZDpbYTBUM-ecLsw9wzoOoNsh6in1BRXBZmiKFATsvA>
 <xmx:RhdGYJCORQsPs7-bneTcDElhdSyKF2xCTL8e4xtwzRfOpJG7fz6zbuyZ5W4>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5B6601080059;
 Mon,  8 Mar 2021 07:23:33 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 12/38] hw/block/nvme: fix Close Zone
Date: Mon,  8 Mar 2021 13:22:47 +0100
Message-Id: <20210308122313.286938-13-its@irrelevant.dk>
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
index 59faebce28f9..5cdf17db512c 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1310,14 +1310,13 @@ static uint16_t nvme_zrm_finish(NvmeNamespace *ns, NvmeZone *zone)
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


