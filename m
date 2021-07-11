Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A763C3F6E
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:14:11 +0200 (CEST)
Received: from localhost ([::1]:39162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gmA-00025u-1N
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gaG-0008Ia-UW
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:01:52 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gaF-0001MO-94
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:01:52 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l17-20020a05600c1d11b029021f84fcaf75so3079143wms.1
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vNIHCXPggM034f3kqxuyfYmegS1Lrb5pCTTwom4fFi8=;
 b=YT05f/Il3kdlzZ65Fkwlil6GcCcNh4m63iezrsIpeC9FbpdApo6DLD5WxUj2DPjw8r
 01Nwj2kr4oSNxiepxCpDd6f6rklFDwty9vipE8nhRigIFWGmKJ3VqumS4sYwbdoJzWM2
 hvFxS7wXR7k5RmDwWq5gaN34v+zGfUjdMpnsBlixj7MezhwW74Bai303bC6nHdwJkYTQ
 bgJuZF0agaD9eSywsUlbMvgNqGuWX3NwIqpUTg5aAh1Ol8uqvhSf5wBwLU17QId7S+sf
 tWO4oRxvN8wXKZ6Oo/Hy7zhWpaPBf/HMZG27J6if+CVlpJC9okrhH6yVwlRCGx+32LxD
 bZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vNIHCXPggM034f3kqxuyfYmegS1Lrb5pCTTwom4fFi8=;
 b=k1VePFUZ+Kph9v7ci4fDNhWoQPYM72ztDXw2SW7EbMNPN6zt+yg5HfX+g/Eeb1evJQ
 ElhPXNCeg7HnrEnKRPbtEP2/LOIQy1H81h69bf+opyt2GaDbvNF5rjPcpxnXh4KQqXxV
 Bh+v+WREfR5yw2S99O55wdYMwjQ+eBySafRND6gtbJwaZEB+o7JUio1/ejKTFO32GT26
 DuzyWxw0HJmqr/Y9DQQ0I+lqODRBs6/sJTZHlt86NoeaANVLntN7qv4g9oTiaO8sDBxn
 Z+jFa+J55U4Qt660okYJMw/jnGrYHGoyy7ljB6ubphqadR8Cjl1ou2yJeUHKFSi27SH+
 RS7Q==
X-Gm-Message-State: AOAM5308kM6bO+5SojZH2fykCsqUlJBE07BWkGUsDVTGpJYCLr4FOxD+
 2ARMOw6r6af1Y/+Qad48jnPnczxtVncB7kMo
X-Google-Smtp-Source: ABdhPJxM5Tu90C1usc1McTitZJ2BfGgPsSCfkAGcA4vkQwlAd6OtrQqnxgPWTyB4qdxGK8bYa2mP4w==
X-Received: by 2002:a7b:c096:: with SMTP id r22mr10940429wmh.186.1626037309745; 
 Sun, 11 Jul 2021 14:01:49 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id l18sm7943457wme.29.2021.07.11.14.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:01:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/19] dp8393x: Store CAM registers as 16-bit
Date: Sun, 11 Jul 2021 23:00:14 +0200
Message-Id: <20210711210016.2710100-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711210016.2710100-1-f4bug@amsat.org>
References: <20210711210016.2710100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fredrik Noring <noring@nocrew.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Finn Thain <fthain@linux-m68k.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the DP83932C datasheet from July 1995:

  4.0 SONIC Registers
  4.1 THE CAM UNIT

    The Content Addressable Memory (CAM) consists of sixteen
    48-bit entries for complete address filtering of network
    packets. Each entry corresponds to a 48-bit destination
    address that is user programmable and can contain any
    combination of Multicast or Physical addresses. Each entry
    is partitioned into three 16-bit CAM cells accessible
    through CAM Address Ports (CAP 2, CAP 1 and CAP 0) with
    CAP0 corresponding to the least significant 16 bits of
    the Destination Address and CAP2 corresponding to the
    most significant bits.

