Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A833C276C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:19:33 +0200 (CEST)
Received: from localhost ([::1]:49968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1tDw-00028u-MH
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t52-0001Tx-5L
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:20 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:35486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t4r-0000tO-Mu
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:19 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 k31-20020a05600c1c9fb029021727d66d33so5114781wms.0
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=juTft1gatBMC6rpbTOnW3It8WuOd1TRakdFeysyyfkg=;
 b=VCBIJ24VStgi7VFRfkPY65w+U/nbk48wX0j4Jt77akBSDR2FYelCi3dZmT9HB2ligE
 amRElLKIXzW+Yp0TH86KGFIkN1wYdah2kWF41Zw+G/J8OK8FUValyRkY72H3SOuAyok4
 VPMv9HV3EAT1w24v1DSYTY/sTFazrsOGZw1YIEGyGoo9q9CX/9LyYpmn0HcuKmPscLh4
 J+wWfSSV8KqcBEREQi/EQMVX3ciElYMClb8erwsXYtsVUuufy5VbD1ik2mhuj9JBwulf
 4S8UcFaE7f/LfgB6g87quOGcB0olSSynCpMtnrMSU8Sb3wPCt1XJk7oVMX60ZYbMz3aK
 t4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=juTft1gatBMC6rpbTOnW3It8WuOd1TRakdFeysyyfkg=;
 b=FTvE3fEKUNUrKTfX8BnUBo5vbM2HdxVzDt98lr/tugeu9t1S7fxV/+eCu56BSuIaVm
 HlThQRSQSYfOrEvyluOh5RlDsSRak798CJr/wAasf0mmJTbJhqWn3cMLXUcYoXqpa4a9
 pdtIaPm2OwMaJgwDFjgLNAvMObeZf+eLC82KrE35pBoTPMEvC6bO1NarPiQgQT4XM4dQ
 VJV6pFVTRIoa1KhFSlnnyUHRKJ3/nWLQEEAwoSazC4hkgJUKf9O9v0W0qbUy8t1lsZGc
 0BuGfyuM6C7wTJlXYZE9a0TL7jjup5IxpqA3U3qXs0DXgWLWnbcpkC2Foodvxo2DCcZF
 yG0g==
X-Gm-Message-State: AOAM532AUrhHKnfKzBjCZDWMCsapSEnbjHvchbd0LDWq6tIzZgQpB0Ki
 tWr+qM3CeHHqLpnUIwiSAmVK7/qsE3JPuzya
X-Google-Smtp-Source: ABdhPJwgikykNBi+AVf3LxWklXRXlcgwNctVynhe68lCwXpqwm+5GUn5jAWjmK2CFbabq3rPhjLvUw==
X-Received: by 2002:a7b:c74a:: with SMTP id w10mr12650146wmk.54.1625847008197; 
 Fri, 09 Jul 2021 09:10:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x19sm5232277wmi.10.2021.07.09.09.10.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 09:10:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/17] tests/boot-serial-test: Add STM32VLDISCOVERY board
 testcase
Date: Fri,  9 Jul 2021 17:09:50 +0100
Message-Id: <20210709161003.25874-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709161003.25874-1-peter.maydell@linaro.org>
References: <20210709161003.25874-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Alexandre Iooss <erdnaxe@crans.org>

New mini-kernel test for STM32VLDISCOVERY USART1.

Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
Acked-by: Thomas Huth <thuth@redhat.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210617165647.2575955-5-erdnaxe@crans.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/boot-serial-test.c | 37 ++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index d40adddafa3..96849cec915 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -94,6 +94,41 @@ static const uint8_t kernel_nrf51[] = {
     0x1c, 0x25, 0x00, 0x40                  /* 0x4000251c = UART TXD */
 };
 
+static const uint8_t kernel_stm32vldiscovery[] = {
+    0x00, 0x00, 0x00, 0x00,                 /* Stack top address */
+    0x1d, 0x00, 0x00, 0x00,                 /* Reset handler address */
+    0x00, 0x00, 0x00, 0x00,                 /* NMI */
+    0x00, 0x00, 0x00, 0x00,                 /* Hard fault */
+    0x00, 0x00, 0x00, 0x00,                 /* Memory management fault */
+    0x00, 0x00, 0x00, 0x00,                 /* Bus fault */
+    0x00, 0x00, 0x00, 0x00,                 /* Usage fault */
+    0x0b, 0x4b,                             /* ldr  r3, [pc, #44] Get RCC */
+    0x44, 0xf2, 0x04, 0x02,                 /* movw r2, #16388 */
+    0x1a, 0x60,                             /* str  r2, [r3] */
+    0x0a, 0x4b,                             /* ldr  r3, [pc, #40] Get GPIOA */
+    0x1a, 0x68,                             /* ldr  r2, [r3] */
+    0x22, 0xf0, 0xf0, 0x02,                 /* bic  r2, r2, #240 */
+    0x1a, 0x60,                             /* str  r2, [r3] */
+    0x1a, 0x68,                             /* ldr  r2, [r3] */
+    0x42, 0xf0, 0xb0, 0x02,                 /* orr  r2, r2, #176 */
+    0x1a, 0x60,                             /* str  r2, [r3] */
+    0x07, 0x4b,                             /* ldr  r3, [pc, #26] Get BAUD */
+    0x45, 0x22,                             /* movs r2, #69 */
+    0x1a, 0x60,                             /* str  r2, [r3] */
+    0x06, 0x4b,                             /* ldr  r3, [pc, #24] Get ENABLE */
+    0x42, 0xf2, 0x08, 0x02,                 /* movw r2, #8200 */
+    0x1a, 0x60,                             /* str  r2, [r3] */
+    0x05, 0x4b,                             /* ldr  r3, [pc, #20] Get TXD */
+    0x54, 0x22,                             /* movs r2, 'T' */
+    0x1a, 0x60,                             /* str  r2, [r3] */
+    0xfe, 0xe7,                             /* b    . */
+    0x18, 0x10, 0x02, 0x40,                 /* 0x40021018 = RCC */
+    0x04, 0x08, 0x01, 0x40,                 /* 0x40010804 = GPIOA */
+    0x08, 0x38, 0x01, 0x40,                 /* 0x40013808 = USART1 BAUD */
+    0x0c, 0x38, 0x01, 0x40,                 /* 0x4001380c = USART1 ENABLE */
+    0x04, 0x38, 0x01, 0x40                  /* 0x40013804 = USART1 TXD */
+};
+
 typedef struct testdef {
     const char *arch;       /* Target architecture */
     const char *machine;    /* Name of the machine */
@@ -144,6 +179,8 @@ static testdef_t tests[] = {
     { "aarch64", "virt", "-cpu max", "TT", sizeof(kernel_aarch64),
       kernel_aarch64 },
     { "arm", "microbit", "", "T", sizeof(kernel_nrf51), kernel_nrf51 },
+    { "arm", "stm32vldiscovery", "", "T",
+      sizeof(kernel_stm32vldiscovery), kernel_stm32vldiscovery },
 
     { NULL }
 };
-- 
2.20.1


