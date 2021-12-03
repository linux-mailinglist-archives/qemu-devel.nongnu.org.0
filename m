Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 664EC467FC5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 23:17:52 +0100 (CET)
Received: from localhost ([::1]:41988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtGsI-0007pH-VN
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 17:17:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3wZWqYQcKCqofOXdebOQYYQVO.MYWaOWe-NOfOVXYXQXe.YbQ@flex--venture.bounces.google.com>)
 id 1mtGqv-000747-Bq
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 17:16:25 -0500
Received: from [2607:f8b0:4864:20::249] (port=49057
 helo=mail-oi1-x249.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3wZWqYQcKCqofOXdebOQYYQVO.MYWaOWe-NOfOVXYXQXe.YbQ@flex--venture.bounces.google.com>)
 id 1mtGqu-0004rj-0m
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 17:16:25 -0500
Received: by mail-oi1-x249.google.com with SMTP id
 y21-20020aca4b15000000b002a819a3cd6dso2983100oia.15
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 14:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=DptKPBtVqulkRZwb4bxvQuevNljfMMf/j/w293um1mM=;
 b=PnQ9CBH+4dRC6T58i0FF2tAOVJVR9mjl5b1wvXU68ZFgFoMxAlb9glW9BNKxrRwFiB
 iUMtVJv8YDO+nXz4Hs9655gwiX5whn5hdNQdVePsaXaZNGR7MDRgjaYn09jL52sGRT64
 opXGamPG+JSxE3z+RB+tbIZMcLaILeLqTE3H6eYjm0lEdsIyavvZczfTDBUWMfkUZXoh
 hpd1CovuXupBRb61ig78XoFF968uqhN0HiM6vHAwVrfpJHdWHZ+iEW8K8WKtuh39kPbn
 /hsKq0yXbPymkZS+6xZyVhhZfGamhQpXo/CzwRFf7RZM/1Y7xmXzEu8IMXyuMAtlfedQ
 Wk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=DptKPBtVqulkRZwb4bxvQuevNljfMMf/j/w293um1mM=;
 b=BzAOGHIqL1w6OWhvfeslrhHmAUa6Z7OvvOuFM/t8R7xUD/EA8WNiD5QSiORP6xpcNG
 YizxiZawYvnSqrJwFuLI/RxXGMtsykFmOUGE6EMKupCeKpJ+n31u7rxxoasXoVrZtAdB
 jTRyhLtirDjcBZtRWGnQmj2cnNyYZK3Xo0964urFym2Z2Cc0/uXrFxRU50df6L1OMsuF
 QvA34YtPf3WE3kXH5THTT6LO/S9bl9obQRPmeisI5ONEXRrWyVljKtX/WpyPOX6PPrEe
 yNPXoxftz6WOrVb4/uKD7C2nKjYmSaF+Am8P2vTrwVO+D/5juviC0cQ0RBHdx+eIIAqR
 VBQw==
X-Gm-Message-State: AOAM531qJqgHqLQh7IIAyettykkko681QXTbBr4hQcfvVC5ev6XGR5L1
 oUrKXuWFrJWrrtuZUXino6Z6fSLFProE
X-Google-Smtp-Source: ABdhPJw5KnBqErxOD+f9hBEv+qBXseA3QiY3ZX9cnpZTg593VDud9PAx8eOjdTvtidAsm0KkZmit0FBvbcq9
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:7a5a:6b8a:761a:5dd9])
 (user=venture job=sendgmr) by 2002:a17:90b:17cf:: with SMTP id
 me15mr17228792pjb.125.1638569409918; Fri, 03 Dec 2021 14:10:09 -0800 (PST)
Date: Fri,  3 Dec 2021 14:10:02 -0800
Message-Id: <20211203221002.1719306-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
Subject: [PATCH v2] hw/net: npcm7xx_emc fix missing queue_flush
From: Patrick Venture <venture@google.com>
To: f4bug@amsat.org, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, hskinnemoen@google.com, 
 kfting@nuvoton.com, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::249
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::249;
 envelope-from=3wZWqYQcKCqofOXdebOQYYQVO.MYWaOWe-NOfOVXYXQXe.YbQ@flex--venture.bounces.google.com;
 helo=mail-oi1-x249.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

The rx_active boolean change to true should always trigger a try_read
call that flushes the queue.

Signed-off-by: Patrick Venture <venture@google.com>
---
v2: introduced helper method to encapsulate rx activation and queue flush.
---
 hw/net/npcm7xx_emc.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
index 7c892f820f..545b2b7410 100644
--- a/hw/net/npcm7xx_emc.c
+++ b/hw/net/npcm7xx_emc.c
@@ -284,6 +284,12 @@ static void emc_halt_rx(NPCM7xxEMCState *emc, uint32_t mista_flag)
     emc_set_mista(emc, mista_flag);
 }
 
+static void emc_enable_rx_and_flush(NPCM7xxEMCState *emc)
+{
+    emc->rx_active = true;
+    qemu_flush_queued_packets(qemu_get_queue(emc->nic));
+}
+
 static void emc_set_next_tx_descriptor(NPCM7xxEMCState *emc,
                                        const NPCM7xxEMCTxDesc *tx_desc,
                                        uint32_t desc_addr)
@@ -581,13 +587,6 @@ static ssize_t emc_receive(NetClientState *nc, const uint8_t *buf, size_t len1)
     return len;
 }
 
-static void emc_try_receive_next_packet(NPCM7xxEMCState *emc)
-{
-    if (emc_can_receive(qemu_get_queue(emc->nic))) {
-        qemu_flush_queued_packets(qemu_get_queue(emc->nic));
-    }
-}
-
 static uint64_t npcm7xx_emc_read(void *opaque, hwaddr offset, unsigned size)
 {
     NPCM7xxEMCState *emc = opaque;
@@ -703,7 +702,7 @@ static void npcm7xx_emc_write(void *opaque, hwaddr offset,
             emc->regs[REG_MGSTA] |= REG_MGSTA_RXHA;
         }
         if (value & REG_MCMDR_RXON) {
-            emc->rx_active = true;
+            emc_enable_rx_and_flush(emc);
         } else {
             emc_halt_rx(emc, 0);
         }
@@ -739,8 +738,7 @@ static void npcm7xx_emc_write(void *opaque, hwaddr offset,
         break;
     case REG_RSDR:
         if (emc->regs[REG_MCMDR] & REG_MCMDR_RXON) {
-            emc->rx_active = true;
-            emc_try_receive_next_packet(emc);
+            emc_enable_rx_and_flush(emc);
         }
         break;
     case REG_MIIDA:
-- 
2.34.1.400.ga245620fadb-goog


