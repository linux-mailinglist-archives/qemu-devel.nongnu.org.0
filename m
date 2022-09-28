Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DE95EE6AB
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:36:58 +0200 (CEST)
Received: from localhost ([::1]:53002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oddnd-0002mh-6A
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddek-0007wI-7B
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:46 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:43941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddei-0006Mu-4Y
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:45 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MuDTn-1pVjLF3U1l-00ucB3; Wed, 28
 Sep 2022 22:27:41 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 04/37] linux-user: Add missing clock_gettime64() syscall strace
Date: Wed, 28 Sep 2022 22:27:04 +0200
Message-Id: <20220928202737.793171-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GIW8ynZGiXfnZktLTdPEs/LQDSNBJPXQhZyfu6tzVnC3HmGNp82
 YkHDxojOEqOZFLl2vm3gTXBtrYOfilnqPUaEX9LYLEfFODyqmXym+9MGeGgdIh2wHDX+lDi
 n1WwjIsRlsW6w0VRr+08m/a734f3hi9RyVuhov53/1tmIAB05fgF4TFHKr8+YZYUkeRmPVa
 f0TCEzN3Uu/l6Bt58dVwA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vkYEw0vDZ6M=:LMP4TO9yJlWRIkQeNXxsUj
 Fx/VMfsxKkgYwBLl0wEZ2yKCfYtQFnr8PegYtny9wNmF5SkRynriGOFWqKvvfY2aE37NQSFLU
 vMr7rnp6se4y22sdPioJJwjSoMiU/kyGo6Mfz10xbAnLYkggk2+W6Iwv8PD/MQRIKiO64ug3v
 e2zrLg6b9nKLFi4AwFXbCW07s+kb6G2SLdtEr00YB4J8iTJgf4j8dCQ79vrk5c/4dhwaeUx+v
 UMSAgH836XYXlTgQmJ4buf+T94OH+k0E4YKk2Id1IDsqexRmb5MUO/uBwudqMpBDbjDfis4Gq
 mYTV4gMHXlMbs0c/p+peVZqz5MtSTgMd9kBQW1nnB85HXBAM2dr5TXm+lEhs/Mic+mYjuZ5ZC
 eqsvsKAKd53FghKMj+KV79zCYPIPRva+pbbpMhWFlswevJPKYLyfl4Rg/GPSb0hWBlBzi1zwT
 6KAiEDvUkV0BOWOSWQs81KAsUHEgkwaWPbFoq1JWCWYEXlGdqwWxGtnbr1lptoNcNN9Dbe4bf
 u8KnJgpIRvjjv6BLuGJIetj8XMr6hA/rY18rbPzHgAQ80vMdIhVG4uHJvoKYFu0gfhqES8zak
 Ri/rrmK6z6K5+tA1brgys8oTNkqtlPNScb6CAYOlnNvL2hEiGGaBkTHuwQDIRD/0xISDq5HD0
 hD5tyqnZ0BnYYgb6EWhKlvXBnj8SkNOZ1alKK1mXk12FAuWr2aZGCTZSANMOyBSuO5/Vd3qob
 OppTkw4ToK/Te0JEX9S/NHYmAUcka61DD6Jihx1LfTY+S4hFE8qyaqx9QsDBBYM7g5nVqDC2f
 ++lYfkS
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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

From: Helge Deller <deller@gmx.de>

Allow linux-user to strace the clock_gettime64() syscall.
This syscall is used a lot on 32-bit guest architectures which use newer
glibc versions.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220918194555.83535-3-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c    | 53 ++++++++++++++++++++++++++++++++++++++++++
 linux-user/strace.list |  4 ++++
 2 files changed, 57 insertions(+)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index a4eeef7ae1ca..816e67999539 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -82,6 +82,7 @@ UNUSED static void print_buf(abi_long addr, abi_long len, int last);
 UNUSED static void print_raw_param(const char *, abi_long, int);
 UNUSED static void print_timeval(abi_ulong, int);
 UNUSED static void print_timespec(abi_ulong, int);
+UNUSED static void print_timespec64(abi_ulong, int);
 UNUSED static void print_timezone(abi_ulong, int);
 UNUSED static void print_itimerval(abi_ulong, int);
 UNUSED static void print_number(abi_long, int);
@@ -795,6 +796,24 @@ print_syscall_ret_clock_gettime(CPUArchState *cpu_env, const struct syscallname
 #define print_syscall_ret_clock_getres     print_syscall_ret_clock_gettime
 #endif
 
+#if defined(TARGET_NR_clock_gettime64)
+static void
+print_syscall_ret_clock_gettime64(CPUArchState *cpu_env, const struct syscallname *name,
+                                abi_long ret, abi_long arg0, abi_long arg1,
+                                abi_long arg2, abi_long arg3, abi_long arg4,
+                                abi_long arg5)
+{
+    if (!print_syscall_err(ret)) {
+        qemu_log(TARGET_ABI_FMT_ld, ret);
+        qemu_log(" (");
+        print_timespec64(arg1, 1);
+        qemu_log(")");
+    }
+
+    qemu_log("\n");
+}
+#endif
+
 #ifdef TARGET_NR_gettimeofday
 static void
 print_syscall_ret_gettimeofday(CPUArchState *cpu_env, const struct syscallname *name,
@@ -1652,6 +1671,27 @@ print_timespec(abi_ulong ts_addr, int last)
     }
 }
 
+static void
+print_timespec64(abi_ulong ts_addr, int last)
+{
+    if (ts_addr) {
+        struct target__kernel_timespec *ts;
+
+        ts = lock_user(VERIFY_READ, ts_addr, sizeof(*ts), 1);
+        if (!ts) {
+            print_pointer(ts_addr, last);
+            return;
+        }
+        qemu_log("{tv_sec = %lld"
+                 ",tv_nsec = %lld}%s",
+                 (long long)tswap64(ts->tv_sec), (long long)tswap64(ts->tv_nsec),
+                 get_comma(last));
+        unlock_user(ts, ts_addr, 0);
+    } else {
+        qemu_log("NULL%s", get_comma(last));
+    }
+}
+
 static void
 print_timezone(abi_ulong tz_addr, int last)
 {
@@ -2267,6 +2307,19 @@ print_clock_gettime(CPUArchState *cpu_env, const struct syscallname *name,
 #define print_clock_getres     print_clock_gettime
 #endif
 
+#if defined(TARGET_NR_clock_gettime64)
+static void
+print_clock_gettime64(CPUArchState *cpu_env, const struct syscallname *name,
+                    abi_long arg0, abi_long arg1, abi_long arg2,
+                    abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    print_syscall_prologue(name);
+    print_enums(clockids, arg0, 0);
+    print_pointer(arg1, 1);
+    print_syscall_epilogue(name);
+}
+#endif
+
 #ifdef TARGET_NR_clock_settime
 static void
 print_clock_settime(CPUArchState *cpu_env, const struct syscallname *name,
diff --git a/linux-user/strace.list b/linux-user/strace.list
index 72e17b1acf00..a78cdf3cdfef 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -1676,3 +1676,7 @@
 #ifdef TARGET_NR_copy_file_range
 { TARGET_NR_copy_file_range, "copy_file_range", "%s(%d,%p,%d,%p,"TARGET_ABI_FMT_lu",%u)", NULL, NULL },
 #endif
+#ifdef TARGET_NR_clock_gettime64
+{ TARGET_NR_clock_gettime64, "clock_gettime64" , NULL, print_clock_gettime64,
+                           print_syscall_ret_clock_gettime64 },
+#endif
-- 
2.37.3


