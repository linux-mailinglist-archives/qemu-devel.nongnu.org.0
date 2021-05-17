Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7782382DA0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 15:39:59 +0200 (CEST)
Received: from localhost ([::1]:35052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lidTT-00011y-23
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 09:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davoronetskiy@gmail.com>)
 id 1liYoC-0007jh-Ny; Mon, 17 May 2021 04:41:05 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:44951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <davoronetskiy@gmail.com>)
 id 1liYoA-0007hL-OT; Mon, 17 May 2021 04:41:04 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 y184-20020a1ce1c10000b02901769b409001so1667464wmg.3; 
 Mon, 17 May 2021 01:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S0BKA7DWQarWZgQuD0oEI5sf8rrZK/ZHs7pXc58I5Og=;
 b=aUd67WglsLaz8CS4qrG1N42GN//3bryWezdwggUOKU+9viCOzd9gKabvSOp5tjdkMi
 HQkU87/XJCQXcx9lemBcn4gFGfZn/8pfr1HGfHLmJ5unar+vrwPKzJ0b+IWQpP/nbvFD
 AdYMX03u3TVsmM8JEKRXWtDY9KOZbaDHLeovblV9QHXjMpymotWOEdD4ZLzGupvEr0KC
 XkwMTmDgmsti6AJY5JiiPWOxEFvbCQC3bfQxdmHJO7fKamAJctF0YsPBjeQVRhHne9K2
 20UQAFpaw02TLL8kcMP9IK0XdHJ+FOx4+4EMLbgVTz7Nmul77XV9HEWt9YwhpZEZKvYc
 59jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S0BKA7DWQarWZgQuD0oEI5sf8rrZK/ZHs7pXc58I5Og=;
 b=oDgFjFy22bCH0K+CxdW5OHeAdYfXlUDgrieloJJ+3eWAxsfEI8qYTmryc5UOFEhMMu
 dGGS17mR13WAw59k7kV1czWylYtC3CvB2F2WVHEnf86DHiMzRpB3WcYmhqtl/iN6WT0d
 SQ4qsCfdO6kXH5fbMDlKZN31BS12ZwO8SIrUytacbibeFcQapz6mqnDXfMCkY6KZz+OO
 i47VtpK5JdgF44QUIgZrBz1kdg8tIJCktcrShkICVgTBN1Y5muNOdSUK/cbrowgRdWGX
 ReAdO1ID7bKaH/OWkvaulkzuXvXm32RMCCb3KdC9bkcYm1BU0vd7AYlrjqv1EdFqDXMK
 1yFQ==
X-Gm-Message-State: AOAM531V6S2DbCVgD2tiDWjIysEqu/W+9X2Ca0y6b2ONN0seQEHbtoVT
 hH+/MQP8sJiKWidz5pdzJPQQyj8rX4v0ewgL
X-Google-Smtp-Source: ABdhPJxYDfSN7yzpOPBbxM+ssxJNkYtLGc6W/TFcRFjOiWpcmRZOrfLieA1kuVHgmZe8WdexsmMj2w==
X-Received: by 2002:a7b:c5d2:: with SMTP id n18mr22215938wmk.97.1621240859169; 
 Mon, 17 May 2021 01:40:59 -0700 (PDT)
Received: from dima-Latitude-5300.fritz.box (31-1-181.netrun.cytanet.com.cy.
 [31.153.1.181])
 by smtp.gmail.com with ESMTPSA id k7sm17224117wro.8.2021.05.17.01.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 01:40:58 -0700 (PDT)
From: Dmitry Voronetskiy <davoronetskiy@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Signed-off-by: Dmitry Voronetskiy <vda1999@yandex.ru>
Date: Mon, 17 May 2021 11:40:55 +0300
Message-Id: <20210517084055.24792-1-davoronetskiy@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=davoronetskiy@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 17 May 2021 09:37:45 -0400
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
Cc: qemu-trivial@nongnu.org, Dmitry Voronetskiy <vda1999@yandex.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dmitry Voronetskiy <vda1999@yandex.ru>

the value passed to strerror should be positive
---
 hw/i386/kvm/apic.c   |  2 +-
 hw/i386/kvm/clock.c  |  4 ++--
 hw/i386/kvm/i8254.c  | 10 +++++-----
 hw/i386/kvm/i8259.c  |  4 ++--
 hw/i386/kvm/ioapic.c |  4 ++--
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/i386/kvm/apic.c b/hw/i386/kvm/apic.c
index 52ff490910..1e89ca0899 100644
--- a/hw/i386/kvm/apic.c
+++ b/hw/i386/kvm/apic.c
@@ -145,7 +145,7 @@ static void kvm_apic_put(CPUState *cs, run_on_cpu_data data)
 
     ret = kvm_vcpu_ioctl(CPU(s->cpu), KVM_SET_LAPIC, &kapic);
     if (ret < 0) {
-        fprintf(stderr, "KVM_SET_LAPIC failed: %s\n", strerror(ret));
+        fprintf(stderr, "KVM_SET_LAPIC failed: %s\n", strerror(-ret));
         abort();
     }
 }
diff --git a/hw/i386/kvm/clock.c b/hw/i386/kvm/clock.c
index efbc1e0d12..df70b4a033 100644
--- a/hw/i386/kvm/clock.c
+++ b/hw/i386/kvm/clock.c
@@ -105,7 +105,7 @@ static void kvm_update_clock(KVMClockState *s)
 
     ret = kvm_vm_ioctl(kvm_state, KVM_GET_CLOCK, &data);
     if (ret < 0) {
-        fprintf(stderr, "KVM_GET_CLOCK failed: %s\n", strerror(ret));
+        fprintf(stderr, "KVM_GET_CLOCK failed: %s\n", strerror(-ret));
                 abort();
     }
     s->clock = data.clock;
