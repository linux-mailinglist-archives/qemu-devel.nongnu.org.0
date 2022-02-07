Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD774AB685
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 09:27:09 +0100 (CET)
Received: from localhost ([::1]:59796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGzMZ-00035k-Rp
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 03:27:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGys8-0005tO-Up
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:55:51 -0500
Received: from [2a00:1450:4864:20::42c] (port=42539
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyro-00028B-7w
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:55:24 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h6so4408607wrb.9
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 23:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NMo03if3Twagvwv1rQ7h3DuZ2u3b3vFvmRw/GAhR6B0=;
 b=eb12Z/ZLUbuvDZcokQa3yHgDVEdvu0CMmion0DONsYcClCzlFebZxPeEbCDmUtj2rb
 rONWJJe79uH4yOsjtLFsRC9z1NssRdyTWgclnoZHXjbto761saDh0cDLAmU9B9vHu2ww
 MZBItgLTQKb7pkZpHbkvcKjLnYzMJF/Q1q/dsAuOAoA82S9zBK93ogcx+IQKUOKnu1hi
 qrqs4V+MSXzR+fPLU5rxS+Op6BPaDyn5Ek0ruNaxrLwfhbp5d5eK4Vwv7E/Iz1cWKcY0
 y73cBGLD5EqE+WMADc/B7gQHSu3Jo0yF8aQyMc2N+I3UtWyOrQJjSinZuS+55PSGkVl0
 RmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NMo03if3Twagvwv1rQ7h3DuZ2u3b3vFvmRw/GAhR6B0=;
 b=vaYPoGXWPZtrz2qvRQtYi4Yatcp5PMvtIHc591MUzb10bVoIdYCPzpBt6VJmSegSqZ
 /SVolgK/o0FLR7+LJoL5RRvRQm73bTFoPpWlNQRAvFgxobh/Jbd6jOHiL7nD4RARL8S6
 neNXaknpk4zxKU5EqwZ2iUOCKrCUxdCQ53PTHWpumSKw92+uhPbLkYoRp3bAeDxas5mz
 eL/cBPwkMr8APabxhqZnBCMIy/LcZ/Wm+b9VN3ZKVtLC5K96749gMPQpWNLAkBMiDevF
 32hGbXvGd3aGSOlWRFkF/Dn34XrPqiVvgc71KWJ4m/KGlre6N25embjQfbS+heVjnyN8
 GJ/g==
X-Gm-Message-State: AOAM532vXx74Z9VIrhixybaG3SdMhjVsZohDTI5SDJ6HLy8LPW7a7wat
 ltsAuw6k/gZA6cPB2eIWfTkL9kriJqM=
X-Google-Smtp-Source: ABdhPJyMkEYfmpIUF3jXBfO5vrLnebgN/0aAXfbIHAR0UauxG466ppsaoI9mAXbST1RmMUlrnJY2aw==
X-Received: by 2002:a05:6000:144f:: with SMTP id
 v15mr9109033wrx.407.1644220513783; 
 Sun, 06 Feb 2022 23:55:13 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id c8sm16597411wmq.39.2022.02.06.23.55.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Feb 2022 23:55:13 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 10/21] accel: Introduce AccelOpsClass::cpu_thread_is_idle()
Date: Mon,  7 Feb 2022 08:54:15 +0100
Message-Id: <20220207075426.81934-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207075426.81934-1-f4bug@amsat.org>
References: <20220207075426.81934-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Add cpu_thread_is_idle() to AccelOps, and implement it for the
KVM / WHPX accelerators.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/kvm/kvm-accel-ops.c         | 6 ++++++
 include/sysemu/accel-ops.h        | 1 +
 softmmu/cpus.c                    | 6 ++++--
 target/i386/whpx/whpx-accel-ops.c | 6 ++++++
 4 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index 7516c67a3f..95b7b08020 100644
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
diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 032f6979d7..50c72540c7 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -30,6 +30,7 @@ struct AccelOpsClass {
 
     void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY NON-NULL */
     void (*kick_vcpu_thread)(CPUState *cpu);
+    bool (*cpu_thread_is_idle)(CPUState *cpu);
 
     void (*synchronize_post_reset)(CPUState *cpu);
     void (*synchronize_post_init)(CPUState *cpu);
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 538e1714af..5b0bcb8c65 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -94,10 +94,12 @@ bool cpu_thread_is_idle(CPUState *cpu)
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
index 6bc47c5309..1d30e4e2ed 100644
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
2.34.1


