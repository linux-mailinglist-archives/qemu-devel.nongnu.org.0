Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE579C667
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 00:19:13 +0200 (CEST)
Received: from localhost ([::1]:48458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i20qu-0005TC-GS
	for lists+qemu-devel@lfdr.de; Sun, 25 Aug 2019 18:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34640)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jcmvbkbc@gmail.com>) id 1i20pF-0004NJ-14
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 18:17:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jcmvbkbc@gmail.com>) id 1i20pD-0001eq-Tp
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 18:17:28 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:44006)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jcmvbkbc@gmail.com>) id 1i20pD-0001eH-Mg
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 18:17:27 -0400
Received: by mail-lj1-x243.google.com with SMTP id h15so13291630ljg.10
 for <qemu-devel@nongnu.org>; Sun, 25 Aug 2019 15:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=6lA3hPr2R4EBn3/9r1jJn8cuWecKfMUqM2sscEv6POs=;
 b=igaK8eg2dTtOVggq56RKFZfc8T4mg74GPSOvo6WCBUvj6/t1GELAjaYtH5bpZJb//G
 mJP3aWiE4hQ37IjiFUZ/ow2tfAyMFY6G3wEFJMiyBRNNr54zZGkxO2zvkjPSD9a47OmU
 ESFYGy7bVhsPJdkWRonxSZCH9ua0xbpux4dIKd4Ov61ggn+YUaujiamzvpj51pd+0Mwl
 Tbnfk5jvedc33o0eyRBu/mNk8OGUluok+zlJi+gNOAp98AKKaeK5uI2KvCifsg/Bb7Yk
 6LKMU1ou8xzMnWjHJ3uB6ZOIvkkqTecOa9bWRywjC4ET1rVXKa2zdOH3AnvCplw8TXZn
 jQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6lA3hPr2R4EBn3/9r1jJn8cuWecKfMUqM2sscEv6POs=;
 b=L108c7xOyORLJBlx+aNrZGLJyNe9tj1PDBFG6KzCHJyjhvR9Ix5gH/Pa7feFTQYIg4
 fhbSg810TzhKWVtlrJYzi7Wh1yzcTqrd8rFR+56XGsB1u7Mz02faPiQFWREOfB+amPRa
 S/+egFTtb9rntJCq5JiaMJDi4ILRsdd94Pjoc/xHeYR9qIGS0u6EmlTEV9jKiMVNtiVX
 GmydL4/Ek5nZVAXxDSM3c/jbtRe8YfIRtrOqVlGb3nqcXOBFSM9B4B4+ioq/fvQSw9MK
 Ug7wCNnSn22ibBbyFYzcEe9728Wvc/Aus6ygFnWakZoVgEHQJxERtSaem3Yfv8tL492F
 JG7Q==
X-Gm-Message-State: APjAAAW1bfCME5NW9msKgg6pVvvZzomQRWvnWYomcI7wXc7RURtKr7Fw
 d7gH61WAJyDVt9x1qJ7sd5PUmx4U
X-Google-Smtp-Source: APXvYqzLghVC0mt0z4apVzNMza9+DRGDJKyvC7DYiPtx3zcvJBjzO+eqe3uxvMKMaPugQZPcHUpexw==
X-Received: by 2002:a2e:993:: with SMTP id 141mr8811878ljj.15.1566771444922;
 Sun, 25 Aug 2019 15:17:24 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net.
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id w15sm1726397ljh.29.2019.08.25.15.17.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Aug 2019 15:17:23 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 25 Aug 2019 15:17:04 -0700
Message-Id: <20190825221704.1574-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: [Qemu-devel] [PATCH] target/xtensa: linux-user: add call0 ABI
 support
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
Cc: Max Filippov <jcmvbkbc@gmail.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Xtensa binaries built for call0 ABI don't rotate register window on
function calls and returns. Invocation of signal handlers from the
kernel is therefore different in windowed and call0 ABIs.
There's currently no way to determine xtensa ELF binary ABI from the
binary itself. Provide an environment variable QEMU_XTENSA_ABI_CALL0 and
use it to initialize PS.WOE in xtensa_cpu_reset. Check this flag in
setup_rt_frame to determine how a signal should be delivered.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 linux-user/xtensa/signal.c | 25 +++++++++++++++++--------
 target/xtensa/cpu.c        | 22 ++++++++++++++++++----
 2 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/linux-user/xtensa/signal.c b/linux-user/xtensa/signal.c
