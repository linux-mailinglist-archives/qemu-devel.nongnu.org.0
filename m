Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E6F64F3BD
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:09:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IUg-0006Mu-4R; Fri, 16 Dec 2022 16:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IU1-00060G-5o
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:09 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITx-0000fr-FI
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:07 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso2706736wmo.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=B378x5OhsXxdbYk6KqXx4tmBaBnAJUAFvnfZ7I26cuw=;
 b=kAPsUCy/qj/ZQYxNQkc7OPBW5+fyTP1cmBmMZQXw22aa7Pz+1wFbiV4XI1YrQrcT/1
 H1QPpVtB+90vqgRtgRF4E3KR+14nmo4XED2osQOQJOJ07wMSPUgZPaoadqWQaW1aGQsa
 pANCkpXvUdSwk6vkyMnGCZIQTcpz7n41wwI6dbbGj8xX1R4xvMuYl7Xmjnoxlf+qdT7A
 qlUvX9HHYqvpqWnSZEvJf+0rGA12LAk72Yn0ZAr2S+n3a1y9F7SRjqrcQpShUx8VpX4W
 6GOBzLKcMRu08tU4fNIlurydA/j/SJ8Bwos+5ig/jhm+V134Rj+QkfzyYuYbyt1IiE6j
 c8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B378x5OhsXxdbYk6KqXx4tmBaBnAJUAFvnfZ7I26cuw=;
 b=BpMjpDr2rlzCDIjqX4krJrfLAl3Mnv4VOyI6U2xXegcBR+EQuhpjr1XqXHeOUTLW/h
 0hMjk7brETLUIinQ2aV1f8agKSJvqGoNgM4oAbhdlV/mRyIUJM+SCty0KJ9k6jrVbZ2j
 2I/Q11+dWPBB9kcIMPo8sIFPGNiMZVWQ8m7nittWFFGgKRzMGyY8TXSe761C3+7DPNDi
 PjItK+wDML+Gm0rkclhnXdCtqRiykpkYoVgpbyNRiOU/RY2zVN4U0huI4w1DzFK62+ov
 vy2QA872vuunkKfoun5vCb31uPi0m5nmyyigs1bVNf+HLEJHxp/rJCpO7JN6BcKXg0r4
 6Mmw==
X-Gm-Message-State: AFqh2kqlDaMxdpEnLvl4AOAWRAyk/3eeJzqMgmfbbZjazHUVqCUazFXA
 EEU1aepWIQ5WYvmvxnLVHABqijH8qc2dcCdb
X-Google-Smtp-Source: AMrXdXsOawPPm+h4qpExDYuBNUl/CwZCe7pdMFZqsDtmcFul7XY4CK8lbCjZGPbTEFxL4c+TlsGfFw==
X-Received: by 2002:a7b:cc85:0:b0:3d3:3c93:af5e with SMTP id
 p5-20020a7bcc85000000b003d33c93af5emr5337292wma.35.1671226984176; 
 Fri, 16 Dec 2022 13:43:04 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.43.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:43:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/36] target/microblaze: Convert to 3-phase reset
Date: Fri, 16 Dec 2022 21:42:27 +0000
Message-Id: <20221216214244.1391647-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

Convert the microblaze CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Message-id: 20221124115023.2437291-10-peter.maydell@linaro.org
---
 target/microblaze/cpu-qom.h |  4 ++--
 target/microblaze/cpu.c     | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/microblaze/cpu-qom.h b/target/microblaze/cpu-qom.h
index 255b39a45df..cda9220fa99 100644
--- a/target/microblaze/cpu-qom.h
+++ b/target/microblaze/cpu-qom.h
@@ -30,7 +30,7 @@ OBJECT_DECLARE_CPU_TYPE(MicroBlazeCPU, MicroBlazeCPUClass, MICROBLAZE_CPU)
 /**
  * MicroBlazeCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A MicroBlaze CPU model.
  */
@@ -40,7 +40,7 @@ struct MicroBlazeCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 89e493f3ff7..817681f9b21 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -162,14 +162,16 @@ static void microblaze_cpu_set_irq(void *opaque, int irq, int level)
 }
 #endif
 
-static void mb_cpu_reset(DeviceState *dev)
+static void mb_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     MicroBlazeCPU *cpu = MICROBLAZE_CPU(s);
     MicroBlazeCPUClass *mcc = MICROBLAZE_CPU_GET_CLASS(cpu);
     CPUMBState *env = &cpu->env;
 
-    mcc->parent_reset(dev);
+    if (mcc->parent_phases.hold) {
+        mcc->parent_phases.hold(obj);
+    }
 
     memset(env, 0, offsetof(CPUMBState, end_reset_fields));
     env->res_addr = RES_ADDR_NONE;
@@ -399,10 +401,12 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
     MicroBlazeCPUClass *mcc = MICROBLAZE_CPU_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
 
     device_class_set_parent_realize(dc, mb_cpu_realizefn,
                                     &mcc->parent_realize);
-    device_class_set_parent_reset(dc, mb_cpu_reset, &mcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, mb_cpu_reset_hold, NULL,
+                                       &mcc->parent_phases);
 
     cc->class_by_name = mb_cpu_class_by_name;
     cc->has_work = mb_cpu_has_work;
-- 
2.25.1


