Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED47509E6E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:22:17 +0200 (CEST)
Received: from localhost ([::1]:34298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhUt6-0005le-E2
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpq-0002js-3F
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:18:54 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpn-0003Q8-C1
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:18:53 -0400
Received: by mail-wr1-x436.google.com with SMTP id k22so6227929wrd.2
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TwQCGhEvSSQC/Z2/EccxdurzG1YqSvcBdgIIL6E/lik=;
 b=GSzUzfymB4RGM71lbqIspMIWR7nnanN6QGW9GjbJWpE265kzng/iPaZLD7K/laDupw
 17zEhQDhlM+DAxsAwmizBpxvyZ+kISH0g3jRLcay0+h61CLuD93wctvj7nhZ9nRQ0mGH
 2AiOOOUr2MZ3lO670+ycldbnh9Asc175si3kv3d3Nzc1K2qRhrcMjEENtpJJ8Ji8Nf7f
 md+YXt6fRq4zKjKJ7Eici53DYBJv8rmiWAY3nUAdzBKduFalFsY6TzGYaQWfeeFJlHlj
 lWAJ3weEQXWQCWAUXUoOe2pc3tICUBnqbQbP1KYPbKhKMawair5mdaYQzqkx2mZO7Smj
 pf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TwQCGhEvSSQC/Z2/EccxdurzG1YqSvcBdgIIL6E/lik=;
 b=hMLplDQYwoBuL4SEu4dKs07RbFXg3IGsYCo1TQ6hDwWdTeweNyK37Opj/lQfGugbUf
 QdVErsAOUhp4/q/qX6NnlywkJ3/LqhEG9d+b5/0832IZQr+sIRFrQwlkWqxYTPJa0nNw
 R3MjseSyeFDs9kfzXBJMrdNVZrByhEARu9BvPMhk9WIdI2p39c+m+fqhHz2dD3VVJpIx
 M0nU2AgJDGy+YAv8nbqEa+37gBStPcKD+7C18RF18Dhj+Giqw8kD/9E+nigck3+7iaAZ
 6EhrXiRfFZpwKF3Ph78iE+03hLLaJ+zekwXjJe8KMEuufyPV6pDDRIzeADxgGgkF82Dh
 Q5Cg==
X-Gm-Message-State: AOAM530ekGfqQYIMRp/QE4oKlVHfc632zCicEF9DrTebiWdMkcm1VFXb
 frsbDQ0qs/o+85hekTf/aeOerZdn8TFX+g==
X-Google-Smtp-Source: ABdhPJx+/DNV5Nn6Yzb7gPVeSPQ7y1JG6BZ7FRaW9OfM4BDfVAp4aw77Pj8hQWD2LlLk8BHyBi047Q==
X-Received: by 2002:adf:ebd2:0:b0:20a:9c10:ab29 with SMTP id
 v18-20020adfebd2000000b0020a9c10ab29mr13123277wrn.212.1650539929889; 
 Thu, 21 Apr 2022 04:18:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.18.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:18:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/31] timer: cadence_ttc: Break out header file to allow
 embedding
Date: Thu, 21 Apr 2022 12:18:17 +0100
Message-Id: <20220421111846.2011565-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Break out header file to allow embedding of the the TTC.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-id: 20220331222017.2914409-2-edgar.iglesias@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/timer/cadence_ttc.h | 54 ++++++++++++++++++++++++++++++++++
 hw/timer/cadence_ttc.c         | 32 ++------------------
 2 files changed, 56 insertions(+), 30 deletions(-)
 create mode 100644 include/hw/timer/cadence_ttc.h

diff --git a/include/hw/timer/cadence_ttc.h b/include/hw/timer/cadence_ttc.h
new file mode 100644
index 00000000000..e1251383f2a
--- /dev/null
+++ b/include/hw/timer/cadence_ttc.h
@@ -0,0 +1,54 @@
+/*
+ * Xilinx Zynq cadence TTC model
+ *
+ * Copyright (c) 2011 Xilinx Inc.
+ * Copyright (c) 2012 Peter A.G. Crosthwaite (peter.crosthwaite@petalogix.com)
+ * Copyright (c) 2012 PetaLogix Pty Ltd.
+ * Written By Haibing Ma
+ *            M. Habib
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef HW_TIMER_CADENCE_TTC_H
+#define HW_TIMER_CADENCE_TTC_H
+
+#include "hw/sysbus.h"
+#include "qemu/timer.h"
+
+typedef struct {
+    QEMUTimer *timer;
+    int freq;
+
+    uint32_t reg_clock;
+    uint32_t reg_count;
+    uint32_t reg_value;
+    uint16_t reg_interval;
+    uint16_t reg_match[3];
+    uint32_t reg_intr;
+    uint32_t reg_intr_en;
+    uint32_t reg_event_ctrl;
+    uint32_t reg_event;
+
+    uint64_t cpu_time;
+    unsigned int cpu_time_valid;
+
+    qemu_irq irq;
+} CadenceTimerState;
+
+#define TYPE_CADENCE_TTC "cadence_ttc"
+OBJECT_DECLARE_SIMPLE_TYPE(CadenceTTCState, CADENCE_TTC)
+
+struct CadenceTTCState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+    CadenceTimerState timer[3];
+};
+
+#endif
diff --git a/hw/timer/cadence_ttc.c b/hw/timer/cadence_ttc.c
index 64108241ba9..e57a0f5f09f 100644
--- a/hw/timer/cadence_ttc.c
+++ b/hw/timer/cadence_ttc.c
@@ -24,6 +24,8 @@
 #include "qemu/timer.h"
 #include "qom/object.h"
 
+#include "hw/timer/cadence_ttc.h"
+
 #ifdef CADENCE_TTC_ERR_DEBUG
 #define DB_PRINT(...) do { \
     fprintf(stderr,  ": %s: ", __func__); \
@@ -49,36 +51,6 @@
 #define CLOCK_CTRL_PS_EN    0x00000001
 #define CLOCK_CTRL_PS_V     0x0000001e
 
-typedef struct {
-    QEMUTimer *timer;
-    int freq;
-
-    uint32_t reg_clock;
-    uint32_t reg_count;
-    uint32_t reg_value;
-    uint16_t reg_interval;
-    uint16_t reg_match[3];
-    uint32_t reg_intr;
-    uint32_t reg_intr_en;
-    uint32_t reg_event_ctrl;
-    uint32_t reg_event;
-
-    uint64_t cpu_time;
-    unsigned int cpu_time_valid;
-
-    qemu_irq irq;
-} CadenceTimerState;
-
-#define TYPE_CADENCE_TTC "cadence_ttc"
-OBJECT_DECLARE_SIMPLE_TYPE(CadenceTTCState, CADENCE_TTC)
-
-struct CadenceTTCState {
-    SysBusDevice parent_obj;
-
-    MemoryRegion iomem;
-    CadenceTimerState timer[3];
-};
-
 static void cadence_timer_update(CadenceTimerState *s)
 {
     qemu_set_irq(s->irq, !!(s->reg_intr & s->reg_intr_en));
-- 
2.25.1


