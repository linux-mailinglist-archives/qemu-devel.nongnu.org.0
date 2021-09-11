Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AB84079AF
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 18:59:26 +0200 (CEST)
Received: from localhost ([::1]:37980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP6Ld-0005wq-Nb
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 12:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6HQ-0006bC-8i
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:55:04 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6HO-0002JG-KW
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:55:03 -0400
Received: by mail-wr1-x42c.google.com with SMTP id b6so7459963wrh.10
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 09:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=82KmkOHInD6T32/MBrAXuGha1mEQ9aTunJA89epWqX8=;
 b=Wvx18w7OXDMt3qrFbOeAJi01TZPxs6nfyKUuc1WoZpxPbN0luw8v90VdrQP8WpXxvz
 6D5Z9YN06NEuWYNUOWpOFtgRuqDO1ofR+8c8+Adrr6+lH7VpSjAm0RD4DBbToIWBKr4O
 EpcSnGgKKnBjDnbMAyv+l4tj6NyBAwt7kZEQqHtpu+mrJBg9lIUOHURWt8YNbjcNNekI
 PsSNkyj7HWyZhh+oo7qQKlSqTJicoQ4/diXt6kWUbicyX6LOYgdiLJtYaLWAv6sesqFI
 fyA3QIMa0d5w9reWvrevYuOFDJO4lqOdvEGSV6x/w/kKpfrEYL+7I47qZw+23ogphZX4
 G4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=82KmkOHInD6T32/MBrAXuGha1mEQ9aTunJA89epWqX8=;
 b=ObxQQVZpwP3LrnzhfeD1sQ+p5wcuBWre4tVK54W+PReRy6sSOIkcR7RyJX2sqdNdzz
 lRyM6YQxkAgxleN6p7/BtoNa7fwvi60ApJpEXphOBrCkiHuf+Uhq3h5BXnVzoA6HKiS8
 vK9KGNoEnk6sbdBupLbT3ldiqrQoNGdAxWPuitFZDEnGMpH5pjjy8YrhjbD38JSdgxl8
 WuOC7670JHzcbSiJ6WuLsU4WqkqxcOwl4c9ywL32qAayUehwQX0Q3JAO75ULFdf+SwzF
 BqHLGLatOLwG/9qpY70WAbd2BwFcITOBmjy5zLwqhNU6BEu7vi6Wg05MbgUZUTKxRz/9
 KaSw==
X-Gm-Message-State: AOAM530nT4u41Sl4w3iGrbBvhmB8DlW7Df49fy0R9TNCXnjX4RzuIKkR
 8Nr8dJxk5ifiVR9EdFMhjj5b/+rzr4g=
X-Google-Smtp-Source: ABdhPJyZOkeQqeD9Cha1QZ+au7oTLStFUBD5ohQ53fqgRfqQc/XFPWDiauSpdQuOdbGBK+hI2RSlpQ==
X-Received: by 2002:a05:6000:7:: with SMTP id h7mr3871888wrx.134.1631379300719; 
 Sat, 11 Sep 2021 09:55:00 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id k22sm2161065wrd.59.2021.09.11.09.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 09:55:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/24] accel/tcg: Rename user-mode do_interrupt hack as
 fake_user_interrupt
Date: Sat, 11 Sep 2021 18:54:15 +0200
Message-Id: <20210911165434.531552-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210911165434.531552-1-f4bug@amsat.org>
References: <20210911165434.531552-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
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


