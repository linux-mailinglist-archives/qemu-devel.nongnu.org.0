Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24034C5336
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 03:03:28 +0100 (CET)
Received: from localhost ([::1]:42686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNmQi-0004z7-3i
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 21:03:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNmN3-0002Gx-Ip
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 20:59:41 -0500
Received: from [2607:f8b0:4864:20::42f] (port=41838
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNmN2-00074i-4N
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 20:59:41 -0500
Received: by mail-pf1-x42f.google.com with SMTP id p8so6207115pfh.8
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 17:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MnZANHh1cEDimBVsUymqDGP9GmDwsCaQg06DqMeTQ5Y=;
 b=GUgLCTrVB65c0ZLEQXyTfkIDh46IAwgCjhmtZ+fAuKIAal1Iq53BURyh+DrxJdohPO
 q/DGL3xY13/Af/Vt6VOIm1ToM5t8dZoZJVJQRbUfAGgZ029gsf0/EzkxTccfo7Y6gEfu
 Zwf+2JmC0V0imc5LulGzGI2KGdRFH/ZhXx66dcFaoxTBSouELIywi6zHczqAY7TLGnpl
 o4sNGauj6fK6wO59jvJKuodm5iggfGMSBiE+gzIG2E47WnlbEawaSqgvbIdaXH5U4nQt
 /w1dBostj61IzopFWtxD0uuK55L5raA5Y7LRHy/eQOqG+QT7yz72ug326tK6TJpgRtIb
 ccQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MnZANHh1cEDimBVsUymqDGP9GmDwsCaQg06DqMeTQ5Y=;
 b=l0Bre7cF+QvtpTpO5AmJno6iIXlOtk1sO4Xh3iNIGN4BKm3H00MBcW7vtb93ETUQtz
 z2Y8R6YVM4BeotYZ5IrzKduHX3pirLreVVU5i++pksqPT4byYwTwiXJS3F7N03pgWIJ8
 /dZo9OOxnUBwb5uAm+1vUvd01VJYqhfU8s84UPfhfEyUxEgUNQqrc/1liiMkm2K6Wv8k
 DH9Xxbl6ZCDJlnN71DVVeodRlDLVswRHGr4Ty/2sikD7TIYZdadvKUx/05G8v15DX8nE
 yxImaOOFoA5RJMQ34tw5lcTByfrRh5C2UNva+AWRPkV3Ie01SvmrvrJtNPFyhDobE3Ej
 vC5Q==
X-Gm-Message-State: AOAM531YcEG3x6YjvCPIKea26eXy1594r2Z9+5uu/Y24tpAlfGZjaaEV
 Zxk76S5/FlhLOWbOxfXFiuSp591ZOXXL6w==
X-Google-Smtp-Source: ABdhPJwXyRGVYmX9Np7wSX25QgF1LK4JT5l/dsVKZ5W0sgF5fh5uDukS9el1yn6ccRoPUSWSi2FvHw==
X-Received: by 2002:a65:6c0d:0:b0:364:ae2e:9708 with SMTP id
 y13-20020a656c0d000000b00364ae2e9708mr8509401pgu.189.1645840778650; 
 Fri, 25 Feb 2022 17:59:38 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a056a001acf00b004f0ed8dc8d7sm4465564pfv.108.2022.02.25.17.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 17:59:38 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PULL v2 4/6] hw/openrisc/openrisc_sim: Increase max_cpus to 4
Date: Sat, 26 Feb 2022 10:59:22 +0900
Message-Id: <20220226015924.1293022-5-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220226015924.1293022-1-shorne@gmail.com>
References: <20220226015924.1293022-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=shorne@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we no longer have a limit of 2 CPUs due to fixing the
IRQ routing issues we can increase the max.  Here we increase
the limit to 4, we could go higher, but currently OMPIC has a
limit of 4, so we align with that.

Signed-off-by: Stafford Horne <shorne@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/openrisc/openrisc_sim.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 5bfbac00f8..8cfb92bec6 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -37,6 +37,8 @@
 
 #define KERNEL_LOAD_ADDR 0x100
 
+#define OR1KSIM_CPUS_MAX 4
+
 #define TYPE_OR1KSIM_MACHINE MACHINE_TYPE_NAME("or1k-sim")
 #define OR1KSIM_MACHINE(obj) \
     OBJECT_CHECK(Or1ksimState, (obj), TYPE_OR1KSIM_MACHINE)
@@ -197,12 +199,12 @@ static void openrisc_sim_init(MachineState *machine)
 {
     ram_addr_t ram_size = machine->ram_size;
     const char *kernel_filename = machine->kernel_filename;
-    OpenRISCCPU *cpus[2] = {};
+    OpenRISCCPU *cpus[OR1KSIM_CPUS_MAX] = {};
     MemoryRegion *ram;
     int n;
     unsigned int smp_cpus = machine->smp.cpus;
 
-    assert(smp_cpus >= 1 && smp_cpus <= 2);
+    assert(smp_cpus >= 1 && smp_cpus <= OR1KSIM_CPUS_MAX);
     for (n = 0; n < smp_cpus; n++) {
         cpus[n] = OPENRISC_CPU(cpu_create(machine->cpu_type));
         if (cpus[n] == NULL) {
@@ -243,7 +245,7 @@ static void openrisc_sim_machine_init(ObjectClass *oc, void *data)
 
     mc->desc = "or1k simulation";
     mc->init = openrisc_sim_init;
-    mc->max_cpus = 2;
+    mc->max_cpus = OR1KSIM_CPUS_MAX;
     mc->is_default = true;
     mc->default_cpu_type = OPENRISC_CPU_TYPE_NAME("or1200");
 }
-- 
2.31.1


