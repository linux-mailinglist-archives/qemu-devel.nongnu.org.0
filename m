Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5C24E11A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 09:22:16 +0200 (CEST)
Received: from localhost ([::1]:55256 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heDi3-0007Ja-46
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 03:11:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35278)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <joel.stan@gmail.com>) id 1heDfO-0006Ew-V2
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 03:09:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1heDUr-0007V2-Pr
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 02:58:07 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:43491)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1heDPr-0008T2-4L; Fri, 21 Jun 2019 02:52:56 -0400
Received: by mail-pg1-x542.google.com with SMTP id f25so2872727pgv.10;
 Thu, 20 Jun 2019 23:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QrPb1I4hGgIdnSQDxicKRNj7Vi+MgOZceJ5iUqGk3p8=;
 b=t9MEcABTrVvPUw9UNLxvsfUsdMWlb/UtFwiat6FbeB+dYpuHLBwxy6AcI79w3NzdoZ
 Gr5/uV3k4hCNkG1szSwqGRi+2gMCii0O9HNuBHiZ1gZZzM7CHuKj4g6Pmni3CRcHGwsC
 YFAYSawf/C2DcIDzN65JXzAVjvj80Ghl63X9std2Eze5h/ftCN0KXxaRaF925VJAgHjJ
 OzMhJiGK6wypRtnn1XwSMcc/WSiwQXJvXZSEwNFV1KDEHQBN4tyTLSQ7QgeQD/PMWPyv
 bHCNKIPB1Lc7ClLloZl7QxVNmQYoxHPMq9UJQFg15epwtS8T5jyRmzua30nSo0ZHI0wM
 pFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=QrPb1I4hGgIdnSQDxicKRNj7Vi+MgOZceJ5iUqGk3p8=;
 b=GJmPjYNaL/mKCdtEDVtImOYUjJAR+JKJBSZuOzaZHbp09M3wPmNfvklO+JuaQoBgGQ
 5seyOpQy4tr7ax8BEd5AFtauUju3IE3B3mO9y0eNtG69r50UgHeeUTClNoIiTCCZtUhx
 P3N27+k2PPjYDnPWr/GtsQOlbT4inpsP3Ip7OL8Nrw75Lwx7QHzkxQ4B2JAt81T9EhL5
 6yYGmr6uy/QwgNUmvSwICtHGbNy8LMrBs+HoHDyAfgZf+DDPEYs/O7xchHM/CRD/Q4hn
 F7RDndgqOwMZ0hnuLOzoYxWxM7o0ykkrZNuz1dW206/e2jeeTa4Epjpe3nyv0kf5PB26
 wneg==
X-Gm-Message-State: APjAAAXm+uAXyKZDQBSDszvlApTvGEGUSZbnkqkU7c/AzVpRFAjj5++/
 A2E3Dknes3z0vW9XxUmUhZA=
X-Google-Smtp-Source: APXvYqwPUo8K7Yy7BSHo3QAwaJI/jWlT/qI8OzIdy8OKTWtnltzZxVslVtS0j2dRYzh4SOU4rm+twQ==
X-Received: by 2002:a63:1d5:: with SMTP id 204mr17261028pgb.207.1561099972851; 
 Thu, 20 Jun 2019 23:52:52 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id m19sm2833108pff.153.2019.06.20.23.52.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 23:52:52 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jun 2019 16:22:42 +0930
Message-Id: <20190621065242.32535-1-joel@jms.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-devel] [PATCH v2] aspeed: Link SCU to the watchdog
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ast2500 uses the watchdog to reset the SDRAM controller. This
operation is usually performed by u-boot's memory training procedure,
and it is enabled by setting a bit in the SCU and then causing the
watchdog to expire. Therefore, we need the watchdog to be able to
access the SCU's register space.

This causes the watchdog to not perform a system reset when the bit is
set. In the future it could perform a reset of the SDMC model.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
v2: rebase on upstream, rework commit message
---
 hw/arm/aspeed_soc.c              |  2 ++
 hw/watchdog/wdt_aspeed.c         | 20 ++++++++++++++++++++
 include/hw/watchdog/wdt_aspeed.h |  1 +
 3 files changed, 23 insertions(+)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index a2ea8c748449..ddd5dfacd7d6 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -155,6 +155,8 @@ static void aspeed_soc_init(Object *obj)
                               sizeof(s->wdt[i]), TYPE_ASPEED_WDT);
         qdev_prop_set_uint32(DEVICE(&s->wdt[i]), "silicon-rev",
                                     sc->info->silicon_rev);
+        object_property_add_const_link(OBJECT(&s->wdt[i]), "scu",
+                                       OBJECT(&s->scu), &error_abort);
     }
 
     sysbus_init_child_obj(obj, "ftgmac100", OBJECT(&s->ftgmac100),
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 4a8409f0daf5..57fe24ae6b1f 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -44,6 +44,9 @@
 
 #define WDT_RESTART_MAGIC               0x4755
 
+#define SCU_RESET_CONTROL1              (0x04 / 4)
+#define    SCU_RESET_SDRAM              BIT(0)
+
 static bool aspeed_wdt_is_enabled(const AspeedWDTState *s)
 {
     return s->regs[WDT_CTRL] & WDT_CTRL_ENABLE;
@@ -222,6 +225,13 @@ static void aspeed_wdt_timer_expired(void *dev)
 {
     AspeedWDTState *s = ASPEED_WDT(dev);
 
+    /* Do not reset on SDRAM controller reset */
+    if (s->scu->regs[SCU_RESET_CONTROL1] & SCU_RESET_SDRAM) {
+        timer_del(s->timer);
+        s->regs[WDT_CTRL] = 0;
+        return;
+    }
+
     qemu_log_mask(CPU_LOG_RESET, "Watchdog timer expired.\n");
     watchdog_perform_action();
     timer_del(s->timer);
@@ -233,6 +243,16 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     AspeedWDTState *s = ASPEED_WDT(dev);
+    Error *err = NULL;
+    Object *obj;
+
+    obj = object_property_get_link(OBJECT(dev), "scu", &err);
+    if (!obj) {
+        error_propagate(errp, err);
+        error_prepend(errp, "required link 'scu' not found: ");
+        return;
+    }
+    s->scu = ASPEED_SCU(obj);
 
     if (!is_supported_silicon_rev(s->silicon_rev)) {
         error_setg(errp, "Unknown silicon revision: 0x%" PRIx32,
diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index 88d8be4f78d6..daef0c0e230b 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -27,6 +27,7 @@ typedef struct AspeedWDTState {
     MemoryRegion iomem;
     uint32_t regs[ASPEED_WDT_REGS_MAX];
 
+    AspeedSCUState *scu;
     uint32_t pclk_freq;
     uint32_t silicon_rev;
     uint32_t ext_pulse_width_mask;
-- 
2.20.1


