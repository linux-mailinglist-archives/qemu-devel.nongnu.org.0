Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68808624D78
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 23:08:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otFib-0000CG-8H; Thu, 10 Nov 2022 17:08:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1otFiZ-0000B4-7s; Thu, 10 Nov 2022 17:08:15 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1otFiX-0007c8-9v; Thu, 10 Nov 2022 17:08:14 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 810A65C00A2;
 Thu, 10 Nov 2022 17:08:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 10 Nov 2022 17:08:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1668118092; x=
 1668204492; bh=eW30KnAabEUNjf3UdDgFBA3DGtsP+pJV6JjbhQYIajk=; b=u
 vWRizQWEcqzNMM/a48IyHT37l1IQdlDDImV1LTpRlPyXLJ6tQIoFYnh/xQ9MeXve
 tn/suFmSAfgsB6T3do0TJaCR86NwvgQOhMpyN7Li0QMVxZ0wmFNwaAXqC0BMJP56
 KsbGi/kRiVsJAqLRJtXj7Tcn/rsTzBOm/Es/Pt2frN3JDhorLJbl0G8M/2r7RiUe
 lmrao3ERvPfwiSQnJq+p9FZn+/qPyg+LTARmyPv4osfdq9mgwybkRXsKy8kLnTzQ
 Eui/cPvQt7iJ6mm/5CTRUhW+7MRISQwzflswK/snk6zTByVjmSFavcJPmN0ULGiY
 Oxeg3IKA5NNZuWhzF6/gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1668118092; x=1668204492; bh=eW30KnAabEUNj
 f3UdDgFBA3DGtsP+pJV6JjbhQYIajk=; b=LQ4US4K6UgBbDR/FrzkxEeJLqtJwc
 0ay8nnWLt2hyXeqdmkCWEnFnkUzYVfo0OnH3rPTpA+twfpXV8MYQVINVbmvVeaJ5
 qSMMqxEXG7kxkr2AwA3M1sUVEwMZ7z2eeltZ7M0xyUbcN5LmLZzOE0OkS9XEWuC/
 9380lgsDGYa3CRsL2Y/TiBhz1IYc+g8hIBuO/XAEOULabTKAw5U6Lz9qmvz+iUlu
 y+WMyrZUg6/shIBZX0TyRWfO5eBXdKLCKTeU4HttV/vVBYwJ7TcriAI04+umBiUs
 VuFoeceVMs5Tt0+TVqIAlWGxPWQM9cGJUb5FyjYahI6n8KnOGWD05y0Cg==
X-ME-Sender: <xms:THZtYzvMuzN68_BiIcDC9jIdo6ZQC5wSFEhIbpogBFED8yD5VzvqeQ>
 <xme:THZtY0cTzXja4pqu99RRKJSZ6cl7YickDWjgJD_feuyjyERbhv0uhtcxCTqX5ZTEm
 FBpN22fQw7lSxpvrc0>
X-ME-Received: <xmr:THZtY2xXd_0nBZRZtRp3eO9bUNfEGSP70lGPkYIEuXnsFJJgNnoMzYcneajTSHqQhos5TvhGnSUEa_9PmiLncsV2Ruojq4X0dhYa5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggdduheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:THZtYyOtzqjkLt6v4MAxPMoLhIyOLOtmAMu1qe5e50dDOTuTS0AxKA>
 <xmx:THZtYz_uFMI0-xj2nRdIovrRfKK6SEZQEQe-rrCoXuSVK2C8FQ0mLg>
 <xmx:THZtYyWn8DX3FDCPtSDDv55c4c5H_CDY4iwcAXne8ClxZQuj0qGi2Q>
 <xmx:THZtY_bqgRL3re8Pf0Bmn63v6OAS8jOXZvSWiyd0Whe3xNtFDmnlbQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 17:08:10 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v3 2/2] hw/nvme: cleanup error reporting in nvme_init_pci()
Date: Thu, 10 Nov 2022 23:08:05 +0100
Message-Id: <20221110220805.26816-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110220805.26816-1-its@irrelevant.dk>
References: <20221110220805.26816-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2209; i=k.jensen@samsung.com;
 h=from:subject; bh=GthvvVhfrW2Vq9nvtXEFnSQddMXTd/AcnTQO8WztkaU=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGNtdkXO341d1KKAzqLlcAwwXF33NcphP6U3XK/A
 2y2wJ6IX5okBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjbXZFAAoJEE3hrzFtTw3pmC
 sH/2u63wg++EPUxLxOTNHSOEMHMme16ZD43Nvlb+RETqRun3zRCrhiagIvbQDgdBCcRIsfY7UfVTlW
 +apVJ4po2PB47S/nXXOAjLEuQKETY5acrT1r0ACSv4rRp0nZW2p1uezkk9jUamLJzPp/HcPl5pwYuV
 pitu0P68uj1l0VOpR6ABdq5nFNyhghQA9vhzCAfMhHJUzjm3Sv1sBvO1x9YQ2grdeECLf5rfqiOKg6
 mh+91jTQO7p3Id3foIabUIu3yi9mV3FlhOiBJat9Z7YaqA/oHp4l3XrhK+N5E+VO2M9YRjC8nsmHkA
 tB2c7C1NyV1KbGeNwOdP7jc2K2MTlcawxN/69Q
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

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index a5c0a5fa6ce2..7d855523bb93 100644
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
+    } else if (ret < 0) {
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


