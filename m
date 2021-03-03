Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E8532B9D3
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:25:55 +0100 (CET)
Received: from localhost ([::1]:59504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWC2-0000vP-B2
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:25:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW9O-0005Vq-5W
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:23:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW9L-0000cH-EX
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:23:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JSKZ4U4zBdXHSKAtMYPcidB9tymokaAa3vsPtMUAjQM=;
 b=fAuXMcBm5NKSBkUQfzdpXkaF7H7xUE/u0rvJQhL6HkGkNQTdu/5C+l3sHuG2AtbBzrYp63
 GZAzcNYI2MrnUrqxxgxhfpI4qb2DaB9R9yJFI9T6r4mMyyQR+Uo3LeLDqj3icYkJpZ64yn
 R4AK9HtgC6mfFHq5NzHP6ta4xfTZUJc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-KZgNugTQMPKxYPIJf22rmA-1; Wed, 03 Mar 2021 13:23:02 -0500
X-MC-Unique: KZgNugTQMPKxYPIJf22rmA-1
Received: by mail-wm1-f72.google.com with SMTP id q24so3402215wmc.1
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:23:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JSKZ4U4zBdXHSKAtMYPcidB9tymokaAa3vsPtMUAjQM=;
 b=qTjjwyJCoE2/s296/O9euicjGTpSjHmdP8ul43ei+n2oS+cGTQ/WMcTgkC7Ob9jGZn
 zmksJYq5Qa99Kx8H/i5ZCT7x6NwCKfMKJ+dZ+lzeYI3O9phIPYtafwYRNtxXAQL+nAgP
 c3ESoLzlO/1JbBuJYJeYNsjMyDZpC5ySmfqMfF6V6AMzmX/nVrbNSdEFdGoTu/HygKTr
 ttqV3kPlax2nbpjVvCFIyUjRbgZuqx9Bv05Q73NEmWzwvRI6STfyVh5y/gA41mmP0Dds
 OHfYesVYPi1AHSxO8l0vVFPMNY2NOQFyZW6Vg8A28BJDbecRigQyR3OBsOStK8wTqA46
 YGrQ==
X-Gm-Message-State: AOAM531PtkfCjYbY6IVgBiUoOjMd9IwPaycP6kif7ndX2pDMat9uivj7
 sXJ8ib8D1rSsfFJsfy9PQhov+H/2AypyCiV4pr7qykgrjHlKL4ab2/m7MIhH87Dyk3hXbO/fL14
 +OvCltULWkcoyDA1ZDSj6OhpaP5VRDTFVKfCfz6PasMcMs8/jmrqKwr3yhVNYm1xV
X-Received: by 2002:a05:600c:4ec7:: with SMTP id
 g7mr295372wmq.56.1614795781361; 
 Wed, 03 Mar 2021 10:23:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkfTopuTz8+rr5+ZCkXuINfRYff1lmKq7JTlmgWuTa8IXYSH/Sikf55e2yiTGalQ+YvZXOhQ==
X-Received: by 2002:a05:600c:4ec7:: with SMTP id
 g7mr295331wmq.56.1614795781060; 
 Wed, 03 Mar 2021 10:23:01 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a131sm6749075wmc.48.2021.03.03.10.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:23:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 06/19] accel/whpx: Add typedef for 'struct whpx_vcpu'
Date: Wed,  3 Mar 2021 19:22:06 +0100
Message-Id: <20210303182219.1631042-7-philmd@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Use the 'whpx_vcpu' typedef instead of 'struct whpx_vcpu'.
This will make the next commits easier to review.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/whpx/whpx-all.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index f0a35df3bba..6469e388b6d 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -148,6 +148,8 @@ struct whpx_register_set {
     WHV_REGISTER_VALUE values[RTL_NUMBER_OF(whpx_register_names)];
 };
 
