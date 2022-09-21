Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FB45E56D7
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 01:49:29 +0200 (CEST)
Received: from localhost ([::1]:52738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob9T6-0000Fu-Ho
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 19:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3aqIrYwcKCn0wfouvsfhpphmf.dpnrfnv-efwfmopohov.psh@flex--venture.bounces.google.com>)
 id 1ob9Qe-0006XG-0j
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 19:46:56 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:35833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3aqIrYwcKCn0wfouvsfhpphmf.dpnrfnv-efwfmopohov.psh@flex--venture.bounces.google.com>)
 id 1ob9Qc-0002ck-Ba
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 19:46:55 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 n85-20020a254058000000b006b0148d96f7so6577338yba.2
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 16:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date; bh=9tiIReuaymRKZMv5ofYH6sbg0oQrV3s+sRPgy/cw9LQ=;
 b=l99SFjWSaAothBVKntzAfERVNRHY/Th2RCcgcmq4zf/tJWFJ1a7rTXW9gN/uyYy1cB
 B1VTeYagMBROpdCTkW80EzC1XZoP4lKgR5SNM8VsHqdoa2c6oc6jrCQUTCPTzdzB1W7n
 38FD/WkdNya1o6OKGJ1/5F65MfICzA7l3IRW9FVzgS8h9a9tNshU6g2ZsEnW2O0vAvmG
 HOcBzLWZ07H4bxMGOq2ejg82WR2JZKT0C8PRWTPaePsSMsp5Ov3pD8fzof3dPkbwCf7/
 w3salKDyNSFOE9MtqK8pBH1MYCUJPYuLA2VVXp+5JJ03EKbi4BeJdqZDMasYdm5m0MvX
 D2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=9tiIReuaymRKZMv5ofYH6sbg0oQrV3s+sRPgy/cw9LQ=;
 b=BS1gghwkDCEK+WaYgC1o79bm3wqeN395fPn0Z5SHinVa9WHUSjNgm70fm7Ni8Lcdjy
 W6/QXJBWgqhrklsufNPqItYOnv3eOm5oeF4mH7WRJ+QR7C96x1xnpFHZ5wcY11+1SSOo
 ES1QDUTRDBsKAeYIAiVvSwpUAPVDGlzt2oZW627NKBR+Gk4/eNAO5Y70EyoFq4+glTCV
 S4PDSC5kdY6t6Q4ngp5hhEn+OS77vfc4T+2PGv8ifPUpHxQiCv1pM45nYy3T43FQmniG
 BWr1YnX+1CYq2/2gDjWxwEA4t6sIGTQ1o0Lq9A1fZ9yCiPpskA4fIzcb9W01X22uawDv
 z5Ww==
X-Gm-Message-State: ACrzQf2D0AD38R0BRxRb3XPpVqv5uv1GDz60gr4613KvqAKEXY+J7cZ0
 Yoypl81KOhhtTs6DBmes7MlPyhJyK8YY
X-Google-Smtp-Source: AMsMyM4pM2RMbKaUl1IolC4zx2FyuoS92ASol7bMiH6qo91HUPRg3brHKv7UckgsJm2efgFEcjpZ08v5MeRB
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:201:cdb2:c21d:9e12:1a22])
 (user=venture job=sendgmr) by 2002:a81:118c:0:b0:346:f0d9:bf51 with SMTP id
 134-20020a81118c000000b00346f0d9bf51mr685723ywr.288.1663804010758; Wed, 21
 Sep 2022 16:46:50 -0700 (PDT)
Date: Wed, 21 Sep 2022 16:46:46 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
Message-ID: <20220921234646.949273-1-venture@google.com>
Subject: [PATCH] hw/net: npcm7xx_emc: set MAC in register space
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3aqIrYwcKCn0wfouvsfhpphmf.dpnrfnv-efwfmopohov.psh@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

The MAC address set from Qemu wasn't being saved into the register space.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
---
 hw/net/npcm7xx_emc.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
index 7c86bb52e5..6be1008529 100644
--- a/hw/net/npcm7xx_emc.c
+++ b/hw/net/npcm7xx_emc.c
@@ -96,6 +96,9 @@ static const char *emc_reg_name(int regno)
 #undef REG
 }
 
+static void npcm7xx_emc_write(void *opaque, hwaddr offset,
+                              uint64_t v, unsigned size);
+
 static void emc_reset(NPCM7xxEMCState *emc)
 {
     trace_npcm7xx_emc_reset(emc->emc_num);
@@ -112,6 +115,18 @@ static void emc_reset(NPCM7xxEMCState *emc)
 
     emc->tx_active = false;
     emc->rx_active = false;
+
+    /* Set the MAC address in the register space. */
+    uint32_t value = (emc->conf.macaddr.a[0] << 24) |
+        (emc->conf.macaddr.a[1] << 16) |
+        (emc->conf.macaddr.a[2] << 8) |
+        emc->conf.macaddr.a[3];
+    npcm7xx_emc_write(emc, REG_CAMM_BASE * sizeof(uint32_t), value,
+                      sizeof(uint32_t));
+
+    value = (emc->conf.macaddr.a[4] << 24) | (emc->conf.macaddr.a[5] << 16);
+    npcm7xx_emc_write(emc, REG_CAML_BASE * sizeof(uint32_t), value,
+                      sizeof(uint32_t));
 }
 
 static void npcm7xx_emc_reset(DeviceState *dev)
-- 
2.37.3.998.g577e59143f-goog


