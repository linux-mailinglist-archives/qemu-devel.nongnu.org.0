Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E573575535
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:42:49 +0200 (CEST)
Received: from localhost ([::1]:44154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC3nT-0007Jw-Po
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3WWDQYggKCngsqdWkpodckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--wuhaotsh.bounces.google.com>)
 id 1oC3Zu-0005ZN-D8
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:46 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:55208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3WWDQYggKCngsqdWkpodckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--wuhaotsh.bounces.google.com>)
 id 1oC3Zr-00082F-PS
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:46 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 h13-20020a63e14d000000b0040df75eaa2eso1588263pgk.21
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 11:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=vhcn9HX+W8BDC3zc9EzHTKhU6VuXS2Qk41Wg69c1pG8=;
 b=U0Asrr7Jv/ZFnHlT0Qk4uee3mXE69YZfediDI5cas+O1Aoex9I2XQOXZGwEml/0roL
 VsrwY46sUpytgtCIZgJtpWTJ9cLoAa2Dnlj5j7dlTWnVhrdYF1AC9C13OevS015PAd37
 p8JpWaJjmVuUS1ZqV3A/TGPNeMppRY5xaONrU8cjkPbCkzE2NsHpGf2RUjebXB8iE1aj
 PjKSG7sB0N/U1MRcDPddHVLxtPWG1zMbGgt76hzvuk0Q7pX2D3/3gdp22PkjA/CjnyEP
 hmV4Vj0nZidqxwAYHjhNllfIncoQp8J+DoD353WP4B1w5WQpWx01zvbX2VNMTZrJtnDJ
 /akA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=vhcn9HX+W8BDC3zc9EzHTKhU6VuXS2Qk41Wg69c1pG8=;
 b=wfF8IzmiAYLvYcUNsawuKJ5P3kfWvPF2MT86tqXhgZYhWvKBqhhN7U1YHmgGzIOHns
 Weto8FlIUA+hYRzAwBFW45lSrMRWptuYACtrsLXmorW91OTKXkgOYQM1orWQPh0DicS+
 eAak6AitdN3hfspA7Zqr0dxCNSqBAnuUPtyPDfzjLyCqvUa7kjKbv7O0V7SL7eHn/eJF
 rBzqJYZKsP2uxfFnNqSLTEYWqnXMTlrVEX64O+6nMsBRrx2N/pu9swv7mjpZjOKshrQ9
 idqzCc2oGwq6ErseEDaE/05u+BgmaHNXJ6McjjhI7POKYVvF4KN8j6SLXgbHwtSbDsMs
 TQrw==
X-Gm-Message-State: AJIora/Tp8NvsCBgrtYPeJCHvlz6bIyGMSUxZ7H6TKGRCBC9ZeH/MTY3
 v0bGIZQXciQUlO5YbQfbXAnYeyH0Ny+I2Q==
X-Google-Smtp-Source: AGRyM1t2cwd2+Ip+/eEZgOIqudNV0MxEv8SbL+KCv+fnVCxvWr9gDKpN6THSAikm7dW/MaiVvWnGJMxZgFznqA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:c4f:b0:1df:a178:897f with SMTP id
 u15-20020a17090a0c4f00b001dfa178897fmr11084385pje.19.1657823321270; Thu, 14
 Jul 2022 11:28:41 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:28:29 -0700
In-Reply-To: <20220714182836.89602-1-wuhaotsh@google.com>
Message-Id: <20220714182836.89602-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714182836.89602-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH v5 1/8] hw/i2c: Clear ACK bit in NPCM7xx SMBus module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3WWDQYggKCngsqdWkpodckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--wuhaotsh.bounces.google.com;
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


