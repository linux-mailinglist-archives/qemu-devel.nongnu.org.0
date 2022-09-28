Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAF35EE6B0
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:40:36 +0200 (CEST)
Received: from localhost ([::1]:44302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oddr9-00006n-Eo
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddel-00080g-Sd
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:47 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:52071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddek-0006OE-7m
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:47 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Md6ZB-1pDWVP1xVT-00aCyp; Wed, 28
 Sep 2022 22:27:44 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 12/37] linux-user: Show timespec on strace for futex()
Date: Wed, 28 Sep 2022 22:27:12 +0200
Message-Id: <20220928202737.793171-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CRsGxHjD+1wbbLQz8YsRXOrJHO1nG1zFk9F88yHWDwrgcAkN/Jv
 XlVy6iSr8yVq6PPUtNw/wQxWcYEd85L+YrWsgEDhijtrvOvVC75QpX4KvNhvnpP2cGCaLYq
 LX8hIm34qmOOgqkOWvdlDhk+/ICO465RP1VtL5ODs4WyNRpzI22u5xZ57d9PTjGqBJItc4L
 zmz+zIp7HKJcjgxpwMvWQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CNOo1p2LRNk=:dv4MzYLA+x12H8GRUCEIq2
 lYkaEf3RJlfcGlDkmB7JgTELPDsdAGunqczayRNSjgbRtxUg+OHwic0T+raQVY9wMme40UwfU
 hwV+BCwtwkZ/959Hhb+UPJn6qmOzPSF7nL2LRp9g1/zfGU8LzRmByyjmO0w8fT3JphAb6yP02
 4UwwozSSF+0hqsIop7WOHnYGjjJ5te9NEqJuRMq5/xezcTSR/ZU/e9dCUnZ7vgPS5dezUZkZZ
 LPSUzeibbOc+s1AcO/waC8fj9ROaLdNWtn3kleungrUWC1l9KRq1P8u6h0It7lCQOuUgHLMi0
 pxyq1X6qlSJ009xe06f5ItHO0ZE8mADbU6uo/P9ZP/dg3inFC6Md0cOOHk4Ru9dfkVFXRcGkc
 7Wev9awAjbsj6KuWiWPzaJAUTEE18Wnt72DtYiWxEJ2Nek8nZgNp8eGbGbZsmMI/vkvmzyRFZ
 fboaDEyY6Fg79spJvP/s0iJLAWc7IAz29skbTGQytaKNIaVMgFIVlg9cSHaTsj0lEJGdphMuS
 q0EE75HeDcJbDhy3hCE6dp7fciCcEAWDSx9uP/OhaY1gBiMxN5oOLMy/A1Zaiuk9hykxTHfw1
 m9CQ5ctqN3GjBpxdcmVhJH/SBIVladuRK+88RJmXhbGSp9pSEAHjWVggryzYMrs1eD+CDiXME
 6e3SJ4f6IbBPgae/FBpNf3jeJ05dDAV36l+acSVTS9iRG+Tx30FtJCStFI2iKzFAKrJLOwoCs
 OgmSbSOrTy3E7P4v3Yo4bsnPXrnwl25fnBJJcGdn1ukg+0oDYx39ve1uG4GswOKuDPCO56T33
 zk4Rw6r
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

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220918194555.83535-11-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 6f818212d529..b6b9abaea466 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3714,11 +3714,20 @@ print_futex(CPUArchState *cpu_env, const struct syscallname *name,
             abi_long arg0, abi_long arg1, abi_long arg2,
             abi_long arg3, abi_long arg4, abi_long arg5)
 {
+    abi_long op = arg1 & FUTEX_CMD_MASK;
     print_syscall_prologue(name);
     print_pointer(arg0, 0);
     print_futex_op(arg1, 0);
     print_raw_param(",%d", arg2, 0);
-    print_pointer(arg3, 0); /* struct timespec */
+    switch (op) {
+        case FUTEX_WAIT:
+        case FUTEX_WAIT_BITSET:
+            print_timespec(arg3, 0);
+            break;
+        default:
+            print_pointer(arg3, 0);
+            break;
+    }
     print_pointer(arg4, 0);
     print_raw_param("%d", arg4, 1);
     print_syscall_epilogue(name);
-- 
2.37.3


