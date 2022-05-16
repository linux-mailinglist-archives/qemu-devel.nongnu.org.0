Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA35528AAB
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:37:12 +0200 (CEST)
Received: from localhost ([::1]:37736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdiZ-00007B-8s
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd4u-0001Lh-6O
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd4s-0003Js-Gj
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wBEsT3r31ofu46HxbD7Amv+tNDwSCFB3+Wv+gV0TRLY=;
 b=AGXT/acHBq2CMGiP38Dwga/CHvoCKMtLVeFTLKdAogF1coxDkdQJp8o9/6kProcu2JB1gx
 6vUSAcivXE/DIDSiwykBBpUfyP7ZB/SFP3HdzmYoFBR/ZaZWivntEbP1M7I2Hp+m6vqelc
 1pT5+Im3mFINbgh0auQhWu4iTE7QfEM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-Sgw1qdHSOeKkhdgq3H6Iiw-1; Mon, 16 May 2022 11:56:08 -0400
X-MC-Unique: Sgw1qdHSOeKkhdgq3H6Iiw-1
Received: by mail-ed1-f70.google.com with SMTP id
 b3-20020aa7d483000000b004282ca95814so9973980edr.9
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wBEsT3r31ofu46HxbD7Amv+tNDwSCFB3+Wv+gV0TRLY=;
 b=PlpJ4GoJdD44HNFWeyBLHDcOIaWu+PBa8ENzTL79hk1wKq3nSNT4RnumOF+LTqDiYw
 E9IGasrlytqUU1E+07KCfX4SOIHDs0cFeooZeVOMda7GUT1elXhXKLN1IaGo8LKvpnxo
 Gq6iWQzcPPUVx28O3CRE+0YU9RsgqUGbxdnZxJzsdHeYbpOXJ9t3zVf7+5nW+lUs2uwM
 6HoFsWK7qqu6jhkvBxEU5m3NADC18R+zYztb94b6xmgUr6rXocnbhzIswv5bepbLx58a
 3sQMfyBkL2z8a49zs+fYJzyiaBgakhBQLbX4tHRlAd+8Tovi8Me56LJ9/tj9IBdSSFfA
 Qs8w==
X-Gm-Message-State: AOAM532ioE7H7G7bzPCQ5pvGsLr70AejnBj7KP50bhAwaT9Gz+mqhSma
 0o3sSbHLQ6+3t0AvscVZMnyZ6UPjmJKnqHiBxPywa1n+uSu589rmgiyacagSfpDdCxfvN6mpcyo
 HleNiRg98sQYD/0f1MK4I4NO22iBFz5sXDQuigfVGTKrNbnfKaJVdI8Dz2WHMwII2DPU=
X-Received: by 2002:aa7:c849:0:b0:427:d464:e66f with SMTP id
 g9-20020aa7c849000000b00427d464e66fmr13959722edt.411.1652716566594; 
 Mon, 16 May 2022 08:56:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyu8I2qfGFbSMKxXlAlQRPfpbWO09S6P0bVUMr+6UWrZ4Q2ni1b51FIZXXj+Wn6+nDiS5ZgBg==
X-Received: by 2002:aa7:c849:0:b0:427:d464:e66f with SMTP id
 g9-20020aa7c849000000b00427d464e66fmr13959700edt.411.1652716566354; 
 Mon, 16 May 2022 08:56:06 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 hg22-20020a1709072cd600b006f5294986besm43354ejc.111.2022.05.16.08.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:56:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Ivan Shcherbakov <ivan@sysprogs.com>
Subject: [PULL 01/23] WHPX: fixed TPR/CR8 translation issues affecting VM
 debugging
Date: Mon, 16 May 2022 17:55:41 +0200
Message-Id: <20220516155603.1234712-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220516155603.1234712-1-pbonzini@redhat.com>
References: <20220516155603.1234712-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ivan Shcherbakov <ivan@sysprogs.com>

This patch fixes the following error that would occur when trying to resume
a WHPX-accelerated VM from a breakpoint:

    qemu: WHPX: Failed to set interrupt state registers, hr=c0350005

The error arises from an incorrect CR8 value being passed to
WHvSetVirtualProcessorRegisters() that doesn't match the
value set via WHvSetVirtualProcessorInterruptControllerState2().

Signed-off-by: Ivan Shcherbakov <ivan@sysprogs.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/whpx/whpx-all.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 23ae639b23..b22a3314b4 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -373,6 +373,8 @@ static int whpx_set_tsc(CPUState *cpu)
  *
  * This mechanism is described in section 10.8.6.1 of Volume 3 of Intel 64
  * and IA-32 Architectures Software Developer's Manual.
+ *
+ * The functions below translate the value of CR8 to TPR and vice versa.
  */
 
 static uint64_t whpx_apic_tpr_to_cr8(uint64_t tpr)
@@ -380,6 +382,11 @@ static uint64_t whpx_apic_tpr_to_cr8(uint64_t tpr)
     return tpr >> 4;
 }
 
+static uint64_t whpx_cr8_to_apic_tpr(uint64_t cr8)
+{
+    return cr8 << 4;
+}
+
 static void whpx_set_registers(CPUState *cpu, int level)
 {
     struct whpx_state *whpx = &whpx_global;
@@ -687,7 +694,7 @@ static void whpx_get_registers(CPUState *cpu)
     tpr = vcxt.values[idx++].Reg64;
     if (tpr != vcpu->tpr) {
         vcpu->tpr = tpr;
-        cpu_set_apic_tpr(x86_cpu->apic_state, tpr);
+        cpu_set_apic_tpr(x86_cpu->apic_state, whpx_cr8_to_apic_tpr(tpr));
     }
 
     /* 8 Debug Registers - Skipped */
@@ -1547,7 +1554,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
      }
 
     /* Sync the TPR to the CR8 if was modified during the intercept */
-    tpr = cpu_get_apic_tpr(x86_cpu->apic_state);
+    tpr = whpx_apic_tpr_to_cr8(cpu_get_apic_tpr(x86_cpu->apic_state));
     if (tpr != vcpu->tpr) {
         vcpu->tpr = tpr;
         reg_values[reg_count].Reg64 = tpr;
@@ -1596,7 +1603,7 @@ static void whpx_vcpu_post_run(CPUState *cpu)
     if (vcpu->tpr != tpr) {
         vcpu->tpr = tpr;
         qemu_mutex_lock_iothread();
-        cpu_set_apic_tpr(x86_cpu->apic_state, vcpu->tpr);
+        cpu_set_apic_tpr(x86_cpu->apic_state, whpx_cr8_to_apic_tpr(vcpu->tpr));
         qemu_mutex_unlock_iothread();
     }
 
-- 
2.36.0


