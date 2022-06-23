Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CC2558AFF
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:56:00 +0200 (CEST)
Received: from localhost ([::1]:41608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Unv-0000PX-CY
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UUc-0005JT-FL; Thu, 23 Jun 2022 17:36:02 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:35727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UUa-0006ja-Py; Thu, 23 Jun 2022 17:36:02 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 10D41320094C;
 Thu, 23 Jun 2022 17:35:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 23 Jun 2022 17:35:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656020157; x=
 1656106557; bh=aQ5V7wENUGjIE2zkNYqp5gvM7R0B0zwTmp04q6h4IT8=; b=g
 QvGkFYalHu4GfpnD5ROxO6DVfK2bcpEgdzzqHz2BsBoIRBaiFrdgO4Xdyzc8WnPg
 1ySxR/NH0d192hnZcpX1thjmweZB7R18a07lkpnxz4An6HNMHubhOroNdnYjR8bL
 mP6/3bHOnKc0W4/tIzHB2gg+KapOuqOc87WDU/DCddG8uYaiS4sQRdZQw+AEvjb2
 d61TjVukjVV/KnLV1mBfevRaMjTVBHxDl8Sekv4N4vzZaduAvDXMHN6+ITxRd7wl
 QtFrR8KuKwviGzK0tAw+82rcAFVjYyUyHtg7Nz5ZzlNFF9EA3ko8gNeXkTzSuff+
 H7xSpK+qGb0o8JWzZQW0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656020157; x=1656106557; bh=aQ5V7wENUGjIE
 2zkNYqp5gvM7R0B0zwTmp04q6h4IT8=; b=sycLCxk4wcUGjAeks/b4lH+9akgqm
 9sO+FdPSlHbmNElVxBvd7YK5J4XWr87zbG/flXnorC/sehaSHdvqZK6V7k4E4eNO
 huq4yxRrjEIVS/wVKkilpFJT6BjvyUFmN4cOaTMS482HhxmvQdtOY+GenCYFZWZg
 bbhyBW1yQCe7N6QTIKi4iZHf678QrDWaZGn91YUgtD+US+jvEaQI3670BtlrE46D
 GaMONfk35hq8fsjY+mO/S1za+vCfpw0h4P0hSQmPgnZd+a1m3pUbYayZL/NbJCzk
 zDkxN+unwjDdw7dvg5NB1gMg8x7BOyg+i2MYVJ8cQ1U4XP/f2TifhcxfQ==
X-ME-Sender: <xms:vdy0YteuQLADGCfplF9p5FAk-yViVzb3ATRVTaWwj3vqQVVyvYfvQg>
 <xme:vdy0YrO3yRDoIFHyjl4y0m9-CkaGkuUXKYPvEGPrwkO9Gu5ZFk8jD4hOhUYMVJ1ZL
 9CJzXm9bl3bWsZkaWg>
X-ME-Received: <xmr:vdy0YmhhUuvHkOXTtFYrJsthiV5AlYES_yT8eEFY1a39oTfv12fB-mV6EvIOdo00p8PG5fv1vuJ6UAbYKD23>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudeigecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:vdy0Ym9VWnbAjS4JpG6Op_Cp9pbvqWCSeVBm5iUtK3PfUn-0D0_s5Q>
 <xmx:vdy0Ypvez810XaGHRPGj7QGrlar50DSCGSa-TkJhRxxWQUKg-d_Bsg>
 <xmx:vdy0YlGmS4XDPnICGKh5bj1gXZ3egXR-dRrPG0DjZMP9zGElRJajOw>
 <xmx:vdy0YqMyb4W8DkIi11PjNDy52lHqa91gBPpI9T7pv6yYcA2Utu2Ztg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 17:35:55 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 15/15] hw/nvme: clear aen mask on reset
Date: Thu, 23 Jun 2022 23:34:42 +0200
Message-Id: <20220623213442.67789-16-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623213442.67789-1-its@irrelevant.dk>
References: <20220623213442.67789-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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

The internally maintained AEN mask is not cleared on reset. Fix this.

Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 15d580a904ef..d349b3e42620 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6167,6 +6167,7 @@ static void nvme_ctrl_reset(NvmeCtrl *n, NvmeResetType rst)
     }
 
     n->aer_queued = 0;
+    n->aer_mask = 0;
     n->outstanding_aers = 0;
     n->qs_created = false;
 
-- 
2.36.1


