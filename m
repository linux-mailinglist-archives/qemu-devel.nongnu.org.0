Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7740862294A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 11:55:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osiim-0002ak-Pr; Wed, 09 Nov 2022 05:54:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1osiie-0002Zn-Io; Wed, 09 Nov 2022 05:54:08 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1osiid-00087O-1n; Wed, 09 Nov 2022 05:54:08 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 5155A3200AC0;
 Wed,  9 Nov 2022 05:54:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 09 Nov 2022 05:54:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667991244; x=
 1668077644; bh=+IAzk32PGmFHkoSkgyshT2NR2DSbJkmn5YKXyjqRqdU=; b=p
 afCYftmDvgbCMf0+bIsQlhgh/zma6DBWq3SiZk4dflwBg21/0qVgeBX1N4rm3fYk
 bCLxIkZtHRII4RVDgM00J+S1ccBkWjNS1LeyNOvNoQTbxN7ZxBsBjrQVrWR6gKtE
 v1k6EbSMK31iQd4Kl35KI/F776UcbyBH9zGKDkYyCFxkFJa+1u6wCVbcGECbOaVv
 GyjsCsQqab2Xek2/9bbfEFlpbVWzUs4Bc3lw5m+WM7iqWRtN5jT2Im0p05b9NXnr
 r1oKC8/LJT21wpOYcztVdv3jcZW7CI4DNr5vO5gyduVSJf+t4icDRWEb9ugHU691
 EtIVIIkpKn9W1xkDq6G2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1667991244; x=1668077644; bh=+IAzk32PGmFHk
 oSkgyshT2NR2DSbJkmn5YKXyjqRqdU=; b=dkqohzt0K4g4I2cnXJqdlsMtqPaUd
 nZh2WFbooIgKIPrS7qcqKrklEe2yetPI6XKpn9LJ2wfE2uVjXP5ZYjpZcPGSi1EE
 87suhBwOKQRaMCeh+jnMMXEhtoSQ6KpEuvLYtwMPLZ9KzJKvcPb4Y7crNWy+ViOQ
 r0ZSTGfZhXSv5xapqUWU4qeDGMjM2aSKMDCyaxzypDMLi8IKOl96y5CmeIn+N4Gd
 H0PbNut2flw/hMRpJpkOdvmB1GsQrB0lCfPQJJfAld6/pqQX1/gGSwNxd7JufYZG
 dkz7qrl8uV1tkqv9yfVCAR0hby9vHV3+qpN2HNEmtGmO7vkjNC9WZ1YNA==
X-ME-Sender: <xms:zIZrY49BO5wUQShEpq6QJ9EmZiGh-8RkK9tSAhzhqltgSJU2Wzo1GA>
 <xme:zIZrYwuA63tGS6M4WZxN0QRhIBjBimNGSxQhOrF6xXgN0R1YUP4FN4z_3Z78wDvwP
 jtvuRV93OZMk4kUIaM>
X-ME-Received: <xmr:zIZrY-C-0-MA6OLhYp7BeUk61t-tLUpOITyBIVubYTjlYDZWYNimoVXmp7-SH5gCGU8XngMrKxY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedvgddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedujedu
 geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:zIZrY4fxCLqKUnUUJm-ADk59A6gExLHl4cvaLgPD6OgErZ3TGQ7nsA>
 <xmx:zIZrY9PkhTVBI-XQiElQZP36oVSMiCVqNuPCSuSy6GWNh8OlQisxsQ>
 <xmx:zIZrYymcAoOH6uJe_eochKi_7hbXyjyNDsbSzLuWLZuXrpLA3XZn4A>
 <xmx:zIZrY-r96HDfXrKztDm4Qlplu4HnAe0hyLAbLra-CLgOmVqJj14w9Q>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Nov 2022 05:54:03 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 2/2] hw/nvme: cleanup error reporting in nvme_init_pci()
Date: Wed,  9 Nov 2022 11:53:57 +0100
Message-Id: <20221109105357.30430-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221109105357.30430-1-its@irrelevant.dk>
References: <20221109105357.30430-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1437; i=k.jensen@samsung.com;
 h=from:subject; bh=/XGo2GLNnDwFQPXO5wyig+gYL4hADnXqTxx0srMHc94=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGNrhsWigfTVyYQ9nug2E+ugZAPZSFEeGpzy9xDP
 k1C3G0cuJIkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJja4bFAAoJEE3hrzFtTw3pCs
 0IAJT0LLtUeURGS+YfGy6cjDtrDgV96Q027u5VA2a22oeCLDfHEGapTNBiyWcaEwTFFgeeIy5Um1Pe
 ttneKlenj+2okou7nLiD8Ij7g0awZ8C4LzozDKy+5HRq/o9pwuq9CA4rjzMWgnE6EKC6uMccq2CYAZ
 Cp0P/JZdtrP41lhRP4ka+P8+BhgXjRF5eVnEQU83Ev9cNzpwUXxMlPMulKF8h4kb3njIMiWxpXPzBH
 jEXiFr/9KLuaQGn1oq3Elv3kLUGz7bSc1hmYZAYzZSUOaJu6SH+S3fLtHySySFr/kEjXcXF3nfAQpv
 PpWB4wTPJZlfcG+4DCg7O47zUF2fjbdzdgX6rN
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
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

Replace the local Error variable with errp and ERRP_GUARD().

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 4cc6ae753295..38eb5ec54f9d 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -7345,13 +7345,13 @@ static int nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
 
 static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 {
+    ERRP_GUARD();
+
     uint8_t *pci_conf = pci_dev->config;
     uint64_t bar_size;
     unsigned msix_table_offset, msix_pba_offset;
     int ret;
 
-    Error *err = NULL;
-
     pci_conf[PCI_INTERRUPT_PIN] = 1;
     pci_config_set_prog_interface(pci_conf, 0x2);
 
@@ -7388,13 +7388,13 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
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
2.38.1