index 8d54ef3ae34b..590f0313ffe9 100644
--- a/linux-user/xtensa/signal.c
+++ b/linux-user/xtensa/signal.c
@@ -134,6 +134,8 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     abi_ulong frame_addr;
     struct target_rt_sigframe *frame;
     uint32_t ra;
+    bool abi_call0;
+    unsigned base;
     int i;
 
     frame_addr = get_sigframe(ka, env, sizeof(*frame));
@@ -182,20 +184,27 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
         __put_user(0x00, &frame->retcode[5]);
 #endif
     }
-    env->sregs[PS] = PS_UM | (3 << PS_RING_SHIFT);
-    if (xtensa_option_enabled(env->config, XTENSA_OPTION_WINDOWED_REGISTER)) {
-        env->sregs[PS] |= PS_WOE | (1 << PS_CALLINC_SHIFT);
-    }
     memset(env->regs, 0, sizeof(env->regs));
     env->pc = ka->_sa_handler;
     env->regs[1] = frame_addr;
     env->sregs[WINDOW_BASE] = 0;
     env->sregs[WINDOW_START] = 1;
 
-    env->regs[4] = (ra & 0x3fffffff) | 0x40000000;
-    env->regs[6] = sig;
-    env->regs[7] = frame_addr + offsetof(struct target_rt_sigframe, info);
-    env->regs[8] = frame_addr + offsetof(struct target_rt_sigframe, uc);
+    abi_call0 = (env->sregs[PS] & PS_WOE) == 0;
+    env->sregs[PS] = PS_UM | (3 << PS_RING_SHIFT);
+
+    if (abi_call0) {
+        base = 0;
+        env->regs[base] = ra;
+    } else {
+        env->sregs[PS] |= PS_WOE | (1 << PS_CALLINC_SHIFT);
+        base = 4;
+        env->regs[base] = (ra & 0x3fffffff) | 0x40000000;
+    }
+    env->regs[base + 2] = sig;
+    env->regs[base + 3] = frame_addr + offsetof(struct target_rt_sigframe,
+                                                info);
+    env->regs[base + 4] = frame_addr + offsetof(struct target_rt_sigframe, uc);
     unlock_user_struct(frame, frame_addr, 1);
     return;
 
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 76db1741a796..791c061880e7 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -53,6 +53,18 @@ static bool xtensa_cpu_has_work(CPUState *cs)
 #endif
 }
 
+#ifdef CONFIG_USER_ONLY
+static int xtensa_abi_call0(void)
+{
+    static int abi_call0 = -1;
+
+    if (abi_call0 == -1) {
+        abi_call0 = getenv("QEMU_XTENSA_ABI_CALL0") != NULL;
+    }
+    return abi_call0;
+}
+#endif
+
 /* CPUClass::reset() */
 static void xtensa_cpu_reset(CPUState *s)
 {
@@ -70,10 +82,12 @@ static void xtensa_cpu_reset(CPUState *s)
             XTENSA_OPTION_INTERRUPT) ? 0x1f : 0x10;
     env->pending_irq_level = 0;
 #else
-    env->sregs[PS] =
-        (xtensa_option_enabled(env->config,
-                               XTENSA_OPTION_WINDOWED_REGISTER) ? PS_WOE : 0) |
-        PS_UM | (3 << PS_RING_SHIFT);
+    env->sregs[PS] = PS_UM | (3 << PS_RING_SHIFT);
+    if (xtensa_option_enabled(env->config,
+                              XTENSA_OPTION_WINDOWED_REGISTER) &&
+        !xtensa_abi_call0()) {
+        env->sregs[PS] |= PS_WOE;
+    }
 #endif
     env->sregs[VECBASE] = env->config->vecbase;
     env->sregs[IBREAKENABLE] = 0;
-- 
2.11.0


