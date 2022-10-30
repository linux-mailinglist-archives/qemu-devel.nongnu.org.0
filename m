Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2C0612D59
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:30:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGow-0001of-De; Sun, 30 Oct 2022 18:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGoh-0001gT-Gh
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:30:07 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGoe-0007gJ-R3
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:30:07 -0400
Received: by mail-wm1-x331.google.com with SMTP id v7so460309wmn.0
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bVCdaSuOxhsuXXra2TyjgvcXSXdswcYJ8KSoBlNRvhg=;
 b=c3ScNOtXd5T6zHAE0PtROwcTCjUvhho9ydshwqMI71yNsEFzxCyNpHTn0viFrflsAz
 GnplR4AbG+cnvVwo5UeboT1KwG9wDWRhpyKH0JLmos8zSWvHLyEO6TLtrwcj77KjAr2E
 mPiH61TK6Sxb119bK+rj4C9IotnwwbmKrZgiorkILJEVddClxqpuWxlFb6xJqtcVUrSm
 c3lPQCt2oqVTvRvKNMK2Ow2vd2GW7RzH39i07jLDHUp0lPNWQb44mhH786U4Q7gEjVEc
 9xVrQSYV1G2eZ7755L9LNL9dLrDLQSgw7owk+N0iP07ARfhOX2Tc2HOqBKt/dibT7UsE
 DkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bVCdaSuOxhsuXXra2TyjgvcXSXdswcYJ8KSoBlNRvhg=;
 b=KVx266m/wLaHwk5pW2F1zySPi81tb3Q7PZt58l1ausuaqYd5Ly9O4TTBThQhQaJypU
 H++8+1lLGQB0zMh8rujTBKMTBxCOB6ljCHlRIIrzChd0EkYxmhqWd+DKD1ZcL422g683
 LvrduxtYyZyRjer+xXGZFzk2qNI4HNxQrjry6ou7smxIR+5EO2sw+KtHFI35P8qGzZCW
 lNDMR3pf+ZQy8GAjxKLD1F6WAw09V1a2yUIrtjPyUi9mn0vSGJfDSmjqOzKi+xH29OWI
 QnIzn2ITKNMY1ooHCvxPoizlg9jDioYBfelk2J/DgqLhNRVpW0RvC0m7rODEsdLp6TnO
 9ISQ==
X-Gm-Message-State: ACrzQf2KS7P4z3j1/8JpEDAxzvx61tI99o8dZL875QYxiwqGhviiV9Xv
 UOX1f5Ja78/JeoorNdbWm9O+dzMEKIq5Xg==
X-Google-Smtp-Source: AMsMyM6wg26LOzbVY97b20mBtx1D5bHtVgeIkIjXIO3g0AfTg8GaQZA5VdIAbEh9QW+TGPjkt1dcDA==
X-Received: by 2002:a05:600c:19cc:b0:3c6:fbb9:caab with SMTP id
 u12-20020a05600c19cc00b003c6fbb9caabmr16191738wmq.182.1667169003260; 
 Sun, 30 Oct 2022 15:30:03 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a5d464a000000b002365cd93d05sm5080239wrs.102.2022.10.30.15.30.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:30:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 12/55] hw/isa/vt82c686: Embed RTCState in host device
Date: Sun, 30 Oct 2022 23:27:58 +0100
Message-Id: <20221030222841.42377-13-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

Embed the rtc in the host device, analoguous to the other child devices
and analoguous to PIIX4.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220901114127.53914-13-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 91686e9570..48cd4d0036 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -550,6 +550,7 @@ struct ViaISAState {
     qemu_irq cpu_intr;
     qemu_irq *isa_irqs;
     ViaSuperIOState via_sio;
+    RTCState rtc;
     PCIIDEState ide;
     UHCIState uhci[2];
     ViaPMState pm;
@@ -571,6 +572,7 @@ static void via_isa_init(Object *obj)
 {
     ViaISAState *s = VIA_ISA(obj);
 
+    object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, TYPE_VIA_IDE);
     object_initialize_child(obj, "uhci1", &s->uhci[0], TYPE_VT82C686B_USB_UHCI);
     object_initialize_child(obj, "uhci2", &s->uhci[1], TYPE_VT82C686B_USB_UHCI);
@@ -624,7 +626,15 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     isa_bus_irqs(isa_bus, s->isa_irqs);
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
     i8257_dma_init(isa_bus, 0);
-    mc146818_rtc_init(isa_bus, 2000, NULL);
+
+    /* RTC */
+    qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
+    if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
+        return;
+    }
+    object_property_add_alias(qdev_get_machine(), "rtc-time", OBJECT(&s->rtc),
+                              "date");
+    isa_connect_gpio_out(ISA_DEVICE(&s->rtc), 0, s->rtc.isairq);
 
     for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
         if (i < PCI_COMMAND || i >= PCI_REVISION_ID) {
-- 
2.37.3


