Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C4054743E
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:30:56 +0200 (CEST)
Received: from localhost ([::1]:44550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzzKR-0002Sn-QV
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyTz-0006po-Ej
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:36:43 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:36107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyTx-0006nd-PU
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:36:43 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 r187-20020a1c44c4000000b0039c76434147so2247664wma.1
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7rOgS1ICNRh/fyv1JCms3RmrzJ1lVycCbSy1dn78KVc=;
 b=BSH0pT1Mux87MV7rzuzUWfAdLXGCEDpcgNmqVCOGkIqu+caeZAT/Z0XGNDFVL9f9yD
 wIYVi5/rkzzPXp98QPMSaqiFcmoBvd/dn8iIbYw/+rDfyDwtolo+C2tq5JLkDrqbKn/L
 zrZE3G2UDjAWwf4uDegU54aWkxY8aEQ4t8gfyTsLIt5ZjJFRbQ0nfAf0pwxIdU6wy/Dk
 Ff69MMAf9uLxjbps9zUAaRhYj9fQSbPt1G6rQloINULc9UOAybl6nZ0diIkGgeFEddNJ
 TdSExgfycrJulfc3IDMuNQimpqIhOi85fkyISL7XyXtiKX0XeMuWaCaabrtxFdcouuuX
 fwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7rOgS1ICNRh/fyv1JCms3RmrzJ1lVycCbSy1dn78KVc=;
 b=glvdqGFZuYP50pHWHrxFAiYOLdqesVNf1ZyJrdREwvz8lTaUC2Ujcl6GWQNH6mfObr
 du9fX/ydoHvmQNnDa0TlXkTOO9ilY9LtrIAllabs8f+T0JthT+ygUqRtHSBpMR9ws1IA
 cM+Bu4TjrPh2JIR/eLSR/kIkVxxZM7IwCZyNlQg05tKFa5xyVn0CipZNAQRTMgmGL6BN
 Ksbi0iDYKvzu2v3Zz2NEcvoVdNjD1EF1VvKi4mkkVSFPLYfL3mChidIkTBy4lLyx3dzk
 bnh2YWvvoeJMwvMxqf4r14zjCDqbYGmlZaagimRCJRlHC8L5Clua8wUaw+5YxfpeNa0k
 7I/A==
X-Gm-Message-State: AOAM531mi5Dd2HXhOK4lzSvRnMiLlOLssmdGriTGa5hhBtSqPO4ry0eU
 uNH9JoQk9R9HuLpZOHE4NA6oPM58p/8=
X-Google-Smtp-Source: ABdhPJxQWrtZdrCdZamHsCPuvDNeSo6xS/aVyxQyNbhNU3t6pvJDI1hGNLmTHAQKT9FVf+1HgSAT7w==
X-Received: by 2002:a05:600c:214c:b0:39c:43b9:9d5f with SMTP id
 v12-20020a05600c214c00b0039c43b99d5fmr4161506wml.56.1654943800294; 
 Sat, 11 Jun 2022 03:36:40 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 h12-20020a05600c2cac00b003942a244f40sm6545987wmc.25.2022.06.11.03.36.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:36:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 40/49] hw/rtc/mc146818rtc: QOM'ify io_base offset
Date: Sat, 11 Jun 2022 12:33:03 +0200
Message-Id: <20220611103312.67773-41-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Bernhard Beschow <shentey@gmail.com>

Exposing the io_base offset as a QOM property not only allows it to be
configurable but also to be displayed in HMP:

Before:

(qemu) info qtree
       ...
          dev: mc146818rtc, id ""
            gpio-out "" 1
            base_year = 0 (0x0)
            irq = 8 (0x8)
            lost_tick_policy = "discard"

After:

          dev: mc146818rtc, id ""
            gpio-out "" 1
            base_year = 0 (0x0)
            iobase = 112 (0x70)
            irq = 8 (0x8)
            lost_tick_policy = "discard"

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220529184006.10712-4-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/microvm-dt.c         | 2 +-
 hw/rtc/mc146818rtc.c         | 9 ++++++---
 include/hw/rtc/mc146818rtc.h | 2 +-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
