Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1356D5754A9
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:09:50 +0200 (CEST)
Received: from localhost ([::1]:49122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC3HZ-0003hr-6W
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ulnQYggKCssDByr5A9yx55x2v.t537v3B-uvCv2454x4B.58x@flex--wuhaotsh.bounces.google.com>)
 id 1oC38k-0007H9-OJ
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:00:42 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:56247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ulnQYggKCssDByr5A9yx55x2v.t537v3B-uvCv2454x4B.58x@flex--wuhaotsh.bounces.google.com>)
 id 1oC38f-0005cM-2b
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:00:40 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 u11-20020a654c0b000000b00415ed4acf16so1544843pgq.22
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 11:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=vhcn9HX+W8BDC3zc9EzHTKhU6VuXS2Qk41Wg69c1pG8=;
 b=Xyz2tsP5nk9RENxAzAasWNHzaWUmNR946oGcC4Lm8FixmR2uJRwe+Qd4TGnLJzLoMQ
 d/x9my8aDYz8uxJa9eqQo1X5sbky+cKPDeNDmCyFeGO7ObuNXkAF1t4pmpVVkvBV5/zG
 JxlLl1i4KVLLMWEGt8LRZFMBHDAzDAV8y6mufR5bUYrCX+JH2bl8RWAsi6lrTAyiGpcW
 0a6Bnk0Pkxviw8H7rD6M7mgshA3om7QY3/NsuO8bhxol0ukysPCZ6n7t7vUSa6L0/P/z
 +ilQRjRg4uzBm7+wyX3G4HVb35xfv/KUDZRuMOD90Qfrpof9ZJt8KHU50MUNZGdtriwS
 a0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=vhcn9HX+W8BDC3zc9EzHTKhU6VuXS2Qk41Wg69c1pG8=;
 b=KGu2ww0oW+DwcWUpedO7yQgT9DJU214ZPaYcF1/VCmzYGTMif7VaN+9jWhZVrvbw+8
 T0MTGkiygYGV9//DvRmXDQSAh9zsPVmb3iGZR4LApw4PwDlqK9B+pKKg0ZCLRkx/ThWU
 MaKcHCOSmGADFEIx2SN8suIUyyZAhKQmRTjzOV6ulhZv7W33DfyIhE1qpoVwAdmhIJqg
 2/W+BXOBMQ0C28P3IeEciE/fRCI5x3KXfHTPwhOYOP01Hx0cymCRW1a9iMSzyzt5DHwr
 sqx8sTsWPy2DrAVlPt10RI5Rdwp7vofvrYO3l/VCWPzQ0eUPlKIFuU7ddgcPKA/0ThUx
 z/5A==
X-Gm-Message-State: AJIora+nLWpGPy3sKZEVzqmsYJeUO531Pu8nnujN2SyxTv0NugdF8G6b
 pqsEglJn3wG+6GGPGDVbtupxPcHhlyTWfg==
X-Google-Smtp-Source: AGRyM1sTkCeLfBc/FQA5vY0cGpIvXalZ1Tn3+t9h5cMqAb4rZlx1CTekjXhHqiSLaeBPe/k9q7lI+Ox1bbzmdA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6a00:224b:b0:52a:b918:e757 with SMTP
 id i11-20020a056a00224b00b0052ab918e757mr9739548pfu.38.1657821626055; Thu, 14
 Jul 2022 11:00:26 -0700 (PDT)
Date: Thu, 14 Jul 2022 10:59:59 -0700
In-Reply-To: <20220714180006.77360-1-wuhaotsh@google.com>
Message-Id: <20220714180006.77360-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714180006.77360-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH 1/8] hw/i2c: Clear ACK bit in NPCM7xx SMBus module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3ulnQYggKCssDByr5A9yx55x2v.t537v3B-uvCv2454x4B.58x@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

The ACK bit in NPCM7XX SMBus module should be cleared each time it
sends out a NACK signal. This patch fixes the bug that it fails to
do so.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i2c/npcm7xx_smbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c
index e7e0ba66fe..f18e311556 100644
--- a/hw/i2c/npcm7xx_smbus.c
+++ b/hw/i2c/npcm7xx_smbus.c
@@ -270,7 +270,7 @@ static void npcm7xx_smbus_recv_byte(NPCM7xxSMBusState *s)
     if (s->st & NPCM7XX_SMBCTL1_ACK) {
         trace_npcm7xx_smbus_nack(DEVICE(s)->canonical_path);
         i2c_nack(s->bus);
-        s->st &= NPCM7XX_SMBCTL1_ACK;
+        s->st &= ~NPCM7XX_SMBCTL1_ACK;
     }
     trace_npcm7xx_smbus_recv_byte((DEVICE(s)->canonical_path), s->sda);
     npcm7xx_smbus_update_irq(s);
-- 
2.37.0.170.g444d1eabd0-goog


