Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD3A5EDB6C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 13:12:27 +0200 (CEST)
Received: from localhost ([::1]:40672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odUzI-0005dW-Rf
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 07:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEN-0008FL-KM
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:53 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:45261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEH-0008H3-3M
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:46 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MORR2-1osOso241W-00PvRM; Wed, 28
 Sep 2022 10:15:36 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 35/38] linux-user: Update print_futex_op
Date: Wed, 28 Sep 2022 10:15:14 +0200
Message-Id: <20220928081517.734954-36-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:L9lncU1G2iarxIbxOUr1tjTNU6d9JPQrW1TgMl2h/nO2Po/+4R5
 vcvnvohdPQOIjTCHbPe6XbOaUBl4KZU841E0ck3Y1ezVfewZldZXaDRGPdQHaFOXJxFxw/z
 vV0i3bWwc+tYnkHKhhq2Y64o7+qPAnoZbWvMB7r6vOpsDGuSgqHupIfiemjTmXLS6mHpUv5
 0GVmNlhJEbXb7XLQVfV0g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:a5EujZJU9Ws=:GX7+Fxr4zYZZxJ9GLOMtEE
 G6rh5BnhaD7FPkckraNPegdeanQnvGe5inOJ4p5e72yA4kvNawIgcE1OplFJlMSXcdLm+vS2T
 XORjdc27WLxmHgVUk83IQR6Bt3rXNtA8nO9NLp3gV+5YJHhKNhI1KpwJogMIuTM7OoWe7ShPG
 uuYfLerOnohxruJMT6StHlRry/89LWPhguNxKUlou70N44NaPoYMb5OFF0c1930p0vXOiR7ie
 8k/C7SbbXbikDr1NTGcmAcM8p9TFKBS1+KPgIWOHyBxA4Rv6MqiFHG9cJPJ0CknspjyKOUIam
 QE6xhYKOAR5noj1SQxQ+dkpukn8rd1eeSeyxbeVm9evXBRfa8dfie0odHyeT9Npsrzvpz2Ecm
 LXXG2uQm9pHTSZf8kFN/K7KnRAKuIifKWTRMNjFrekefELdJTW0I2gBjdh/+cAGRAqnKotDvw
 8UA39JgWWik2Uz0uif9C31j2jYMU9c3Ff9HNxGgAauhc6DIHvH4eqGVqm1KGyjcdgOAH9yXmK
 zZxLEuv35PajYzEwtaMq5m+R9u3pGCf9AeuW/YQw3JqPPMJJ2wfkP1zC/CHtLYHbo2v0UEvji
 HE7iwwnYE1cHbvDRpO65SZxKnYjFH2IzkLCV4Hzpj5SwGpACOizGS7ZkOqqfCRxpzSeYFQ8sR
 t5N1qiO9m0ZLISGIJtxB/ofiLNKBfaTw5YYMKfxQJMX34tkD8VjgypRKbQH2RsdfYjy20VHsD
 xnWnGYa37JEiL1z3A1dCur0erj45+me+tqAokvv0OiPGY5Umi0+0JHG9WsCl90THFlwLPejVu
 ckLMS9l
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Use a table for the names; print unknown values in hex,
since the value contains flags.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220829021006.67305-7-richard.henderson@linaro.org>
[lv: update print_futex() according to
"linux-user: Show timespec on strace for futex()"]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c | 70 +++++++++++++++++++++------------------------
 1 file changed, 33 insertions(+), 37 deletions(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 2deb84a2c106..faa733125624 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3710,44 +3710,37 @@ print_munmap(CPUArchState *cpu_env, const struct syscallname *name,
 #endif
 
 #ifdef TARGET_NR_futex
-static void print_futex_op(abi_long tflag, int last)
-{
-#define print_op(val) \
-if( cmd == val ) { \
-    qemu_log(#val); \
-    return; \
-}
-
-    int cmd = (int)tflag;
-#ifdef FUTEX_PRIVATE_FLAG
-    if (cmd & FUTEX_PRIVATE_FLAG) {
-        qemu_log("FUTEX_PRIVATE_FLAG|");
-        cmd &= ~FUTEX_PRIVATE_FLAG;
-    }
-#endif
-#ifdef FUTEX_CLOCK_REALTIME
-    if (cmd & FUTEX_CLOCK_REALTIME) {
-        qemu_log("FUTEX_CLOCK_REALTIME|");
-        cmd &= ~FUTEX_CLOCK_REALTIME;
+static void print_futex_op(int cmd, int last)
+{
+    static const char * const futex_names[] = {
+#define NAME(X)  [X] = #X
+        NAME(FUTEX_WAIT),
+        NAME(FUTEX_WAKE),
+        NAME(FUTEX_FD),
+        NAME(FUTEX_REQUEUE),
+        NAME(FUTEX_CMP_REQUEUE),
+        NAME(FUTEX_WAKE_OP),
+        NAME(FUTEX_LOCK_PI),
+        NAME(FUTEX_UNLOCK_PI),
+        NAME(FUTEX_TRYLOCK_PI),
+        NAME(FUTEX_WAIT_BITSET),
+        NAME(FUTEX_WAKE_BITSET),
+        NAME(FUTEX_WAIT_REQUEUE_PI),
+        NAME(FUTEX_CMP_REQUEUE_PI),
+        NAME(FUTEX_LOCK_PI2),
+#undef NAME
+    };
+
+    unsigned base_cmd = cmd & FUTEX_CMD_MASK;
+
+    if (base_cmd < ARRAY_SIZE(futex_names)) {
+        qemu_log("%s%s%s",
+                 (cmd & FUTEX_PRIVATE_FLAG ? "FUTEX_PRIVATE_FLAG|" : ""),
+                 (cmd & FUTEX_CLOCK_REALTIME ? "FUTEX_CLOCK_REALTIME|" : ""),
+                 futex_names[base_cmd]);
+    } else {
+        qemu_log("0x%x", cmd);
     }
-#endif
-    print_op(FUTEX_WAIT)
-    print_op(FUTEX_WAKE)
-    print_op(FUTEX_FD)
-    print_op(FUTEX_REQUEUE)
-    print_op(FUTEX_CMP_REQUEUE)
-    print_op(FUTEX_WAKE_OP)
-    print_op(FUTEX_LOCK_PI)
-    print_op(FUTEX_UNLOCK_PI)
-    print_op(FUTEX_TRYLOCK_PI)
-#ifdef FUTEX_WAIT_BITSET
-    print_op(FUTEX_WAIT_BITSET)
-#endif
-#ifdef FUTEX_WAKE_BITSET
-    print_op(FUTEX_WAKE_BITSET)
-#endif
-    /* unknown values */
-    qemu_log("%d", cmd);
 }
 
 static void
@@ -3763,6 +3756,9 @@ print_futex(CPUArchState *cpu_env, const struct syscallname *name,
     switch (op) {
         case FUTEX_WAIT:
         case FUTEX_WAIT_BITSET:
+        case FUTEX_LOCK_PI:
+        case FUTEX_LOCK_PI2:
+        case FUTEX_WAIT_REQUEUE_PI:
             print_timespec(arg3, 0);
             break;
         default:
-- 
2.37.3


