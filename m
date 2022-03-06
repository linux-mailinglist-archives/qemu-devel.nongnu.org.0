Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AB44CEBA1
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:07:10 +0100 (CET)
Received: from localhost ([::1]:46122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqbN-0000wx-El
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:07:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqVR-0000gv-JD
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:01:01 -0500
Received: from [2a00:1450:4864:20::32b] (port=41797
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqVO-0003vS-Ux
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:01:00 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 7-20020a05600c228700b00385fd860f49so6900019wmf.0
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I1BibOgzE1kXRXSK7t3OOwFMjdn8Qs/Lnfs/VlDah2s=;
 b=Jwy3EcOq9Hx+V/KGcjbZpIhkoqVlpAviEoarslz3zwL7cegBEqq+1SphtL40tiH6OC
 8vXwQ9MlqNFynu3yNws2n4hcVa3B4Zrnmv+q3WmQmyMUQGw+VtRFyUmA5cnNMzctZCv1
 HAE+C1GTzSWDc0yo6DUC90Bt3ct7FgwBHufzTlz3aZN2pKVeJwJswlKIkZ9kX4U4gZz/
 0YvkFPGR+UDX0QvJlhd5H7Kim/81fOvaHkmIxvOl600mNsJOw792Fo/KN3e2guv+HZtG
 MLs6TlRTZVGGZ9GClYZyJExBUtxVdzbU3eEmhUP6XQyd4u8Z7jGwbE1cBmsUZQXVyICV
 Iu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I1BibOgzE1kXRXSK7t3OOwFMjdn8Qs/Lnfs/VlDah2s=;
 b=bzA9cE1/OkwhTNj+ZpkB17dqGz+JRPiYlRfnDx2wMGrkNnVgmn8z4+wMzyT+XEI9/1
 wTvpBSjc6Gp5Z9RFJhiM5fZlCgHFqeBcZLBqjudWsNSFiK12XNjgEgDjPsCswInAeCMl
 NvdwhsaCQywdiOxFng2A3Svo+e7T7R1PhzKsib4BUlbYX0q8wWzjT9MNHG7fEuxrTG5v
 TyxmfjIFCNCpUrxb4Puo5MMRRyoN+yIUJRdrKoc3aKFEmW/Msx2pqJSRNlnN2PSCfhwv
 2ayg7tXkA1SIifHUOnUSOjs7Bb7GPF7y339PgBC+JOLw+Q9QeQJAFmG5zrVMnzzKfR/U
 iaNQ==
X-Gm-Message-State: AOAM530FDmqVwtkVJhb4pxahUl2bP3jwGCTcqbmVZCjdyx7aLTtfpsY0
 fzSAb8Q9KB32zRuUpvQLZuZ+ubu+VTY=
X-Google-Smtp-Source: ABdhPJw3jfcgaqTg/zd8lhpqboKH6UurEddO7oAFnulIktUIkw5cDsEY8G1UmHJRylgzobhXiKfvdA==
X-Received: by 2002:a1c:c911:0:b0:389:8f96:28f3 with SMTP id
 f17-20020a1cc911000000b003898f9628f3mr6050694wmb.49.1646571657023; 
 Sun, 06 Mar 2022 05:00:57 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 g11-20020a5d554b000000b001f0326a23ddsm9113637wrw.70.2022.03.06.05.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:00:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/33] accel: Introduce AccelOpsClass::cpu_thread_is_idle()
Date: Sun,  6 Mar 2022 13:59:37 +0100
Message-Id: <20220306130000.8104-11-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Add cpu_thread_is_idle() to AccelOps, and implement it for the
KVM / WHPX accelerators.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220207075426.81934-11-f4bug@amsat.org>
---
 include/sysemu/accel-ops.h        | 1 +
 accel/kvm/kvm-accel-ops.c         | 6 ++++++
 softmmu/cpus.c                    | 6 ++++--
 target/i386/whpx/whpx-accel-ops.c | 6 ++++++
 4 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 032f6979d76..50c72540c73 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -30,6 +30,7 @@ struct AccelOpsClass {
 
     void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY NON-NULL */
     void (*kick_vcpu_thread)(CPUState *cpu);
+    bool (*cpu_thread_is_idle)(CPUState *cpu);
 
     void (*synchronize_post_reset)(CPUState *cpu);
     void (*synchronize_post_init)(CPUState *cpu);
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index 7516c67a3f5..95b7b080202 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -74,11 +74,17 @@ static void kvm_start_vcpu_thread(CPUState *cpu)
                        cpu, QEMU_THREAD_JOINABLE);
 }
 
+static bool kvm_vcpu_thread_is_idle(CPUState *cpu)
+{
+    return !kvm_halt_in_kernel();
+}
+
 static void kvm_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = kvm_start_vcpu_thread;
+    ops->cpu_thread_is_idle = kvm_vcpu_thread_is_idle;
     ops->synchronize_post_reset = kvm_cpu_synchronize_post_reset;
     ops->synchronize_post_init = kvm_cpu_synchronize_post_init;
     ops->synchronize_state = kvm_cpu_synchronize_state;
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index ac6bec56038..b17033d3bce 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -90,10 +90,12 @@ bool cpu_thread_is_idle(CPUState *cpu)
     if (cpu_is_stopped(cpu)) {
         return true;
     }
-    if (!cpu->halted || cpu_has_work(cpu) ||
-        kvm_halt_in_kernel() || whpx_apic_in_platform()) {
+    if (!cpu->halted || cpu_has_work(cpu)) {
         return false;
     }
+    if (cpus_accel->cpu_thread_is_idle) {
+        return cpus_accel->cpu_thread_is_idle(cpu);
+    }
     return true;
 }
 
diff --git a/target/i386/whpx/whpx-accel-ops.c b/target/i386/whpx/whpx-accel-ops.c
index 6bc47c53098..1d30e4e2ed2 100644
--- a/target/i386/whpx/whpx-accel-ops.c
+++ b/target/i386/whpx/whpx-accel-ops.c
@@ -83,12 +83,18 @@ static void whpx_kick_vcpu_thread(CPUState *cpu)
     }
 }
 
+static bool whpx_vcpu_thread_is_idle(CPUState *cpu)
+{
+    return !whpx_apic_in_platform();
+}
+
 static void whpx_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = whpx_start_vcpu_thread;
     ops->kick_vcpu_thread = whpx_kick_vcpu_thread;
+    ops->cpu_thread_is_idle = whpx_vcpu_thread_is_idle;
 
     ops->synchronize_post_reset = whpx_cpu_synchronize_post_reset;
     ops->synchronize_post_init = whpx_cpu_synchronize_post_init;
-- 
2.35.1


