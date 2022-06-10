Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A11546AE1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:50:59 +0200 (CEST)
Received: from localhost ([::1]:46540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhqc-0005Z0-6k
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhBN-0008Uw-Q2
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:22 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:55028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhB7-0007Ih-3h
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:21 -0400
Received: by mail-wm1-x333.google.com with SMTP id n185so14102505wmn.4
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7uLUkIKv9rA0htRASzFEYEP1w+WXslMGtSO7U8RJ4TM=;
 b=IiZUgmkXSjwTDFhf30NPvv+rvdwtj/QGiQwAWlvcgXTNeS3xDKHf+SvwxQ19DLfdnG
 /lvskCCpUy/P87Ou51cl0hpYvG/0GHhBRvv9OABvQM+q1YCgWupT/64Hz2847m9tuCGJ
 Lk4LrZucWbqxGaeUpAWEEPPHMZwHDZwCd1VpSHANczM4UmZchXk6NdMEEgSJOYvNF7y1
 1sBUxbXdPP6MxAFTs8CIinEfvL9zO/l4nUT0eFbTlnyAG14DeVpQsEZG1whsHm/GUt4y
 AWSzm7kMSsNRsdAzXMuB1E+ZG0bXbeuxb5P1aSDje87HXH4rOlVU4zDPTD1YwAXFxkon
 6vxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7uLUkIKv9rA0htRASzFEYEP1w+WXslMGtSO7U8RJ4TM=;
 b=Qas3+L2OIt5haX8yotLnQAVO15QL7JM5hhmb0uBs5HZgfZFWmok9mnlSO+Uq9SkhIK
 +iGAQzI+84ZqA1K6UDgZiio3tHEGejIVRAKDf4CYpGFzwbIbnSKnTnQQp1e9IWhqjt8t
 Yr82kiOMoJxJFfdMi6taODWm6QYTre15WQS1zndr5o1eiEeNo2P2cxPBYOn+jsKm0x7u
 9Q8DzlBeCsMFJZpw7CdsrsWYvqyrHaMKmffqNKKW3W+rdVPikzx3TbpzNmJK+W+ZGNcu
 xR7wM8S+px0iYS3m2dfKBCx/p8P4qIjdzGk7SyVAeRU5JWglkv6GQAw19I/eeb/3l4Qb
 Oyeg==
X-Gm-Message-State: AOAM533pxoQzY0ra2ECBKZXO6Q/XxezpTc2NjExzLmywntzQBz7jKIWd
 3FywDNX7wrdaiHEEzrl28DvWAIWzFShuzw==
X-Google-Smtp-Source: ABdhPJwI3Zkb3OFiv0LrKmveqVrrDFBTkEbnpR6XlBrHnuLMjCXRCYwF+SCrQCfVKCCkxVxzFiZCEA==
X-Received: by 2002:a7b:c392:0:b0:39c:4d27:e698 with SMTP id
 s18-20020a7bc392000000b0039c4d27e698mr468566wmj.57.1654877283669; 
 Fri, 10 Jun 2022 09:08:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.08.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:08:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/28] gdbstub: Don't use GDB syscalls if no GDB is attached
Date: Fri, 10 Jun 2022 17:07:37 +0100
Message-Id: <20220610160738.2230762-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20220526190053.521505-2-peter.maydell@linaro.org
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


