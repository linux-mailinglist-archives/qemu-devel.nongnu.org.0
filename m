Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 113254927D8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 14:55:51 +0100 (CET)
Received: from localhost ([::1]:50188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9oxi-0006fW-5U
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 08:55:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9nby-0004oo-6u; Tue, 18 Jan 2022 07:29:18 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:41033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9nbm-0001wV-Ml; Tue, 18 Jan 2022 07:29:17 -0500
Received: from quad ([82.142.13.186]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mcpz0-1mZuYX0CQ6-00a107; Tue, 18
 Jan 2022 13:28:55 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 8/9] linux-user: Return void from queue_signal()
Date: Tue, 18 Jan 2022 13:28:46 +0100
Message-Id: <20220118122847.636461-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118122847.636461-1-laurent@vivier.eu>
References: <20220118122847.636461-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QeG1eFTRE/Urk2aR/twAVOiLDrXveYNtkX83aKc3lzNNpiVafgg
 vGTzMGI9AacC43fObbFJ4wtX5zBTFgF3sfALPvye9CRBB1ohZocvr1/a/xdDreApwMWEJbx
 zb3kP11EF/tzb8iaSmernm7qfD7lGX/YNjs8JWdSli/DB3tHR05Wkoq3XgwHTQV8afRECSk
 biTHv/IuBM8VDDKZi6cSA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3LWQsXjGBMs=:eH32QqGWHM/h+loKzlHWmj
 BnqsRjyvIX3xHiEQObpSPI0uAcaOaqo7hHQR3GshWJlnbU9oVe4qbwU5Po8qzBKJAbucoD4rR
 VCm/KM1xr7xrNRNWKK/UYiQewTrZgsUB6YscM0/m2b+UNaEgKp7OEqa2/bj7sa8rYWGPvNAlI
 GnWBTFamP0DB2waLJVJIP+Xwimy/yZ3LIZZTgaPVMbn5ylPf0JJ2bheXqO0gNTCFJYoFzU2AA
 dCtxnMiYk8wVLTOKRNUcFCLAqflAh9EAYszN6ifJQnih0lPgxHCYtd2xyuFQDs6o7XTBFGm7Y
 m2T7K8XIHJMR3fUayWpoUZoZdMecdsyGIeAEOPT0KL3zKiD1GNvJ7358hzd1ks71xD9vsxd7z
 EkfLFlVKQ58zjdyguzIDmpdD0fo9VEpeSblVZne3qdq45JmGa2/5LdQG8ZGzHaYub4Rt6ywph
 1ZJSbhQp7i0T55cIMbCUXOO8Nlf2L0Qye5/shiJn75bjlhwsuXp+3SsG7SwH69eJVAdoyWu2W
 vlx9E8n4ww4Z5oUsIx4zbW4NhSxezYTgD5B+GLdmFw1Tjz3xpKIiswsfZQlNjU8P40VJASxs1
 Gd2ZbBnZ1sNM90Wz5j53dzNNWhDlsYBgwCLte+zwJtMVSvEObFcGM/Tw3WsHf9URYD/DDtOza
 t4GsL5r9TwT1FlkS15I6MrZU2xolR/d6Gy61fFamxyKtwWsVEv4TxZFwkZ2j/mc0tWF4=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The linux-user queue_signal() function always returns 1, and none of
its callers check the return value.  Give it a void return type
instead.

The return value is a leftover from the old pre-2016 linux-user
signal handling code, which really did have a queue of signals and so
might return a failure indication if too many signals were queued at
once.  The current design avoids having to ever have more than one
signal queued via queue_signal() at once, so it can never fail.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220114153732.3767229-4-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/signal-common.h | 4 ++--
 linux-user/signal.c        | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index 42aa479080b8..2113165a7583 100644
--- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -59,8 +59,8 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
 void process_pending_signals(CPUArchState *cpu_env);
 void signal_init(void);
-int queue_signal(CPUArchState *env, int sig, int si_type,
-                 target_siginfo_t *info);
+void queue_signal(CPUArchState *env, int sig, int si_type,
+                  target_siginfo_t *info);
 void host_to_target_siginfo(target_siginfo_t *tinfo, const siginfo_t *info);
 void target_to_host_siginfo(siginfo_t *info, const target_siginfo_t *tinfo);
 int target_to_host_signal(int sig);
diff --git a/linux-user/signal.c b/linux-user/signal.c
index bfbbeab9ad2e..32854bb3752d 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -780,8 +780,8 @@ static void QEMU_NORETURN dump_core_and_abort(int target_sig)
 
 /* queue a signal so that it will be send to the virtual CPU as soon
    as possible */
-int queue_signal(CPUArchState *env, int sig, int si_type,
-                 target_siginfo_t *info)
+void queue_signal(CPUArchState *env, int sig, int si_type,
+                  target_siginfo_t *info)
 {
     CPUState *cpu = env_cpu(env);
     TaskState *ts = cpu->opaque;
@@ -794,7 +794,6 @@ int queue_signal(CPUArchState *env, int sig, int si_type,
     ts->sync_signal.pending = sig;
     /* signal that a new signal is pending */
     qatomic_set(&ts->signal_pending, 1);
-    return 1; /* indicates that the signal was queued */
 }
 
 
-- 
2.34.1


