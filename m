Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57D939E6F2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 20:59:55 +0200 (CEST)
Received: from localhost ([::1]:41024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqKTa-0006Rq-Dg
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 14:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqKRR-0003bz-JN; Mon, 07 Jun 2021 14:57:41 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:45159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqKRP-0005m5-Hx; Mon, 07 Jun 2021 14:57:41 -0400
Received: from quad ([82.142.12.38]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N8oKc-1lJvmi1sLG-015q8o; Mon, 07
 Jun 2021 20:57:34 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 02/11] i386/kvm: The value passed to strerror should be positive
Date: Mon,  7 Jun 2021 20:57:21 +0200
Message-Id: <20210607185730.346641-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607185730.346641-1-laurent@vivier.eu>
References: <20210607185730.346641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:eO/zs/LosSB4wBzM0aA4r3tRMdSTwdd0Km/ye9zr9e4RcmFCEZ/
 NG94Ksy4W1PrBJweqYF3JG2UiN+V6FX/TGXnIx27dXBfQY6onmT/h/c0M4vvYuT8Rb+1YQm
 PKyi8/sgTVwJMn5U7mWHtVkl94pLdNIu7mcFgw699wHj3GR/49n/z5iMyj1WdKz6ccVs/rH
 I5+ioLyCLLPFdJs5/KCMg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+BMpj+m2zGc=:BQbTUC3F7O/lmeqJB8nRCU
 Jka3c1Zglaiq3uj4tFs/qMaqC6/xKiR5Bpauw63U40XPKq63BrfAGxuTG8E06VMePHGN0S2pO
 vWHwhW4IExJEtUALwEJZMr09edEfTgVojT1Ijn38IWfLequoZeWbJv9TQYGh4EEF83yNA8a/S
 5Uj7RZnMKFi4zSc7/jsng+wQnpVFlnVfCgMkmEv3HZ+cOMyCX3+UczQhe+Terep681zqRuAUZ
 zPAALbLzONpm3IePw69+vB4AUXRUT498EOl4/Ms0gvUCPOjXiKqzZolZlPRZbP4xJ9En7FVCR
 5NNQW7+IKMPSHHv8WZdM98FFUv/wnKFI0M770G7TwgLTGN66wSed7z3iDSFWzodi9qQPRriY+
 KFQGKid/1isTof5ezi8iW2UFXo/cEsIniNM/XxLrw3U7boeJk9C3BI6AHZpngBdPiVrmAMXTf
 NgRNRlrKODjNhZ+xU8tuHCtMFnOxVKdMiGGqoZqF2DBZKW42YMu9wcq0/jpoDrH6WM2Da/AdD
 jXqS8PBkgLtfjVXVgK67uU=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Dmitry Voronetskiy <vda1999@yandex.ru>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dmitry Voronetskiy <vda1999@yandex.ru>

Signed-off-by: Dmitry Voronetskiy <vda1999@yandex.ru>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210519113528.12474-1-davoronetskiy@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/i386/kvm/apic.c   |  2 +-
 hw/i386/kvm/clock.c  |  4 ++--
 hw/i386/kvm/i8254.c  | 10 +++++-----
 hw/i386/kvm/i8259.c  |  4 ++--
 hw/i386/kvm/ioapic.c |  4 ++--
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/i386/kvm/apic.c b/hw/i386/kvm/apic.c
index 52ff49091000..1e89ca0899c2 100644
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
index efbc1e0d12c2..df70b4a0338a 100644
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
index c558893961ba..fa68669e8a59 100644
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
index 3f8bf69e9ca4..d61bae4dc359 100644
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
index 71a563181e03..ee7c8ef68bea 100644
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
2.31.1


