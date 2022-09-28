Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 947575EE7D5
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 23:07:29 +0200 (CEST)
Received: from localhost ([::1]:59442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odeH9-0001as-Nq
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 17:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf6-0000hr-F6
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:08 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:49501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf4-0006YX-Lq
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:08 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Myb09-1pRLb72Mpx-00ywzv; Wed, 28
 Sep 2022 22:28:04 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 35/37] linux-user: Update print_futex_op
Date: Wed, 28 Sep 2022 22:27:35 +0200
Message-Id: <20220928202737.793171-36-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lIb77sB6JdUnv2GeVFDsdSEuAi4q+peZJJB3PjBOjCo6tQOking
 fXMbsdE7jYteSMdCkW44ykwNVcu0o5dQPP2llLR31S6gFLP965jUar7plfVETNGE6NvGmc2
 sjLpFwGxHhG9kup301xVNX5uoyZ30fnzp4Lojsv57ff98JNPz3sJlGkRyK9QocC5hig37CL
 dvwOWJ7fxrA1I0hfBHHeg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aqWYxsrcghQ=:a+GUDRSuQqGT+zbg/i+Bto
 61QxKjGeA1aACl+wMpqyt5cpkWtcgyXLlYouSbzZ/imClwsFP34P7kwVN2AwmOeld8B8R2pbg
 bUupwKq3o/IDPnbNKb8SEF+a3kMn+SfMNGK9RVcjP1gi05UGkm0q/IISB//JZsUEjWh69VX+4
 VqghXp8rroXwCuSq1pPTTMrYGXM+CImljAahA4RaMGfwg+kXlwwhQJeAEGA86QfuGETZq8upS
 jEgNYKcDU2FmlmWnjH/trs9I8kiL/y7oEIm3ohtyzsRmKx4F8L00VbMXAdb4KLx4+TU5KNUff
 1wCCYGDupKQuXZwlIdXDgStZ4vuVRPKmN9zIwHyu6xZOsdzVcLhntqf0VbPxlC1D97JsE6V0x
 6piibayqBrhpc0QdlgMqEG+oQNrm/fPWslUUY/UAu5HkkklFUfREg7G4g9JmduYRFNF0E9BSA
 CfwwYZ68eZ64wdc3FN9rtsMIrhG5ShoXcQjhgFXTRV/MJ8w5+eu378EpGUzX6c7lCazcyGbrn
 Pms14ZeZrPO6SWAJH4jpj+nQAgvk7GxN0/+GzNbsoTMj/Ja7Hzuv46ZB+sp4zOy/DDsTlHQ6m
 iVI/mjcZCzIcrq+iHQpfaEkeIbd9RXTkUv3PmLIN4/LQJ/zC6FROlUdbmPH0nMl6DVBCZQtH5
 CP1FI/XzAkSj6KSOYFVjNEadFgGmgOaahl8S+b0pO4jdDOlUD9OcIU6/9xEpi3a5gIqQtfAjX
 2MlzasBR5Rabn70eCfJSlTPwZmffo99aFdcbDGDgOSBRPmbUs6YzQ9BI14J/irGE8nXke/lZm
 hFOvFym
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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


