Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5E11889C0
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 17:04:58 +0100 (CET)
Received: from localhost ([::1]:35498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEEi8-0001cb-Cu
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 12:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36992)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jEEVK-0004mt-LA
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:51:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jEEVJ-0007EC-5V
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:51:42 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:56701)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1jEEVI-00079R-OK
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:51:40 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mbj3Y-1jr9ce1TsE-00dJhi; Tue, 17 Mar 2020 16:51:34 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL v2 11/37] linux-user/syscall: Add support for
 clock_gettime64/clock_settime64
Date: Tue, 17 Mar 2020 16:50:50 +0100
Message-Id: <20200317155116.1227513-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200317155116.1227513-1-laurent@vivier.eu>
References: <20200317155116.1227513-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:T6Y3YFkvH713Qe4ereREj/6wQ39TRnkL7Bu8HvV5fLKnQbT3NZD
 wMzutVMYbTRtvwV0Pcf7eioGF1AclZDdyqbmpGeWWaWIqh+beGw365KFs/0c7apgcKtAYja
 LMbGZRbUTkLrfKpw/yYUMC0QpYyQXl/xAZaGp6LfB0ibEKI19oHlqAs3DbesJdCuNlxdBvV
 1JP+xLnPbdRZejIepUy9g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tPFUMU9m8nc=:q8RI5wAjAeGql1u7BC+QgF
 RR850naCz3NVqcjrndJnU2AsC4KoFtq0x61666PZCumY6JcIjYIkGvviYqqsWTb5sWxzfAPG7
 THGLRfFCRzYoU1NcGRxBlh9KGJxCxdGWgWpPj4z4KU9aWu5cnnLW3hYZt4bJqaUKOo1KqfTWq
 h9az82UC/5JCmpujBfVZCSVAfieXQquBx8V17GKynMWRpqYsAIoJo8gxzjHpjJcP8pqFJb9cx
 2VQCTvqsh4+/kLzuURWDfwKX2pPe3Jg7zeqI2O+e5SBVtjBEP1DA2TSZYC6TATOV5Z9YJaEB9
 uWKplilmcshMYYY/C6/2XsO6e/4rClHX3l/4FTcR9ofTJlmlHXu2kHW1OMU5uY+/Wn6O/KJ/W
 hi8Z4dDVllM750rAJ1LX8FixSZ/Sj+5Oz7IxKRz2iRlY87HDKrzedQ1iYcjsSY8QNtW+XSHRT
 w2rCnLHCKocZcTNnHHIXSH/LS4FzI3CdsJicQke0IOsomsJTpImuS4myiaZO5eH3hvES/+6I0
 tJFc7FgGVXMunO41KI6OfDqsIgDeSMJERCpdenvHWZu/FLif1R74tec71AWlRNLBwRuACPgBM
 26WjTY7rdDAZcE1MtMch3qoNItS71nv+WhRwGMz0a198hqr5QyuielxY6zMF5DAUbToaz7qDj
 MP6qB686LiMhBN1YkBog9l5P5EHMU3SrNKJXkNGG3E8SnMVe9vu68mObUISxyWi+YU0SCQTZ7
 /7Iar2HhAyerw47GODckRQ2zqwVzpmghWlU9C3Y23ESCofdlgmSYU6DIsraA52VAeVAMZYbwr
 rA69ckWX+FHK2Sg0MG0GDTUtsc2EkJXbFs2OjSui10o/a7W6Y4x0ceC3hK/mlW1GwTV9mx/
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
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
Cc: Riku Voipio <riku.voipio@iki.fi>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

Add support for the clock_gettime64/clock_settime64 syscalls.

If your host is 64-bit or is 32-bit with the *_time64 syscall then the
timespec will correctly be a 64-bit time_t. Otherwise the host will
return a 32-bit time_t which will be rounded to 64-bits. This will be
incorrect after y2038.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <4a7fd05532400d10aa0f684c9043e2ac7b34d91c.1584051142.git.alistair.francis@wdc.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ea1c84dc5de5..661404687080 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1229,6 +1229,22 @@ static inline abi_long target_to_host_timespec(struct timespec *host_ts,
 }
 #endif
 
+#if defined(TARGET_NR_clock_settime64)
+static inline abi_long target_to_host_timespec64(struct timespec *host_ts,
+                                                 abi_ulong target_addr)
+{
+    struct target__kernel_timespec *target_ts;
+
+    if (!lock_user_struct(VERIFY_READ, target_ts, target_addr, 1)) {
+        return -TARGET_EFAULT;
+    }
+    __get_user(host_ts->tv_sec, &target_ts->tv_sec);
+    __get_user(host_ts->tv_nsec, &target_ts->tv_nsec);
+    unlock_user_struct(target_ts, target_addr, 0);
+    return 0;
+}
+#endif
+
 static inline abi_long host_to_target_timespec(abi_ulong target_addr,
                                                struct timespec *host_ts)
 {
@@ -11493,6 +11509,18 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return ret;
     }
 #endif
+#ifdef TARGET_NR_clock_settime64
+    case TARGET_NR_clock_settime64:
+    {
+        struct timespec ts;
+
+        ret = target_to_host_timespec64(&ts, arg2);
+        if (!is_error(ret)) {
+            ret = get_errno(clock_settime(arg1, &ts));
+        }
+        return ret;
+    }
+#endif
 #ifdef TARGET_NR_clock_gettime
     case TARGET_NR_clock_gettime:
     {
@@ -11504,6 +11532,17 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return ret;
     }
 #endif
+#ifdef TARGET_NR_clock_gettime64
+    case TARGET_NR_clock_gettime64:
+    {
+        struct timespec ts;
+        ret = get_errno(clock_gettime(arg1, &ts));
+        if (!is_error(ret)) {
+            ret = host_to_target_timespec64(arg2, &ts);
+        }
+        return ret;
+    }
+#endif
 #ifdef TARGET_NR_clock_getres
     case TARGET_NR_clock_getres:
     {
-- 
2.24.1


