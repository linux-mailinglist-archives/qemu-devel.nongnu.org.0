Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0731264F434
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:34:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IU7-00062r-Nc; Fri, 16 Dec 2022 16:43:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IU1-00060F-4j
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:09 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITx-0000fE-UP
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:07 -0500
Received: by mail-wm1-x32f.google.com with SMTP id v7so2786536wmn.0
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=16RWnagd9d1NknqwhBiXGx22YuZemZqKb+dy4GTRhZI=;
 b=dSvQmiaCDmRZCe7E5ePevTKglqWb81nbePehtv9MS7AGMK+RPntTz+o3mJDsJEftsw
 yNk9fTFcqTin0UT2Jp/t9hLqTczIXMTec8RDy9bo1reir0z3gqI/VyZNMbDlQjd30CDn
 EmdmJS2IWu7WwBowZfoAHoAkXjPaHm3lSmz/eGYiW5BlOowcPdOvAW6gpfRFkIGDTQPG
 O4axZXF94r6pp9JZADNXJr2HkVLGHrRDmjujR8hO9CK+ofBvcwIr9qovLz0ulwEr7PZ7
 Z3FQCSevY+on/VFsXlKKps8o3jvztIvMhz0zg1fjeUB8FBheKvpraV5I7NmTnr2rS1Ny
 kMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=16RWnagd9d1NknqwhBiXGx22YuZemZqKb+dy4GTRhZI=;
 b=g30GDlGnG7U+AbOsTC62Kfft91GXsELwkQwP9Zn/Vv+VccQ7NxN7kE0qF8rC7N51Mv
 lizXJp74hCTu61LouYD+bLAZbeI1+w2zXWItkFNDs6xSWCXANcdOlQLSc8uJI4jMKmJM
 AiZ6GPdEKGZZUtf5ayzXRMgVszEG8clahs/+2DFcVGslqRGe/hUHNnuPMLj+w6dNQWJr
 EVO4xCnQkfXTZ5yRGdWKDVi/Wu+6n6SM7NiINeIuRWaD23jiBk21wEdetS0Gku2LsUyX
 S+shATyQxPofqHaLjFYrEUFUfSGWDBRHhY/cGU/Qluk5Zory8b7t9OBDMAuQ20QT7Bc6
 WuaQ==
X-Gm-Message-State: AFqh2kpQ2dYnVf9WlCOF81zHh1ZTfE7prYSV8GtQCpOxqsRTP4Gaur4/
 5oXrjFSzL4pMIfw8eMrWWSSPxz5C5XtuIf5f
X-Google-Smtp-Source: AMrXdXsTmW6BSGGZq39aHQUaqCvnTmCj0PP+24KC75QYoPJZT+Rn7XJ8ybfqdx4uQyhlIgR1PaG27Q==
X-Received: by 2002:a7b:c3d5:0:b0:3d3:396e:5e36 with SMTP id
 t21-20020a7bc3d5000000b003d3396e5e36mr6069498wmj.0.1671226985116; 
 Fri, 16 Dec 2022 13:43:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.43.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:43:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/36] target/mips: Convert to 3-phase reset
Date: Fri, 16 Dec 2022 21:42:28 +0000
Message-Id: <20221216214244.1391647-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Convert the mips CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Message-id: 20221124115023.2437291-11-peter.maydell@linaro.org
---
 target/mips/cpu-qom.h |  4 ++--
 target/mips/cpu.c     | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/mips/cpu-qom.h b/target/mips/cpu-qom.h
index e28b5296073..0dffab453b2 100644
--- a/target/mips/cpu-qom.h
+++ b/target/mips/cpu-qom.h
@@ -34,7 +34,7 @@ OBJECT_DECLARE_CPU_TYPE(MIPSCPU, MIPSCPUClass, MIPS_CPU)
 /**
  * MIPSCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A MIPS CPU model.
  */
@@ -44,7 +44,7 @@ struct MIPSCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
     const struct mips_def_t *cpu_def;
 
     /* Used for the jazz board to modify mips_cpu_do_transaction_failed. */
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 7a565466cb3..c614b04607a 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -182,14 +182,16 @@ static bool mips_cpu_has_work(CPUState *cs)
 
 #include "cpu-defs.c.inc"
 
-static void mips_cpu_reset(DeviceState *dev)
+static void mips_cpu_reset_hold(Object *obj)
 {
-    CPUState *cs = CPU(dev);
+    CPUState *cs = CPU(obj);
     MIPSCPU *cpu = MIPS_CPU(cs);
     MIPSCPUClass *mcc = MIPS_CPU_GET_CLASS(cpu);
     CPUMIPSState *env = &cpu->env;
 
-    mcc->parent_reset(dev);
+    if (mcc->parent_phases.hold) {
+        mcc->parent_phases.hold(obj);
+    }
 
     memset(env, 0, offsetof(CPUMIPSState, end_reset_fields));
 
@@ -562,10 +564,12 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     MIPSCPUClass *mcc = MIPS_CPU_CLASS(c);
     CPUClass *cc = CPU_CLASS(c);
     DeviceClass *dc = DEVICE_CLASS(c);
+    ResettableClass *rc = RESETTABLE_CLASS(c);
 
     device_class_set_parent_realize(dc, mips_cpu_realizefn,
                                     &mcc->parent_realize);
-    device_class_set_parent_reset(dc, mips_cpu_reset, &mcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, mips_cpu_reset_hold, NULL,
+                                       &mcc->parent_phases);
 
     cc->class_by_name = mips_cpu_class_by_name;
     cc->has_work = mips_cpu_has_work;
-- 
2.25.1