index 287818c641..b3049e4f9f 100644
--- a/hw/i386/microvm-dt.c
+++ b/hw/i386/microvm-dt.c
@@ -210,7 +210,7 @@ static void dt_add_isa_rtc(MicrovmMachineState *mms, ISADevice *dev)
 {
     const char compat[] = "motorola,mc146818";
     uint32_t irq = object_property_get_uint(OBJECT(dev), "irq", &error_fatal);
-    hwaddr base = RTC_ISA_BASE;
+    hwaddr base = object_property_get_uint(OBJECT(dev), "iobase", &error_fatal);
     hwaddr size = 8;
     char *nodename;
 
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index ef9765bb8f..1ebb412479 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -74,6 +74,8 @@
 #define RTC_CLOCK_RATE            32768
 #define UIP_HOLD_LENGTH           (8 * NANOSECONDS_PER_SECOND / 32768)
 
+#define RTC_ISA_BASE 0x70
+
 static void rtc_set_time(RTCState *s);
 static void rtc_update_time(RTCState *s);
 static void rtc_set_cmos(RTCState *s, const struct tm *tm);
@@ -941,7 +943,7 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
     qemu_register_suspend_notifier(&s->suspend_notifier);
 
     memory_region_init_io(&s->io, OBJECT(s), &cmos_ops, s, "rtc", 2);
-    isa_register_ioport(isadev, &s->io, RTC_ISA_BASE);
+    isa_register_ioport(isadev, &s->io, s->io_base);
 
     /* register rtc 0x70 port for coalesced_pio */
     memory_region_set_flush_coalesced(&s->io);
@@ -950,7 +952,7 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&s->io, 0, &s->coalesced_io);
     memory_region_add_coalescing(&s->coalesced_io, 0, 1);
 
-    qdev_set_legacy_instance_id(dev, RTC_ISA_BASE, 3);
+    qdev_set_legacy_instance_id(dev, s->io_base, 3);
 
     object_property_add_tm(OBJECT(s), "date", rtc_get_date);
 
@@ -983,6 +985,7 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
 
 static Property mc146818rtc_properties[] = {
     DEFINE_PROP_INT32("base_year", RTCState, base_year, 1980),
+    DEFINE_PROP_UINT16("iobase", RTCState, io_base, RTC_ISA_BASE),
     DEFINE_PROP_UINT8("irq", RTCState, isairq, RTC_ISA_IRQ),
     DEFINE_PROP_LOSTTICKPOLICY("lost_tick_policy", RTCState,
                                lost_tick_policy, LOST_TICK_POLICY_DISCARD),
@@ -1028,7 +1031,7 @@ static void rtc_build_aml(AcpiDevAmlIf *adev, Aml *scope)
      * does, even though qemu only responds to the first two ports.
      */
     crs = aml_resource_template();
-    aml_append(crs, aml_io(AML_DECODE16, RTC_ISA_BASE, RTC_ISA_BASE,
+    aml_append(crs, aml_io(AML_DECODE16, s->io_base, s->io_base,
                            0x01, 0x08));
     aml_append(crs, aml_irq_no_flags(s->isairq));
 
diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
index 33d85753c0..1db0fcee92 100644
--- a/include/hw/rtc/mc146818rtc.h
+++ b/include/hw/rtc/mc146818rtc.h
@@ -26,6 +26,7 @@ struct RTCState {
     uint8_t cmos_data[128];
     uint8_t cmos_index;
     uint8_t isairq;
+    uint16_t io_base;
     int32_t base_year;
     uint64_t base_rtc;
     uint64_t last_update;
@@ -49,7 +50,6 @@ struct RTCState {
 };
 
 #define RTC_ISA_IRQ 8
-#define RTC_ISA_BASE 0x70
 
 ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,
                              qemu_irq intercept_irq);
-- 
2.36.1


