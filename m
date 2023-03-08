Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2876B0930
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:33:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZtrS-0001l1-RE; Wed, 08 Mar 2023 08:29:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqu-0001cR-VG
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:09 -0500
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqt-00064i-5T
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:08 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mv2gw-1qQcxl207U-00r49U; Wed, 08
 Mar 2023 14:29:05 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 08/28] linux-user: Provide print_raw_param64() for 64-bit values
Date: Wed,  8 Mar 2023 14:28:37 +0100
Message-Id: <20230308132857.161793-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Dl2UHpk1T11Kv0NoMlfZjWuBvWbsFR6XxNrRGS7xmoBE63BOPcH
 XYdQOo4Sz0JJkhKmEfUsW4vCT7eweSs5m03Vfl0dkry/soalwWfE3pri95J+qDZK0oRamrg
 hpo6tQo0LZbTPQk7TgHf8qC8GVOf0EEe3idSkMlEp4Y5EShWc2DR7f9Q0BE4n6ZC/zUbjPb
 9KEAAUC+1dKC1nUhzjiAQ==
UI-OutboundReport: notjunk:1;M01:P0:PFYOmQFLlV0=;6BA3mvl0j/LqR5GdU0902RYzh7z
 w1zrtxR09xhmGjoBqCLqTWhqUcB0cov0FQ1NB7BCwrMgHxjBs/SgvxON0TDJs+r8LvF2f9Xn9
 WnyqmfDcvAxttVJp/T/jIqi0U/jKl/yKrazLF82SDr//MP+wg7nfQSN0iuFj2qKbl0YpBu1Mb
 IksagNNXz5L5BrC7RVf2hTG9Q7ruwYGWFmMUZbGu2OejnHKDYZrPPCvpQM+Wv2B1krEPu30dQ
 cZjXq1ztVsVd4v1gMoFPvAjK45iVnHW9FTUoRj+Vt37WZcK8BnyYVcLjCfjFRiID9Fd5t2RI5
 8mXmHdfg8ixlEjJ17lR871p+P53gWB/v5zmTSx9aKiZUX7nM3r4rLiiC7mHuzwZ+C6wbfHwwX
 f1ECfmY69uLFgqqoo0az5beaUnofaJQnURs9LKIFxoWBcQLvr3d1h1cz2/wgJS1xBiWipp40a
 e1t6W6oE8n+muRrWj9tHPRT82sxr46JvXelVscjRs5brwmm8aPcN+29t5Zz7KA4azYlHdGYD7
 3DPIJ2EsToBIDgyWrbUfxCif0zLmejHPLltQkCkgSd4g49cL2o8yLu5JQwGkDQD5kqmJud3fm
 JmeYU8qAIifB+AFxYjM4DQu8I9wVYKQruPoVS4qIfA2Glcg29dpnJiPuJLAOlie4f7Y7VZy1g
 75BY2QiTlQoZgMFh089G3ru3zRQBgv+1STR88FhPGQ==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Helge Deller <deller@gmx.de>

Add a new function print_raw_param64() to print 64-bit values in the
same way as print_raw_param(). This prevents that qemu_log() is used to
work around the problem that print_raw_param() can only print 32-bit
values when compiled for 32-bit targets.

Additionally convert the existing 64-bit users in print_timespec64(),
print_rlimit64() and print_preadwrite64() over to this new function and
drop some unneccessary spaces.

Suggested-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Message-Id: <Y9lNbFNyRSUhhrHa@p100>
[lvivier: remove print_preadwrite64 and print_rlimit64 part]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 340010661c4f..2cea93aec46e 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -81,6 +81,7 @@ UNUSED static void print_syscall_epilogue(const struct syscallname *);
 UNUSED static void print_string(abi_long, int);
 UNUSED static void print_buf(abi_long addr, abi_long len, int last);
 UNUSED static void print_raw_param(const char *, abi_long, int);
+UNUSED static void print_raw_param64(const char *, long long, int last);
 UNUSED static void print_timeval(abi_ulong, int);
 UNUSED static void print_timespec(abi_ulong, int);
 UNUSED static void print_timespec64(abi_ulong, int);
@@ -1642,6 +1643,19 @@ print_raw_param(const char *fmt, abi_long param, int last)
     qemu_log(format, param);
 }
 
+/*
+ * Same as print_raw_param() but prints out raw 64-bit parameter.
+ */
+static void
+print_raw_param64(const char *fmt, long long param, int last)
+{
+    char format[64];
+
+    (void) snprintf(format, sizeof (format), "%s%s", fmt, get_comma(last));
+    qemu_log(format, param);
+}
+
+
 static void
 print_pointer(abi_long p, int last)
 {
@@ -1718,10 +1732,8 @@ print_timespec64(abi_ulong ts_addr, int last)
             print_pointer(ts_addr, last);
             return;
         }
-        qemu_log("{tv_sec = %lld"
-                 ",tv_nsec = %lld}%s",
-                 (long long)tswap64(ts->tv_sec), (long long)tswap64(ts->tv_nsec),
-                 get_comma(last));
+        print_raw_param64("{tv_sec=%" PRId64, tswap64(ts->tv_sec), 0);
+        print_raw_param64("tv_nsec=%" PRId64 "}", tswap64(ts->tv_nsec), last);
         unlock_user(ts, ts_addr, 0);
     } else {
         qemu_log("NULL%s", get_comma(last));
-- 
2.39.2


