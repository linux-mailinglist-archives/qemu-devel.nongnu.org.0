Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507A2467F6B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 22:39:20 +0100 (CET)
Received: from localhost ([::1]:46540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtGH1-00068h-DI
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 16:39:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3vYuqYQcKCpIH09FGD02AA270.yA8C08G-z0H079A929G.AD2@flex--venture.bounces.google.com>)
 id 1mtGDS-0002R0-Re
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 16:35:40 -0500
Received: from [2607:f8b0:4864:20::a49] (port=49912
 helo=mail-vk1-xa49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3vYuqYQcKCpIH09FGD02AA270.yA8C08G-z0H079A929G.AD2@flex--venture.bounces.google.com>)
 id 1mtGDR-0004Gm-Ex
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 16:35:38 -0500
Received: by mail-vk1-xa49.google.com with SMTP id
 m5-20020ac5cfc5000000b002fafbc93a15so1984005vkf.16
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 13:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=kDkgNdL4NfNYupV3ZzxBLZNlPS6gY+g/aREor8CAFlw=;
 b=tUu7poknx/lnk+nK7SbkSn+IoXQRi1T2tvTQSk79H/FlutqcKPNGVKfspjXWxgFMJo
 Iw31u4hMkYnqznkB8uzTHwd+YyPZDWu2zwKJ77AoJkwu9nFp4PbOa1ABoSvpZ98fHgsy
 qAz9zf8p7Nwoqwg0/FsvIuTvf8pSUUKC8w0QKWwiWU3AXaeE7sNSsJ6mYcdzu4wtFdzc
 ujyAQWt7Nqjdkvb1qlyNnXRKJAFMzdIAcfLzFkh3RuKz+LlSWtQWHADQKHpn+8KLYi2A
 r7H5HUKTPToy0PMnnW8c+66WHpvt28xrncu+G7FxIbfvBL/TfBGLZ6zj3YKZkU7lDnEs
 3xjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=kDkgNdL4NfNYupV3ZzxBLZNlPS6gY+g/aREor8CAFlw=;
 b=OAs6s7X9PIMB0h+MKgOMvsdN8WYkUC656GTvt7knCJUH3GviUYIL0Nmd7UZZy0XZ5E
 Uar3FRs8VXodfAQ6bR0q5CRUQsd+r0406+hX7AjkA6HCT13cmMbpDZjSKLJs/Dwr1psQ
 4onEf1xooeiFCYfy1ZlvI5TBf8PVJsV2m/FDk9SW/pcPiT2ukXWW2HiVbJL/amHPW4T6
 +/Jvyk978D2aRnABJSnU5DO4mfK0DLdngeUIEcRgWur1HJJWV+G8JmEqL99UdvlCWzPX
 9S8SzzCXITQpRexce+bBLcKfLBI5ysH+6sKd40YCU7vKLdW0KVC2msHbxFx6hLp1R5pO
 EL9Q==
X-Gm-Message-State: AOAM533IfRzNg5qK37hvDH7T6yHdspJPz0K5XG80m/ZSEmnYtTePiMBG
 LSQnWg5tbm2G/hCtfj9Kx0WAzMqZQCgg
X-Google-Smtp-Source: ABdhPJwVrng5ZMhtm1Wnevqe/crdv7hQC6qnJtlhoh8AZbG1u1XP7RcSz1ZncXdaRRVl2Fm6TMKPOKnWtWGz
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:7a5a:6b8a:761a:5dd9])
 (user=venture job=sendgmr) by 2002:a25:e090:: with SMTP id
 x138mr24159503ybg.501.1638566845470; Fri, 03 Dec 2021 13:27:25 -0800 (PST)
Date: Fri,  3 Dec 2021 13:27:14 -0800
Message-Id: <20211203212714.1714362-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
Subject: [PATCH] hw/net: npcm7xx_emc fix missing queue_flush
From: Patrick Venture <venture@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, hskinnemoen@google.com, 
 kfting@nuvoton.com, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a49;
 envelope-from=3vYuqYQcKCpIH09FGD02AA270.yA8C08G-z0H079A929G.AD2@flex--venture.bounces.google.com;
 helo=mail-vk1-xa49.google.com
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
 hw/net/npcm7xx_emc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
index 7c892f820f..97522e6388 100644
--- a/hw/net/npcm7xx_emc.c
+++ b/hw/net/npcm7xx_emc.c
@@ -581,13 +581,6 @@ static ssize_t emc_receive(NetClientState *nc, const uint8_t *buf, size_t len1)
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
@@ -704,6 +697,7 @@ static void npcm7xx_emc_write(void *opaque, hwaddr offset,
         }
         if (value & REG_MCMDR_RXON) {
             emc->rx_active = true;
+            qemu_flush_queued_packets(qemu_get_queue(emc->nic));
         } else {
             emc_halt_rx(emc, 0);
         }
@@ -740,7 +734,7 @@ static void npcm7xx_emc_write(void *opaque, hwaddr offset,
     case REG_RSDR:
         if (emc->regs[REG_MCMDR] & REG_MCMDR_RXON) {
             emc->rx_active = true;
-            emc_try_receive_next_packet(emc);
+            qemu_flush_queued_packets(qemu_get_queue(emc->nic));
         }
         break;
     case REG_MIIDA:
-- 
2.34.1.400.ga245620fadb-goog