@@ -189,7 +189,7 @@ static void kvmclock_vm_state_change(void *opaque, bool running,
         data.clock = s->clock;
         ret = kvm_vm_ioctl(kvm_state, KVM_SET_CLOCK, &data);
         if (ret < 0) {
-            fprintf(stderr, "KVM_SET_CLOCK failed: %s\n", strerror(ret));
+            fprintf(stderr, "KVM_SET_CLOCK failed: %s\n", strerror(-ret));
             abort();
         }
 
diff --git a/hw/i386/kvm/i8254.c b/hw/i386/kvm/i8254.c
index c558893961..fa68669e8a 100644
--- a/hw/i386/kvm/i8254.c
+++ b/hw/i386/kvm/i8254.c
@@ -104,7 +104,7 @@ static void kvm_pit_get(PITCommonState *pit)
     if (kvm_has_pit_state2()) {
         ret = kvm_vm_ioctl(kvm_state, KVM_GET_PIT2, &kpit);
         if (ret < 0) {
-            fprintf(stderr, "KVM_GET_PIT2 failed: %s\n", strerror(ret));
+            fprintf(stderr, "KVM_GET_PIT2 failed: %s\n", strerror(-ret));
             abort();
         }
         pit->channels[0].irq_disabled = kpit.flags & KVM_PIT_FLAGS_HPET_LEGACY;
@@ -115,7 +115,7 @@ static void kvm_pit_get(PITCommonState *pit)
          */
         ret = kvm_vm_ioctl(kvm_state, KVM_GET_PIT, &kpit);
         if (ret < 0) {
-            fprintf(stderr, "KVM_GET_PIT failed: %s\n", strerror(ret));
+            fprintf(stderr, "KVM_GET_PIT failed: %s\n", strerror(-ret));
             abort();
         }
     }
@@ -180,7 +180,7 @@ static void kvm_pit_put(PITCommonState *pit)
     if (ret < 0) {
         fprintf(stderr, "%s failed: %s\n",
                 kvm_has_pit_state2() ? "KVM_SET_PIT2" : "KVM_SET_PIT",
-                strerror(ret));
+                strerror(-ret));
         abort();
     }
 }
@@ -272,7 +272,7 @@ static void kvm_pit_realizefn(DeviceState *dev, Error **errp)
     }
     if (ret < 0) {
         error_setg(errp, "Create kernel PIC irqchip failed: %s",
-                   strerror(ret));
+                   strerror(-ret));
         return;
     }
     switch (s->lost_tick_policy) {
@@ -286,7 +286,7 @@ static void kvm_pit_realizefn(DeviceState *dev, Error **errp)
             if (ret < 0) {
                 error_setg(errp,
                            "Can't disable in-kernel PIT reinjection: %s",
-                           strerror(ret));
+                           strerror(-ret));
                 return;
             }
         }
diff --git a/hw/i386/kvm/i8259.c b/hw/i386/kvm/i8259.c
index 3f8bf69e9c..d61bae4dc3 100644
--- a/hw/i386/kvm/i8259.c
+++ b/hw/i386/kvm/i8259.c
@@ -43,7 +43,7 @@ static void kvm_pic_get(PICCommonState *s)
     chip.chip_id = s->master ? KVM_IRQCHIP_PIC_MASTER : KVM_IRQCHIP_PIC_SLAVE;
     ret = kvm_vm_ioctl(kvm_state, KVM_GET_IRQCHIP, &chip);
     if (ret < 0) {
-        fprintf(stderr, "KVM_GET_IRQCHIP failed: %s\n", strerror(ret));
+        fprintf(stderr, "KVM_GET_IRQCHIP failed: %s\n", strerror(-ret));
         abort();
     }
 
@@ -96,7 +96,7 @@ static void kvm_pic_put(PICCommonState *s)
 
     ret = kvm_vm_ioctl(kvm_state, KVM_SET_IRQCHIP, &chip);
     if (ret < 0) {
-        fprintf(stderr, "KVM_SET_IRQCHIP failed: %s\n", strerror(ret));
+        fprintf(stderr, "KVM_SET_IRQCHIP failed: %s\n", strerror(-ret));
         abort();
     }
 }
diff --git a/hw/i386/kvm/ioapic.c b/hw/i386/kvm/ioapic.c
index 71a563181e..ee7c8ef68b 100644
--- a/hw/i386/kvm/ioapic.c
+++ b/hw/i386/kvm/ioapic.c
@@ -62,7 +62,7 @@ static void kvm_ioapic_get(IOAPICCommonState *s)
     chip.chip_id = KVM_IRQCHIP_IOAPIC;
     ret = kvm_vm_ioctl(kvm_state, KVM_GET_IRQCHIP, &chip);
     if (ret < 0) {
-        fprintf(stderr, "KVM_GET_IRQCHIP failed: %s\n", strerror(ret));
+        fprintf(stderr, "KVM_GET_IRQCHIP failed: %s\n", strerror(-ret));
         abort();
     }
 
@@ -95,7 +95,7 @@ static void kvm_ioapic_put(IOAPICCommonState *s)
 
     ret = kvm_vm_ioctl(kvm_state, KVM_SET_IRQCHIP, &chip);
     if (ret < 0) {
-        fprintf(stderr, "KVM_SET_IRQCHIP failed: %s\n", strerror(ret));
+        fprintf(stderr, "KVM_SET_IRQCHIP failed: %s\n", strerror(-ret));
         abort();
     }
 }
-- 
2.25.1


