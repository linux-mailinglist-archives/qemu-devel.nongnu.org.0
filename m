Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E375292D0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:24:41 +0200 (CEST)
Received: from localhost ([::1]:52368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiCm-0001yo-Lv
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhim-0008Le-IG
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:53:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhik-0006fD-Qk
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:53:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jj+1GdC5ed9RjG2w4YTgAyI/dqT/LcafZe1Q5l3sISU=;
 b=BiS8VZsxCJluchTok5/yxvM0fITvdv2xMFNyU18FPAj1nNyM2KCIMX8Wd0lxCDqXJqRGWN
 mYs9LHTaTN9jlIQftsdz3cZRKhVseg5jlqLqKJOg+TpX/c+GAcimvTk3MDh8k0lgmjVcJz
 tq3Dj5TkPTcVm1t6GjANR+nYAA3KpyI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-A-qKVp51OzqInc3uMg2yBw-1; Mon, 16 May 2022 16:53:36 -0400
X-MC-Unique: A-qKVp51OzqInc3uMg2yBw-1
Received: by mail-ed1-f70.google.com with SMTP id
 ch28-20020a0564021bdc00b00425cb227ab4so10492471edb.4
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Jj+1GdC5ed9RjG2w4YTgAyI/dqT/LcafZe1Q5l3sISU=;
 b=4xArsnqNRV1SVDRtqbSWH6HeacCrEdHxPcD7GLRulN9PLxZc83qjAyOcyfOMh+rUCj
 ru7K4ozsfWzgest3lByJzWvZzHk2eDnb5YKomXhdIkrUwrwKJtiK5Ycm1fKsgjsIV7gW
 +AWv5Ne39R+RoQOCBIBCdQPRDMzg5zMrsVfKpRggAhhJT9yoTduefotJ74GtsbKUT0pJ
 JORl8bVa6gVKON/RnJPU3o8y7AupBkik9FmKsSfErhP11tJc0k0waeLuOsjbcmAyjJjc
 iJrwQqxb7rKg6m7UYg+APScmjgV3hmYkqf9XzOnGaOrv2uO9ZTLz2N5GzuQqLmcjmobh
 7blQ==
X-Gm-Message-State: AOAM533lSw51u8sFI/oe/yxK5rDUy4BaB+UTfN6lluqcyas9J3SM4Kcy
 WYtgPLzD4E9E167vM71Rcb4YSYNA2n0+sknulUJL2xnNlmuLD6vrJHF5UW2YE4Teaq5AQVZMYtF
 Kx6m48jYIXf3BRKOfFM993/tQeEfP0CUCvELjXWogUwCseLy+ZOEGBfSET8Uj
X-Received: by 2002:a50:ea8b:0:b0:428:7d05:eb7e with SMTP id
 d11-20020a50ea8b000000b004287d05eb7emr14878217edo.185.1652734413896; 
 Mon, 16 May 2022 13:53:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2KCqWfRikajj4wIQWOtpCghzr69gRHuvpcIhTWpWoTu9HLy2ox3hPwr0mjBMz5Umcz1ed7Q==
X-Received: by 2002:a50:ea8b:0:b0:428:7d05:eb7e with SMTP id
 d11-20020a50ea8b000000b004287d05eb7emr14878187edo.185.1652734413670; 
 Mon, 16 May 2022 13:53:33 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 g26-20020a056402181a00b0042617ba638esm5627992edy.24.2022.05.16.13.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:53:33 -0700 (PDT)
Date: Mon, 16 May 2022 16:53:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org
Subject: [PULL v2 49/86] target/i386: Fix sanity check on max APIC ID /
 X2APIC enablement
Message-ID: <20220516204913.542894-50-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: David Woodhouse <dwmw2@infradead.org>

The check on x86ms->apic_id_limit in pc_machine_done() had two problems.

Firstly, we need KVM to support the X2APIC API in order to allow IRQ
delivery to APICs >= 255. So we need to call/check kvm_enable_x2apic(),
which was done elsewhere in *some* cases but not all.

Secondly, microvm needs the same check. So move it from pc_machine_done()
to x86_cpus_init() where it will work for both.

The check in kvm_cpu_instance_init() is now redundant and can be dropped.

Signed-off-by: David Woodhouse <dwmw2@infradead.org>
Acked-by: Claudio Fontana <cfontana@suse.de>
Message-Id: <20220314142544.150555-1-dwmw2@infradead.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc.c              |  8 --------
 hw/i386/x86.c             | 16 ++++++++++++++++
 target/i386/kvm/kvm-cpu.c |  2 +-
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 312eb9e400..15f37d8dc6 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -744,14 +744,6 @@ void pc_machine_done(Notifier *notifier, void *data)
         /* update FW_CFG_NB_CPUS to account for -device added CPUs */
         fw_cfg_modify_i16(x86ms->fw_cfg, FW_CFG_NB_CPUS, x86ms->boot_cpus);
     }
-
-
-    if (x86ms->apic_id_limit > 255 && !xen_enabled() &&
-        !kvm_irqchip_in_kernel()) {
-        error_report("current -smp configuration requires kernel "
-                     "irqchip support.");
-        exit(EXIT_FAILURE);
-    }
 }
 
 void pc_guest_info_init(PCMachineState *pcms)
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 79ebdface6..f79e720cc2 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -38,6 +38,7 @@
 #include "sysemu/replay.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/cpu-timers.h"
+#include "sysemu/xen.h"
 #include "trace.h"
 
 #include "hw/i386/x86.h"
@@ -122,6 +123,21 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
      */
     x86ms->apic_id_limit = x86_cpu_apic_id_from_index(x86ms,
                                                       ms->smp.max_cpus - 1) + 1;
+
+    /*
+     * Can we support APIC ID 255 or higher?
+     *
+     * Under Xen: yes.
+     * With userspace emulated lapic: no
+     * With KVM's in-kernel lapic: only if X2APIC API is enabled.
+     */
+    if (x86ms->apic_id_limit > 255 && !xen_enabled() &&
+        (!kvm_irqchip_in_kernel() || !kvm_enable_x2apic())) {
+        error_report("current -smp configuration requires kernel "
+                     "irqchip and X2APIC API support.");
+        exit(EXIT_FAILURE);
+    }
+
     possible_cpus = mc->possible_cpu_arch_ids(ms);
     for (i = 0; i < ms->smp.cpus; i++) {
         x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id, &error_fatal);
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index 5eb955ce9a..7237378a7d 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -171,7 +171,7 @@ static void kvm_cpu_instance_init(CPUState *cs)
         /* only applies to builtin_x86_defs cpus */
         if (!kvm_irqchip_in_kernel()) {
             x86_cpu_change_kvm_default("x2apic", "off");
-        } else if (kvm_irqchip_is_split() && kvm_enable_x2apic()) {
+        } else if (kvm_irqchip_is_split()) {
             x86_cpu_change_kvm_default("kvm-msi-ext-dest-id", "on");
         }
 
-- 
MST


