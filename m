Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 357BC4CFBE4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:50:11 +0100 (CET)
Received: from localhost ([::1]:35528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAwM-0002Ke-A3
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:50:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAMO-0004FO-HS
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:13:00 -0500
Received: from [2a00:1450:4864:20::32c] (port=44586
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAMN-0004MP-0G
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:13:00 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so8942048wmb.3
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zwKcr0BxuWom7IkiNcPhPZK4xdCumUneF31LB5FuiUY=;
 b=HkgfJrUF7Lj9+nmVbUNfzF9UP3gz0PeSpBl5h2Htw3Voq6pekfjWHjD6X1K0qa7Bzw
 jBtkzP5AhfcomeuhY3EMeRARyX3VRpLqM89R4gJKCQ39LWgw58xgxsy9SfLDd9S3tfgm
 tSu5K+NQ+P61FSDrnSHELbzFTBTgpemMYowz9WGezL+ZFve9/ApXsETnZEqsOLoS9LGl
 hefg8pZR2G7HyFlKqzd/5AjqmKObBX2tyivFsAMo1jhd6RFlFbXS7GYtFnWKVCaCub+T
 MsZQXzXlWEIkNJXVIXaBNm2R/9rfvrAK793XNAHLBS+jKGy2VDOqCzPhxucd6Cdc1HXd
 XDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zwKcr0BxuWom7IkiNcPhPZK4xdCumUneF31LB5FuiUY=;
 b=YZkm7RDJ8UayhDxI6cxtNNIMgBgL2QTS+n5SXEv8JnHPdfxK1rqpJ+FCOlkFU72ub4
 Rg4N+VMQdRWp3X7d9hBXsK7ozMruVNfP6sdF32Aoho2cFxD3nlAx/ddnHNHIHV/VHlT3
 XuoqY9K0//QbyB/eAevN78wmVw4GM2saniS0tHpJyPhiku17nF64WtHPi43DI5qC0d3s
 eMlBK5Wv8C3pp0Ja3iKqV3VJ2Zn8W3jTNjp8Rwn3ZJhFMGiHIXJNZftVk6Q/EnKVNHQE
 2fN5OHlhry2fvOwRg/vEbUkVBVXxYfvOZhvF1jCLi6iRg6ubS9t4f6BWj+7U3f+6Ajns
 OlLQ==
X-Gm-Message-State: AOAM532kfBdk/ghJnWGoNmN3jcfFAbmzJyYwqezf2zxaYdxsMAm4MJnm
 kMtus9lfSgSrFUFiykRfONzQQIgmyAM=
X-Google-Smtp-Source: ABdhPJwpAw+/D02VLkC5oW44AssJPO+7fI9hMAa1OAlJp6ECe7se2fPd+geO6QRw/XtxWhq/h0+LkA==
X-Received: by 2002:a05:600c:1994:b0:389:bcf5:6e79 with SMTP id
 t20-20020a05600c199400b00389bcf56e79mr250439wmq.43.1646647977298; 
 Mon, 07 Mar 2022 02:12:57 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u10-20020adfa18a000000b001f04c24afe7sm10857180wru.41.2022.03.07.02.12.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 02:12:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/16] hw/rtc/mc146818rtc: QOM'ify IRQ number
Date: Mon,  7 Mar 2022 11:12:01 +0100
Message-Id: <20220307101207.90369-11-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
References: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

Exposing the IRQ number as a QOM property not only allows it to be
configurable but also to be displayed in HMP:

Before:

(qemu) info qtree
       ...
          dev: mc146818rtc, id ""
            gpio-out "" 1
            base_year = 0 (0x0)
            lost_tick_policy = "discard"

After:

          dev: mc146818rtc, id ""
            gpio-out "" 1
            base_year = 0 (0x0)
            irq = 8 (0x8)
            lost_tick_policy = "discard"

The reason the IRQ number didn's show up before is that this device does not
call isa_init_irq().

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220301220037.76555-2-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c               |  2 +-
 hw/rtc/mc146818rtc.c         | 13 +++++++++++--
 include/hw/rtc/mc146818rtc.h |  1 +
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index f876c71750..fc3c8b3fd1 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -216,7 +216,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
         return;
     }
-    isa_init_irq(ISA_DEVICE(&s->rtc), &s->rtc.irq, RTC_ISA_IRQ);
+    isa_init_irq(ISA_DEVICE(&s->rtc), &s->rtc.irq, s->rtc.isairq);
 }
 
 static void piix4_init(Object *obj)
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index ac9a60c90e..f235c2ddbe 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -912,6 +912,11 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
         s->base_year = 0;
     }
 
+    if (s->isairq >= ISA_NUM_IRQS) {
+        error_setg(errp, "Maximum value for \"irq\" is: %u", ISA_NUM_IRQS - 1);
+        return;
+    }
+
     rtc_set_date_from_host(isadev);
 
     switch (s->lost_tick_policy) {
@@ -957,15 +962,17 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
 {
     DeviceState *dev;
     ISADevice *isadev;
+    RTCState *s;
 
     isadev = isa_new(TYPE_MC146818_RTC);
     dev = DEVICE(isadev);
+    s = MC146818_RTC(isadev);
     qdev_prop_set_int32(dev, "base_year", base_year);
     isa_realize_and_unref(isadev, bus, &error_fatal);
     if (intercept_irq) {
         qdev_connect_gpio_out(dev, 0, intercept_irq);
     } else {
-        isa_connect_gpio_out(isadev, 0, RTC_ISA_IRQ);
+        isa_connect_gpio_out(isadev, 0, s->isairq);
     }
 
     object_property_add_alias(qdev_get_machine(), "rtc-time", OBJECT(isadev),
@@ -976,6 +983,7 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
 
 static Property mc146818rtc_properties[] = {
     DEFINE_PROP_INT32("base_year", RTCState, base_year, 1980),
+    DEFINE_PROP_UINT8("irq", RTCState, isairq, RTC_ISA_IRQ),
     DEFINE_PROP_LOSTTICKPOLICY("lost_tick_policy", RTCState,
                                lost_tick_policy, LOST_TICK_POLICY_DISCARD),
     DEFINE_PROP_END_OF_LIST(),
@@ -1011,6 +1019,7 @@ static void rtc_reset_hold(Object *obj)
 
 static void rtc_build_aml(ISADevice *isadev, Aml *scope)
 {
+    RTCState *s = MC146818_RTC(isadev);
     Aml *dev;
     Aml *crs;
 
@@ -1021,7 +1030,7 @@ static void rtc_build_aml(ISADevice *isadev, Aml *scope)
     crs = aml_resource_template();
     aml_append(crs, aml_io(AML_DECODE16, RTC_ISA_BASE, RTC_ISA_BASE,
                            0x01, 0x08));
-    aml_append(crs, aml_irq_no_flags(RTC_ISA_IRQ));
+    aml_append(crs, aml_irq_no_flags(s->isairq));
 
     dev = aml_device("RTC");
     aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0B00")));
diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
index 5b45b22924..deef93f89a 100644
--- a/include/hw/rtc/mc146818rtc.h
+++ b/include/hw/rtc/mc146818rtc.h
@@ -25,6 +25,7 @@ struct RTCState {
     MemoryRegion coalesced_io;
     uint8_t cmos_data[128];
     uint8_t cmos_index;
+    uint8_t isairq;
     int32_t base_year;
     uint64_t base_rtc;
     uint64_t last_update;
-- 
2.34.1


