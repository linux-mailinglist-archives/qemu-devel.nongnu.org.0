Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D606F7AA0
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:19:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujsL-0002af-B3; Thu, 04 May 2023 21:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujsI-0002UX-QD
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:42 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujsH-00075p-0b
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:42 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-52c62a71541so802135a12.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248679; x=1685840679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FFi9k6FVuhmjeEuDvSU0Hvy8dG/Qgn75vXEPkKyXHjg=;
 b=C5oMeKP0tnxh/plRDlP5bRmlKpjm/Nl6vqs7Vm+UbUHjwWGfTL5zrFm4WaKOE2B+Aj
 jWUyIzc5dUsCBt/FD6XkUTO8efBrWpaScOkoNIxatElNyiCOys9NNjpGTdJp9Tm+qQxD
 8a2itbJyTCDOjOFHj7Zwmzr2A/k0N+l/TywQVPaWuvpp1TMVgXcl3i5xHJPi6VDPDmRJ
 xXc8Z2PLsKRNsQNNTpHP/Ef66P3+nXd12CC7Q8Y03rMT06KXaevzd57aT0+qkAXDnqz9
 xAAFMmiILCmnpsL+vEqw1+L+vTkDSpzlw2tu8sshygZaJ9OYKmX81jOsDeitvD7/IvfY
 P+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248679; x=1685840679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FFi9k6FVuhmjeEuDvSU0Hvy8dG/Qgn75vXEPkKyXHjg=;
 b=g+APBZuxZRwi1ofTLbHkZOlnsaTylIxE6nL5L7tvKGHvrRtb0uFtSacWlCD04Yg6GX
 vhIcCYTVnGz/Q4MIVCptctRjvd6IRHRj/VZcDKEsF6WOeq1d0OR9rVjP6SBh+muVQQ03
 VPYV67Hh5U2CGtrCxr7xawIwnLnK6NU7QjPL8wQXIf/pQofd/ufej1JUdpHIKgUeMafO
 DHKTyeUvxquCIUcwbgu6pz6ONM4JOLrZ8k97wzASdnorCnnneMxBuBAlKYWzGjzG4EyO
 Io4VqDlDnLhu6Hny/79u4kgbzzDnULMnXgHyM3sVlh0iLHgm1X0cmlE1hSRk2DaDm9Ps
 hsLw==
X-Gm-Message-State: AC+VfDwlC7xq3p74Ld7IGJYdZh3B2LnKXVB8nuL4Fz3K9kh/B0YsB6gK
 22b2Hpes3vhGGbrmuwe9AuSZkt4SQ4NNvw==
X-Google-Smtp-Source: ACHHUZ596UsvMGmbLYLInDifOvQLMBlnrEgw5hp/Zpu0ixdxXvxADORdA/nRGnguxYM8oG0GUrcxvA==
X-Received: by 2002:a17:903:190:b0:1ab:397:9748 with SMTP id
 z16-20020a170903019000b001ab03979748mr6864977plg.21.1683248679405; 
 Thu, 04 May 2023 18:04:39 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:04:38 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 24/89] target/riscv: Convert env->virt to a bool
 env->virt_enabled
Date: Fri,  5 May 2023 11:01:36 +1000
Message-Id: <20230505010241.21812-25-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x532.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Currently we only use the env->virt to encode the virtual mode enabled
status. Let's make it a bool type.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <20230325145348.1208-1-zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230327080858.39703-6-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        | 2 +-
 target/riscv/cpu_bits.h   | 3 ---
 target/riscv/cpu_helper.c | 6 +++---
 target/riscv/machine.c    | 6 +++---
 target/riscv/translate.c  | 4 ++--
 5 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5f38b0adc0..ff6b3c6720 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -185,7 +185,7 @@ struct CPUArchState {
 #ifndef CONFIG_USER_ONLY
     target_ulong priv;
     /* This contains QEMU specific information about the virt state. */
-    target_ulong virt;
+    bool virt_enabled;
     target_ulong geilen;
     uint64_t resetvec;
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index a92313a06f..190e517862 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -611,9 +611,6 @@ typedef enum {
 #define PRV_H 2 /* Reserved */
 #define PRV_M 3
 
-/* Virtulisation Register Fields */
-#define VIRT_ONOFF          1
-
 /* RV32 satp CSR field masks */
 #define SATP32_MODE         0x80000000
 #define SATP32_ASID         0x7fc00000
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index b286118a6b..c7bc3fc553 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -560,18 +560,18 @@ void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen)
 
 bool riscv_cpu_virt_enabled(CPURISCVState *env)
 {
-    return get_field(env->virt, VIRT_ONOFF);
+    return env->virt_enabled;
 }
 
 /* This function can only be called to set virt when RVH is enabled */
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
 {
     /* Flush the TLB on all virt mode changes. */
-    if (get_field(env->virt, VIRT_ONOFF) != enable) {
+    if (env->virt_enabled != enable) {
         tlb_flush(env_cpu(env));
     }
 
-    env->virt = set_field(env->virt, VIRT_ONOFF, enable);
+    env->virt_enabled = enable;
 
     if (enable) {
         /*
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 27f430ad74..8869346089 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -349,8 +349,8 @@ static const VMStateDescription vmstate_jvt = {
 
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
-    .version_id = 7,
-    .minimum_version_id = 7,
+    .version_id = 8,
+    .minimum_version_id = 8,
     .post_load = riscv_cpu_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
@@ -370,7 +370,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINT32(env.misa_mxl_max, RISCVCPU),
         VMSTATE_UINT32(env.misa_ext_mask, RISCVCPU),
         VMSTATE_UINTTL(env.priv, RISCVCPU),
-        VMSTATE_UINTTL(env.virt, RISCVCPU),
+        VMSTATE_BOOL(env.virt_enabled, RISCVCPU),
         VMSTATE_UINT64(env.resetvec, RISCVCPU),
         VMSTATE_UINTTL(env.mhartid, RISCVCPU),
         VMSTATE_UINT64(env.mstatus, RISCVCPU),
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6872d17fb9..5dddac44bc 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1266,8 +1266,8 @@ static void riscv_tr_disas_log(const DisasContextBase *dcbase,
 
     fprintf(logfile, "IN: %s\n", lookup_symbol(dcbase->pc_first));
 #ifndef CONFIG_USER_ONLY
-    fprintf(logfile, "Priv: "TARGET_FMT_ld"; Virt: "TARGET_FMT_ld"\n",
-            env->priv, env->virt);
+    fprintf(logfile, "Priv: "TARGET_FMT_ld"; Virt: %d\n",
+            env->priv, env->virt_enabled);
 #endif
     target_disas(logfile, cpu, dcbase->pc_first, dcbase->tb->size);
 }
-- 
2.40.0


