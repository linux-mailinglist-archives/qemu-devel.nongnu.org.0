Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7BE547A40
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 15:05:13 +0200 (CEST)
Received: from localhost ([::1]:41518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0NHD-0007W9-Q2
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 09:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o0NFv-0006fV-7p
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 09:03:51 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:43001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o0NFt-0007my-EE
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 09:03:50 -0400
Received: by mail-pl1-x62d.google.com with SMTP id f8so2936761plo.9
 for <qemu-devel@nongnu.org>; Sun, 12 Jun 2022 06:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UrsX08Obu5Jcmo8A7FY6gAY9AY+XftNQGr4c5PBHozc=;
 b=QnEqpLSvCRe4jGHupl5/vy43fJlwkKNN2cvd6GNoCbRwR5VBo0JW3T1FAYN3cut057
 rnzZ85LblUhuEwqGV4AwU9kIWVh89M5j3xsJqX1a8v9xZ5HHCMAJhubWnqdzZX/mhThf
 ahjmS/CRT1XJBbvORuDifX16PaZ9NGEmOEAlJ4QSJlljqTLMC8tuWR4v5HED4jjD38Lr
 9AfnlwVcyFxxSGt5Z/gPqaEhaldqYxUCmkY2Sxuf3kOydfC7du4vZRl/dVzENY2pRsQf
 OTY1bdV7d/ZKcyvDwQ9uWYz0AcxnS0LD+Bmz8dCQ+TXAu7mLq0DCR7WNXDHzvRsaHHyu
 gAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UrsX08Obu5Jcmo8A7FY6gAY9AY+XftNQGr4c5PBHozc=;
 b=tKnqkCVt3QRva2FRILdj9ohDgU1XORZehDvUheT/ksIXARG4uGXTyMPNDEp1KQRL2R
 Zohlklf1HrRtUtJTDSpzUbZReeH3LrAabwJ933eujeXeVlh2NGd7yLD5Ad8fEdiVi3I8
 sIcJ08v6Oka+nB09YenegXwPTo0XV18m8+du3y+R7UGgdSVivK7DFvx6R5gclt1uQZhb
 myyMTOqYR8fLplertzaJhszfFdiZ4uStN0emqvVBsrYAvi/e3rVgrRC4WHVJ+U2iIhNK
 9zXmaXQOmXfRNkGTKXbpADTTOJDckYdItyb8dbTE00q9m7crM7YTOEtuZfqIGu0lW/2E
 2oRA==
X-Gm-Message-State: AOAM531GxpBxKtkwt91ss/teWs6HuHKI83Fk8CWZqzzLyY3qBfpodBsr
 5b8rbVZgdFrqHlvAjXbxFQzvcbPhVbw=
X-Google-Smtp-Source: ABdhPJzezk/anYteAtaAXIDf/3Mup8jbG6gw4okzgcrcaOqQCEx8PJS4L/CUG54cqVnKp0oejexFTw==
X-Received: by 2002:a17:902:bc84:b0:167:80c6:aedd with SMTP id
 bb4-20020a170902bc8400b0016780c6aeddmr34505876plb.97.1655039026696; 
 Sun, 12 Jun 2022 06:03:46 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 bl2-20020a17090b098200b001e30a16c609sm3118400pjb.21.2022.06.12.06.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 06:03:45 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 Stafford Horne <shorne@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] goldfish_rtc: Add endianness property
Date: Sun, 12 Jun 2022 22:03:33 +0900
Message-Id: <20220612130333.257213-1-shorne@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=shorne@gmail.com; helo=mail-pl1-x62d.google.com
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

Add an endianness property to allow configuring the RTC as either
native, little or big endian.

Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
In a recent mail thread[0] it was discussed that future users of goldfish devices
should use little-endian rather than native endian.  This is to avoid having to
define special ioread/write routines in the Linux kernel as the default of the
Linux kernel is to use little-endian.

I have defined a property to allow us to make this change the endianness of the
device at initialization time.  For OpenRISC we can now set the qemu device
endianness property to little-endian and the device works.

