Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF3C69A4AB
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 05:10:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSs47-0000i5-MV; Thu, 16 Feb 2023 23:09:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSs46-0000he-9B
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:09:42 -0500
Received: from esa6.hc2706-39.iphmx.com ([216.71.137.79])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSs40-00018s-Qp
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:09:42 -0500
X-IronPort-RemoteIP: 209.85.222.198
X-IronPort-MID: 262966609
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:qTHG9q+prI+bCsK41/SfDrUDPnyTJUtcMsCJ2f8bNWPcYEJGY0x3n
 TEXDW+COqyCYjeheYgkYYy3/EkOvJbWxoRqSgo/rioxFiIbosf7XuiUfxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yI6jefQHeCU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNLg06/gEk35q+q4mpG5gdWic1j5zcyqVFEVPrzGonsdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVHmZkh+AsBOsTAbzsAG6ZvXAdJHAathZ5RlqPgqo
 DlFncTYpQ7EpcQgksxEO/VTO3gW0aGrZNYriJVw2CCe5xSuTpfi/xlhJFE5etU01c99PUVl9
 9goGTAidQGnhsvjldpXSsE07igiBMziPYdao3I5iD+AXKZgTpfETKHHo9Rf2V/chOgURaeYN
 5dfM2A1Kk2RM3WjOX9OYH46tO6sln/zaRVStRSYqbdfD237llIrgeazboKEEjCMbZVRpBjAh
 SHNxW78AxAAMtCF+wKO933504cjmgu+Aur+DoaQ7/NvnRify3IeDDUQUl20p+T/jVSxM++zM
 GQR8ysq6LExrQmlF4itGRK/p3GAs1gXXN84//AG1TxhA5H8u26xblXohBYbADD6nKfanQAX6
 2I=
IronPort-HdrOrdr: A9a23:RBC6xqhhCFxJsexz/C0ovUb+RHBQXgwji2hC6mlwRA09TyVXrb
 HLoB19726JtN91YhsdcL+7Sc+9qB/nhPxICMwqTMyftWrdyRaVxf9ZnPLfKlTbckWUh41gPO
 VbAtJD4bXLbWSS5vyKhzVQfexQpeWvweSDqd2b4U1QbTxHXYld0iYRMHflLqS0fmV77FgCea
 Z0KvAom9PZQwVuUi1zPBZlY9T+
