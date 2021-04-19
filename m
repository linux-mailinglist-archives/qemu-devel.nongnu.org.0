Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FAA364AF8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:06:31 +0200 (CEST)
Received: from localhost ([::1]:46808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYaAA-0000yA-Ln
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZ6-0000IT-Lv; Mon, 19 Apr 2021 15:28:12 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:34535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZ4-0005Fz-6y; Mon, 19 Apr 2021 15:28:12 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 2053721AF;
 Mon, 19 Apr 2021 15:28:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 19 Apr 2021 15:28:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
 ryhggh5Gs1vDGYb8gAh76mQ5+l9r52BROyJo5AfAq/8=; b=ZyvmIq3RW+vP2efi
 DVOzB1nC0jqUumGCsQDAc/Cz6tGaMBs2wkRJWXDU29TlFMwt8I5FvEZvZaKzcJe4
 J8IlZft9fEBCpNOwPVvJIMRXQ/ebqt3kEGN5ObCC7MQVMhOlifoixHYUz8H3imf1
 QDJNhCNwIaG4THhiVpNrQLbAm8RV7jvUzOxZRdLRq8QQ6WRDCVPZOFtHJF67yI8F
 KNHyTGM7OVBp6poUYVaUpxZmIegFGEwA2Ayc5MHE73CuASwAUAQfjogKj39TcqzI
 2zH0RlEEtDHxOK15j7saYt7zNRP8uWQEhtyvYolA2pfvsjrpbLjLvm5d/Bu0ABns
 0Y8K5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=ryhggh5Gs1vDGYb8gAh76mQ5+l9r52BROyJo5AfAq
 /8=; b=NgqcP6PQ6YPdkWykFH0fHgvwcaifEYjjQ5voK1uoNtmYu1XTEVqmc95be
 O9BQI/d/HX0UI99qugxuXdfj/VzlpKFh1i19VEuiTFh8AF0vWD9owZuAiPW+iNwZ
 JKM5cUSPY0DxN7FDMqeWm0+VBQxCQjPTLOI4v1NgtCguXMj+AIRRJKVQyjuHP5mZ
 cg0OdSdo+DHga98hqZO1Un7e/jkXnGjqT64BilDh12kaYR+FOG7RwTQGtNI3wFVD
 QkMnzKrTybDQ5Wl5UQcqY8YXMxXj/+5TawjKoReze2ma0I6hrfHTJtLjT3zI5uJI
 Vuo591hEpInVWo+hHymU7YL0T9vPQ==
X-ME-Sender: <xms:x9l9YMqPHd7kMl_C7dBm4omHwjmoxW_4fDaQrphxn6OdxHJPF-GSxg>
 <xme:x9l9YMRnkrf6bOrnLkJ7i1qLj4cmjB5sW3BRSN6VUR7vjDCGNgxIHhi4GudsO8GLu
 _jSRZcbQTqr0Aqr96k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeetveeuudegveeiheegieelueeftedvtdekteefleegheduhfejueelvdfh
 ffdtgeenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:x9l9YBM-EgXsoxkG4xDUDODX4uBO_arzLJeMVTNqi98xUsWirtz7Yg>
 <xmx:x9l9YHOIi3SAegAB5Z2DR23EHYaOS1lPmAcIvU_cR-lR3hEs7X5P5w>
 <xmx:x9l9YJvuzmjXJy1X4Kmj-PS6w-rXqvpBvxJqxqfrf_ncHtfgCuc4Vw>
 <xmx:x9l9YOndNfEQ5N37V1xMKGQlmEvOW9QKiFjzV6Ok4i8ta4Xamg0Lqw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2517E1080066;
 Mon, 19 Apr 2021 15:28:06 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/14] hw/block/nvme: rename __nvme_advance_zone_wp
Date: Mon, 19 Apr 2021 21:27:49 +0200
Message-Id: <20210419192801.62255-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419192801.62255-1-its@irrelevant.dk>
References: <20210419192801.62255-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Get rid of the (reserved) double underscore use.

Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 002c0672b397..d1b94e36c6fb 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1745,8 +1745,8 @@ static inline uint16_t nvme_zrm_open(NvmeNamespace *ns, NvmeZone *zone)
     return nvme_zrm_open_flags(ns, zone, 0);
 }
 
-static void __nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
-                                   uint32_t nlb)
+static void nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
+                                 uint32_t nlb)
 {
     zone->d.wp += nlb;
 
@@ -1766,7 +1766,7 @@ static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req)
     nlb = le16_to_cpu(rw->nlb) + 1;
     zone = nvme_get_zone_by_slba(ns, slba);
 
-    __nvme_advance_zone_wp(ns, zone, nlb);
+    nvme_advance_zone_wp(ns, zone, nlb);
 }
 
 static inline bool nvme_is_write(NvmeRequest *req)
@@ -2155,7 +2155,7 @@ out:
         uint64_t sdlba = le64_to_cpu(copy->sdlba);
         NvmeZone *zone = nvme_get_zone_by_slba(ns, sdlba);
 
-        __nvme_advance_zone_wp(ns, zone, ctx->nlb);
+        nvme_advance_zone_wp(ns, zone, ctx->nlb);
     }
 
     g_free(ctx->bounce);
-- 
2.31.1


