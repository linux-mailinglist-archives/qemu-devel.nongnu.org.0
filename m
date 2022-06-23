Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE4F558AAE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:25:10 +0200 (CEST)
Received: from localhost ([::1]:35960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4UK5-0007sF-Q9
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UDk-0005ix-Ly; Thu, 23 Jun 2022 17:18:36 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:43763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UDj-00044d-48; Thu, 23 Jun 2022 17:18:36 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 38A3C320025E;
 Thu, 23 Jun 2022 17:18:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 23 Jun 2022 17:18:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656019112; x=
 1656105512; bh=lmRxgq4fNcetwf7/k+ccoS3T0J+r+c9ZMkTA0GefQO4=; b=D
 Y7OPYRm1cXopoIVlPR0waRGDrBOzF6wxh6J9FWub7L/QWaZkuOAhJiAO8zt6chHD
 iUNv5iJ9MSMnz0np72WgbryaxEKgGTkB2h+ohYLSTFO4p8z5DUjyvhBqF0Zy4N5T
 tEeDiuaEg6SIkyAor/ejydP1IYlG9VSUDwjwFj3OQbwYYZkppJP7kcQzRPIEYzuJ
 BLEYjafk8IRCXGqwyNQrvB4thw8S1nDE7q7XLIOWizvQ4AVx3RqwpxBPY8mkH5ek
 Tr381tuHg98/HV+TpFY3n6yu/j/iff/U5guCwsfGldwDJ0dqAjar+NddEN1RfJa9
 h5XdtAusCbYXX7HkBsU5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656019112; x=1656105512; bh=lmRxgq4fNcetw
 f7/k+ccoS3T0J+r+c9ZMkTA0GefQO4=; b=ZK+E696Cagri4Czao1423gXs1Rn23
 evnkVW33W8VrBMrpprHibWWk+9x7bL9Cq/83WVOm0UFxybMdPtVzH5h02a7UNLVU
 MzxArKkAHLYCbL0XVIBilji4+g1WwcQS07cPGKwVyKw/5E8Zjv8+Os/uDDK/zV9v
 RtkxoDM0qnWxsxEqmHlYWNr7ApCBn8Ry/3L25M9RAPFQg8vHWpJrkAMmI59G4t6M
 lqRCVwkdCvcsE6Mel0gPy1EyLJ6OVIN9x/LijQ5T1pdOiZ6QQXvG8DRHqDccBAwU
 mKh/dYI4IHAjQTXlbF/4cxAXoI6bSIod4Fw6zNUZo9GLzbtEcoZi33Kcw==
X-ME-Sender: <xms:qNi0YjEQKPTS_c1FlXelwGtMqX4C4td5FTzFO-6vlPcAIq0ocnGbDw>
 <xme:qNi0YgUHvab9CeE4M1sML4Pql9EsUW8QJxp_zdviYhk3kJCdBe7nO3GLIflUcwhK5
 wPmdbAdfaaE_rxilDU>
X-ME-Received: <xmr:qNi0YlLTxpg5Mum3uTuov1Pr56ORwUirp6detzxInlt1M9USSrxkHejX9mInoftLm131oTfbdDltyOvz6qn7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudeitdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:qNi0YhES_94y8hxpGzvLvCIIyZjagBYiNr-CnyHqrKCq33Pe1x0uSA>
 <xmx:qNi0YpW7xb7ZNo8ysL05DIeeNGPdHOuqVhpETzZh0fI0ci_YaK3pag>
 <xmx:qNi0YsNY-4QKAveie3TVlZ3DcmpdSTOV6eFDN6dJf9nXllCA2W9dDw>
 <xmx:qNi0YsTzXhcW6p9IWOLSpjFqaynD2bmeD6mvlZUTNKyCpFbTCjsYkw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 17:18:31 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 03/12] hw/nvme: cleanup error reporting in nvme_init_pci()
Date: Thu, 23 Jun 2022 23:18:12 +0200
Message-Id: <20220623211821.50534-4-its@irrelevant.dk>
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

Replace the local Error variable with errp and ERRP_GUARD().

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index b688afccbe5a..af82daa304bf 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -7120,14 +7120,14 @@ static int nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
 
 static int nvme_init_pci(NvmeCtrl *n, Error **errp)
 {
+    ERRP_GUARD();
+
     PCIDevice *pci_dev = PCI_DEVICE(n);
     uint8_t *pci_conf = pci_dev->config;
     uint64_t bar_size;
     unsigned msix_table_offset, msix_pba_offset;
     int ret;
 
-    Error *err = NULL;
-
     pci_conf[PCI_INTERRUPT_PIN] = 1;
     pci_config_set_prog_interface(pci_conf, 0x2);
 
@@ -7164,13 +7164,13 @@ static int nvme_init_pci(NvmeCtrl *n, Error **errp)
     }
     ret = msix_init(pci_dev, n->params.msix_qsize,
                     &n->bar0, 0, msix_table_offset,
-                    &n->bar0, 0, msix_pba_offset, 0, &err);
+                    &n->bar0, 0, msix_pba_offset, 0, errp);
     if (ret < 0) {
         if (ret == -ENOTSUP) {
-            warn_report_err(err);
+            warn_report_err(*errp);
+            *errp = NULL;
         } else {
-            error_propagate(errp, err);
-            return ret;
+            return -1;
         }
     }
 
-- 
2.36.1


