Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF486F7A9E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:19:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujth-0002q3-1U; Thu, 04 May 2023 21:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujtW-0002Ck-BB
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:05:59 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujtU-0007cg-G7
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:05:58 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1aaff9c93a5so8146655ad.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248755; x=1685840755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fXtZPf1E6h+vYd9nupqfDNnVJU62rsNJUjgqDNMmw/U=;
 b=AUQvFCk/lGwaa2XQzvOGs4gRAiGI80G4JdoW//BmGbKdok/45ww2jzwopGK5bGfdEW
 h6RsywY0jH9+fVkZmLAn4jqEclKBv6xC6KWV6RgIgjCZgiJdX/tjRCxh6SUNli7WxLvw
 mXmKW/gHTYLTSizBsZW6WDvDiHsWhFzIoJmXUI4PjsbUNo8hGpJDFlc9PvTbpPe3tKIZ
 b78mebhREKbF6JMK8U05CzVk4dSPQLOIEVedDldJZ1dbg7zAijEKPMPU/k+U3dUS+NFo
 lBrlKHWbrFWBt1knqNNkqPqr/hHwMdWqn2byqJSsNtpIvEpBRLpz25CABNYJUXfHZ4+L
 6+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248755; x=1685840755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fXtZPf1E6h+vYd9nupqfDNnVJU62rsNJUjgqDNMmw/U=;
 b=lKxD9186r3AAETmePI4T+0hbzOXh7d40pKRvAYDYA+/O2Kqp1fKkq15aqPqLwebsaC
 zuT6vs6yLE7r8KJ40K9B642k9tu5x7wklpMsPkcy2uK+ykekUB3hQp+1ekCRuALQz2aF
 4XIKwwfZPVwEnyNM7pXM4y8E9XucoBIuOHW8x7Q+HedoBBXBhtL6xXVAjeDvVKPS4G/u
 iVXJ3gyZjx5LE/1AFofC8DrAUwvIWygCDtEG5n4UT3lHFuzSgreDUbrW70Utp9JrsyUL
 dAptJOInrHAIOxL1pzP1skihKH+HafwxCIkT/Nf91RW/MMjZAqm1uPlpmCU1D+9e6OJF
 wp5w==
X-Gm-Message-State: AC+VfDy3sCapsy4j6NqBlhKRFNLnt/+MCxifTVHchJ68nUQeJ0XG61Dz
 VEFBPdOvgQtL2nQMYMDZw7EXmJ8EBqLThg==
X-Google-Smtp-Source: ACHHUZ494u5Y61Rrdo1pPCEfzOlZGMRpTLGW+xBMhOYFvYQfBeifcXGM8JU2NFO8scrafk+IHy6yug==
X-Received: by 2002:a17:902:8f97:b0:1a9:2c70:e1eb with SMTP id
 z23-20020a1709028f9700b001a92c70e1ebmr5229366plo.36.1683248755039; 
 Thu, 04 May 2023 18:05:55 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:05:54 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 46/89] target/riscv: remove cpu->cfg.ext_h
Date: Fri,  5 May 2023 11:01:58 +1000
Message-Id: <20230505010241.21812-47-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x630.google.com
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

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Create a new "h" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVH. Instances of cpu->cfg.ext_h and similar are
replaced with riscv_has_ext(env, RVH).

Remove the old "h" property and 'ext_h' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230406180351.570807-15-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  1 -
 target/riscv/cpu.c | 10 +++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 486061589e..823be82239 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -423,7 +423,6 @@ typedef struct {
 
 struct RISCVCPUConfig {
     bool ext_g;
-    bool ext_h;
     bool ext_j;
     bool ext_v;
     bool ext_zba;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9565495839..6291224905 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -847,13 +847,13 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_h && !riscv_has_ext(env, RVI)) {
+    if (riscv_has_ext(env, RVH) && !riscv_has_ext(env, RVI)) {
         error_setg(errp,
                    "H depends on an I base integer ISA with 32 x registers");
         return;
     }
 
-    if (cpu->cfg.ext_h && !riscv_has_ext(env, RVS)) {
+    if (riscv_has_ext(env, RVH) && !riscv_has_ext(env, RVS)) {
         error_setg(errp, "H extension implicitly requires S-mode");
         return;
     }
@@ -1172,7 +1172,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVU)) {
         ext |= RVU;
     }
-    if (riscv_cpu_cfg(env)->ext_h) {
+    if (riscv_has_ext(env, RVH)) {
         ext |= RVH;
     }
     if (riscv_cpu_cfg(env)->ext_v) {
@@ -1509,6 +1509,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVS, .enabled = true},
     {.name = "u", .description = "User-level instructions",
      .misa_bit = RVU, .enabled = true},
+    {.name = "h", .description = "Hypervisor",
+     .misa_bit = RVH, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1533,7 +1535,6 @@ static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
-    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
     DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
@@ -1647,7 +1648,6 @@ static void register_cpu_props(Object *obj)
      */
     if (cpu->env.misa_ext != 0) {
         cpu->cfg.ext_v = misa_ext & RVV;
-        cpu->cfg.ext_h = misa_ext & RVH;
         cpu->cfg.ext_j = misa_ext & RVJ;
 
         /*
-- 
2.40.0


