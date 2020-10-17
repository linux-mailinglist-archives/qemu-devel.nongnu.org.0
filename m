Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1739029125B
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Oct 2020 16:24:40 +0200 (CEST)
Received: from localhost ([::1]:38928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTn8R-00050x-5D
	for lists+qemu-devel@lfdr.de; Sat, 17 Oct 2020 10:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kTmpL-0003IP-5u
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 10:04:55 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kTmpJ-0003qx-75
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 10:04:54 -0400
Received: by mail-wr1-x442.google.com with SMTP id s9so6560745wro.8
 for <qemu-devel@nongnu.org>; Sat, 17 Oct 2020 07:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pk7ivm07JttABN6WhHIewfEZwDkoRMEO3KDnJXLnE38=;
 b=q2XkE/zhdvB/kGUH2WLI7AY5nHqrlS8rSDTHpRMu3OS5mnfu7OiIS6yvMD2mzv/cC8
 p6mk5cdWNUq5yL0BOI0sZZdzzvDhwEmPyBBnkuMoFmWbWRuGGwXUP8GFxE9rkLmxGr0m
 newEAn06KGnXDbh8fE3wN21dBpHz3ky7yzL1i1NIlfQisXIs/yjVypw2l6yyPEGompRn
 HFqwR4PyY+8KOTcL7Fh68GHvWyNXuNyHOPDdL+HxycgUP/ACibbLcDP6B0WIMBJfENgF
 o05HaJ8Wi4sQ1Zi9jfr6QCRKo2+avhMmKmgbDxVXdQFVCCDQUQTwxNhYSeXKRuylZkhu
 2I0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pk7ivm07JttABN6WhHIewfEZwDkoRMEO3KDnJXLnE38=;
 b=DOpzzuYKAOuOwNQAIdAdA5qh8eKLs40+sHeO52wDFzAMI1s93Mj1LixSHmP3FyUzqt
 oSDhY+v8axnkRupgAFRwcUsMNHFZfg+N8RitS16onJHYUXYu1+kg0/qmNqIryMvE0eHc
 9yWFGvNCKWIBqvz7lGxKQZKen4pCB17vE6a1MaODPXeqwyoyE29Uh2TmH9wwngxWs6iT
 uPf6GtNTJV+z4svMr7McCRN74qy9UsRWk16074vERwl5NYvrrTYm26vA5pMnJvbcgqNC
 krtpfG8DKqVD8+TNELBeabI//PV92rxrRi2Jhk5s1AYyx55DrB7LHP8elHxZyKrb7cfx
 jyhA==
X-Gm-Message-State: AOAM530cU+P8iMcNVBNCVRKhtTdt1AOJskDGnoP+uhbgEcEYo3wafuKr
 nA1fKV3zxaSwH81Tda8ZkTJyLLagILQ=
X-Google-Smtp-Source: ABdhPJxUx1B0eOR4U1/f2dhFaqbJZKKN5dPzToUzHYMYR4CNS8o62qXs2hWqy3zXjm7aJIwFZ+utHg==
X-Received: by 2002:adf:e8cf:: with SMTP id k15mr10260053wrn.262.1602943491792; 
 Sat, 17 Oct 2020 07:04:51 -0700 (PDT)
Received: from localhost.localdomain
 (117.red-83-52-172.dynamicip.rima-tde.net. [83.52.172.117])
 by smtp.gmail.com with ESMTPSA id m11sm7619662wmf.10.2020.10.17.07.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Oct 2020 07:04:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/44] hw/mips/boston: Set CPU frequency to 1 GHz
Date: Sat, 17 Oct 2020 16:02:26 +0200
Message-Id: <20201017140243.1078718-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201017140243.1078718-1-f4bug@amsat.org>
References: <20201017140243.1078718-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The I6400 can run at 1 GHz or more. Create a 'cpuclk'
output clock and connect it to the CPU input clock.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201012095804.3335117-19-f4bug@amsat.org>
---
 hw/mips/boston.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 1b3f69e949c..cf2296f4488 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -30,6 +30,7 @@
 #include "hw/mips/cps.h"
 #include "hw/mips/cpudevs.h"
 #include "hw/pci-host/xilinx-pcie.h"
+#include "hw/qdev-clock.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
@@ -54,6 +55,7 @@ struct BostonState {
     MachineState *mach;
     MIPSCPSState cps;
     SerialMM *uart;
+    Clock *cpuclk;
 
     CharBackend lcd_display;
     char lcd_content[8];
@@ -251,10 +253,19 @@ static const MemoryRegionOps boston_platreg_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static void mips_boston_instance_init(Object *obj)
+{
+    BostonState *s = BOSTON(obj);
+
+    s->cpuclk = qdev_init_clock_out(DEVICE(obj), "cpu-refclk");
+    clock_set_hz(s->cpuclk, 1000000000); /* 1 GHz */
+}
+
 static const TypeInfo boston_device = {
     .name          = TYPE_MIPS_BOSTON,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(BostonState),
+    .instance_init = mips_boston_instance_init,
 };
 
 static void boston_register_types(void)
@@ -462,6 +473,8 @@ static void boston_mach_init(MachineState *machine)
                             &error_fatal);
     object_property_set_int(OBJECT(&s->cps), "num-vp", machine->smp.cpus,
                             &error_fatal);
+    qdev_connect_clock_in(DEVICE(&s->cps), "clk-in",
+                          qdev_get_clock_out(dev, "cpu-refclk"));
     sysbus_realize(SYS_BUS_DEVICE(&s->cps), &error_fatal);
 
     sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->cps), 0, 0, 1);
-- 
2.26.2