Received: from mail-qk1-f198.google.com ([209.85.222.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 23:09:34 -0500
Received: by mail-qk1-f198.google.com with SMTP id
 s7-20020a05620a0bc700b006e08208eb31so2437862qki.3
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 20:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AJf59aTRwaYQyNp2JJrZnCn+KTG3sP5V/gP1PZsBjOU=;
 b=avHOetoyB8+ryA853ecNy4YWkDPwOz1PEo1cWH0a/CGndztIdcGFbIlPiRGiZ4iiRu
 xs8hqaVya1mEvCwtiWH8gUYUfTb8ZNs17+p5bZzVwFCBFB1XccCgF4KhSaP6dN5adH98
 KxilhiQp3Z+uCuFGTLUb+3HMHIN+Zs5srh4jxH/xSOnq3XkAyDnIBe+S8CEdF3Pub0G5
 4jKseAMaOlO8pWsutGub+grWtyxdhhLRxYfCS6WCnMnLYLphBLncVurJPs+8gGhhVZ1c
 g4PKrAgcOZlxGGzqtpf8KQWm0NExX2AtLnSN29+yJ+newXIr8d59WotqzZsNTA/4AVy/
 IXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AJf59aTRwaYQyNp2JJrZnCn+KTG3sP5V/gP1PZsBjOU=;
 b=eXO6Q141Va7cQTuR1VwL0COC9XHs+bmwGa1/ovd6/Y0+0xLTVirJQX3CcX41fGOGbh
 FxV0J4R04XrQjNkjRsiGOXwQC/ZSiyPhVPoTsOuVA+7U70pBo7kMAnTACvoSyH3fMUGe
 OzBA+ZLqxAN0EVOsELL1d2JOxI8K1sV6yDfstWsSuMjEPRHK8mb5IWLtyXNiPSiqX9uc
 OceTnxUretW4IG9/c9iu5gqHPgW21n8rt/mWILlZM34l5+2WnOXo6Kjf9pA794t3qLkp
 Hb45vgNU0lW0KRIbCl7Dnm2voSLnj471NrRfCwwktbRche2rbEr6gmY332PCBarMhQ9k
 pr6Q==
X-Gm-Message-State: AO0yUKWB/L6RdLIDIMv5zQd03WWdiQWJadedy2F1Lgrtzr5QoqsjXovY
 2A5fG3G1/J8pwWJVEuxsO7NshfBLtN5d97eHH7H9YzPtzu9/shuIJ3/HpiKL9xpKjqQudoZV+zv
 RzOsz384zzfzMTUbEfQc/HRrp8atoQAcGVNXhdg==
X-Received: by 2002:ac8:5b86:0:b0:3b8:4144:fe72 with SMTP id
 a6-20020ac85b86000000b003b84144fe72mr14621897qta.9.1676606973455; 
 Thu, 16 Feb 2023 20:09:33 -0800 (PST)
X-Google-Smtp-Source: AK7set+syyyF+H7sW+/pZjrDIGgRCelF6QKyudOA2LdItno0YE7bqLp/cZe0DASMyFC52OEI6+MQ+w==
X-Received: by 2002:ac8:5b86:0:b0:3b8:4144:fe72 with SMTP id
 a6-20020ac85b86000000b003b84144fe72mr14621866qta.9.1676606973116; 
 Thu, 16 Feb 2023 20:09:33 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 r17-20020ac85211000000b003a5c6ad428asm2418067qtn.92.2023.02.16.20.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 20:09:32 -0800 (PST)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PULL 03/10] fuzz/generic-fuzz: use reboots instead of forks to reset
 state
Date: Thu, 16 Feb 2023 23:08:48 -0500
Message-Id: <20230217040855.16873-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230217040855.16873-1-alxndr@bu.edu>
References: <20230217040855.16873-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.79; envelope-from=alxndr@bu.edu;
 helo=esa6.hc2706-39.iphmx.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.649, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 tests/qtest/fuzz/generic_fuzz.c | 114 ++++++--------------------------
 1 file changed, 22 insertions(+), 92 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 7326f6840b..f4acfa45cc 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -18,7 +18,6 @@
 #include "tests/qtest/libqtest.h"
 #include "tests/qtest/libqos/pci-pc.h"
 #include "fuzz.h"
-#include "fork_fuzz.h"
 #include "string.h"
 #include "exec/memory.h"
 #include "exec/ramblock.h"
@@ -29,6 +28,8 @@
 #include "generic_fuzz_configs.h"
 #include "hw/mem/sparse-mem.h"
 
+static void pci_enum(gpointer pcidev, gpointer bus);
+
 /*
  * SEPARATOR is used to separate "operations" in the fuzz input
  */
@@ -47,7 +48,6 @@ enum cmds {
     OP_CLOCK_STEP,
 };
 
-#define DEFAULT_TIMEOUT_US 100000
 #define USEC_IN_SEC 1000000000
 
 #define MAX_DMA_FILL_SIZE 0x10000
@@ -60,8 +60,6 @@ typedef struct {
     ram_addr_t size; /* The number of bytes until the end of the I/O region */
 } address_range;
 
-static useconds_t timeout = DEFAULT_TIMEOUT_US;
-
 static bool qtest_log_enabled;
 
 MemoryRegion *sparse_mem_mr;
@@ -589,30 +587,6 @@ static void op_disable_pci(QTestState *s, const unsigned char *data, size_t len)
     pci_disabled = true;
 }
 