Store the CAM registers as 16-bit as it simplifies the code.

Having now the CAM registers as arrays of 3 uint16_t, we can avoid
using the VMSTATE_BUFFER_UNSAFE macro by using VMSTATE_UINT16_2DARRAY
which is more appropriate. This breaks the migration stream however.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Finn Thain <fthain@linux-m68k.org>
Message-Id: <20210710174954.2577195-5-f4bug@amsat.org>
Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/net/dp8393x.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index d1e147a82a6..283de9db0bf 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -158,7 +158,7 @@ struct dp8393xState {
     MemoryRegion mmio;
 
     /* Registers */
-    uint8_t cam[16][6];
+    uint16_t cam[16][3];
     uint16_t regs[SONIC_REG_COUNT];
 
     /* Temporaries */
@@ -281,15 +281,13 @@ static void dp8393x_do_load_cam(dp8393xState *s)
         address_space_read(&s->as, dp8393x_cdp(s),
                            MEMTXATTRS_UNSPECIFIED, s->data, size);
         index = dp8393x_get(s, width, 0) & 0xf;
-        s->cam[index][0] = dp8393x_get(s, width, 1) & 0xff;
-        s->cam[index][1] = dp8393x_get(s, width, 1) >> 8;
-        s->cam[index][2] = dp8393x_get(s, width, 2) & 0xff;
-        s->cam[index][3] = dp8393x_get(s, width, 2) >> 8;
-        s->cam[index][4] = dp8393x_get(s, width, 3) & 0xff;
-        s->cam[index][5] = dp8393x_get(s, width, 3) >> 8;
-        trace_dp8393x_load_cam(index, s->cam[index][0], s->cam[index][1],
-                               s->cam[index][2], s->cam[index][3],
-                               s->cam[index][4], s->cam[index][5]);
+        s->cam[index][0] = dp8393x_get(s, width, 1);
+        s->cam[index][1] = dp8393x_get(s, width, 2);
+        s->cam[index][2] = dp8393x_get(s, width, 3);
+        trace_dp8393x_load_cam(index,
+                               s->cam[index][0] >> 8, s->cam[index][0] & 0xff,
+                               s->cam[index][1] >> 8, s->cam[index][1] & 0xff,
+                               s->cam[index][2] >> 8, s->cam[index][2] & 0xff);
         /* Move to next entry */
         s->regs[SONIC_CDC]--;
         s->regs[SONIC_CDP] += size;
@@ -592,8 +590,7 @@ static uint64_t dp8393x_read(void *opaque, hwaddr addr, unsigned int size)
     case SONIC_CAP1:
     case SONIC_CAP0:
         if (s->regs[SONIC_CR] & SONIC_CR_RST) {
-            val = s->cam[s->regs[SONIC_CEP] & 0xf][2 * (SONIC_CAP0 - reg) + 1] << 8;
-            val |= s->cam[s->regs[SONIC_CEP] & 0xf][2 * (SONIC_CAP0 - reg)];
+            val = s->cam[s->regs[SONIC_CEP] & 0xf][SONIC_CAP0 - reg];
         }
         break;
     /* All other registers have no special contraints */
@@ -984,10 +981,10 @@ static void dp8393x_realize(DeviceState *dev, Error **errp)
 
 static const VMStateDescription vmstate_dp8393x = {
     .name = "dp8393x",
-    .version_id = 0,
-    .minimum_version_id = 0,
+    .version_id = 1,
+    .minimum_version_id = 1,
     .fields = (VMStateField []) {
-        VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 6),
+        VMSTATE_UINT16_2DARRAY(cam, dp8393xState, 16, 3),
         VMSTATE_UINT16_ARRAY(regs, dp8393xState, SONIC_REG_COUNT),
         VMSTATE_END_OF_LIST()
     }
-- 
2.31.1


