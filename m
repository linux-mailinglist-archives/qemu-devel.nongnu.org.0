Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FEB4B7BA1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 01:12:46 +0100 (CET)
Received: from localhost ([::1]:46704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK7w5-0007k9-Bd
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 19:12:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nK7sn-0006Wn-Cw
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 19:09:21 -0500
Received: from [2607:f8b0:4864:20::f2d] (port=43688
 helo=mail-qv1-xf2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nK7sj-0007Qb-5Q
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 19:09:19 -0500
Received: by mail-qv1-xf2d.google.com with SMTP id a28so670252qvb.10
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 16:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VymPTuPgvJyFIxbcnME34BWXvp7kxMF9LOyMJJVapQ0=;
 b=Ii19nHoErmEL9nkS3QFnzwgEBnYURLS2xODnBAyR1MyL3Xt7Hj00wv6iV/B9Z20P41
 eUgq828VwXvF/dsSR4uB7bRcnyDFM2e57vFnHJtEbhpAqNHBzb3Xw1zNXC073X38sVKb
 4W07rHz0i2yRJ7TaqlXfq+yU+QkXGUvoTRS7n9B50NpjvwkCRxlstDQr2QxjFfQCHP4T
 JrMDtHeCWX61eR0ZnROkQ5oFHH9jg/zUEENmN142nr1FVMjn7uzEQmPXnR0lnNIZebdG
 pkjERrZCUDGEsQCmKiUMiiZhEruod9ygG80ngMyhqmv1qXubJxANYeyuZ7+3HycirbD8
 q65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VymPTuPgvJyFIxbcnME34BWXvp7kxMF9LOyMJJVapQ0=;
 b=lrihPDjJi+/2ccx1frXdXCzeedocRArgbSSIrTWtSo4R3LlQ5G2JQfaFt0nbnfPq3I
 lKMHUHg7kr1OTSvlWr+ux94F7MYbTS9KIJzHlrTmyaiiiOBk5mPu8NEoJM4D4Lv6AxF2
 ZpaqhSOR6XhMQ2xeH6jFQ13QD71hvio13z8qhsYzM0XUfe9cbBsiWj3VPTEMZUJV5Ode
 irZjjUBOYaD5E4uc+pUwReBJZEfcnob3rAyQP8Tl4NUo9VO8mcef5/Rcijk4phE4yBjJ
 aww5Tnm050dHofK8Ri7IoCs0f3lJjveXy8GCZJkXz6dKUnTpQR7BNYzrg1RRjrR11uH4
 th2w==
X-Gm-Message-State: AOAM533l5f8Wj5HZ+DfptJb4/Yj07jPColHlYQQQtY6e+1PWwGl/ZWYL
 EALeGqoy31IT9zJWo6mPz5UL2G+/QrBoI1F8
X-Google-Smtp-Source: ABdhPJxm/mMpMPbM6kq7BO6AEXURv/SZN/cpBLdFTJfy793hkhA8RP2zBVDctI4Jl6eVNZCWqGXY0Q==
X-Received: by 2002:a05:6214:27c9:b0:42d:f6b8:2a17 with SMTP id
 ge9-20020a05621427c900b0042df6b82a17mr283749qvb.113.1644970155946; 
 Tue, 15 Feb 2022 16:09:15 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id h4sm303418qtr.95.2022.02.15.16.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 16:09:15 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/riscv: Add isa extenstion strings to the device tree
Date: Tue, 15 Feb 2022 16:09:04 -0800
Message-Id: <20220216000904.1217872-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=atishp@rivosinc.com; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Heiko Stubner <heiko@sntech.de>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Linux kernel parses the ISA extensions from "riscv,isa" DT
property. It used to parse only the single letter base extensions
until now. A generic ISA extension parsing framework was proposed[1]
recently that can parse multi-letter ISA extensions as well.

Generate the extended ISA string by appending  the available ISA extensions
to the "riscv,isa" string if it is enabled so that kernel can process it.

[1] https://lkml.org/lkml/2022/2/15/263

Suggested-by: Heiko Stubner <heiko@sntech.de>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes from v1->v2:
1. Improved the code redability by using arrays instead of individual check
---
 target/riscv/cpu.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b0a40b83e7a8..9bf8923f164b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -34,6 +34,13 @@
 
 /* RISC-V CPU definitions */
 
+/* This includes the null terminated character '\0' */
+#define MAX_ISA_EXT_LEN 256
+struct isa_ext_data {
+        const char *name;
+        bool enabled;
+};
+
 static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
 
 const char * const riscv_int_regnames[] = {
@@ -881,10 +888,35 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
+static void riscv_isa_string_ext(RISCVCPU *cpu, char *isa_str, int max_str_len)
+{
+    int offset = strnlen(isa_str, max_str_len);
+    int i;
+    struct isa_ext_data isa_edata_arr[] = {
+        { "svpbmt", cpu->cfg.ext_svpbmt   },
+        { "svinval", cpu->cfg.ext_svinval },
+        { "svnapot", cpu->cfg.ext_svnapot },
+    };
+
+    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
+        if (!isa_edata_arr[i].enabled) {
+            continue;
+        }
+        /* check available space */
+        if ((offset + strlen(isa_edata_arr[i].name) + 1) > max_str_len) {
+            qemu_log("No space left to append isa extension");
+            return;
+        }
+        offset += snprintf(isa_str + offset, max_str_len, "_%s",
+                           isa_edata_arr[i].name);
+    }
+}
+
 char *riscv_isa_string(RISCVCPU *cpu)
 {
     int i;
-    const size_t maxlen = sizeof("rv128") + sizeof(riscv_exts) + 1;
+    const size_t maxlen = sizeof("rv128") + sizeof(riscv_exts) +
+                          MAX_ISA_EXT_LEN;
     char *isa_str = g_new(char, maxlen);
     char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
     for (i = 0; i < sizeof(riscv_exts); i++) {
@@ -893,6 +925,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
         }
     }
     *p = '\0';
+    riscv_isa_string_ext(cpu, isa_str, maxlen);
     return isa_str;
 }
 
-- 
2.30.2


