Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AEB400D9E
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 02:02:39 +0200 (CEST)
Received: from localhost ([::1]:38906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMfcN-0001x2-0i
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 20:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfW8-0005UR-S9
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:56:12 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:35424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfW7-0007ZF-Ac
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:56:12 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 z9-20020a7bc149000000b002e8861aff59so2232911wmi.0
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=82KmkOHInD6T32/MBrAXuGha1mEQ9aTunJA89epWqX8=;
 b=Kn93JtMrWE65+Dwtq2r2ai4VuihprXioSaMgxmymKtW9ll2R/DY2c8BEFaK6ccGB0j
 etXFfgchXoBrOnD5yfgQDrABEggvDa384g7CJ9zzL1NxRq7PD8QP8xRX/022RCIOD0XZ
 1/hpHPMri9eC23XA+LRmZB3Q+OCFclnC1VC5OqdzI3f76Po12AqsrFmqBYhYb4iBP/hM
 TvnbgU0kIt+ZscnxW7GS+ekZ4uKvfVzK0ES3+98MmDazCLjFHy/LYtj/ByGexmj3liul
 9P4q8rvmiPDkrqNep11HeaY1lvHdd7gmODw2oqqptzfNUHTs+aFPgRqHvhXSUZwcclgu
 08+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=82KmkOHInD6T32/MBrAXuGha1mEQ9aTunJA89epWqX8=;
 b=bGF63ldY/u2mt4PujJ5D+fhK/7yu8/iqzaF2tR1Zmf+VXSzyqSZF/JTLL381IRZX8n
 d2Pp2TUOJin/GFHhW26P9ZJXUhl1t5JU2gXl86EelVUVh+tCdPFdoVXQ50E2MC0z9FcZ
 UgOv3CWvLIqQXiqdSDNVFtLW08hod7iBsAFfmiQBoGJZv0Vn/KoNmjkTtoFCnVmYj7yp
 70nrDzq1Qvds3Pmtk9N6wKEXz1Kpp00kJqFKjj5XCBW19LeobOXcfjfIXIqcLeYV8SXl
 SXQmXz9hf1AYMNl/TAlgjySqTGolrjLBIxPihxaYjhUMcQeXNsVSSKWpZTPn/tixK6F3
 jG5Q==
X-Gm-Message-State: AOAM530EHO3aFsAg5IAba37oKs8smyuyMKOvBdxfoRG0xZVN2OhZlwS6
 Nfp3JnAAYZM/lOt5I29Q1hZ+9EKGcU4=
X-Google-Smtp-Source: ABdhPJwst4L6LtqbIqiimTRXPOTq6XxTPm3Izm/4SP1dNz9JfR7Lw17lMRZ9duymzC3zNapRWxZRHg==
X-Received: by 2002:a05:600c:5123:: with SMTP id
 o35mr4977935wms.153.1630799769864; 
 Sat, 04 Sep 2021 16:56:09 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id s12sm3423506wru.41.2021.09.04.16.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:56:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/24] accel/tcg: Rename user-mode do_interrupt hack as
 fake_user_interrupt
Date: Sun,  5 Sep 2021 01:55:23 +0200
Message-Id: <20210904235542.1092641-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904235542.1092641-1-f4bug@amsat.org>
References: <20210904235542.1092641-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

do_interrupt() is sysemu specific. However due to some X86
specific hack, it is also used in user-mode emulation, which
is why it couldn't be restricted to CONFIG_SOFTMMU (see the
comment around added in commit 78271684719: "cpu: tcg_ops:
move to tcg-cpu-ops.h, keep a pointer in CPUClass").
Keep the hack but rename the handler as fake_user_interrupt()
and restrict do_interrupt() to sysemu.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/tcg-cpu-ops.h | 22 ++++++++++++++--------
 accel/tcg/cpu-exec.c          |  4 ++--
 target/i386/tcg/tcg-cpu.c     |  6 ++++--
 3 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index eab27d0c030..6c7ab9600ba 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -37,14 +37,6 @@ struct TCGCPUOps {
     void (*cpu_exec_exit)(CPUState *cpu);
     /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
     bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
-    /**
-     * @do_interrupt: Callback for interrupt handling.
-     *
-     * note that this is in general SOFTMMU only, but it actually isn't
-     * because of an x86 hack (accel/tcg/cpu-exec.c), so we cannot put it
-     * in the SOFTMMU section in general.
-     */
-    void (*do_interrupt)(CPUState *cpu);
     /**
      * @tlb_fill: Handle a softmmu tlb miss or user-only address fault
      *
@@ -61,6 +53,20 @@ struct TCGCPUOps {
     void (*debug_excp_handler)(CPUState *cpu);
 
 #ifdef NEED_CPU_H
+#if defined(CONFIG_USER_ONLY) && defined(TARGET_I386)
+    /**
+     * @fake_user_interrupt: Callback for 'fake exception' handling.
+     *
+     * Simulate 'fake exception' which will be handled outside the
+     * cpu execution loop (hack for x86 user mode).
+     */
+    void (*fake_user_interrupt)(CPUState *cpu);
+#else
+    /**
+     * @do_interrupt: Callback for interrupt handling.
+     */
+    void (*do_interrupt)(CPUState *cpu);
+#endif /* !CONFIG_USER_ONLY || !TARGET_I386 */
 #ifdef CONFIG_SOFTMMU
     /**
      * @do_transaction_failed: Callback for handling failed memory transactions
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index e5c0ccd1a2a..2838177e7f0 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -651,8 +651,8 @@ static inline bool cpu_handle_exception(CPUState *cpu, int *ret)
            loop */
 #if defined(TARGET_I386)
         CPUClass *cc = CPU_GET_CLASS(cpu);
-        cc->tcg_ops->do_interrupt(cpu);
-#endif
+        cc->tcg_ops->fake_user_interrupt(cpu);
+#endif /* TARGET_I386 */
         *ret = cpu->exception_index;
         cpu->exception_index = -1;
         return true;
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 93a79a57415..04c35486a2f 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -73,9 +73,11 @@ static const struct TCGCPUOps x86_tcg_ops = {
     .cpu_exec_enter = x86_cpu_exec_enter,
     .cpu_exec_exit = x86_cpu_exec_exit,
     .cpu_exec_interrupt = x86_cpu_exec_interrupt,
-    .do_interrupt = x86_cpu_do_interrupt,
     .tlb_fill = x86_cpu_tlb_fill,
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+    .fake_user_interrupt = x86_cpu_do_interrupt,
+#else
+    .do_interrupt = x86_cpu_do_interrupt,
     .debug_excp_handler = breakpoint_handler,
     .debug_check_breakpoint = x86_debug_check_breakpoint,
 #endif /* !CONFIG_USER_ONLY */
-- 
2.31.1


