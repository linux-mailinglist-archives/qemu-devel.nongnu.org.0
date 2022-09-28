Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDB25EDAAC
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 12:56:41 +0200 (CEST)
Received: from localhost ([::1]:41052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odUk4-0001V6-Oa
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 06:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE5-00086m-9X
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:29 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:53089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE2-00089a-MD
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:28 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N4yyQ-1pKb1s2R6K-010ugF; Wed, 28
 Sep 2022 10:15:24 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 12/38] linux-user: Show timespec on strace for futex()
Date: Wed, 28 Sep 2022 10:14:51 +0200
Message-Id: <20220928081517.734954-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YCIWjKB32DrXlkcm2dsq1/E+ckxuGL7JG976qLGBHtUsdXuS/iO
 k4TZK2c5NjLxz+xEkpt6pg0RLk+IquElg9s0eHsXz1LLlBDLn+M9MoIK3AIm5kZyLu1R1Xr
 KVH2eIfLOkOc+0XDHX13TUh/adrgdES6pggZG48eghpg1SEUGW7O09KxWmaKDRRrRNfuuFW
 z1ccwHohf/BxzrcRI3IgA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RPLGkX36y0I=:flP6Tu5gSxCQ8+Mg+DF0iO
 x/Nbf0dRz8C6AjLkQSd2xFcocpCPH2ngHpLmOT0koAMSSuWZr1O6rhgXhZvlRlNtIVJu1I3o1
 aNootu6+th0eC4YqeSWkJgxT455Ecdyqk4esbL9bJcBGZx5A1nNpUTuGwvCql+aCsDGYiXapo
 tyPMG7YOM6a42N7F06UZ1BnTk5sSY3QrRie3G+pfZRjHwhKXLUuWSV1KScTKowSfgA20s7eG8
 QwjY8YWIQ29GQurAmB072JoN5HALch9UX5FyT03oP2llMn0y2Mq96vlNUqqxU+Gi1ZfTyHvwd
 /NsGNw92FvIDoegTZZADC17mtfobUCNWC6XusYmDtHzBIhQDMXLkjcGbzksgEyswSBYi+iXfr
 QKFX1s4bSah11gFgI71FfsCEx6omhuCGnJ1iSu/bla2xphq+kBKXlu28PJ0K/IGqOBgH+laqn
 d7zF3+T2RAZrlR5rKp8K5EB6vvvATlzcYo7nrUZLouFG8FyYuLqr2kqOIJZCZ8e/bs3nRSYS6
 4zLBGn6246pBZ8lO3Bme2PCNsp2YHMpyrMXKGDYZ0h3YZ/50o685+8womt7dShZhaCT/3O7Ev
 HnMXSV2AIHCcY0wYSPRd3LBm+z6Li29/YXORuuI8Gn+O9ymEn45eefFXBuTXX40jCTHlEwnG9
 zplx82+LwAZwsZOGi2Ge4yfRJBmg+s/PkP9BiKovk+TOio1givz1XPPQRRWBMS29MasavhZQZ
 cBR86+MtCuQbVEIi9XUcvoUuEJVVy0Pt82wgkaHiMRY3gi3ayfup79ioAHoOBLkgldCJEu0U0
 1x7Bp6W
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


