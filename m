Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCAB558AB4
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:28:00 +0200 (CEST)
Received: from localhost ([::1]:40666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4UMp-0002go-PY
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UDn-0005rr-7k; Thu, 23 Jun 2022 17:18:40 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:39333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UDl-00044y-IE; Thu, 23 Jun 2022 17:18:38 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id A69833200957;
 Thu, 23 Jun 2022 17:18:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 23 Jun 2022 17:18:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656019115; x=
 1656105515; bh=Gu/2ZQo53SQ5H+1IizNlQZ3toC12z2U/p2E4Ue6509c=; b=Y
 iu6n7lwBCOMnl1vOMaBjY+37vrAAk9pxrXzpxm2+lR70Fm9yQw5Z0gJho2cGH+uf
 kCQKN0vs+bitY7XbbpW79t+WuXz7sDwWu+XDnsUa40HaOyU/cs3ZUNrcUzkI9xGx
 /sPjWCFgHtwCQ8oHwgEltM+2Yv0pGz5/Ah8kAJrmc9Eq0aAyAnb+Fj4zGkZJQIAD
 i8wyeGtyBg+eHwYyFD1UhekO4gkd905XtbId1k/eml6UX5rXSkcQxch5pR1G2Ly6
 2JE9kHbSOQHOlFZhxs3Bwv/ezcxec3boi0ECG4sm8xPTXv8/4a4t5/+wnWOrWw+l
 JjbQ1JMT6uR71YguikxUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656019115; x=1656105515; bh=Gu/2ZQo53SQ5H
 +1IizNlQZ3toC12z2U/p2E4Ue6509c=; b=TeIqED5PGxwrg/PAAgV7PwEam3ucL
 itnQX4OFMGV/0v4odpMSgpjYM4FtZoGtf+m63fud14wrl9uF4InTZECdAQo4Tq8i
 fHbT5ayXqdF1nnpvzdRwfZdGeNTtIilbZMsORqnVF1fr+o7FJ4NV7RK8UBf/qN9X
 ZNqiKBosgoLRsMjVaiymnJr6lQ3U48rJYfpbvbZJA4VsEtkVGgNUtjtb8nC2EIDK
 NvCHz8/dSqgzZyYTCeywMImZisJlD6DCgKLPcvpBKjmq0+Y98RXPWVBEVNLnhc2/
 2HrIg5LIVNBWXtcdRu5GusYwBE1kkib2MbmZSDbjW2KSD5ukCDsU3NtDg==
X-ME-Sender: <xms:q9i0YkCYxGe7AjBcdA-0-jhwrzGfi9yAr7JOr4oKcsEf4YYrWyxvaQ>
 <xme:q9i0YmhvdPJ_ExhYKhqC8VxtgUPJGlZI63Lvu65TdsgmNuTGOZvdgO4ja1jLb-TmE
 fLPAlYn_gKNmdkAaA8>
X-ME-Received: <xmr:q9i0Ynk367JnPLCWR1iM6MRsc2BIppE2XY8rzD3TlygALgzIhlklGRBggw6Huhrj22HX1mFO2YPRfvYgXsJU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudeitdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:q9i0YqzAbNgoyUNS_EyfOqAilsHmKasVdwLpyI495qm-UlfBOVgq_A>
 <xmx:q9i0YpRVPN4mJ2TA0dR0S2grf7wvf9F2LEz4XPWhoJAFdbU93L2VaA>
 <xmx:q9i0YlYE6pFp0DMiI-eAB76mu5FJwa7RfXuQv5RUTaQ6OUvS7V8vTg>
 <xmx:q9i0Yrde8hfrLMcKKPsPLjm6ALeSBvtg2JxZC5xj-IcFXC4cieX4fA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 17:18:34 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 04/12] hw/nvme: fix numzrwa handling
Date: Thu, 23 Jun 2022 23:18:13 +0200
Message-Id: <20220623211821.50534-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623211821.50534-1-its@irrelevant.dk>
References: <20220623211821.50534-1-its@irrelevant.dk>
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

Number of ZRWA Resources should be initialized to Max Active Resources,
and not the total number of zones.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 8 ++------
 hw/nvme/ns.c   | 4 ++--
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index af82daa304bf..a09700455c02 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1765,9 +1765,7 @@ static uint16_t nvme_zrm_finish(NvmeNamespace *ns, NvmeZone *zone)
 
         if (zone->d.za & NVME_ZA_ZRWA_VALID) {
             zone->d.za &= ~NVME_ZA_ZRWA_VALID;
-            if (ns->params.numzrwa) {
-                ns->zns.numzrwa++;
-            }
+            ns->zns.numzrwa++;
         }
 
         /* fallthrough */
@@ -1807,9 +1805,7 @@ static uint16_t nvme_zrm_reset(NvmeNamespace *ns, NvmeZone *zone)
         nvme_aor_dec_active(ns);
 
         if (zone->d.za & NVME_ZA_ZRWA_VALID) {
-            if (ns->params.numzrwa) {
-                ns->zns.numzrwa++;
-            }
+            ns->zns.numzrwa++;
         }
 
         /* fallthrough */
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 870c3ca1a2f0..b9b35b3c3bc9 100644
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
2.36.1


