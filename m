Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA784B5A7F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:19:59 +0100 (CET)
Received: from localhost ([::1]:60110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJgtC-0004kd-7p
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:19:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgX4-0001ED-5z; Mon, 14 Feb 2022 13:57:06 -0500
Received: from [2607:f8b0:4864:20::42b] (port=39513
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgX2-0006Oz-Cm; Mon, 14 Feb 2022 13:57:05 -0500
Received: by mail-pf1-x42b.google.com with SMTP id m22so11607753pfk.6;
 Mon, 14 Feb 2022 10:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=isRHTaQo7DzZUT2vSSjaeKX6MCgdzOyldyuiSGY08ZY=;
 b=YEVf2b8yxaaNroNyuJZZmOuxhNraFer3vstbP/LAJFobwgAMHcV78ZuOo20k+ursjx
 PjUq0hq8QxfsMhP6bTMmxK72M7RvWMG0aMjALet5T6MG+v8GAtoxdB9COkJmXe2g+riK
 z5B4hh/PoT6Y9WHhOOvVHrLvApbcs06Cb4B43ULmXlMr3Q8qpHrglm1hKqThzez6+HMJ
 SwoIpFpR1047idbbkUxyrEPyIZuZCAOWsKZrxIcUnrb0g2Ql0v+1hmdoy9SIVebdTIcG
 IUvkcIGzD0GY9LPHBreGh+cmpdEaeJXINfQbTICjpgqVIV8wiNTA7nKlkFsS1hQIZGhS
 EZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=isRHTaQo7DzZUT2vSSjaeKX6MCgdzOyldyuiSGY08ZY=;
 b=2d5dvjtwXUWU4u8NsEC51NGpnlfdwVeQ5B1q0KZx02VtYojsYq2lSsaUsuKUEKaRh4
 OaL61QiyNvZrOPcOdDevQRyN0qFYVX0q24jNnPW9/P3+dgPiGZ9O8+EyWVwkjbCfCQZS
 QUljh4Ild8tvRxAuOWjR/4+7hsc0envLPGXuQJN3561XlSvxhvmGxUD+DkNQxOfWz5Fp
 uKmex7JcJYlHwm4FkJURo/OcdUYDHaulrqx5huCZJdFCFPqAsEfRxeOJxN3HIARPSCA2
 X3Z7R8fBdyWn9BEn23bUF2zUW63P1mHCNNGcAlhCzAPilWZO/OeLao4EEnArxTGCsEj7
 c2mA==
X-Gm-Message-State: AOAM533eyTcLghKeLp2mWMbr0aAi1rTMetKZqo3Go/+SFpCbq00gEHZh
 I1Z+YZlFTGq/0KFJScwgoRDyyO+M/oo=
X-Google-Smtp-Source: ABdhPJzp2tee3LRcfjnRRsPFfLUfPG1l9OYyS1bI230E6ROvSaSQ6U/wFXOEHDL72P4TxeXc/mLw9g==
X-Received: by 2002:a05:6a00:21c9:: with SMTP id
 t9mr469892pfj.48.1644865022744; 
 Mon, 14 Feb 2022 10:57:02 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id q40sm14642132pjq.19.2022.02.14.10.56.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:57:02 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Will Cohen <wwcohen@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 05/16] hvf: Fix OOB write in RDTSCP instruction decode
Date: Mon, 14 Feb 2022 19:55:54 +0100
Message-Id: <20220214185605.28087-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214185605.28087-1-f4bug@amsat.org>
References: <20220214185605.28087-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Cameron Esfahani <dirty@apple.com>

A guest could craft a specific stream of instructions that will have QEMU
write 0xF9 to inappropriate locations in memory.  Add additional asserts
to check for this.  Generate a #UD if there are more than 14 prefix bytes.

Found by Julian Stecklina <julian.stecklina@cyberus-technology.de>

Signed-off-by: Cameron Esfahani <dirty@apple.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/hvf/x86_decode.c | 11 +++++++++--
 target/i386/hvf/x86hvf.c     |  8 ++++++++
 target/i386/hvf/x86hvf.h     |  1 +
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/target/i386/hvf/x86_decode.c b/target/i386/hvf/x86_decode.c
index 062713b1a4..fbaf1813e8 100644
--- a/target/i386/hvf/x86_decode.c
+++ b/target/i386/hvf/x86_decode.c
@@ -24,6 +24,7 @@
 #include "vmx.h"
 #include "x86_mmu.h"
 #include "x86_descr.h"
+#include "x86hvf.h"
 
 #define OPCODE_ESCAPE   0xf
 
@@ -541,7 +542,8 @@ static void decode_lidtgroup(CPUX86State *env, struct x86_decode *decode)
     };
     decode->cmd = group[decode->modrm.reg];
     if (0xf9 == decode->modrm.modrm) {
-        decode->opcode[decode->len++] = decode->modrm.modrm;
+        VM_PANIC_ON(decode->opcode_len >= sizeof(decode->opcode));
+        decode->opcode[decode->opcode_len++] = decode->modrm.modrm;
         decode->cmd = X86_DECODE_CMD_RDTSCP;
     }
 }
