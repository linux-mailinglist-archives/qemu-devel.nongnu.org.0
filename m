Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7528A3242F0
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 18:11:55 +0100 (CET)
Received: from localhost ([::1]:52790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lExha-0005sE-Fb
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 12:11:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lExUZ-0003Js-2R
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:58:27 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lExUT-00075P-Hm
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:58:26 -0500
Received: by mail-wr1-x42d.google.com with SMTP id 7so2582384wrz.0
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 08:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wBGoBkcvwiIvW/STPkt2r5KSBRzV20ncmjwyfXsyDe0=;
 b=ahQG4IMb9i52b24cQgLH5c+qIbJjl3uqgqvcaBuK1me6qRryMDUtaCp/ETVZVEU2gl
 euZcZEC+fUoi4LX2AEASYOHc/+KUP+c7mcnIzb5SxJsoUn0pzWToAYGNpfPsV+jreB3p
 qN4PhzLADuv5siFWru+cabJupHgaCGN59aYGGIPBeeCXZwzSSXlrn6isKTdaFR2KVpCd
 xvfI2Q58RS1FyIrE3ovfMklnSs1TGQUCOjP2gmlM/3WHouw/rqQ3TwcRv6BifxI0wvC+
 L56Vol4OOAP71XzagfywRfxc7/ZYHtuZkjT6yvWiMx68apYkOQUFnltdF2YMYXc8QMDV
 Zo4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wBGoBkcvwiIvW/STPkt2r5KSBRzV20ncmjwyfXsyDe0=;
 b=HVW91rC1Gm6ortke1YmeE93F03At1EXya85Wx5LOxue9t2h7pnMmaLJyYlKLtrHTg4
 J5ORAoS+tLOrA7q4fKIod27w+mPIvE9gQKjfinXDWfdkwTKiER4zaeFKk0A89E6sLP+4
 hnnOmz5qSjF2iHqPC9dSACs1OlPYIaIqGbmOk/HLz3IvaCn4rfG7nBV0ehDajjCM7gzL
 tehCIBCTIJOpHzwReTVWTNF1eqz78gtHDA8tfbUTPdo3lD68ycq1qDpJQ9oo45/Jcoo/
 ClbIDywp6F2mdBwqDZHPGrRa6jFiedUct4kRaqCWvpTF9C0hyDjuQrIrEMepmKZ565/L
 Ys7Q==
X-Gm-Message-State: AOAM533ksn8M7WJBn2Mj3zGRWTbg0mFR8DwSDXtJ6RHjOyxHXQ99fpxe
 EYCKmLHHkeu0E5D+P0rzOhmX7Zu+0oqJow==
X-Google-Smtp-Source: ABdhPJztFsGaoxfquW5FAqR8Xwh2vCy+0WFBGhH1SfUoGmag/SWJBVVnvwLwnOXo6ed5H+eSijbruQ==
X-Received: by 2002:a05:6000:1047:: with SMTP id
 c7mr32646540wrx.332.1614185900077; 
 Wed, 24 Feb 2021 08:58:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p3sm4756768wro.55.2021.02.24.08.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 08:58:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E53741FF91;
 Wed, 24 Feb 2021 16:58:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Subject: [RFC PATCH 5/5] include/exec/tb-lookup: try and reduce branch
 prediction issues
Date: Wed, 24 Feb 2021 16:58:11 +0000
Message-Id: <20210224165811.11567-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210224165811.11567-1-alex.bennee@linaro.org>
References: <20210224165811.11567-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: cota@braap.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that everything is nicely aligned instead of a compare and jump
just blitz the bits together and test for zero at the end.

[AJB: looking at perf I can't see much change. Basically the hotspot
seems to be the initial load of the TB parameters. If this reflects
the stall of the memory bus loading TB fields I guess this means there
isn't much more to be squeezed out here:

helper_lookup_tb_ptr() /home/alex/lsrc/qemu.git/builds/arm.all/qemu-system-aarch64
Event: cycles:ppp

Percent

             Disassembly of section .text:

             0000000000809c40 <helper_lookup_tb_ptr>:
             helper_lookup_tb_ptr():
             {
                 return ctpop64(arg);
             }

             const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
             {
  4.14         push   %r13
  1.32         push   %r12
             env_cpu():
              *
              * Return the CPUState associated with the environment.
              */
             static inline CPUState *env_cpu(CPUArchState *env)
             {
                 return &env_archcpu(env)->parent_obj;
  0.47         lea    -0x9dc0(%rdi),%r12
             helper_lookup_tb_ptr():
  0.80         push   %rbp
  0.40         mov    %rdi,%rbp
  0.90         push   %rbx
  1.59         sub    $0x28,%rsp
  1.95         mov    %fs:0x28,%rax
  2.28         mov    %rax,0x18(%rsp)
  0.51         xor    %eax,%eax
                 CPUState *cpu = env_cpu(env);
                 TranslationBlock *tb;
                 target_ulong cs_base, pc;
                 uint32_t flags;

                 cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
  0.98         lea    0x4(%rsp),%rcx
  0.66         lea    0x8(%rsp),%rdx
  1.09         lea    0x10(%rsp),%rsi
  2.08       → callq  cpu_get_tb_cpu_state

                 tb = tb_lookup(cpu, pc, cs_base, flags, curr_cflags(cpu));
  1.19         mov    0x10(%rsp),%rsi
  1.03         mov    0x4(%rsp),%r9d
             deposit32():
                                              uint32_t fieldval)
             {
                 uint32_t mask;
                 assert(start >= 0 && length > 0 && length <= 32 - start);
                 mask = (~0U >> (32 - length)) << start;
                 return (value & ~mask) | ((fieldval << start) & mask);
  2.53         mov    -0x1b24(%rbp),%r8d
  0.55         lea    parallel_cpus,%rdx
             tb_jmp_cache_hash_func():
             }

             static inline unsigned int tb_jmp_cache_hash_func(target_ulong pc)
             {
                 target_ulong tmp;
                 tmp = pc ^ (pc >> (TARGET_PAGE_BITS - TB_JMP_PAGE_BITS));
  0.09         mov    %rsi,%rdi
             deposit32():
  0.62         shl    $0x18,%r8d
             curr_cflags():

             /* current cflags for hashing/comparison */
             static inline uint32_t curr_cflags(CPUState *cpu)
             {
                 uint32_t cflags = deposit32(0, CF_CLUSTER_SHIFT, 8, cpu->cluster_index);
                 cflags |= parallel_cpus ? CF_PARALLEL : 0;
  1.80         mov    %r8d,%eax
  0.92         or     $0x80000,%eax
  1.45         cmpb   $0x0,(%rdx)
  0.84         lea    use_icount,%rdx
  3.13         cmovne %eax,%r8d
                 cflags |= icount_enabled() ? CF_USE_ICOUNT : 0;
  0.62         mov    (%rdx),%ecx
             helper_lookup_tb_ptr():
  0.60         mov    0x8(%rsp),%rdx
  1.95         mov    %r8d,%eax
  0.60         or     $0x20000,%eax
  0.45         test   %ecx,%ecx
  3.70         cmovne %eax,%r8d
             tb_jmp_cache_hash_func():
  0.47         lea    target_page,%rax
  0.55         mov    0x4(%rax),%ecx
  0.55         sub    $0x6,%ecx
  3.17         shr    %cl,%rdi
  0.53         xor    %rsi,%rdi
                 return (((tmp >> (TARGET_PAGE_BITS - TB_JMP_PAGE_BITS)) & TB_JMP_PAGE_MASK)
  1.74         mov    %rdi,%rax
                        | (tmp & TB_JMP_ADDR_MASK));
  0.50         and    $0x3f,%edi
                 return (((tmp >> (TARGET_PAGE_BITS - TB_JMP_PAGE_BITS)) & TB_JMP_PAGE_MASK)
  2.85         shr    %cl,%rax
  0.31         and    $0xfc0,%eax
                        | (tmp & TB_JMP_ADDR_MASK));
  0.36         or     %edi,%eax
             tb_lookup():

                 /* we should never be trying to look up an INVALID tb */
                 tcg_debug_assert(!(cflags & CF_INVALID));

                 hash = tb_jmp_cache_hash_func(pc);
                 tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash]);
  2.26         lea    0x210(%r12,%rax,8),%r13
  5.86         mov    0x0(%r13),%rbx

                 if (likely(tb)) {
  0.38         test   %rbx,%rbx
  0.00       ↓ je     e7
                     uint64_t bits = tb->pc ^ pc;
  6.77         mov    (%rbx),%rax
                     bits |= tb->cs_base ^ cs_base;
  0.75         mov    0x8(%rbx),%rcx
                     uint64_t bits = tb->pc ^ pc;
  1.67         xor    %rsi,%rax
                     bits |= tb->cs_base ^ cs_base;
  0.83         xor    %rdx,%rcx
  0.95         or     %rax,%rcx
                     bits |= tb->flags ^ flags;
  0.05         mov    %r9d,%eax
  1.63         xor    0x10(%rbx),%eax
  2.26         or     %rax,%rcx
                     bits |= tb->trace_vcpu_dstate ^ *cpu->trace_dstate;
  0.08         mov    0x18(%rbx),%eax
  0.55         xor    -0x1b38(%rbp),%rax
  2.45         or     %rcx,%rax
             tb_cflags():
                 return qatomic_read(&tb->cflags);
  0.13         mov    0x14(%rbx),%ecx
             tb_lookup():
                     bits |= tb_cflags(tb) ^ cflags;
  0.22         xor    %r8d,%ecx
                     if (!bits) {
  3.34         or     %rax,%rcx
  3.69       ↓ je     fe
                         return tb;
                     }
                 }
                 tb = tb_htable_lookup(cpu, pc, cs_base, flags, cflags);
  0.21   e7:   mov    %r9d,%ecx
               mov    %r12,%rdi
  0.20       → callq  tb_htable_lookup
  0.00         mov    %rax,%rbx
                 if (tb == NULL) {
  0.02         test   %rax,%rax
             ↓ je     130
                     return NULL;
                 }
                 qatomic_set(&cpu->tb_jmp_cache[hash], tb);
  0.10         mov    %rax,0x0(%r13)
             helper_lookup_tb_ptr():
                 if (tb == NULL) {
                     return tcg_code_gen_epilogue;
                 }
                 qemu_log_mask_and_addr(CPU_LOG_EXEC, pc,
  0.40   fe:   lea    qemu_loglevel,%rax
  0.16         testb  $0x20,(%rax)
  0.14       ↓ jne    140
                                        "Chain %d: %p ["
                                        TARGET_FMT_lx "/" TARGET_FMT_lx "/%#x] %s\n",
                                        cpu->cpu_index, tb->tc.ptr, cs_base, pc, flags,
                                        lookup_symbol(pc));
                 return tb->tc.ptr;
  1.69  10a:   mov    0x20(%rbx),%rax
             }
  0.18  10e:   mov    0x18(%rsp),%rsi
  0.34         xor    %fs:0x28,%rsi
  0.50       ↓ jne    188
  4.48         add    $0x28,%rsp
  0.27         pop    %rbx
  0.10         pop    %rbp
  0.30         pop    %r12
  4.56         pop    %r13
  0.20       ← retq
               nop
                     return tcg_code_gen_epilogue;
        130:   lea    tcg_code_gen_epilogue,%rax
               mov    (%rax),%rax
             ↑ jmp    10e
               nop
                 qemu_log_mask_and_addr(CPU_LOG_EXEC, pc,
        140:   mov    0x10(%rsp),%rdi
             → callq  qemu_log_in_addr_range
               test   %al,%al
             ↑ je     10a
               mov    0x10(%rsp),%rdi
             → callq  lookup_symbol
               sub    $0x8,%rsp
               mov    0x20(%rbx),%rdx
               mov    -0x1b28(%rbp),%esi
               push   %rax
               mov    0x14(%rsp),%r9d
               lea    __PRETTY_FUNCTION__.30436+0x10,%rdi
               xor    %eax,%eax
               mov    0x20(%rsp),%r8
               mov    0x18(%rsp),%rcx
             → callq  qemu_log
               pop    %rax
               pop    %rdx
             ↑ jmp    10a
             }
        188: → callq  __stack_chk_fail@plt

]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/tb-lookup.h | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/exec/tb-lookup.h b/include/exec/tb-lookup.h
index 7b70412fae..3140abebc2 100644
--- a/include/exec/tb-lookup.h
+++ b/include/exec/tb-lookup.h
@@ -30,13 +30,15 @@ static inline TranslationBlock * tb_lookup(CPUState *cpu,
     hash = tb_jmp_cache_hash_func(pc);
     tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash]);
 
-    if (likely(tb &&
-               tb->pc == pc &&
-               tb->cs_base == cs_base &&
-               tb->flags == flags &&
-               tb->trace_vcpu_dstate == *cpu->trace_dstate &&
-               tb_cflags(tb) == cflags)) {
-        return tb;
+    if (likely(tb)) {
+        uint64_t bits = tb->pc ^ pc;
+        bits |= tb->cs_base ^ cs_base;
+        bits |= tb->flags ^ flags;
+        bits |= tb->trace_vcpu_dstate ^ *cpu->trace_dstate;
+        bits |= tb_cflags(tb) ^ cflags;
+        if (!bits) {
+            return tb;
+        }
     }
     tb = tb_htable_lookup(cpu, pc, cs_base, flags, cflags);
     if (tb == NULL) {
-- 
2.20.1