+typedef struct whpx_vcpu whpx_vcpu;
+
 struct whpx_vcpu {
     WHV_EMULATOR_HANDLE emulator;
     bool window_registered;
@@ -173,9 +175,9 @@ struct WHPDispatch whp_dispatch;
  * VP support
  */
 
-static struct whpx_vcpu *get_whpx_vcpu(CPUState *cpu)
+static whpx_vcpu *get_whpx_vcpu(CPUState *cpu)
 {
-    return (struct whpx_vcpu *)cpu->hax_vcpu;
+    return (whpx_vcpu *)cpu->hax_vcpu;
 }
 
 static WHV_X64_SEGMENT_REGISTER whpx_seg_q2h(const SegmentCache *qs, int v86,
@@ -259,7 +261,7 @@ static int whpx_set_tsc(CPUState *cpu)
 static void whpx_set_registers(CPUState *cpu, int level)
 {
     struct whpx_state *whpx = &whpx_global;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
     struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct whpx_register_set vcxt;
@@ -448,7 +450,7 @@ static int whpx_get_tsc(CPUState *cpu)
 static void whpx_get_registers(CPUState *cpu)
 {
     struct whpx_state *whpx = &whpx_global;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
     struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct whpx_register_set vcxt;
@@ -712,7 +714,7 @@ static const WHV_EMULATOR_CALLBACKS whpx_emu_callbacks = {
 static int whpx_handle_mmio(CPUState *cpu, WHV_MEMORY_ACCESS_CONTEXT *ctx)
 {
     HRESULT hr;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
     WHV_EMULATOR_STATUS emu_status;
 
     hr = whp_dispatch.WHvEmulatorTryMmioEmulation(
@@ -737,7 +739,7 @@ static int whpx_handle_portio(CPUState *cpu,
                               WHV_X64_IO_PORT_ACCESS_CONTEXT *ctx)
 {
     HRESULT hr;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
     WHV_EMULATOR_STATUS emu_status;
 
     hr = whp_dispatch.WHvEmulatorTryIoEmulation(
@@ -780,7 +782,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
 {
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
     struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
     X86CPU *x86_cpu = X86_CPU(cpu);
     int irq;
@@ -902,7 +904,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
 
 static void whpx_vcpu_post_run(CPUState *cpu)
 {
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
     struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
     X86CPU *x86_cpu = X86_CPU(cpu);
 
@@ -929,7 +931,7 @@ static void whpx_vcpu_process_async_events(CPUState *cpu)
 {
     struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
     X86CPU *x86_cpu = X86_CPU(cpu);
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
 
     if ((cpu->interrupt_request & CPU_INTERRUPT_INIT) &&
         !(env->hflags & HF_SMM_MASK)) {
@@ -968,7 +970,7 @@ static int whpx_vcpu_run(CPUState *cpu)
 {
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
     int ret;
 
     whpx_vcpu_process_async_events(cpu);
@@ -1331,7 +1333,7 @@ int whpx_init_vcpu(CPUState *cpu)
 {
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
-    struct whpx_vcpu *vcpu = NULL;
+    whpx_vcpu *vcpu = NULL;
     Error *local_error = NULL;
     struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
     X86CPU *x86_cpu = X86_CPU(cpu);
@@ -1356,7 +1358,7 @@ int whpx_init_vcpu(CPUState *cpu)
         }
     }
 
-    vcpu = g_malloc0(sizeof(struct whpx_vcpu));
+    vcpu = g_malloc0(sizeof(whpx_vcpu));
 
     if (!vcpu) {
         error_report("WHPX: Failed to allocte VCPU context.");
@@ -1475,7 +1477,7 @@ int whpx_vcpu_exec(CPUState *cpu)
 void whpx_destroy_vcpu(CPUState *cpu)
 {
     struct whpx_state *whpx = &whpx_global;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
 
     whp_dispatch.WHvDeleteVirtualProcessor(whpx->partition, cpu->cpu_index);
     whp_dispatch.WHvEmulatorDestroyEmulator(vcpu->emulator);
-- 
2.26.2