For now I kept the default as DEVICE_NATIVE_ENDIAN for illustration purposes I
could also do:

 - Add the "endianness" property to all goldfish devices.
 - Switch the default to LITTLE_ENDIAN and just set BIG_ENDIAN for m68k only.
 - Just the bare minimum, using this patch and also set little-endian in
   OpenRISC.
 - Just drop this patch and use BIG_ENDIAN access for goldfish in the kernel for
   OpenRISC like m68k does.

I have tested this with the OpenRISC virt platform[1] available here (now with pci
support).

[0] https://lore.kernel.org/all/CAK8P3a13PTsMExyXZm5sZM3WBK-8hoNFjYoi19pHmKKCJQmHeA@mail.gmail.com/
[1] https://github.com/stffrdhrn/qemu/commits/or1k-virt-2

 hw/rtc/goldfish_rtc.c         | 45 ++++++++++++++++++++++++++++-------
 include/hw/rtc/goldfish_rtc.h |  2 ++
 2 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/hw/rtc/goldfish_rtc.c b/hw/rtc/goldfish_rtc.c
index 35e493be31..ab1e15a3e2 100644
--- a/hw/rtc/goldfish_rtc.c
+++ b/hw/rtc/goldfish_rtc.c
@@ -216,14 +216,34 @@ static int goldfish_rtc_post_load(void *opaque, int version_id)
     return 0;
 }
 
-static const MemoryRegionOps goldfish_rtc_ops = {
-    .read = goldfish_rtc_read,
-    .write = goldfish_rtc_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-    .valid = {
-        .min_access_size = 4,
-        .max_access_size = 4
-    }
+static const MemoryRegionOps goldfish_rtc_ops[3] = {
+    [DEVICE_NATIVE_ENDIAN] = {
+        .read = goldfish_rtc_read,
+        .write = goldfish_rtc_write,
+        .endianness = DEVICE_NATIVE_ENDIAN,
+        .valid = {
+            .min_access_size = 4,
+            .max_access_size = 4
+        }
+    },
+    [DEVICE_LITTLE_ENDIAN] = {
+        .read = goldfish_rtc_read,
+        .write = goldfish_rtc_write,
+        .endianness = DEVICE_LITTLE_ENDIAN,
+        .valid = {
+            .min_access_size = 4,
+            .max_access_size = 4
+        }
+    },
+    [DEVICE_BIG_ENDIAN] = {
+        .read = goldfish_rtc_read,
+        .write = goldfish_rtc_write,
+        .endianness = DEVICE_BIG_ENDIAN,
+        .valid = {
+            .min_access_size = 4,
+            .max_access_size = 4
+        }
+    },
 };
 
 static const VMStateDescription goldfish_rtc_vmstate = {
@@ -265,7 +285,8 @@ static void goldfish_rtc_realize(DeviceState *d, Error **errp)
     SysBusDevice *dev = SYS_BUS_DEVICE(d);
     GoldfishRTCState *s = GOLDFISH_RTC(d);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &goldfish_rtc_ops, s,
+    memory_region_init_io(&s->iomem, OBJECT(s),
+                          &goldfish_rtc_ops[s->endianness], s,
                           "goldfish_rtc", 0x24);
     sysbus_init_mmio(dev, &s->iomem);
 
@@ -274,10 +295,16 @@ static void goldfish_rtc_realize(DeviceState *d, Error **errp)
     s->timer = timer_new_ns(rtc_clock, goldfish_rtc_interrupt, s);
 }
 
+static Property goldfish_rtc_properties[] = {
+    DEFINE_PROP_UINT8("endianness", GoldfishRTCState, endianness, DEVICE_NATIVE_ENDIAN),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void goldfish_rtc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    device_class_set_props(dc, goldfish_rtc_properties);
     dc->realize = goldfish_rtc_realize;
     dc->reset = goldfish_rtc_reset;
     dc->vmsd = &goldfish_rtc_vmstate;
diff --git a/include/hw/rtc/goldfish_rtc.h b/include/hw/rtc/goldfish_rtc.h
index 79ca7daf5d..8e1aeb85e3 100644
--- a/include/hw/rtc/goldfish_rtc.h
+++ b/include/hw/rtc/goldfish_rtc.h
@@ -42,6 +42,8 @@ struct GoldfishRTCState {
     uint32_t irq_pending;
     uint32_t irq_enabled;
     uint32_t time_high;
+
+    uint8_t endianness;
 };
 
 #endif
-- 
2.36.1


