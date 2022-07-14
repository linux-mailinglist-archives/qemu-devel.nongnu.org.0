Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33689575512
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:34:11 +0200 (CEST)
Received: from localhost ([::1]:53330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC3f8-0002fM-B9
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3MmDQYggKClEFD0t7CB0z77z4x.v759x5D-wxEx4676z6D.7Az@flex--wuhaotsh.bounces.google.com>)
 id 1oC3ZF-0004M3-Kf
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:05 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:51109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3MmDQYggKClEFD0t7CB0z77z4x.v759x5D-wxEx4676z6D.7Az@flex--wuhaotsh.bounces.google.com>)
 id 1oC3ZE-0007T5-5d
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:05 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 q4-20020a170902dac400b0016becde3dfbso587397plx.17
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 11:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=TM8Kh0gGU2hIWoEk51Qm6WG9lPFo5JxHmzkWdY1yzZE=;
 b=p0cH6IXxkzUspP/eJTqe5KW03kk2E7qB9PtS3r7Q3gCJPA0R4DBuHl7UhHgEvRWf2o
 iGppc1bcFzVQMvXmaxAG2fIgtjpfmtaAiiIX/uNZDeAa5Jq74DmFHxs54fTGnNyPBZa+
 vKMUtD5VcSIBpbfTmjt1A0oJkP62y6OKVPtfhUNZyCqx0IvmblQPg/xMuTjI4yb/zf1b
 IG45GNNOcPJTZjJ7vHY1OFNkZ/CNwLWeoH7w5nZFxnqDlpI9e5VEFxo5uzMQ/7mD93gE
 Z9gTlZtueZQb6uW07jV1aArwpUBdrk3j4yrMppLqhJm64Wyy8qQu8QI+1vgFJdrb1ge/
 tnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=TM8Kh0gGU2hIWoEk51Qm6WG9lPFo5JxHmzkWdY1yzZE=;
 b=M062l/273tzaHSwC/dIcPWTAlWELrP9CXF1x6Y4XMWjPybT2l6+v7iicQvryxPYqqS
 0xYlDGJliQphkHUwb5egznaEs8KUpaIMzvJka28wY30vIL0jxtSlYeU8jJNaOwLlChnn
 vvU4conO1lXTnOd8lmz95VdE3tMCrcYYd9b3e+xpPK1MDiP32xZPehffjOJuKIaopEPM
 OJkNSDlVEiX7pgoW9gc8pQXrqIfTwFWxgSy16oFpUchKaXgJatx8y7yGeYXAo4FNQay1
 hp1gXk8haNkgEj0ht9r0wez2og0d8jxkx27y5q93CbNWSL0LY5d0uG9Qc2CTpTUN3r0j
 mUNA==
X-Gm-Message-State: AJIora+BDdGcYy2fnxlwCEDgxCT0bvO8K3aaC68BrwtQu0hnQ9ig00MS
 h7/8CSTBEqs9bVbnVdXsEWeAiD21f+v7Zw==
X-Google-Smtp-Source: AGRyM1tiqkW+LZRX69MsCTxdtJgFEImXitzC4obqVUIWPcgUvh9OcrRDwlVfwC7PJr6m4OEBQP8ZB5TDusWqWg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6a00:c91:b0:52a:cad7:d755 with SMTP
 id a17-20020a056a000c9100b0052acad7d755mr9830300pfv.66.1657823282162; Thu, 14
 Jul 2022 11:28:02 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:27:41 -0700
In-Reply-To: <20220714182756.85664-1-wuhaotsh@google.com>
Message-Id: <20220714182756.85664-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714182756.85664-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH 2/8] hw/i2c: Read FIFO during RXF_CTL change in NPCM7XX SMBus
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com, Titus Rwantare <titusr@google.com>,
 Corey Minyard <cminyard@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3MmDQYggKClEFD0t7CB0z77z4x.v759x5D-wxEx4676z6D.7Az@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
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

Originally we read in from SMBus when RXF_STS is cleared. However,
the driver clears RXF_STS before setting RXF_CTL, causing the SM bus
module to read incorrect amount of bytes in FIFO mode when the number
of bytes read changed. This patch fixes this issue.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Acked-by: Corey Minyard <cminyard@mvista.com>
---
 hw/i2c/npcm7xx_smbus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c
index f18e311556..1435daea94 100644
--- a/hw/i2c/npcm7xx_smbus.c
+++ b/hw/i2c/npcm7xx_smbus.c
@@ -637,9 +637,6 @@ static void npcm7xx_smbus_write_rxf_sts(NPCM7xxSMBusState *s, uint8_t value)
 {
     if (value & NPCM7XX_SMBRXF_STS_RX_THST) {
         s->rxf_sts &= ~NPCM7XX_SMBRXF_STS_RX_THST;
-        if (s->status == NPCM7XX_SMBUS_STATUS_RECEIVING) {
-            npcm7xx_smbus_recv_fifo(s);
-        }
     }
 }
 
@@ -651,6 +648,9 @@ static void npcm7xx_smbus_write_rxf_ctl(NPCM7xxSMBusState *s, uint8_t value)
         new_ctl = KEEP_OLD_BIT(s->rxf_ctl, new_ctl, NPCM7XX_SMBRXF_CTL_LAST);
     }
     s->rxf_ctl = new_ctl;
+    if (s->status == NPCM7XX_SMBUS_STATUS_RECEIVING) {
+        npcm7xx_smbus_recv_fifo(s);
+    }
 }
 
 static uint64_t npcm7xx_smbus_read(void *opaque, hwaddr offset, unsigned size)
-- 
2.37.0.170.g444d1eabd0-goog