-static void handle_timeout(int sig)
-{
-    if (qtest_log_enabled) {
-        fprintf(stderr, "[Timeout]\n");
-        fflush(stderr);
-    }
-
-    /*
-     * If there is a crash, libfuzzer/ASAN forks a child to run an
-     * "llvm-symbolizer" process for printing out a pretty stacktrace. It
-     * communicates with this child using a pipe.  If we timeout+Exit, while
-     * libfuzzer is still communicating with the llvm-symbolizer child, we will
-     * be left with an orphan llvm-symbolizer process. Sometimes, this appears
-     * to lead to a deadlock in the forkserver. Use waitpid to check if there
-     * are any waitable children. If so, exit out of the signal-handler, and
-     * let libfuzzer finish communicating with the child, and exit, on its own.
-     */
-    if (waitpid(-1, NULL, WNOHANG) == 0) {
-        return;
-    }
-
-    _Exit(0);
-}
-
 /*
  * Here, we interpret random bytes from the fuzzer, as a sequence of commands.
  * Some commands can be variable-width, so we use a separator, SEPARATOR, to
@@ -669,64 +643,32 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
     size_t cmd_len;
     uint8_t op;
 
-    if (fork() == 0) {
-        struct sigaction sact;
-        struct itimerval timer;
-        sigset_t set;
-        /*
-         * Sometimes the fuzzer will find inputs that take quite a long time to
-         * process. Often times, these inputs do not result in new coverage.
-         * Even if these inputs might be interesting, they can slow down the
-         * fuzzer, overall. Set a timeout for each command to avoid hurting
-         * performance, too much
-         */
-        if (timeout) {
-
-            sigemptyset(&sact.sa_mask);
-            sact.sa_flags   = SA_NODEFER;
-            sact.sa_handler = handle_timeout;
-            sigaction(SIGALRM, &sact, NULL);
+    op_clear_dma_patterns(s, NULL, 0);
+    pci_disabled = false;
 
-            sigemptyset(&set);
-            sigaddset(&set, SIGALRM);
-            pthread_sigmask(SIG_UNBLOCK, &set, NULL);
-
-            memset(&timer, 0, sizeof(timer));
-            timer.it_value.tv_sec = timeout / USEC_IN_SEC;
-            timer.it_value.tv_usec = timeout % USEC_IN_SEC;
-        }
-
-        op_clear_dma_patterns(s, NULL, 0);
-        pci_disabled = false;
-
-        while (cmd && Size) {
-            /* Reset the timeout, each time we run a new command */
-            if (timeout) {
-                setitimer(ITIMER_REAL, &timer, NULL);
-            }
+    QPCIBus *pcibus = qpci_new_pc(s, NULL);
+    g_ptr_array_foreach(fuzzable_pci_devices, pci_enum, pcibus);
+    qpci_free_pc(pcibus);
 
-            /* Get the length until the next command or end of input */
-            nextcmd = memmem(cmd, Size, SEPARATOR, strlen(SEPARATOR));
-            cmd_len = nextcmd ? nextcmd - cmd : Size;
+    while (cmd && Size) {
+        /* Get the length until the next command or end of input */
+        nextcmd = memmem(cmd, Size, SEPARATOR, strlen(SEPARATOR));
+        cmd_len = nextcmd ? nextcmd - cmd : Size;
 
-            if (cmd_len > 0) {
-                /* Interpret the first byte of the command as an opcode */
-                op = *cmd % (sizeof(ops) / sizeof((ops)[0]));
-                ops[op](s, cmd + 1, cmd_len - 1);
+        if (cmd_len > 0) {
+            /* Interpret the first byte of the command as an opcode */
+            op = *cmd % (sizeof(ops) / sizeof((ops)[0]));
+            ops[op](s, cmd + 1, cmd_len - 1);
 
-                /* Run the main loop */
-                flush_events(s);
-            }
-            /* Advance to the next command */
-            cmd = nextcmd ? nextcmd + sizeof(SEPARATOR) - 1 : nextcmd;
-            Size = Size - (cmd_len + sizeof(SEPARATOR) - 1);
-            g_array_set_size(dma_regions, 0);
+            /* Run the main loop */
+            flush_events(s);
         }
-        _Exit(0);
-    } else {
-        flush_events(s);
-        wait(0);
+        /* Advance to the next command */
+        cmd = nextcmd ? nextcmd + sizeof(SEPARATOR) - 1 : nextcmd;
+        Size = Size - (cmd_len + sizeof(SEPARATOR) - 1);
+        g_array_set_size(dma_regions, 0);
     }
+    fuzz_reset(s);
 }
 
 static void usage(void)
@@ -738,8 +680,6 @@ static void usage(void)
     printf("Optionally: QEMU_AVOID_DOUBLE_FETCH= "
             "Try to avoid racy DMA double fetch bugs? %d by default\n",
             avoid_double_fetches);
-    printf("Optionally: QEMU_FUZZ_TIMEOUT= Specify a custom timeout (us). "
-            "0 to disable. %d by default\n", timeout);
     exit(0);
 }
 
@@ -825,7 +765,6 @@ static void generic_pre_fuzz(QTestState *s)
 {
     GHashTableIter iter;
     MemoryRegion *mr;
-    QPCIBus *pcibus;
     char **result;
     GString *name_pattern;
 
@@ -838,9 +777,6 @@ static void generic_pre_fuzz(QTestState *s)
     if (getenv("QEMU_AVOID_DOUBLE_FETCH")) {
         avoid_double_fetches = 1;
     }
-    if (getenv("QEMU_FUZZ_TIMEOUT")) {
-        timeout = g_ascii_strtoll(getenv("QEMU_FUZZ_TIMEOUT"), NULL, 0);
-    }
     qts_global = s;
 
     /*
@@ -883,12 +819,6 @@ static void generic_pre_fuzz(QTestState *s)
         printf("No fuzzable memory regions found...\n");
         exit(1);
     }
-
-    pcibus = qpci_new_pc(s, NULL);
-    g_ptr_array_foreach(fuzzable_pci_devices, pci_enum, pcibus);
-    qpci_free_pc(pcibus);
-
-    counter_shm_init();
 }
 
 /*
-- 
2.39.0


