Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6F168AE49
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 05:31:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOWfT-0007Ae-AB; Sat, 04 Feb 2023 23:30:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWfP-0007AB-SV
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:30:16 -0500
Received: from esa16.hc2706-39.iphmx.com ([216.71.140.205])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWfN-0006AD-Qx
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:30:15 -0500
X-IronPort-RemoteIP: 209.85.222.200
X-IronPort-MID: 254597924
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:bCAJl6ghnRTMM6437Y+Po7HVX1613hIKZh0ujC45NGQN5FlHY01je
 htvDD2GO6mIYzanfIp/bNiyoE0Au5DQzocyTARrri49F34W8JqUDtmndXv9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5ARiPasjUGL2zBH5MrpOfcldEFOlGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiM+t5qK23CulQRrukoPD8fwXG8M49m/c3Gd/
 /0W3XC4YV9B0qQhA43xWTEBe811FfQuFLMqvRFTGCFcpqHLWyKE/hlgMK05FakjquE0OW5uz
 /0JGjUJVA2mqdzm/63uH4GAhux7RCXqFIYWu3Ul1DKASPh8GciFTKLN6ttVmjw3g6iiH96EP
 5tfOWcpNk6aJUcXYj/7C7pn9AusrnD7YztUsnqfuOw673W7IAlZiuWxbYuKK4bWLSlTthig+
 k/G8FnlOBclb+SA0xq9/3PrjeCayEsXX6pXTtVU7MVCmVCW2ykfBQMbUXO9pv+2jFP4XMhQQ
 3H44QIrpKk2sVWoF5zzBUXg5nGDuREYVpxbFOhSBByx95c4Kj2xXgAsJgOtovR83CPqbVTGD
 mO0ou4=
IronPort-HdrOrdr: A9a23:gTHsK6wxFNTrijTU/99JKrPwH71zdoMgy1knxilNoSQ/SL39qy
 nOpoV46faQsl16ZJhOo7290da7MArhHPJOjbX5Xo3SPzUO2lHIEGgK1+KL/9SHIULDH4VmtZ
 uIHZIRNDXWZmIK6PoT22KDYrEdKODtytHPuQ7W9QYUcT1X
Received: from mail-qk1-f200.google.com ([209.85.222.200])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Feb 2023 23:30:11 -0500
Received: by mail-qk1-f200.google.com with SMTP id
 x14-20020a05620a14ae00b0072f7f0f356bso3129186qkj.1
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 20:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=diRwlVaNECrZ3ogUCDIfbNPgA3QWNyNv4puQy3QkAqQ=;
 b=Nk/+rLzrRKl4yPusZ8XGlJtATtnLyFGSDY0eKPsLcgrnnRkDtWXPaTXmsACOPQLiSA
 WDoUjs7B2ZXH4iMGsxz3X1nUUawx+8/rUySd/KgBW/xoZAoeJGqkshuhjndKZmQ1oGUQ
 RIJJFMa3zedj+n21SntfrXnIe6O2pkIMf39ubKSAmAsrc9Ektchk60GXk32ChMsrthGW
 GccH9eYmObxbDbIO5dkADxHnoCxP5gAubAtH/BxVwHvP2Ch6uNx2W92HmqNs47z89IZN
 yCp5WYq2uRzehnvVvgofr8Ngpz6lFZHkFCTQVxGI4ZpblYNe4fccTo+Q9vSGteDIvypk
 BdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=diRwlVaNECrZ3ogUCDIfbNPgA3QWNyNv4puQy3QkAqQ=;
 b=W5qS8FBU5ZfPJ7lTzBbTKpU6iaEUEy4bXS8PqsQ53uNS25+mNwDHgGgWHql/qUxn2V
 hPcAM2rKfLABy3xAMSE64srvGCMP+ScWuWSLwblozyvujbR4swUoEWmva/6W/2U3OCgh
 XQ8iYmsoCEzYFs1ksaDQ2apAtmKI9/OJdSqVbsEkdQfii3vknCKLs8r06dbhhYfIEpG+
 q12hyKseiCNU7IEB89L6zMVXc+QSAhFaWvcFmmCKcvfwJJVw43z5suv/hQTShR3Wf791
 AEpc0LBCOPSGTuC23SbLMBhEDoX9GpM9t217fxqwIiyBMy6j3LvTbFgqwOMshJnpVsZG
 qzrQ==
