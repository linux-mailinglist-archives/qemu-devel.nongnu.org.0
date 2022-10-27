Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C7960EFA8
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 07:50:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onvkB-0004cJ-WC; Thu, 27 Oct 2022 01:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1onvjk-0004Lv-RZ
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 01:47:29 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1onvjV-0003jk-TT
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 01:47:28 -0400
Received: by mail-pl1-x633.google.com with SMTP id c2so350975plz.11
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 22:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iZxjLBFOBniLUEOzOFd8zqTQ1srgxqp3aaC0QMoX4tA=;
 b=XnCAcDGSiTnyZA22UXThJi+AxeIVa4jSH8olG8CkLcosxGa8ZgsNWMYtFt348egGlk
 4kFFFgbx8+8m/nKqWl+/e3WcQmzcm6WnS53jzOkL2sidwornPFOJiiWdcBJ82jq2AH9x
 7UTMKmAnpsjmXugMTxlTStLKE+4/eJotMHdWbFiSCKmvMk8/cJ1BF24cyKr4Y0g7Ls6x
 5umi52P+q2zXfUScG0PIKQbPutoIInD3IY/zk6xutiVqcp0fQ4HuQW9B6pSNoyamae11
 98orWAcTqMJBmH4BCaJ+MLXs5en9cgZTPKGUBd0KhTnzAb5b5MOmAyPf6vH3apPfwAyR
 ifjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iZxjLBFOBniLUEOzOFd8zqTQ1srgxqp3aaC0QMoX4tA=;
 b=Pc2IxP1hy1BEkFvB5ckaff5lEy4Ds3XjtzA4lBw8VyPEcssemgOEbyB3mN+gbC4RNS
 BFOVMmxlVCa5q0SBbK26yhdf+l4V5wQ+NFiyXo8I+gEEc7O+SKb5/dKWBZdxXxyrXv7K
 l/dkPo37ogW2w1x2NxIaSYByClSzVdP3i5wT+Yqr/6gRbr/MvRPJlZ+wYBZXxIcijjkU
 Qq0w2sF6GyrY+jXTueCjTaI+fsxaTjFPvDIZJJ6d2jWK+YGodLGbAg3wyi/HAOugs2Wq
 Ls8vsFIgL95V+/IE/3Hgk3FCFRJdHxNSsZy/LRYlIstNorGXRygdMdD4gb8py48u7Ykp
 Dgew==
X-Gm-Message-State: ACrzQf3YXJsbli+xkPRLdLHodqkAsLoCrFgBgGBpISuLk4fpkNW/nwmg
 TkyFvrrp4IIP1+d9A6VQVafJfvZANt9wxA==
X-Google-Smtp-Source: AMsMyM7qJxhprpg1BMA/yPDQOiHBfkrSbB+zANClLJTJBlUo99Vmtiv1i0OlC8BVQyRVsS/IDtPEUw==
X-Received: by 2002:a17:903:32cd:b0:185:5421:a5d6 with SMTP id
 i13-20020a17090332cd00b001855421a5d6mr48017940plr.99.1666849631532; 
 Wed, 26 Oct 2022 22:47:11 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com
 ([2401:4900:519a:c85:c94:7c26:ac49:6811])
 by smtp.googlemail.com with ESMTPSA id
 188-20020a6204c5000000b00562784609fbsm328217pfe.209.2022.10.26.22.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 22:47:10 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v1 2/3] target/riscv: Extend isa_ext_data for single letter
 extensions
Date: Thu, 27 Oct 2022 11:16:48 +0530
Message-Id: <20221027054649.69228-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027054649.69228-1-mchitale@ventanamicro.com>
References: <20221027054649.69228-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Currently the ISA string for a CPU is generated from two different
arrays, one for single letter extensions and another for multi letter
extensions. Add all the single letter extensions to the isa_ext_data
array and use it for generating the ISA string. Also drop 'P' and 'Q'
extensions from the list of single letter extensions as those are not
supported yet.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/cpu.c | 41 +++++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e6d9c706bb..35320a8547 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -41,8 +41,6 @@
                              (QEMU_VERSION_MICRO))
 #define RISCV_CPU_MIMPID    RISCV_CPU_MARCHID
 
-static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
-
 struct isa_ext_data {
     const char *name;
     bool multi_letter;
@@ -71,6 +69,13 @@ struct isa_ext_data {
  *    extensions by an underscore.
  */
 static const struct isa_ext_data isa_edata_arr[] = {
+    ISA_EXT_DATA_ENTRY(i, false, PRIV_VERSION_1_10_0, ext_i),
+    ISA_EXT_DATA_ENTRY(e, false, PRIV_VERSION_1_10_0, ext_e),
+    ISA_EXT_DATA_ENTRY(m, false, PRIV_VERSION_1_10_0, ext_m),
+    ISA_EXT_DATA_ENTRY(a, false, PRIV_VERSION_1_10_0, ext_a),
+    ISA_EXT_DATA_ENTRY(f, false, PRIV_VERSION_1_10_0, ext_f),
+    ISA_EXT_DATA_ENTRY(d, false, PRIV_VERSION_1_10_0, ext_d),
+    ISA_EXT_DATA_ENTRY(c, false, PRIV_VERSION_1_10_0, ext_c),
     ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
     ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_12_0, ext_v),
     ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
@@ -1182,16 +1187,23 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
-static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
+static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str)
 {
     char *old = *isa_str;
     char *new = *isa_str;
     int i;
 
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (isa_edata_arr[i].multi_letter &&
-            isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
-            new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
+        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
+            if (isa_edata_arr[i].multi_letter) {
+                if (cpu->cfg.short_isa_string) {
+                    continue;
+                }
+                new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
+            } else {
+                new = g_strconcat(old, isa_edata_arr[i].name, NULL);
+            }
+
             g_free(old);
             old = new;
         }
@@ -1202,19 +1214,12 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
 
 char *riscv_isa_string(RISCVCPU *cpu)
 {
-    int i;
-    const size_t maxlen = sizeof("rv128") + sizeof(riscv_single_letter_exts);
+    const size_t maxlen = sizeof("rv128");
     char *isa_str = g_new(char, maxlen);
-    char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
-    for (i = 0; i < sizeof(riscv_single_letter_exts) - 1; i++) {
-        if (cpu->env.misa_ext & RV(riscv_single_letter_exts[i])) {
-            *p++ = qemu_tolower(riscv_single_letter_exts[i]);
-        }
-    }
-    *p = '\0';
-    if (!cpu->cfg.short_isa_string) {
-        riscv_isa_string_ext(cpu, &isa_str, maxlen);
-    }
+
+    snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
+    riscv_isa_string_ext(cpu, &isa_str);
+
     return isa_str;
 }
 
-- 
2.34.1


