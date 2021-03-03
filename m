Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A599332B9EB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:35:16 +0100 (CET)
Received: from localhost ([::1]:36292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWL5-0006ip-Nf
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:35:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW9x-0006pA-BN
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:23:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW9u-0000nC-DD
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:23:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=79DgZpr2EmNkKjevsnbnnQniykZdHifg2JouUZY5E8w=;
 b=RMIThd85MBEpUEDRMa6C3BXWNXPRonEBX3aItDd99DjeoO2y6JHgN3FCWIvFZRt4eK+cL7
 CAzhH2xzu6ckTpfdQRgAyeh0b/hxkjzHgTV0xhFXHdck+RPONUGnXkFIoZKVzjnd0vkith
 bXHIuIhGeROX7QgRfoK+SUhwdDWMo4k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-mQUngpVVPP2husgdzc-5-w-1; Wed, 03 Mar 2021 13:23:40 -0500
X-MC-Unique: mQUngpVVPP2husgdzc-5-w-1
Received: by mail-wr1-f69.google.com with SMTP id p15so13019597wre.13
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:23:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=79DgZpr2EmNkKjevsnbnnQniykZdHifg2JouUZY5E8w=;
 b=WpdSBNc29O/Mib1HpxihPHIQoKzzFHEQTmYEeblBdgNwJKni5DxIX7+X9aLVaDAWKQ
 FO8HHToU/hTqxNSRegmh33etNjVtFj6uisjl9NPTJxV2uu4O/sNmGzCDS9ZWJAZV9LaJ
 AKuavw0ufdnSlWvdlOFYWCdzRpBQrvaGRQEX+F6Yv7bhQDknRPddEJi8s9OFzhjbMR77
 2P/STZ5bI0K1+weDXk/XOlwYUkk+Xvv9BmIsJlsVjTnaGC1qRhB8EmR2QkpS7va/5REK
 vX1MZfB1dRQJ9rJpuAsuZDvkQQ1TIGD8Zgo9qdcvemFfTE6A5nbtZfeTM6Q6TXM3OgUX
 vpaQ==
X-Gm-Message-State: AOAM532X3j1yt0SP4b8FnSxC5q9VOuvsfPauC0DfQnjqJ1jLew7cy+Eq
 gPJGuZzmFA8mu9rCAOSpRYeVex1GEsg1jeuOhis1ywTBgbttNO74GudjGTzg4F1p/Jhb6qj07Km
 /rDL9vsIH6QNeNaUPX+JbwjXdqxk47+i7K5F2yAd12x7+t/Kdad1odw7SnDD7O4f2
X-Received: by 2002:a7b:c407:: with SMTP id k7mr292601wmi.136.1614795819114;
 Wed, 03 Mar 2021 10:23:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2ZZPhH9pI1ojwAdx3yz1Bw2buB6+u4yZQIHTFUxGfLpDaJfYOKtQLkaZHng2glOOMTYruTw==
X-Received: by 2002:a7b:c407:: with SMTP id k7mr292558wmi.136.1614795818843;
 Wed, 03 Mar 2021 10:23:38 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t14sm34525097wru.64.2021.03.03.10.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:23:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 11/19] accel/kvm: Introduce kvm_vcpu_state() helper
Date: Wed,  3 Mar 2021 19:22:11 +0100
Message-Id: <20210303182219.1631042-12-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303182219.1631042-1-philmd@redhat.com>
References: <20210303182219.1631042-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/kvm.h | 2 ++
 accel/kvm/kvm-all.c  | 5 +++++
 target/i386/cpu.c    | 4 ++--
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 687c598be9b..f339be31d1b 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -361,6 +361,8 @@ int kvm_arch_init_vcpu(CPUState *cpu);
 int kvm_arch_destroy_vcpu(CPUState *cpu);
 
 bool kvm_vcpu_id_is_valid(int vcpu_id);
+/* Returns a pointer to the KVMState associated with this vCPU */
+KVMState *kvm_vcpu_state(CPUState *cpu);
 
 /* Returns VCPU ID to be used on KVM_CREATE_VCPU ioctl() */
 unsigned long kvm_arch_vcpu_id(CPUState *cpu);
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 84c943fcdb2..b787d590a9a 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1978,6 +1978,11 @@ bool kvm_vcpu_id_is_valid(int vcpu_id)
     return vcpu_id >= 0 && vcpu_id < kvm_max_vcpu_id(s);
 }
 
+KVMState *kvm_vcpu_state(CPUState *cpu)
+{
+    return cpu->kvm_state;
+}
+
 static int kvm_init(MachineState *ms)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6a53446e6a5..0d6376322bb 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5755,7 +5755,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
     case 0xA:
         /* Architectural Performance Monitoring Leaf */
         if (kvm_enabled() && cpu->enable_pmu) {
-            KVMState *s = cs->kvm_state;
+            KVMState *s = kvm_vcpu_state(cs);
 
             *eax = kvm_arch_get_supported_cpuid(s, 0xA, count, R_EAX);
             *ebx = kvm_arch_get_supported_cpuid(s, 0xA, count, R_EBX);
@@ -6620,7 +6620,7 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
 
     if ((env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT) &&
         kvm_enabled()) {
-        KVMState *s = CPU(cpu)->kvm_state;
+        KVMState *s = kvm_vcpu_state(CPU(cpu));
         uint32_t eax_0 = kvm_arch_get_supported_cpuid(s, 0x14, 0, R_EAX);
         uint32_t ebx_0 = kvm_arch_get_supported_cpuid(s, 0x14, 0, R_EBX);
         uint32_t ecx_0 = kvm_arch_get_supported_cpuid(s, 0x14, 0, R_ECX);
-- 
2.26.2


