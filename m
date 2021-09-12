Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4C6407EFD
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:34:46 +0200 (CEST)
Received: from localhost ([::1]:47022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTNN-0002Vy-IM
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTGr-0005dQ-Ua
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:01 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTGp-0004Si-Q8
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:00 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 r128-20020a1c4486000000b003065f0bc631so582826wma.0
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TDL/s5qp2PZchCaLgZDHqquPt+pAQfMwmIRobGZzfuA=;
 b=XFs74/EaPkrJZju9ypeG4+JmS4NDvULBYQfp/czFrtDW1nGjV3dWbktI/OV7gEWT3y
 MFYWJMb08la+fUfOC6YyazfG2kj3Q2DVUAEYzvN8d4hs72s2ED939Si7bHZ0dA3eQi2u
 DT1LrA68uQnBfXd3bmqecbCuMmwRl4AsoHXDSh8JsEWg4QrKE1Z+Ypi2xxqzpXBUIb4/
 sWqj7qVmDFgQ3+kPDWm6yOkZdfqZnbXJYP3OoDHMNWmhIlQZGcf83wj/16Fg3aVPUoGq
 12B3la3pPS/MMv3D4RrIrWQZcXYM2Gyi+FL3lNiWWBTdUPimdJYfaPyuD/2aA/L4+XJ/
 MZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TDL/s5qp2PZchCaLgZDHqquPt+pAQfMwmIRobGZzfuA=;
 b=dU5pWZ1EcMjB+i0ArlEKZyxK4pnrUv3DTIs5nVIBj/QLK5oDWb0fmXtVd+fLbEAZeL
 MRLCKMhhg5dLK7B3+WGjh9pXLlJM8pztLfPuSBqI7CuYxze52afztUR26ehJZaC6+6/U
 fjYlB8IRTjWToC3KtjKYWVaglg7Dz6winLEm03IOTLqGjbX1HaO4jt0AvDK15coHVMgQ
 XU1W9NZNC4wOED3q3WNRhiRegG4Apwythd0M54Sf5WoFGCTVEM+9X8tWBFXYZYA1hHNu
 2SqoFkKotmNDS0pgSXLMU6IxPTvWuelr8iUwZ06DQGxr2PlaF47bOV5FY2eycRs6fUhX
 hJWA==
X-Gm-Message-State: AOAM53272bHneu7R2XFmCmaJ6MqWGa1RNUbyVcioJbVQ8khIuIixmXF0
 hXMXAZ//DYLZfWslZjeY4hbjnyv24Vc=
X-Google-Smtp-Source: ABdhPJxpZhfsNSiPeixZlQX7ap3xwv5gY78wg3wxwdMplzd1e+jhv9xiLwqik9gnZf3UeEEXPlY5EA==
X-Received: by 2002:a1c:4d7:: with SMTP id 206mr6137563wme.158.1631467677873; 
 Sun, 12 Sep 2021 10:27:57 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id i20sm4678954wml.37.2021.09.12.10.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:27:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/30] accel/kvm: Implement AccelOpsClass::has_work()
Date: Sun, 12 Sep 2021 19:27:06 +0200
Message-Id: <20210912172731.789788-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement KVM has_work() handler in AccelOpsClass and
remove it from cpu_thread_is_idle() since cpu_has_work()
is already called.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/kvm/kvm-accel-ops.c | 6 ++++++
 softmmu/cpus.c            | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index 7516c67a3f5..6f4d5df3a0d 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -74,6 +74,11 @@ static void kvm_start_vcpu_thread(CPUState *cpu)
                        cpu, QEMU_THREAD_JOINABLE);
 }
 
+static bool kvm_cpu_has_work(CPUState *cpu)
+{
+    return kvm_halt_in_kernel();
+}
+
 static void kvm_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
@@ -83,6 +88,7 @@ static void kvm_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_post_init = kvm_cpu_synchronize_post_init;
     ops->synchronize_state = kvm_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = kvm_cpu_synchronize_pre_loadvm;
+    ops->has_work = kvm_cpu_has_work;
 }
 
 static const TypeInfo kvm_accel_ops_type = {
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 2a61dfd6287..3db7bd4eb4d 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -90,7 +90,7 @@ bool cpu_thread_is_idle(CPUState *cpu)
         return true;
     }
     if (!cpu->halted || cpu_has_work(cpu) ||
-        kvm_halt_in_kernel() || whpx_apic_in_platform()) {
+        whpx_apic_in_platform()) {
         return false;
     }
     return true;
-- 
2.31.1


