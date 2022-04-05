Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D62904F3303
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 15:07:32 +0200 (CEST)
Received: from localhost ([::1]:56462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbiuB-00021B-Vi
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 09:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nbirh-0000R0-EX
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 09:04:57 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:46460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nbirf-0003xY-Gd
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 09:04:57 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-d39f741ba0so14245504fac.13
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 06:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=akBslgGtD7yVObalqIwNNaUBrshy9tWJ6X+w0+2xKLE=;
 b=Z7XnhHLs2FV572tRsmv7dWZtlFFPkr0yqHr7R11ZM4HUOXLaqXZ3/vRaMUaFGcFPI1
 jN/RGJXFmdxJUsihnfxP09UCHDWWWklfg+aiMX4MGoHEy705KtsdcVT2z/RbvuzwFiO3
 anPwXiJ4sOZ43fE+ZOZ37KAvU7xyqcmSoC2CSC7tYkp1qwcyMLd2ulN7qmgbwN4JFr17
 fUWixE0KBh5ToTCaXqNJexCe/sLhmFDTqBKlyza3zt2BbSlwW0rzSZNc/KL7c8BAK4tu
 qRU5cfOc7G10SmkZ2GTBCQ7Ih2biCTdb3kp7aZqdsUyGFwA46ienJ6w2R0d2SQs+Bmir
 eGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=akBslgGtD7yVObalqIwNNaUBrshy9tWJ6X+w0+2xKLE=;
 b=iV4CCxXpa7CRuASMsmdIbxP3t3tMbxuHgr8u34fR1ikO6YrW6Vqobq41idLUO+i6+w
 CB12wkQ2lroDnCh7OoFnmoCcFWcTWrvuywaTxzfafJB4V9LYhvgZxWTGxokb4Rd0ERpR
 UnLi1ns0ebYx/N73HxrzQlqCi1OFpxjEtufteV5rfMyD0BSr1lBMJzdtun9w+gL8BlRw
 AANhFQ9X0CulZsEM6INDDLrouurRpPxE6EfEBSzDqzj8FsGxI2baAPlIANQLBpDJjFlQ
 FbRyTyWMavA5D2NjKPzrBP1HcBKGb6PuVPxOVPGldXiRTx4dUBzfAejWZPCE3U5Cg13U
 Mc+g==
X-Gm-Message-State: AOAM530bhvSFDxRDQfYsqYk6t6oEMjOGphJ8SaOSC02EdQ9k/IbpwOc1
 jrscRNI41ukCOrWF+gqQl3MYPzvRNQg=
X-Google-Smtp-Source: ABdhPJxnpaOawuqQq+jA3fyZut6iHTQbR3Ejcx8PM8TnaWul2aktwDs+X1yyVXAhy9c2Z1N+ePujCw==
X-Received: by 2002:a05:6870:c20f:b0:e2:434:c3e1 with SMTP id
 z15-20020a056870c20f00b000e20434c3e1mr1509442oae.266.1649163894113; 
 Tue, 05 Apr 2022 06:04:54 -0700 (PDT)
Received: from rekt.ibmmodules.com ([2804:431:c7c6:abe8:ed:2c78:ab0c:7946])
 by smtp.gmail.com with ESMTPSA id
 60-20020a9d0642000000b005b22a82458csm5658134otn.55.2022.04.05.06.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 06:04:53 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/1] kvm-all.c: hint Valgrind that kvm_get_one_reg() inits
 memory
Date: Tue,  5 Apr 2022 10:04:39 -0300
Message-Id: <20220405130439.44253-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405130439.44253-1-danielhb413@gmail.com>
References: <20220405130439.44253-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a lot of Valgrind warnings about conditional jump depending on
unintialized values like this one (taken from a pSeries guest):

 Conditional jump or move depends on uninitialised value(s)
    at 0xB011DC: kvmppc_enable_cap_large_decr (kvm.c:2544)
    by 0x92F28F: cap_large_decr_cpu_apply (spapr_caps.c:523)
    by 0x930C37: spapr_caps_cpu_apply (spapr_caps.c:921)
    by 0x955D3B: spapr_reset_vcpu (spapr_cpu_core.c:73)
(...)
  Uninitialised value was created by a stack allocation
    at 0xB01150: kvmppc_enable_cap_large_decr (kvm.c:2538)

In this case, the alleged unintialized value is the 'lpcr' variable that
is written by kvm_get_one_reg() and then used in an if clause:

int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable)
{
    CPUState *cs = CPU(cpu);
    uint64_t lpcr;

    kvm_get_one_reg(cs, KVM_REG_PPC_LPCR_64, &lpcr);
    /* Do we need to modify the LPCR? */
    if (!!(lpcr & LPCR_LD) != !!enable) { <---- Valgrind warns here
(...)

A quick fix is to init the variable that kvm_get_one_reg() is going to
write ('lpcr' in the example above). Another idea is to convince
Valgrind that kvm_get_one_reg() inits the 'void *target' memory in case
the ioctl() is successful. This will put some boilerplate in the
function but it will bring benefit for its other callers.

This patch uses the memcheck VALGRING_MAKE_MEM_DEFINED() to mark the
'target' variable as initialized if the ioctl is successful.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 accel/kvm/kvm-all.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 5f1377ca04..d9acba23c7 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -53,6 +53,10 @@
 #include <sys/eventfd.h>
 #endif
 
+#ifdef CONFIG_VALGRIND_H
+#include <valgrind/memcheck.h>
+#endif
+
 /* KVM uses PAGE_SIZE in its definition of KVM_COALESCED_MMIO_MAX. We
  * need to use the real host PAGE_SIZE, as that's what KVM will use.
  */
@@ -3504,6 +3508,19 @@ int kvm_get_one_reg(CPUState *cs, uint64_t id, void *target)
     if (r) {
         trace_kvm_failed_reg_get(id, strerror(-r));
     }
+
+#ifdef CONFIG_VALGRIND_H
+    if (r == 0) {
+        switch (id & KVM_REG_SIZE_MASK) {
+        case KVM_REG_SIZE_U32:
+            VALGRIND_MAKE_MEM_DEFINED(target, sizeof(uint32_t));
+            break;
+        case KVM_REG_SIZE_U64:
+            VALGRIND_MAKE_MEM_DEFINED(target, sizeof(uint64_t));
+            break;
+        }
+    }
+#endif
     return r;
 }
 
-- 
2.35.1


