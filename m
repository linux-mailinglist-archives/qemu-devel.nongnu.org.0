Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE710370E17
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:56:34 +0200 (CEST)
Received: from localhost ([::1]:37842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldFOT-0006xU-Or
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldF8G-0003yg-Mj
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:39:48 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldF8F-00065e-0I
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:39:48 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so4420292wmy.5
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3L2mjfQzk7TCWKcP+rhR59mB+qlFPaN9REnF5NU6NE8=;
 b=nTYLfQGO0MvkBAxazjwV3ccbO+kMFMnJS+dj/s78spd/o6+p50w4CPYvk3SxW2jvu7
 oDCXLijhUIwRYcW2MOVOtt+D+/G/25c7l+iPtvSBgBg8wgFFpjysdiN9CPknCJBFFDNj
 In1lTuoRN/OXEeMPf6kzYI+kDr8DMeZC6Z7eJFqaaATXej8pwTg0xuCDW/7Dfp27VFB0
 bVNabmiuOneSNTAPalP5AnAD4gsN2H/mW8KihXrA1kcTuvTNq2MiXZobZuHLqb86kN6Q
 lTKgjd0oLCJLNShUQXXWJIeXEoUs9I3Lf2cSQATi9/bYLfaVZr99gdzEr89ycQ+pvKc6
 Iytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3L2mjfQzk7TCWKcP+rhR59mB+qlFPaN9REnF5NU6NE8=;
 b=Ony4mlm/veTB9OrNey8DJqRB10EDBfCof2vJPlZc7Kn/bI+mo/JNUd70kWsLaBX50Y
 mzVka8ZbMt1fp0NbpLkkQMXEHbu0MUxRLohWwp0FExNxb7wIrS1mAFbe+yD24Z+iQLwg
 twpzgvBxWxul1YDpIlUJWjVB8Y6JDqoQzrE+siw8MN8Sn3iO/UNP0aYBm3KgR6Xq97H5
 riTpZc9kr1OwjZjaLOLKwj486+lyyLOD+Wcl7EcMPFu66utcIOEIBC5WqQTkIlJkZvfa
 jIIazJBy1+cbxA5qm4yKyT7DA22Ms0wVoJIvNE4PoIrzMap1GfYe+LYJkF4z3rFINSKo
 1Wyw==
X-Gm-Message-State: AOAM532Zt/zME9OAp/TkynqxBSvYcjBPWucZkFDSqvPnRvi6OkFHqfM/
 HXy+MyXa54wdCyFFti7zVi3S7RCfXgZVEp2U
X-Google-Smtp-Source: ABdhPJxXq1vlipRa4WwsHx76/fCKa9AEAt5Dy2rXeqEXvSw/SkiQTi8KcMk63dPm0ht5d0pvlVu/lQ==
X-Received: by 2002:a7b:c006:: with SMTP id c6mr17150630wmb.129.1619973585205; 
 Sun, 02 May 2021 09:39:45 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id b6sm17784264wmj.2.2021.05.02.09.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:39:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] hw/rtc/mc146818rtc: Convert to 3-phase reset
 (Resettable interface)
Date: Sun,  2 May 2021 18:39:31 +0200
Message-Id: <20210502163931.552675-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502163931.552675-1-f4bug@amsat.org>
References: <20210502163931.552675-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TYPE_MC146818_RTC is an ISA device, so its DeviceClass::reset()
handler is called automatically when its qbus parent is reset
(we don't need to register it manually).

We have 2 reset() methods: a generic one and the qdev one.
Merge them into a reset_enter handler (keeping the IRQ lowering
to a reset_hold one), and remove the qemu_register_reset() call.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/rtc/mc146818rtc.c | 42 ++++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index 5d0fcacd0c0..836c3691706 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -872,22 +872,6 @@ static void rtc_notify_suspend(Notifier *notifier, void *data)
     rtc_set_memory(ISA_DEVICE(s), 0xF, 0xFE);
 }
 
-static void rtc_reset(void *opaque)
-{
-    RTCState *s = opaque;
-
-    s->cmos_data[RTC_REG_B] &= ~(REG_B_PIE | REG_B_AIE | REG_B_SQWE);
-    s->cmos_data[RTC_REG_C] &= ~(REG_C_UF | REG_C_IRQF | REG_C_PF | REG_C_AF);
-    check_update_timer(s);
-
-    qemu_irq_lower(s->irq);
-
-    if (s->lost_tick_policy == LOST_TICK_POLICY_SLEW) {
-        s->irq_coalesced = 0;
-        s->irq_reinject_on_ack_count = 0;
-    }
-}
-
 static const MemoryRegionOps cmos_ops = {
     .read = cmos_ioport_read,
     .write = cmos_ioport_write,
@@ -962,7 +946,6 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
     memory_region_add_coalescing(&s->coalesced_io, 0, 1);
 
     qdev_set_legacy_instance_id(dev, RTC_ISA_BASE, 3);
-    qemu_register_reset(rtc_reset, s);
 
     object_property_add_tm(OBJECT(s), "date", rtc_get_date);
 
@@ -998,15 +981,32 @@ static Property mc146818rtc_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void rtc_resetdev(DeviceState *d)
+static void rtc_reset_enter(Object *obj, ResetType type)
 {
-    RTCState *s = MC146818_RTC(d);
+    RTCState *s = MC146818_RTC(obj);
 
     /* Reason: VM do suspend self will set 0xfe
      * Reset any values other than 0xfe(Guest suspend case) */
     if (s->cmos_data[0x0f] != 0xfe) {
         s->cmos_data[0x0f] = 0x00;
     }
+
+    s->cmos_data[RTC_REG_B] &= ~(REG_B_PIE | REG_B_AIE | REG_B_SQWE);
+    s->cmos_data[RTC_REG_C] &= ~(REG_C_UF | REG_C_IRQF | REG_C_PF | REG_C_AF);
+    check_update_timer(s);
+
+
+    if (s->lost_tick_policy == LOST_TICK_POLICY_SLEW) {
+        s->irq_coalesced = 0;
+        s->irq_reinject_on_ack_count = 0;
+    }
+}
+
+static void rtc_reset_hold(Object *obj)
+{
+    RTCState *s = MC146818_RTC(obj);
+
+    qemu_irq_lower(s->irq);
 }
 
 static void rtc_build_aml(ISADevice *isadev, Aml *scope)
@@ -1033,11 +1033,13 @@ static void rtc_build_aml(ISADevice *isadev, Aml *scope)
 static void rtc_class_initfn(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     ISADeviceClass *isa = ISA_DEVICE_CLASS(klass);
 
     dc->realize = rtc_realizefn;
-    dc->reset = rtc_resetdev;
     dc->vmsd = &vmstate_rtc;
+    rc->phases.enter = rtc_reset_enter;
+    rc->phases.hold = rtc_reset_hold;
     isa->build_aml = rtc_build_aml;
     device_class_set_props(dc, mc146818rtc_properties);
 }
-- 
2.26.3