X-Gm-Message-State: AO0yUKULjnApF3GJAKJ9Lvl6cG3WOYDcr8Ei4lEEo+mL8HV0huKvfahf
 p3WKbc3kPaxMruB1E7SngPECK2O6a96ftXDmQ51tR/72ztYNVfIUzoOfo8ofFIZzhb/sYiQc0Oa
 SQ+TW5kLP8OT9Q9kzbAckjYtvm6v3XA==
X-Received: by 2002:a05:622a:84:b0:3b9:bf43:fccd with SMTP id
 o4-20020a05622a008400b003b9bf43fccdmr26390542qtw.10.1675571410844; 
 Sat, 04 Feb 2023 20:30:10 -0800 (PST)
X-Google-Smtp-Source: AK7set/9Rokrn7zhVygko/bnIMnIb3Pb1dKyvo7/nXMFrcLxv/VILYHdhAJ3/78bqSsQkFHjqHKkjQ==
X-Received: by 2002:a05:622a:84:b0:3b9:bf43:fccd with SMTP id
 o4-20020a05622a008400b003b9bf43fccdmr26390517qtw.10.1675571410531; 
 Sat, 04 Feb 2023 20:30:10 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a37af04000000b0072ddf70791fsm4922943qke.122.2023.02.04.20.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 20:30:10 -0800 (PST)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 03/10] fuzz/generic-fuzz: use reboots instead of forks to
 reset state
Date: Sat,  4 Feb 2023 23:29:44 -0500
Message-Id: <20230205042951.3570008-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230205042951.3570008-1-alxndr@bu.edu>
References: <20230205042951.3570008-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.205; envelope-from=alxndr@bu.edu;
 helo=esa16.hc2706-39.iphmx.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
---
 tests/qtest/fuzz/generic_fuzz.c | 106 +++++++-------------------------
 1 file changed, 23 insertions(+), 83 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 7326f6840b..c2e5642150 100644
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
@@ -589,30 +590,6 @@ static void op_disable_pci(QTestState *s, const unsigned char *data, size_t len)
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
@@ -669,64 +646,34 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
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
-
-            sigemptyset(&set);
-            sigaddset(&set, SIGALRM);
-            pthread_sigmask(SIG_UNBLOCK, &set, NULL);
-
-            memset(&timer, 0, sizeof(timer));
-            timer.it_value.tv_sec = timeout / USEC_IN_SEC;
-            timer.it_value.tv_usec = timeout % USEC_IN_SEC;
-        }
+    op_clear_dma_patterns(s, NULL, 0);
+    pci_disabled = false;
 
-        op_clear_dma_patterns(s, NULL, 0);
-        pci_disabled = false;
+    QPCIBus *pcibus = qpci_new_pc(s, NULL);
+    g_ptr_array_foreach(fuzzable_pci_devices, pci_enum, pcibus);
+    qpci_free_pc(pcibus);
 
-        while (cmd && Size) {
-            /* Reset the timeout, each time we run a new command */
-            if (timeout) {
-                setitimer(ITIMER_REAL, &timer, NULL);
-            }
+    while (cmd && Size) {
+        /* Reset the timeout, each time we run a new command */
 
-            /* Get the length until the next command or end of input */
-            nextcmd = memmem(cmd, Size, SEPARATOR, strlen(SEPARATOR));
-            cmd_len = nextcmd ? nextcmd - cmd : Size;
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
+    fuzz_reboot(s);
 }
 
 static void usage(void)
@@ -825,7 +772,6 @@ static void generic_pre_fuzz(QTestState *s)
 {
     GHashTableIter iter;
     MemoryRegion *mr;
-    QPCIBus *pcibus;
     char **result;
     GString *name_pattern;
 
@@ -883,12 +829,6 @@ static void generic_pre_fuzz(QTestState *s)
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


