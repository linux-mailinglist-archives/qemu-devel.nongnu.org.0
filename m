Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B9A623BC0
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 07:25:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot0yk-0000Ja-9Y; Thu, 10 Nov 2022 01:23:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ot0yX-0000HP-CU; Thu, 10 Nov 2022 01:23:45 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ot0yV-0006oc-MC; Thu, 10 Nov 2022 01:23:45 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id CD1855C0160;
 Thu, 10 Nov 2022 01:23:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 10 Nov 2022 01:23:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1668061421; x=
 1668147821; bh=GqyIELdNKjk1b44ic5vW5y5bX/deE+BfdTODabeQy6s=; b=L
 GB+u2nXihHD/XK2iEUsTI8LCxPxDA9ylcb8DNN7j9Pnvn9XMO32e6OJwfsRUgh1e
 Aydb24/sqa33svpoe4NCuEhs73955+Ga/p3kcwy4hRweOOX61pyJIG2mSoZUX37z
 /u2O7IVf2xMD1YRYuXpdwOhTmhPJC4xroT38mZ4xgvzfdfl+ppOiq3SS0nVB2aui
 yhEJsNIJdM8YqoEu5wSbvGFQBZy1FKeFc4JLdQ6oqahurTwYm8RhmUufvHD2aL7G
 oxozFtmT6ehVTnU138vb4Dvw8X8LNVp1ZPO7CRtao5ew7gU5YTr2JoYlHZJnqMof
 fpmYyyJg/ZzT3FpeeEDiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1668061421; x=1668147821; bh=GqyIELdNKjk1b
 44ic5vW5y5bX/deE+BfdTODabeQy6s=; b=n1cMHkhYm1L7kWb4iFiOJ/031X0NV
 WackfSM28E50D3k88WtGzncsXp6ETKuXulf5ZOCZOU2Ha7+k4RCgC+yh///RORtO
 G8V29nWu1btuypeizXuQof2yHCewaFNkPvoJnH1fVUExlnBKhFRacuq5P8Zcbh7g
 uu62SLFo15DvKw7yuLfiKISUuUxmy6FhCZY2bthpPecx7w7WhZ4Q8rJGFlTZD639
 y51RRp60HjNBmA0KQ8hdDPvg364qfXC6MN2tW3NgfQuIlSxqo7eMK5CQaQlOoZA4
 zSd3W6wdOAdmBbJ9ACcNUXd4xrQ0ZolXLuw8Al1FSjLOYE/OQiR+lXCzw==
X-ME-Sender: <xms:7ZhsY9YrAEjPPYXev0Y6Yjx5no4FLp_iY19gB79V6_wFHMcU390DBg>
 <xme:7ZhsY0YKsxSrnFBfVXbUpIUf83MHt2KSfntrCYWoRnwppKUTc5c5M_Iv_OfAUbhJG
 0MxQ9e0sbwVzcSIyBI>
X-ME-Received: <xmr:7ZhsY_-bXs9DAqDTZOFGW4cI7GH6eIIyf4zbJkYR2LgSWOresV6UXq9mmdBoXkFbcloOM--XehsC-dcShYAd88Aq4_GXgFLLyxBqFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeefgdelhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedujedu
 geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:7ZhsY7rxZoHTy3jx78oToX2hKV9X75Mc12-dc3uPxgPmkdWgBw8Y_w>
 <xmx:7ZhsY4rMvfWs5MlKPp2CrhMfOFtL-dm0_vGjU2Pxqv17tsPGOSOP9Q>
 <xmx:7ZhsYxSvsuMob1aVFg7R495Cq6IP8GshQPvyP_JRL8f9g6dq3rzfqA>
 <xmx:7ZhsYxl7pU-JlHl1yV7hcgcMBr_ZUBwvmbxz0JgLgvmPtBlRA6R-AA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 01:23:40 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 2/2] hw/nvme: cleanup error reporting in nvme_init_pci()
Date: Thu, 10 Nov 2022 07:23:35 +0100
Message-Id: <20221110062335.18401-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110062335.18401-1-its@irrelevant.dk>
References: <20221110062335.18401-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2248; i=k.jensen@samsung.com;
 h=from:subject; bh=RSsMSLyP5YpRe5Zj1zzYBj797y2T13E9eElrWVZGcDA=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGNsmOcNf9rrKhGgSKpMsYV/wr3vOh5sxFN4J0TN
 +YFeBfSi4IkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjbJjnAAoJEE3hrzFtTw3pmF
 cIALoPc0vpzmGirwr/lDNjhPYtjkNoeXz3Zm9JoBj5w2JKdaiXdlijZmkd+Dz3nB0kD7D4aHVaNOrE
 y5wce/qlJ3O63TmlzXkF0nnMQXSyhu2ko1tUXKZS6ual66YFqy5oDyZ4h5to0XHMcT6gPAIq7Wz58x
 Fh6V3aIB7ptE4vjUU/8CQBiG8BTYKxHMCHnJ46VTP9wsVQvAhQfjRVvA7UaR6rFQybyCkbVYuKCgji
 Btb9rUcwFhZxjVs6387hv4mGyckQwiAnMHF94UGmRPkg32i/Ox4uWnJeEmT8VxvQNYIXQgAxeXEbd7
 1wxdIHxWX5O4k+tI2w036Hip6XBd5qsLx7MaYL
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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

Replace the local Error variable with errp and ERRP_GUARD() and change
the return value to bool.

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index a5c0a5fa6ce2..e23af4db91ae 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -7343,15 +7343,14 @@ static int nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
     return 0;
 }
 
-static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
+static bool nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 {
+    ERRP_GUARD();
     uint8_t *pci_conf = pci_dev->config;
     uint64_t bar_size;
     unsigned msix_table_offset, msix_pba_offset;
     int ret;
 
-    Error *err = NULL;
-
     pci_conf[PCI_INTERRUPT_PIN] = 1;
     pci_config_set_prog_interface(pci_conf, 0x2);
 
@@ -7388,14 +7387,12 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
     }
     ret = msix_init(pci_dev, n->params.msix_qsize,
                     &n->bar0, 0, msix_table_offset,
-                    &n->bar0, 0, msix_pba_offset, 0, &err);
-    if (ret < 0) {
-        if (ret == -ENOTSUP) {
-            warn_report_err(err);
-        } else {
-            error_propagate(errp, err);
-            return ret;
-        }
+                    &n->bar0, 0, msix_pba_offset, 0, errp);
+    if (ret == -ENOTSUP) {
+        warn_report_err(*errp);
+        *errp = NULL;
+    } else {
+        return false;
     }
 
     nvme_update_msixcap_ts(pci_dev, n->conf_msix_qsize);
@@ -7412,7 +7409,7 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
         nvme_init_sriov(n, pci_dev, 0x120);
     }
 
-    return 0;
+    return true;
 }
 
 static void nvme_init_subnqn(NvmeCtrl *n)
@@ -7588,7 +7585,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         return;
     }
     nvme_init_state(n);
-    if (nvme_init_pci(n, pci_dev, errp)) {
+    if (!nvme_init_pci(n, pci_dev, errp)) {
         return;
     }
     nvme_init_ctrl(n, pci_dev);
-- 
2.38.1


