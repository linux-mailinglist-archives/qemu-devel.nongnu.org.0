Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE601BF53B
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 12:21:52 +0200 (CEST)
Received: from localhost ([::1]:47760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jU6KF-0001i5-8O
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 06:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52418)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jU6IV-0008Aw-BU
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 06:20:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jU6IO-000172-4p
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 06:20:02 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:46271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jU6IN-00011p-NN
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 06:19:55 -0400
Received: by mail-lf1-x144.google.com with SMTP id g10so734076lfj.13
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 03:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=opmkyJ2lt40WK/inlwbmCnCG1rqTZ+e0R6h7t3/vrFE=;
 b=k2uRwX9OwkMyYc6oTmZaYb0KThhYS3YQi198O1K+0L1kVRxxAK0SUCfsYVvgzUldR/
 Z6sn5JiYJTv5dNxnBp7H3uncJQEQPmDV30syaVPfQFOOyjkAOxZsKMgqvRqnIaqzW0V2
 72fj8AdxB3xs+qQTxE6ad88e19Xwy9VPcUQoz3fPYsEljmpNBhn7vH2tSYIn2bKYZCFb
 RB0Smm5wC5tMCNPouKAL9VxoHilG/PIS5yikifC++luNBpZeWzWUMWvVHvKCYvyvZ7kP
 2CLyc00ZXIJPPjwg4qJzeZXJ0TPAz6eC/6kADUZ/XtSV777mv7Y3ALGQWNZbEwvbeG9k
 NDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=opmkyJ2lt40WK/inlwbmCnCG1rqTZ+e0R6h7t3/vrFE=;
 b=hSt4TYho2NvPEnr1XD8AN+TDzZGMOP73HPY8pppDtFaj2mLI1KGrBh+pHMqOqcVC5s
 x/Mk0G5O6KFtCYQYaSLXurEvU1k1Lazf9tj2UPZl2KzakWDNrK0BgKLSjRpe8AhvchQu
 qDO2UWUSlnkNYtDCVRsQhCnFjWm0PoDOw20ZZm1qflEx9ZXEkMv6RTUzwwwS6y2/g2Kt
 mf65DG0mNQksq+urScFfByMsfK9qS+A7QDcqY78/iE+ovEJ0FunLLEo+ZbXRAZb8xtVg
 1YE2dzTKbJM8DVYOdy1o0NEGIQVidLzg2l10FqeOQvDI+G2fdCqEJUpz+dlZqQbD+Rbl
 nWvg==
X-Gm-Message-State: AGi0PuYvbBa6I1OFarJjlatdZyaGBQ5+ToVAArjTLRc0gNtytRYUkw5T
 89subk8ngc1MOutk8q9kRizFRRJmJR0=
X-Google-Smtp-Source: APiQypLlRmQsqA5Ug7rxz2I9zKbOWmyWkc2mt26kAzfzUFlbE85QbiwwXwm++vAS6tQndP0B0WjQsQ==
X-Received: by 2002:a19:c3c5:: with SMTP id t188mr1720815lff.199.1588241993402; 
 Thu, 30 Apr 2020 03:19:53 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id d18sm3868549lfm.36.2020.04.30.03.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 03:19:52 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL v1 1/6] target/microblaze: Add the opcode-0x0-illegal CPU
 property
Date: Thu, 30 Apr 2020 12:19:44 +0200
Message-Id: <20200430101949.7754-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430101949.7754-1-edgar.iglesias@gmail.com>
References: <20200430101949.7754-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::144;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::144
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add the opcode-0x0-illegal CPU property to control if the core
should trap opcode zero as illegal.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Luc Michel <luc.michel@greensocs.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/microblaze/cpu.h       | 1 +
 target/microblaze/cpu.c       | 6 +++++-
 target/microblaze/translate.c | 2 +-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 1a700a880c..d51587b342 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -303,6 +303,7 @@ struct MicroBlazeCPU {
         bool endi;
         bool dopb_bus_exception;
         bool iopb_bus_exception;
+        bool opcode_0_illegal;
         char *version;
         uint8_t pvr;
     } cfg;
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index c9cf2364ca..418a0cd1fa 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -206,7 +206,9 @@ static void mb_cpu_realizefn(DeviceState *dev, Error **errp)
                         (cpu->cfg.dopb_bus_exception ?
                                                  PVR2_DOPB_BUS_EXC_MASK : 0) |
                         (cpu->cfg.iopb_bus_exception ?
-                                                 PVR2_IOPB_BUS_EXC_MASK : 0);
+                                                 PVR2_IOPB_BUS_EXC_MASK : 0) |
+                        (cpu->cfg.opcode_0_illegal ?
+                                                 PVR2_OPCODE_0x0_ILL_MASK : 0);
 
     env->pvr.regs[5] |= cpu->cfg.dcache_writeback ?
                                         PVR5_DCACHE_WRITEBACK_MASK : 0;
@@ -274,6 +276,8 @@ static Property mb_properties[] = {
     /* Enables bus exceptions on failed instruction fetches.  */
     DEFINE_PROP_BOOL("iopb-bus-exception", MicroBlazeCPU,
                      cfg.iopb_bus_exception, false),
+    DEFINE_PROP_BOOL("opcode-0x0-illegal", MicroBlazeCPU,
+                     cfg.opcode_0_illegal, false),
     DEFINE_PROP_STRING("version", MicroBlazeCPU, cfg.version),
     DEFINE_PROP_UINT8("pvr", MicroBlazeCPU, cfg.pvr, C_PVR_FULL),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 37a844db99..222632b670 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1573,7 +1573,7 @@ static inline void decode(DisasContext *dc, uint32_t ir)
     LOG_DIS("%8.8x\t", dc->ir);
 
     if (ir == 0) {
-        trap_illegal(dc, dc->cpu->env.pvr.regs[2] & PVR2_OPCODE_0x0_ILL_MASK);
+        trap_illegal(dc, dc->cpu->cfg.opcode_0_illegal);
         /* Don't decode nop/zero instructions any further.  */
         return;
     }
-- 
2.20.1


