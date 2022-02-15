Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6AC4B670C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:10:53 +0100 (CET)
Received: from localhost ([::1]:40760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJtrI-0003l5-10
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:10:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nJtmJ-0000hB-Ph
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:05:43 -0500
Received: from [2607:f8b0:4864:20::731] (port=33535
 helo=mail-qk1-x731.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nJtmH-00048D-DV
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:05:43 -0500
Received: by mail-qk1-x731.google.com with SMTP id o10so16785852qkg.0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P3TDeBoYnGJEcYB2yF/ZaCd5f36n6a0O40QXP2A3pTk=;
 b=0yTG5ybbN2NQaWf1LOaeSuTpBMiDamRR5tEz6jQZUnM9RHVEO1PKAK8OY/Hhi951bj
 j69CB/Cq3AGDycGTSjaJ2TeNx5XvS0RxrNHx56DnkECQ2GrBfwxX/oFSTjhhqsFDEL2K
 WJT0M5KMFZv0fbS2raRpKGzm6skEI9/PShw6xlDtXW6U601IVocHVGT2/oovooPVooET
 pcQmfvQBU0Tg+/Lv5bQdfVnJ1WPmtsdtxMQIuhKpzmwLY7qoFwvxdOgDKe7BxkJua6Da
 cqgvQt3C0KUBh+Vljby42UTeN8Dof6YBNQIr2gcqdhzTJ4khTdgHmcNpfOjMiVQeqLrK
 hQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P3TDeBoYnGJEcYB2yF/ZaCd5f36n6a0O40QXP2A3pTk=;
 b=RS7EGcPTQt1RokOQFxUZmEkHktIAZ0Deo1isnQNNv3LdWjK0As9CtKQiHSnulwzoU5
 eDoN9zXaIL3Xe1q3rbGQ8MdE27pYafNmX46Vw0n37c5FPjTZPmFwZD/tplLT1WmRgLBr
 Inrj1JZackatVzTuL5Y8eCS2TQivXXt0ljv8kt1asFR+dXokis9phFAMqGJczb0Y8a1d
 96bW7zRet+nCxauL2yWSLiDowpFGIBaIQXQ3NMDGkIF471SYkXQ7+srJSp0srxvBmP6M
 aYOLHdAMsP9i0VSuaKnFBOKKM38KCJIhSw1aA4PvCjeQ8OcjybHaJkDXMTgckgXL3rK0
 MvnA==
X-Gm-Message-State: AOAM532XS3RUHMMaijmN29HJkmqxtFGWSpJLMJAMbMQvgGXJTpAPetH/
 oAm+liDM/RPIPay7uK+jCKdPFu0n4awmT8RM
X-Google-Smtp-Source: ABdhPJx725idZpO94ZILRY4pg9T9ibe8d8dkpI06JpVqXJNMTT4yrPU9Ep1RlglLh3T9jivGdNe/iA==
X-Received: by 2002:a05:620a:4501:: with SMTP id
 t1mr1490758qkp.16.1644915938748; 
 Tue, 15 Feb 2022 01:05:38 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id o5sm690868qtp.48.2022.02.15.01.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:05:38 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/riscv: Add isa extenstion strings to the device tree
Date: Tue, 15 Feb 2022 01:05:30 -0800
Message-Id: <20220215090530.911828-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::731
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=atishp@rivosinc.com; helo=mail-qk1-x731.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Append the available ISA extensions to the "riscv,isa" string if it
is enabled so that kernel can process it.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b0a40b83e7a8..c70260d0df15 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -34,6 +34,9 @@
 
 /* RISC-V CPU definitions */
 
+/* This includes the null terminated character '\0' */
+#define MAX_ISA_EXT_LEN 256
+
 static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
 
 const char * const riscv_int_regnames[] = {
@@ -881,10 +884,26 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
+static void riscv_isa_string_ext(RISCVCPU *cpu, char *isa_str, int max_str_len)
+{
+    int offset = strnlen(isa_str, max_str_len);
+
+    if (cpu->cfg.ext_svpbmt) {
+        offset += snprintf(isa_str + offset, max_str_len, "_%s", "_svpbmt");
+    }
+    if ((offset < max_str_len) && cpu->cfg.ext_svinval) {
+        offset += snprintf(isa_str + offset, max_str_len, "_%s", "_svinval");
+    }
+    if ((offset < max_str_len) && (cpu->cfg.ext_svnapot)) {
+        offset += snprintf(isa_str + offset, max_str_len, "_%s", "_svnapot");
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
@@ -893,6 +912,8 @@ char *riscv_isa_string(RISCVCPU *cpu)
         }
     }
     *p = '\0';
+    riscv_isa_string_ext(cpu, isa_str, maxlen);
+
     return isa_str;
 }
 
-- 
2.30.2


