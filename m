Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBB3537239
	for <lists+qemu-devel@lfdr.de>; Sun, 29 May 2022 20:47:17 +0200 (CEST)
Received: from localhost ([::1]:59426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvNwa-00043D-AT
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 14:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nvNq7-0006b4-O7; Sun, 29 May 2022 14:40:35 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nvNq6-0002GU-47; Sun, 29 May 2022 14:40:35 -0400
Received: by mail-wr1-x430.google.com with SMTP id e25so1407064wra.11;
 Sun, 29 May 2022 11:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6HztDJBzf0Fp93vOy8s8PCk7aEO7ZIXWGwPqPqGSnVI=;
 b=n+r5zsoMkA2VBM/JHXzix9H1JrPIjwGyaoggXxwzVDrOUt+YfqO6+WAtlEAjRH0kOf
 075p0QA5Wi9Ws7OjCSD4CP3GygnOHDJrEF5uwdkRyGNgj/85PNSKV3lBG4r+rGX2eSyI
 1bMiNpIXiDNzn0oS5LNidT95pNcHolL7gC3WWDkV3lJKEvG1fg09RIetiDgvdP0IK5ln
 b0ZLqikMlLjAClXEfNllvDzGWeb5/d08+mkyyShephru5Oq+xrlf0Fhq3O5OxGSzI0wD
 5az1OgG7y0uSUwQ8kk3xvKZJaoOKhjFJMURW1LjlZTUA31AFvEpkcwQedGKmyDJVL81O
 bM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6HztDJBzf0Fp93vOy8s8PCk7aEO7ZIXWGwPqPqGSnVI=;
 b=s/nE8/OiPOsf1p1kvWOkOqRcSLc+Mp6MSdSPOb/Z0JCM6gxvMn2rxyh//WxSOXYoMo
 4/3sch+TfXr0GL1lAbSj2CHtnz9Lnl4eu0ke/wqc923LVdz/my+Xw01kFva5TPyU0d0m
 XMpUBT4vTZgYhUteVJP0DX4QhnXYqG+bTjwyS8oM1H04AsDrezbWAeOq+Ad9XLY6gzsq
 HvfN+Mc7ggCR1m8xOacd0YNrCcPKGpX4PZwRwy1SmQT/XckxSG1KRVOU32xp29lXu2Tl
 zgndy4Ku3DXTFQNVu076ljKB8h791/wgPHcFNs57tmgi8xkFigWUyYqUEOc3KZHhbIZy
 vpow==
X-Gm-Message-State: AOAM533GH1oh5j5xQRIr7kD9sCzw/ykBW2FunNpjOmTdOjrfXKDYGU23
 XNRrGOdrehaQBsE3GB998affk9VyA/4g4b1S
X-Google-Smtp-Source: ABdhPJyRW8Xty5Fa7nezA5eIZQx/lUnuy3WP1gCaAdlOdA5Q5w/dl0d1dV3WtSJ8W7M0UXze91j6UA==
X-Received: by 2002:adf:9cc2:0:b0:20f:e59a:ec41 with SMTP id
 h2-20020adf9cc2000000b0020fe59aec41mr26732038wre.124.1653849632255; 
 Sun, 29 May 2022 11:40:32 -0700 (PDT)
Received: from osoxes.fritz.box (pd9ed79c4.dip0.t-ipconnect.de.
 [217.237.121.196]) by smtp.gmail.com with ESMTPSA id
 g13-20020a5d64ed000000b002100e86319asm7341049wri.78.2022.05.29.11.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 11:40:32 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v3 3/3] rtc/mc146818rtc: QOM'ify io_base offset
Date: Sun, 29 May 2022 20:40:06 +0200
Message-Id: <20220529184006.10712-4-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220529184006.10712-1-shentey@gmail.com>
References: <20220529184006.10712-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x430.google.com
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
index f235c2ddbe..5f458a881e 100644
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
@@ -1028,7 +1031,7 @@ static void rtc_build_aml(ISADevice *isadev, Aml *scope)
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