@@ -1847,7 +1849,8 @@ void calc_modrm_operand(CPUX86State *env, struct x86_decode *decode,
 
 static void decode_prefix(CPUX86State *env, struct x86_decode *decode)
 {
-    while (1) {
+    /* At most 14 prefix bytes. */
+    for (int i = 0; i < 14; i++) {
         /*
          * REX prefix must come after legacy prefixes.
          * REX before legacy is ignored.
@@ -1892,6 +1895,8 @@ static void decode_prefix(CPUX86State *env, struct x86_decode *decode)
             return;
         }
     }
+    /* Too many prefixes!  Generate #UD. */
+    hvf_inject_ud(env);
 }
 
 void set_addressing_size(CPUX86State *env, struct x86_decode *decode)
@@ -2090,11 +2095,13 @@ static void decode_opcodes(CPUX86State *env, struct x86_decode *decode)
     uint8_t opcode;
 
     opcode = decode_byte(env, decode);
+    VM_PANIC_ON(decode->opcode_len >= sizeof(decode->opcode));
     decode->opcode[decode->opcode_len++] = opcode;
     if (opcode != OPCODE_ESCAPE) {
         decode_opcode_1(env, decode, opcode);
     } else {
         opcode = decode_byte(env, decode);
+        VM_PANIC_ON(decode->opcode_len >= sizeof(decode->opcode));
         decode->opcode[decode->opcode_len++] = opcode;
         decode_opcode_2(env, decode, opcode);
     }
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index 05ec1bddc4..a805c125d9 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -425,6 +425,14 @@ bool hvf_inject_interrupts(CPUState *cpu_state)
             & (CPU_INTERRUPT_INIT | CPU_INTERRUPT_TPR));
 }
 
+void hvf_inject_ud(CPUX86State *env)
+{
+    env->exception_nr = EXCP06_ILLOP;
+    env->exception_injected = 1;
+    env->has_error_code = false;
+    env->error_code = 0;
+}
+
 int hvf_process_events(CPUState *cpu_state)
 {
     X86CPU *cpu = X86_CPU(cpu_state);
diff --git a/target/i386/hvf/x86hvf.h b/target/i386/hvf/x86hvf.h
index 99ed8d608d..ef472a32f9 100644
--- a/target/i386/hvf/x86hvf.h
+++ b/target/i386/hvf/x86hvf.h
@@ -22,6 +22,7 @@
 
 int hvf_process_events(CPUState *);
 bool hvf_inject_interrupts(CPUState *);
+void hvf_inject_ud(CPUX86State *);
 void hvf_set_segment(struct CPUState *cpu, struct vmx_segment *vmx_seg,
                      SegmentCache *qseg, bool is_tr);
 void hvf_get_segment(SegmentCache *qseg, struct vmx_segment *vmx_seg);
-- 
2.34.1


