Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CBD5353C0
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 21:06:01 +0200 (CEST)
Received: from localhost ([::1]:41914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuIo4-0006Ht-CR
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 15:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nuIjG-0002XN-Qd
 for qemu-devel@nongnu.org; Thu, 26 May 2022 15:01:02 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:43996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nuIjE-0008OL-E9
 for qemu-devel@nongnu.org; Thu, 26 May 2022 15:01:02 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 67-20020a1c1946000000b00397382b44f4so1566910wmz.2
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 12:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BUEk1h6kvEkh1F8d7ZRJI5ayCUpStlTkzTI4Km+ysPY=;
 b=j138BoNJEpPMFg+yxmrZKjxNU+3H/UlaE4rkagZC+4J0RY5acQTk+jDNwPrniQuPNe
 cjR2ZtDvIEBqC9DzsW+0swQ8CO8YCg+XVvaevIXlRs/+2aOY28kisnD3//aMnje/OQ3D
 qfmClcNqrrdS4XR+OLOQj4oC3aJza13H+HKdJCu19k+r7osSXlPy32EAso4iMB0pRamM
 fkgpxwEq3an6clPMICwVyFyyzjWT/x8WDEIFD6MHvejXwJmML+D6m1cpWN3t/vRebJIi
 SMksV3Mqnvo0RnM6JTQx1aLkP3+T1i0c0cMma5/HKB45DOl5YaYPVHBefs+zFPKYQOmR
 k3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BUEk1h6kvEkh1F8d7ZRJI5ayCUpStlTkzTI4Km+ysPY=;
 b=v3Cb+ve5U+QR2eRAmdT8IlUwQBs5+lbYZ+SQQsqxrm8b88KFJdVOUcHdsuonWXbirL
 c8HdcfilmRpkq8YQavSW6Gsa7sO/GYwlJmP8lydhG8fgd1PC1g9+kdyvhJCKViZsyeDO
 mFnoggOgmdtlL3qW9LvpuafavAHBajeo9eaw2Gcg/S1YcIKBQaLU+UrcPjahMxhFWg0j
 TXhwbI/QhxZfTliZPkhxjWzvwnbCEx63B60Vvra5rM7AVTls33dgjD/KbJgup/XFD7vw
 xqyESSrZPuAR28yzTujNeWvBQK3hy+fWzCTjtsOOtIR4bvn/B66gj0fNXskRDaptVGDg
 Fe7A==
X-Gm-Message-State: AOAM531Jwa5t8OwcH9SwD8VbP4nafxNmD6BOIA+tlQU8c8r0x0yP445W
 uJA+nO9ZnNBGBHgbzJ38ewkoR3NupWNEtA==
X-Google-Smtp-Source: ABdhPJzrTiU9z+1kP9PlhIghltz13qGOnyyfQBpr5S6HXJRLAjx907gXplEV4EeH7w5m64K5ifQ2eg==
X-Received: by 2002:a7b:c3c2:0:b0:394:9229:3b40 with SMTP id
 t2-20020a7bc3c2000000b0039492293b40mr3580844wmj.195.1653591656891; 
 Thu, 26 May 2022 12:00:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a1ccc0a000000b0039763d41a48sm2507476wmb.25.2022.05.26.12.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 12:00:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Liviu Ionescu <ilg@livius.net>
Subject: [PATCH 1/2] gdbstub: Don't use GDB syscalls if no GDB is attached
Date: Thu, 26 May 2022 20:00:52 +0100
Message-Id: <20220526190053.521505-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220526190053.521505-1-peter.maydell@linaro.org>
References: <20220526190053.521505-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In two places in gdbstub.c we look at gdbserver_state.init to decide
whether we're going to do a semihosting syscall via the gdb remote
protocol:
 * when setting up, if the user didn't explicitly select either
   native semihosting or gdb semihosting, we autoselect, with the
   intended behaviour "use gdb if gdb is connected"
 * when the semihosting layer attempts to do a syscall via gdb, we
   silently ignore it if the gdbstub wasn't actually set up

However, if the user's commandline sets up the gdbstub but tells QEMU
to start rather than waiting for a GDB to connect (eg using '-s' but
not '-S'), then we will have gdbserver_state.init true but no actual
connection; an attempt to use gdb syscalls will then crash because we
try to use gdbserver_state.c_cpu when it hasn't been set up:

#0  0x00007ffff6803ba8 in qemu_cpu_kick (cpu=0x0) at ../../softmmu/cpus.c:457
#1  0x00007ffff6c03913 in gdb_do_syscallv (cb=0x7ffff6c19944 <common_semi_cb>,
    fmt=0x7ffff7573b7e "", va=0x7ffff56294c0) at ../../gdbstub.c:2946
#2  0x00007ffff6c19c3a in common_semi_gdb_syscall (cs=0x7ffff83fe060,
    cb=0x7ffff6c19944 <common_semi_cb>, fmt=0x7ffff7573b75 "isatty,%x")
    at ../../semihosting/arm-compat-semi.c:494
#3  0x00007ffff6c1a064 in gdb_isattyfn (cs=0x7ffff83fe060, gf=0x7ffff86a3690)
    at ../../semihosting/arm-compat-semi.c:636
#4  0x00007ffff6c1b20f in do_common_semihosting (cs=0x7ffff83fe060)
    at ../../semihosting/arm-compat-semi.c:967
#5  0x00007ffff693a037 in handle_semihosting (cs=0x7ffff83fe060)
    at ../../target/arm/helper.c:10316

You can probably also get into this state via some odd
corner cases involving connecting a GDB and then telling it
to detach from all the vCPUs.

Abstract out the test into a new gdb_attached() function
which returns true only if there's actually a GDB connected
to the debug stub and attached to at least one vCPU.

Reported-by: Liviu Ionescu <ilg@livius.net>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Silently doing nothing in gdb_do_syscallv(), never calling the
callback function, is kind of dodgy.  But it's what the code is doing
already, and besides it's not clear what we should do if the user
specifically says "semihosting calls via the gdb stub" and then
doesn't connect gdb...
---
 gdbstub.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index a3ff8702cef..88a34c8f522 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -443,6 +443,15 @@ static int get_char(void)
 }
 #endif
 
+/*
+ * Return true if there is a GDB currently connected to the stub
+ * and attached to a CPU
+ */
+static bool gdb_attached(void)
+{
+    return gdbserver_state.init && gdbserver_state.c_cpu;
+}
+
 static enum {
     GDB_SYS_UNKNOWN,
     GDB_SYS_ENABLED,
@@ -464,8 +473,7 @@ int use_gdb_syscalls(void)
     /* -semihosting-config target=auto */
     /* On the first call check if gdb is connected and remember. */
     if (gdb_syscall_mode == GDB_SYS_UNKNOWN) {
-        gdb_syscall_mode = gdbserver_state.init ?
-            GDB_SYS_ENABLED : GDB_SYS_DISABLED;
+        gdb_syscall_mode = gdb_attached() ? GDB_SYS_ENABLED : GDB_SYS_DISABLED;
     }
     return gdb_syscall_mode == GDB_SYS_ENABLED;
 }
@@ -2886,7 +2894,7 @@ void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va)
     target_ulong addr;
     uint64_t i64;
 
-    if (!gdbserver_state.init) {
+    if (!gdb_attached()) {
         return;
     }
 
-- 
2.25.1


