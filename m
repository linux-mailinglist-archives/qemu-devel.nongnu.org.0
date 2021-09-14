Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B3140A217
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:38:24 +0200 (CEST)
Received: from localhost ([::1]:40816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwSt-0002E9-4S
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6s-0001rt-Ej
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:38 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:39850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6f-0007qs-IB
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:34 -0400
Received: by mail-pg1-x531.google.com with SMTP id g184so11004019pgc.6
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wr6V+HMLHJbAkFT+KuII9FEWJ5dhHoEyzENG4sNw/t0=;
 b=GyNQpfctXAkMyQmn8RdJs8ONvxWCXo4MDOfPhEsEp0W5HIQtW8N9YNhXBK9/YmhQGW
 BP9UO5HxVeJjCjm3oEoEBoIGUkCO77roKMMUDOvKC/nOrkZRfAQsmlxKoSwMFfY1g2v9
 +tskIMM/idrv9Zhl4vjHPnNvFseP1ZssB8DZ3EvVRQ4h65ZKPBvS02DeuqQ4heLsEli+
 lJMOqbvJP+wN7B7tdoAKm0Q15sl3l9N/L9QJBCT1UHtF7vXPecYHEFyFBlH2hAksWSj9
 JK4Sc9jenUFwLApFxRR6kggrd5krEfsvv5cY3+HGPWsevaFBEMm9XQjC8vEv363M87qC
 jWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wr6V+HMLHJbAkFT+KuII9FEWJ5dhHoEyzENG4sNw/t0=;
 b=pzj3VFb6ttXNKRGb3lcTVzuhQxbXmzx5KNmRNDhuY3q/kw63ilSZ3SqKJAm0UdAzLZ
 o+iL7TUm4CjuH6ZgO4sNK9gWznGQeDtq2I7ENNSbfhKm7uaq5+xW+9MWqJViZYNVlX4c
 Fb5hh95JGenJJmtbhXPHIGgnAlLaiMAyghI76laLZ2rSxgMX4MfJWLzzIFQG6aPjrBIT
 oRyct7rb4XBGYF9w5GfUrFXxxzvpQKYmb8Q3r5QvME9uMJAqKo2lnoJ4w3knJrscJPuY
 D7KDR+0Oyo9Kg6POdoffJnguQE3QH5NjSDip3m9K/vlRzDrGlzawUPHz2duY5jhUTrIu
 mGaQ==
X-Gm-Message-State: AOAM533v3WfjAg9l7rnfbco1W7gGzdISnO9yKD1KN9dTsW9j6IwNtUtY
 Mv9Af5teFCKAgqmxiXxlQOjjV+9oOnPDJQ==
X-Google-Smtp-Source: ABdhPJwfE4ohrAVDRsNCEOlhAyKUMnAxdIDB5gbz39OJ+sPHVjqIsn6cnKPax4RotIYJrnCdhh5f1Q==
X-Received: by 2002:a63:c113:: with SMTP id w19mr13223450pgf.168.1631578521466; 
 Mon, 13 Sep 2021 17:15:21 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/44] user: Remove cpu_get_pic_interrupt() stubs
Date: Mon, 13 Sep 2021 17:14:44 -0700
Message-Id: <20210914001456.793490-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

cpu_get_pic_interrupt() is now unreachable from user-mode,
delete the unnecessary stubs.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210911165434.531552-25-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/cpu.h                 | 2 +-
 bsd-user/i386/target_arch_cpu.c   | 5 -----
 bsd-user/x86_64/target_arch_cpu.c | 5 -----
 linux-user/main.c                 | 7 -------
 4 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 1a36c53c18..7dd664791a 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1836,9 +1836,9 @@ int x86_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void x86_cpu_list(void);
 int cpu_x86_support_mca_broadcast(CPUX86State *env);
 
+#ifndef CONFIG_USER_ONLY
 int cpu_get_pic_interrupt(CPUX86State *s);
 
-#ifndef CONFIG_USER_ONLY
 /* MSDOS compatibility mode FPU exception support */
 void x86_register_ferr_irq(qemu_irq irq);
 void fpu_check_raise_ferr_irq(CPUX86State *s);
diff --git a/bsd-user/i386/target_arch_cpu.c b/bsd-user/i386/target_arch_cpu.c
index 71998e5ba5..d349e45299 100644
--- a/bsd-user/i386/target_arch_cpu.c
+++ b/bsd-user/i386/target_arch_cpu.c
@@ -33,11 +33,6 @@ uint64_t cpu_get_tsc(CPUX86State *env)
     return cpu_get_host_ticks();
 }
 
-int cpu_get_pic_interrupt(CPUX86State *env)
-{
-    return -1;
-}
-
 void bsd_i386_write_dt(void *ptr, unsigned long addr, unsigned long limit,
                      int flags)
 {
diff --git a/bsd-user/x86_64/target_arch_cpu.c b/bsd-user/x86_64/target_arch_cpu.c
index db822e54c6..be7bd10720 100644
--- a/bsd-user/x86_64/target_arch_cpu.c
+++ b/bsd-user/x86_64/target_arch_cpu.c
@@ -33,11 +33,6 @@ uint64_t cpu_get_tsc(CPUX86State *env)
     return cpu_get_host_ticks();
 }
 
-int cpu_get_pic_interrupt(CPUX86State *env)
-{
-    return -1;
-}
-
 void bsd_x86_64_write_dt(void *ptr, unsigned long addr,
         unsigned long limit, int flags)
 {
diff --git a/linux-user/main.c b/linux-user/main.c
index a6094563b6..45bde4598d 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -120,13 +120,6 @@ const char *qemu_uname_release;
    by remapping the process stack directly at the right place */
 unsigned long guest_stack_size = 8 * 1024 * 1024UL;
 
-#if defined(TARGET_I386)
-int cpu_get_pic_interrupt(CPUX86State *env)
-{
-    return -1;
-}
-#endif
-
 /***********************************************************/
 /* Helper routines for implementing atomic operations.  */
 
-- 
2.25.1


