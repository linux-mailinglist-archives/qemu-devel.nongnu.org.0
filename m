Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 279BE5144AF
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 10:46:49 +0200 (CEST)
Received: from localhost ([::1]:54252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkMH1-0005bi-Hy
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 04:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nkM4Q-0000Li-1W; Fri, 29 Apr 2022 04:33:46 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:57145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nkM4O-000592-EY; Fri, 29 Apr 2022 04:33:45 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 794ED5C00E9;
 Fri, 29 Apr 2022 04:33:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 29 Apr 2022 04:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1651221223; x=
 1651307623; bh=baudGR2g2UWMwMShaB9gPREnF8Fm2vNjxfHurmUA2YQ=; b=c
 pZVMHCOCKcRFpDUvZ4zq7lhgzwxncUJMrNBZ0g5u0+N9nDLQ1W9wS5rUisqmEMGn
 yQ4sihB7AcjhYWarQXjxuG/o3I0zwQHkgCttNnmDWE6YjbaHpWWnAsivCIp5eBmr
 L6pEPTqJZSBLwneJtBO9EGjHUPTDKJzUpGKlrBKHAf87WtcJXBiTjDzG7BNxtsvo
 a1cQWPAhRXQ4BSf1BdaETAGhgT6VHjwUb2tLYlZLLBBM9rFFA9bdNdbg2EITafrq
 vGdq+BSwaY+uaJYdew9yV6tOGhMPKSloc5U/Dx3k3EZK5fcosTnASX4qesvU1dFj
 pR02R4sY+mt0qwyVCr8aQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651221223; x=1651307623; bh=baudGR2g2UWMwMShaB9gPREnF8Fm2vNjxfH
 urmUA2YQ=; b=fMMdj7av6W9Xd1sElEMsRSfzPJEDjpE1/RxYX/p/MUFOhiA61l4
 1Go6arzi5rKXDNPpKNJ/Z9C8uKM2XVtCPoPZZ98N/gy2/ATB5dzReSNdgu2AbFpE
 uUOVXj7XlqHI/jKljFDt71YyrvEpGpKHfbHOK8zuxk3jWA/8FpKObmjVKnPhg0t2
 gDL9D2vJQEUj/eoPjpC+fkf6rrm3Cs5cYYcRML3m3Il+5IaNYQNdqHVj9gFSK+9G
 vevCmZa8tnSspf+JqQZ7ym0zBJCdM0CrL2Degvs1t7Zy/CaAr7N6F6ysVF11I6Js
 WZTe+DbyDzBCAS5Gk7bK7ZQ07owwaofOf/g==
X-ME-Sender: <xms:56JrYkugJNtWNsEJXTeuHwGvVPnU9-kYl_T1m49RP2HmZak5EB9GuA>
 <xme:56JrYhe-tU2IHE2NhMjhrPAqAIvZffKvmsgIHFJVP-JS2Tgh-12HMmkgU-8faA0YG
 DRJL6pdzsx-UOY8Fhs>
X-ME-Received: <xmr:56JrYvzxvoXi01uJ19sOFqkPhc_AIqYB0JgoZ463gS673owYW0LsJvzAel4bQV1PX0ZLD5lBZIqxA_Vjs-nr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudelgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedujedu
 geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:56JrYnPc6GAles9MyN1v7pYxMW5guEEyf_JHeKhqKHhK4mTTHsfBTw>
 <xmx:56JrYk_zfKnm-24xmufgudCeYIbmPz2fuljMxWokz1YONwB3rnfK9g>
 <xmx:56JrYvUuh7zmAvMF_NsFYavLOctcZG_R4IeHKzUiSEZ9x5waXpNeuA>
 <xmx:56JrYvb_CY7aNviJZsUr0jwPT8Ee215ntIEUABtF3ruuzy-2ntIzEA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Apr 2022 04:33:41 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] hw/nvme: enforce common serial per subsystem
Date: Fri, 29 Apr 2022 10:33:32 +0200
Message-Id: <20220429083336.2201286-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429083336.2201286-1-its@irrelevant.dk>
References: <20220429083336.2201286-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Keith Busch <kbusch@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Christoph Hellwig <hch@lst.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The Identify Controller Serial Number (SN) is the serial number for the
NVM subsystem and must be the same across all controller in the NVM
subsystem.

Enforce this.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/nvme.h   | 1 +
 hw/nvme/subsys.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 739c8b8f7962..7f2e8f1b6491 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -48,6 +48,7 @@ typedef struct NvmeSubsystem {
     DeviceState parent_obj;
     NvmeBus     bus;
     uint8_t     subnqn[256];
+    char        *serial;
 
     NvmeCtrl      *ctrls[NVME_MAX_CONTROLLERS];
     NvmeNamespace *namespaces[NVME_MAX_NAMESPACES + 1];
diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index fb58d639504e..691a90d20947 100644
--- a/hw/nvme/subsys.c
+++ b/hw/nvme/subsys.c
@@ -27,6 +27,13 @@ int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
         return -1;
     }
 
+    if (!subsys->serial) {
+        subsys->serial = g_strdup(n->params.serial);
+    } else if (strcmp(subsys->serial, n->params.serial)) {
+        error_setg(errp, "invalid controller serial");
+        return -1;
+    }
+
     subsys->ctrls[cntlid] = n;
 
     for (nsid = 1; nsid < ARRAY_SIZE(subsys->namespaces); nsid++) {
-- 
2.35.1


