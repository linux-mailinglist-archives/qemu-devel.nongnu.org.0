Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079CF6B53F7
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:12:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvi-0008B1-A7; Fri, 10 Mar 2023 17:09:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvg-0008AB-Kk
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:36 -0500
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakve-00030I-UM
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:36 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N2mWA-1qZ91642Sy-0135ip; Fri, 10
 Mar 2023 23:09:33 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Helge Deller <deller@gmx.de>
Subject: [PULL 08/28] linux-user: Provide print_raw_param64() for 64-bit values
Date: Fri, 10 Mar 2023 23:09:07 +0100
Message-Id: <20230310220927.326606-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cLQw+6F0QVWslnEYmBa94mKlYnGFaj6RNn/MUzW8KWo1GQJ8dQT
 paUyBuJOTa7xp6A/AUJotrBdIeu1eSJxmXQs5aQNvpIX4hCaCKCedrc4qg/ChavHPHqg+yj
 ktTRc/num54S4WLfAkYYgx1qUYnNrprhNmTK6KNcWOv9NznNa1vWojYcfM085BMKADMi462
 /doTTKq3vdC0kjWtgVnmw==
UI-OutboundReport: notjunk:1;M01:P0:qTLLBIi1yxA=;t5jj+lZf7kAsjeFe/IZXaDDFFEx
 OuSgYCZA3BancerKQMGEhayNqsWegWnkwMWIaZ6uL8PX+LAj3C5/wX3Qs9c38l7TH5q9eAFHK
 HaIP6F4kKar2/Te1JxA2M2fI0liLoElxVegi+UiCZqpxDYaG8Iu07g5Oj5Pwf+rPS2T3mIk/s
 V1hdUPqAKv9qhpgfCPb55BqnU6Uer6888SOdV447PPFBYOCTK44cKSH0adL0zLt/X+fzVglf/
 dFERvYBF0ptn9j1QxZMnVAyuKet3rMu9lKMpsD3qpWgkgX+q6w9zvvMPxAwIrCl9Uzfw3gV5/
 QBc33THpwhcYRMAzwpXGeNOV+Dcdjfi9LTnj9MmT8AbAAFx5hykhVeBqUQ94EL/n3byi3tAaW
 JFhwJ5jnWin8olp8/eZswk4+zcaOPfxeb45mqZbwsSR/QnVrArePVWgR+APcQS+SO7e2IkuYm
 BgjSaF5+rn1QP6NB3CGAs5CvJLkcoYv2R5IMVE58FcXCQPU0wqf79VTd6sfBD3YWguaxgsK5S
 2sep/qZQ9lFoBq8dKLKUy1wHukTtfJ7VcmOCtLCcDjjUgpytVKD+S2nFArK/A+ksV3BTY7zqR
 ZJ9xrtC7JLEqY5In/ajs2TyjuXF1tEmJKQ+tHV0stUxgh/VvXsUzg47hysOBfqlsejk9+WWDI
 aLETc+MIr/g+laGKbOljMDS0z8ocr+EeD8CPOECPcw==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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
index 340010661c4f..5218e3fc33ac 100644
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
+    (void)snprintf(format, sizeof(format), "%s%s", fmt, get_comma(last));
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


