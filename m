Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD02B4BD8B0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 10:52:39 +0100 (CET)
Received: from localhost ([::1]:49142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5N0-0000kJ-OU
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 04:52:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zM-00080D-AK
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:12 -0500
Received: from [2a00:1450:4864:20::32a] (port=37391
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zK-000102-D9
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:11 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 p14-20020a05600c1d8e00b0037f881182a8so899835wms.2
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cEOGtMvEBym4vB62YkCGC60KIA3PCqmNTfzEeeuJSVc=;
 b=mXGkeYBaOmvRgSL3Jn9CrrmOUZGmDjrmZmw7y72YVvt5bnPeWLw5u1Ve9FigIZU/8v
 2aynQiXKyn8OFGOe8yeOhbSHYJDXAgNvmiXd5/hX66z5KMw91dhL/SgaozKc3PPY/GkR
 lGEeD9dcW1vZlRq8mnvCIDhc6wuRhzhv/VRymaf7JvqSPuX4WpYk2v8ErVVeMSPWGjZW
 fMw9XQtHQ56VcQePL13NH4/i/JvSvUNvEgII/ltl+X1vM4DAkar1Wn5QRUvJMHhBwL2t
 i7PeusScQrtxZPXmr8Tjolgk7HdFpK9/WEvbzJC5aRUqoJvRw/dn0tNi7Uny21huzRge
 TjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cEOGtMvEBym4vB62YkCGC60KIA3PCqmNTfzEeeuJSVc=;
 b=VBNpT3NSLes0irC/L0g0V6KllouU2eXiebK8eN2SoPTC9oUjRb1AC1RSgwbsOWhLqy
 dRV864Fzw8DZpH8mtHsrdTFvcrsuU9SJwrmboIz07RPRnWJvgfKau9xTV4wtY8ZO7aao
 pa9cP2WrDr9t0Yr1BEJ3Kge2j147luX0uIRmFPLmDFsSs0+yUhHwM8OqU0sTEfbDy5CF
 qtxc1k36/EBJ+kJrWcn9SWVznr+kQ1Yf1ZkCxjxOHYrl2CqFSUojLREu6otReLSH0Q3a
 wdnwxVI/kzZmvGAeq8E8WHUe1kiOeMK5n91Q35/W1M9qqSR9T+KGFRaXfH2GLRDVhdUt
 Ifgg==
X-Gm-Message-State: AOAM5319HaWbooYbmySU7YgEKxOpDkj0os5LZKzsy8OxgMJTYNJFIjQF
 7788+WWyVMbopl9uvvc2318M8IGS+vqPiA==
X-Google-Smtp-Source: ABdhPJyjdm483WO729sG3O0G8UJeyYySa4aB1IGc0VIOtTfkb4XFy31QhoO0S2fCOHb4URzcnddHjA==
X-Received: by 2002:a7b:ca45:0:b0:37b:e8cf:8ebb with SMTP id
 m5-20020a7bca45000000b0037be8cf8ebbmr20441169wml.72.1645435689111; 
 Mon, 21 Feb 2022 01:28:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id q76sm7555778wme.1.2022.02.21.01.28.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:28:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/26] target/arm: Use aarch64_cpu_register() for 'host' CPU
 type
Date: Mon, 21 Feb 2022 09:27:42 +0000
Message-Id: <20220221092800.404870-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221092800.404870-1-peter.maydell@linaro.org>
References: <20220221092800.404870-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the aarch64_cpu_register() machinery to register the 'host' CPU
type.  This doesn't gain us anything functionally, but it does mean
that the code for initializing it looks more like that for the other
CPU types, in that its initfn then doesn't need to call
arm_cpu_post_init() (because aarch64_cpu_instance_init() does that
for it).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220204165506.2846058-3-peter.maydell@linaro.org
---
 target/arm/cpu64.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 052666b819e..590ac562714 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -683,7 +683,7 @@ void aarch64_add_pauth_properties(Object *obj)
 }
 
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-static void arm_host_initfn(Object *obj)
+static void aarch64_host_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
@@ -696,15 +696,7 @@ static void arm_host_initfn(Object *obj)
 #else
     hvf_arm_set_cpu_features_from_host(cpu);
 #endif
-    arm_cpu_post_init(obj);
 }
-
-static const TypeInfo host_arm_cpu_type_info = {
-    .name = TYPE_ARM_HOST_CPU,
-    .parent = TYPE_AARCH64_CPU,
-    .instance_init = arm_host_initfn,
-};
-
 #endif
 
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
@@ -943,6 +935,9 @@ static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
     { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
     { .name = "max",                .initfn = aarch64_max_initfn },
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
+    { .name = "host",               .initfn = aarch64_host_initfn },
+#endif
 };
 
 static bool aarch64_cpu_get_aarch64(Object *obj, Error **errp)
@@ -1049,10 +1044,6 @@ static void aarch64_cpu_register_types(void)
     for (i = 0; i < ARRAY_SIZE(aarch64_cpus); ++i) {
         aarch64_cpu_register(&aarch64_cpus[i]);
     }
-
-#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-    type_register_static(&host_arm_cpu_type_info);
-#endif
 }
 
 type_init(aarch64_cpu_register_types)
-- 
2.25.1


