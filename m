Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7964B4AB6F0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:06:02 +0100 (CET)
Received: from localhost ([::1]:52758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGzyD-0002s6-Dz
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:06:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGysP-0005wt-1Y
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:55:58 -0500
Received: from [2a00:1450:4864:20::32f] (port=43758
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyrv-00028p-4M
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:55:29 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 k6-20020a05600c1c8600b003524656034cso7968045wms.2
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 23:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G2lKCVTl1oac2ID1Q04D+ryfEO1CXYWXcWqr7jR7pwE=;
 b=bPdW+sZpJUn3Mnm83OjKF5jJ/YiPWotNN4/6r6104Vdi5CwKpw132JXdg4xWdbpcUu
 XKsfCYYYWfW6vC3sJwtqVNhIYx9kIVLe/cBAF/NWA/q3TrdcAVZKhh9JwfijVMbwtGa4
 LCoKkqKdRabVQsRpBkjEIZh3NaHFSqX+JS0+j2EVzqlx6ujWOnVNCF3VSC7EcUQXBkmy
 TxUBpDDNJ6yCY9ULcc92mgMBhHpMCyhbSLjqiNtHohwyk9hUgQSq9w7tycCOBDRSEIHE
 5WuCTNlC1NUwU3vN30tjHV+hC3oDwYqBl+rFS3CLPYG7BU0HQvqP8AqSXgtQHRcVeYbg
 v64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=G2lKCVTl1oac2ID1Q04D+ryfEO1CXYWXcWqr7jR7pwE=;
 b=s4rdliWGrM9E5Bw6YfJXMkK3/B46CERzkUw6t2bYFH8d3gO17xSImIkaMGjhXzA/hd
 cVaM7MhLef4Stcl6GKnaJ9VAPE9+OwOKWq3EDLYoSAp4sFvFCImXaX19HWCZ4X6vN2sL
 jZeWMvCpU8+ea753/Sg0y5FD0Crb/hSbUCl0Hz+x3ngk2C12C6kE9/AAFIzQCrGWr/oQ
 tyEPu3fICxXAF23xDGLspLKq0PTFHq9MWhI0BOua6dPEG3gDUP++QPmAkSuj8GEsR31r
 4b6DM2E64GfbhZjtF/p/GzNkwVxHerynGk4RAqCwAL3dZwSxuScUkqi1uazK3VkNWI77
 CLig==
X-Gm-Message-State: AOAM530ZskC+mfCX1c+dn1ONIWt4Op2kPvYS7RoKnsU9vWGTBEggUz6F
 8p8NtkKXQXj/GmBUUMG6VHb83mTN3xs=
X-Google-Smtp-Source: ABdhPJyGo1HIr2IsE9Guiim2CovjsB8k95QIZoO6loPQKi0gjDqcGbVVZOjKLz7z//H6fsaqPc38hA==
X-Received: by 2002:a05:600c:4e05:: with SMTP id
 b5mr9875859wmq.44.1644220518604; 
 Sun, 06 Feb 2022 23:55:18 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id d12sm1747655wrx.47.2022.02.06.23.55.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Feb 2022 23:55:18 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 11/21] accel: Introduce AccelOpsClass::cpus_are_resettable()
Date: Mon,  7 Feb 2022 08:54:16 +0100
Message-Id: <20220207075426.81934-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207075426.81934-1-f4bug@amsat.org>
References: <20220207075426.81934-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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

Add cpus_are_resettable() to AccelOps, and implement it for the
KVM accelerator.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/kvm/kvm-accel-ops.c  | 6 ++++++
 include/sysemu/accel-ops.h | 2 ++
 include/sysemu/hw_accel.h  | 5 -----
 softmmu/cpus.c             | 5 ++++-
 4 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index 95b7b08020..c4244a23c6 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -79,12 +79,18 @@ static bool kvm_vcpu_thread_is_idle(CPUState *cpu)
     return !kvm_halt_in_kernel();
 }
 
+static bool kvm_cpus_are_resettable(void)
+{
+    return !kvm_enabled() || kvm_cpu_check_are_resettable();
+}
+
 static void kvm_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = kvm_start_vcpu_thread;
     ops->cpu_thread_is_idle = kvm_vcpu_thread_is_idle;
+    ops->cpus_are_resettable = kvm_cpus_are_resettable;
     ops->synchronize_post_reset = kvm_cpu_synchronize_post_reset;
     ops->synchronize_post_init = kvm_cpu_synchronize_post_init;
     ops->synchronize_state = kvm_cpu_synchronize_state;
diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 50c72540c7..6013c9444c 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -28,6 +28,8 @@ struct AccelOpsClass {
     /* initialization function called when accel is chosen */
     void (*ops_init)(AccelOpsClass *ops);
 
+    bool (*cpus_are_resettable)(void);
+
     void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY NON-NULL */
     void (*kick_vcpu_thread)(CPUState *cpu);
     bool (*cpu_thread_is_idle)(CPUState *cpu);
diff --git a/include/sysemu/hw_accel.h b/include/sysemu/hw_accel.h
index 01b5ebf442..22903a55f7 100644
--- a/include/sysemu/hw_accel.h
+++ b/include/sysemu/hw_accel.h
@@ -23,9 +23,4 @@ void cpu_synchronize_post_reset(CPUState *cpu);
 void cpu_synchronize_post_init(CPUState *cpu);
 void cpu_synchronize_pre_loadvm(CPUState *cpu);
 
-static inline bool cpu_check_are_resettable(void)
-{
-    return kvm_enabled() ? kvm_cpu_check_are_resettable() : true;
-}
-
 #endif /* QEMU_HW_ACCEL_H */
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 5b0bcb8c65..79e7d7a608 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -199,7 +199,10 @@ void cpu_synchronize_pre_loadvm(CPUState *cpu)
 
 bool cpus_are_resettable(void)
 {
-    return cpu_check_are_resettable();
+    if (cpus_accel->cpus_are_resettable) {
+        return cpus_accel->cpus_are_resettable();
+    }
+    return true;
 }
 
 int64_t cpus_get_virtual_clock(void)
-- 
2.34.1


