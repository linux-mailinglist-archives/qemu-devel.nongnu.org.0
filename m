Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1954B2A9F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:42:10 +0100 (CET)
Received: from localhost ([::1]:49076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIYzp-0000Gc-5l
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:42:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYtV-0008NS-4N
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:35:37 -0500
Received: from [2607:f8b0:4864:20::1036] (port=53080
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYtT-0002EX-Fu
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:35:36 -0500
Received: by mail-pj1-x1036.google.com with SMTP id v4so8587587pjh.2
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=isRHTaQo7DzZUT2vSSjaeKX6MCgdzOyldyuiSGY08ZY=;
 b=XN5u9g5gvNarIS0LKofz93RftA7N4AoeilhdDSvtkcGwnF11xpbETYPpbwqyEIiS/x
 ySTq+0MKobjWja0ZgoJtG93iA1NtkgGTJgEm5u266fTaxJcghA1k8dq2wfU9nXaSzuz3
 s3LxDqbdRAn2pGhQXoFIrXGi8VK6qHmCwGSSN9Y1TnKzjaDxeK1yIwauj5X4OCvBCoZD
 HvM8RSJYEwl6xF1AHWgxkR0mVZhp1LHNMj4TWVYNiX9k0bpepXFs01Zo9nqv61dTJaxm
 JNRZM2pmX1PkLSUhyIFKtjlTwYNNR0faTqKP6df+eTc1egJlzaINd3VUyotUI8CZBugv
 EoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=isRHTaQo7DzZUT2vSSjaeKX6MCgdzOyldyuiSGY08ZY=;
 b=UxihK7XzDkYVAKAsuOulIOXhlWlc/oNSE7Mh74E7yxCTuT5tgmy3xnGB9k5mI88JHz
 v4+XIMKVYyBx4KRE91fBjWZ7pe8BdnUSGBRusZbPoyK0/ctsr2IX1NfzMrdPP/MqJvmB
 6wN0777HI7jH2BhA7kYlRoay8tNNNm5PlnwXuKjExmkSP08tkzvthNem9P6kF8lht7BP
 D01axDwsrKJxiSQmSTqAdustwrhqpL9UXQFwaeLhFDn+bi75vWBe5QcORFHIjpdKqzwS
 b0NHjx+lasRDTmwyiCnAm15WQQ0lVxqPd3668o9y86QaxDVogfYALq6XvLKFPGRu46av
 59pg==
X-Gm-Message-State: AOAM530lqpRtTDFa20vLyF4QLW8FPRSEMhbmPaurj6RKZhxR6uaaEdB3
 qsXh8Hrfc5UdARaEExHA7EVYZ4iczXI=
X-Google-Smtp-Source: ABdhPJySb99La4guu8mEdJznVggyS4d8fM8yWLnF8cbS6S5q/y0G4Vxf0NKP/75+YXYJAe4DmCwZAw==
X-Received: by 2002:a17:902:cacb:: with SMTP id
 y11mr2383167pld.96.1644597329795; 
 Fri, 11 Feb 2022 08:35:29 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id nn1sm1021572pjb.47.2022.02.11.08.35.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 11 Feb 2022 08:35:29 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 05/13] hvf: Fix OOB write in RDTSCP instruction decode
Date: Fri, 11 Feb 2022 17:34:26 +0100
Message-Id: <20220211163434.58423-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211163434.58423-1-f4bug@amsat.org>
References: <20220211163434.58423-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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


