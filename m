Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A582D1C66
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 22:56:11 +0100 (CET)
Received: from localhost ([::1]:37734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmOUM-0002O2-Q6
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 16:56:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmORQ-0000yf-CG
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:53:08 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:42059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmORO-0004gT-QO
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:53:08 -0500
Received: by mail-ej1-x629.google.com with SMTP id d17so21690614ejy.9
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 13:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qjOwZ+ezyUw0upRlgdgtR4rZLf1mggbyV0qRLL3cwSA=;
 b=Kj/AKnAsuXWASW2az5jHLpPfukgBy4EzHfJ1QNWVmoiRuPxt1xVaEtbVExUbFnqY0C
 DRX0AmJWp9BLPnFQNbrm9tBg5SibV25MDRjfI6s6TNnCaVIAcPhUFyuDPDCizhGL9QIf
 2Lw3u0Ua3CNo2ai93NjrLDWDNdE+KGTG2Q1pBeI2kSHY9hFc8RiUCcNEo5elAll9CynC
 4I50l19MDXit5LpgCDNflCKAVKaxLdmyNYJxckEHzJ3RepzD0wdBGarGVvBSa2lIEC33
 wH8LuFllJRnM36Bp+lJdCAQp0dLEm7oWo6CNG1pCu7ZlrygbYoWNtM6QDgXY+W3Z88oR
 J/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qjOwZ+ezyUw0upRlgdgtR4rZLf1mggbyV0qRLL3cwSA=;
 b=fgpFqAXNDJy0qOAa4wVLe9JCmIEWKotYWhS304yJIQgv8I7lKwz+CLRJ5UhhqP1O/Y
 awnSZDvmh1/1OOzDxD3tEA7Czv8J012ODBjMDxhKEZucSN4QDVLL0tAwpK0ogi0bS7x3
 kPd9crkLC5t1u0gezvcLICOADEKOSZECThM7TnaNWtp3THK1ocLtGlAz8j4onf8XMGP5
 n2TmMwUV4OcNgAOmNxchij5HxfpWApfyfMlXNs0KMxO7DKqj4zciqS6/S635QYuXly8D
 yFzfNFLq79nM9+QU9+4hVDPD2HMzpWj2GjXCTaB3GpgeEnSwVU1FNZHdh+1hfjFDjVNK
 WwAw==
X-Gm-Message-State: AOAM533MkR+WUb0IRz6FNEscdqFvHqUFwOocAlgngo2soplZGCtoFU1z
 94k6yQClYY4+L0VJbPXCnWUnR5DdmoE=
X-Google-Smtp-Source: ABdhPJy89svkomcIuyZxooeg0HIV4RHugqDL5abb6JvtpTezTyCqEXiLiFL20ulmX3jmcqnej9kTfg==
X-Received: by 2002:a17:906:edc4:: with SMTP id
 sb4mr20269908ejb.21.1607377985115; 
 Mon, 07 Dec 2020 13:53:05 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id t26sm15057865edt.69.2020.12.07.13.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 13:53:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/2] target/mips: Rename cpu_supports_FEAT() as
 cpu_type_supports_FEAT()
Date: Mon,  7 Dec 2020 22:52:56 +0100
Message-Id: <20201207215257.4004222-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207215257.4004222-1-f4bug@amsat.org>
References: <20201207215257.4004222-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paul Burton <paulburton@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As cpu_supports_isa() / cpu_supports_cps_smp() take a 'cpu_type'
name argument, rename them cpu_type_supports_FEAT().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.h       | 4 ++--
 hw/mips/boston.c        | 4 ++--
 hw/mips/malta.c         | 4 ++--
 target/mips/translate.c | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 23f8c6f96cd..9c65c87bf99 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1286,8 +1286,8 @@ int cpu_mips_signal_handler(int host_signum, void *pinfo, void *puc);
 #define MIPS_CPU_TYPE_NAME(model) model MIPS_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_MIPS_CPU
 
-bool cpu_supports_cps_smp(const char *cpu_type);
-bool cpu_supports_isa(const char *cpu_type, uint64_t isa);
+bool cpu_type_supports_cps_smp(const char *cpu_type);
+bool cpu_type_supports_isa(const char *cpu_type, uint64_t isa);
 void cpu_set_exception_base(int vp_index, target_ulong address);
 
 /* mips_int.c */
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 3d40867dc4c..16467ea4752 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -459,12 +459,12 @@ static void boston_mach_init(MachineState *machine)
     s = BOSTON(dev);
     s->mach = machine;
 
-    if (!cpu_supports_cps_smp(machine->cpu_type)) {
+    if (!cpu_type_supports_cps_smp(machine->cpu_type)) {
         error_report("Boston requires CPUs which support CPS");
         exit(1);
     }
 
-    is_64b = cpu_supports_isa(machine->cpu_type, ISA_MIPS64);
+    is_64b = cpu_type_supports_isa(machine->cpu_type, ISA_MIPS64);
 
     object_initialize_child(OBJECT(machine), "cps", &s->cps, TYPE_MIPS_CPS);
     object_property_set_str(OBJECT(&s->cps), "cpu-type", machine->cpu_type,
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 9d1a3b50b7a..965a952d934 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1204,7 +1204,7 @@ static void create_cps(MachineState *ms, MaltaState *s,
 static void mips_create_cpu(MachineState *ms, MaltaState *s,
                             qemu_irq *cbus_irq, qemu_irq *i8259_irq)
 {
-    if ((ms->smp.cpus > 1) && cpu_supports_cps_smp(ms->cpu_type)) {
+    if ((ms->smp.cpus > 1) && cpu_type_supports_cps_smp(ms->cpu_type)) {
         create_cps(ms, s, cbus_irq, i8259_irq);
     } else {
         create_cpu_without_cps(ms, s, cbus_irq, i8259_irq);
@@ -1308,7 +1308,7 @@ void mips_malta_init(MachineState *machine)
         loaderparams.initrd_filename = initrd_filename;
         kernel_entry = load_kernel();
 
-        if (!cpu_supports_isa(machine->cpu_type, ISA_NANOMIPS32)) {
+        if (!cpu_type_supports_isa(machine->cpu_type, ISA_NANOMIPS32)) {
             write_bootloader(memory_region_get_ram_ptr(bios),
                              bootloader_run_addr, kernel_entry);
         } else {
diff --git a/target/mips/translate.c b/target/mips/translate.c
index c64a1bc42e1..b8ed16bb779 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -31770,13 +31770,13 @@ void cpu_mips_realize_env(CPUMIPSState *env)
     mvp_init(env, env->cpu_model);
 }
 
-bool cpu_supports_cps_smp(const char *cpu_type)
+bool cpu_type_supports_cps_smp(const char *cpu_type)
 {
     const MIPSCPUClass *mcc = MIPS_CPU_CLASS(object_class_by_name(cpu_type));
     return (mcc->cpu_def->CP0_Config3 & (1 << CP0C3_CMGCR)) != 0;
 }
 
-bool cpu_supports_isa(const char *cpu_type, uint64_t isa)
+bool cpu_type_supports_isa(const char *cpu_type, uint64_t isa)
 {
     const MIPSCPUClass *mcc = MIPS_CPU_CLASS(object_class_by_name(cpu_type));
     return (mcc->cpu_def->insn_flags & isa) != 0;
-- 
2.26.2


