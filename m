Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 949453871DC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 08:26:50 +0200 (CEST)
Received: from localhost ([::1]:55864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1litBp-0002up-NR
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 02:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisL1-0008S2-KC
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:15 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:43111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKz-0007Jn-Pe
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:15 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mqro7-1l59nu1A6T-00mpip; Tue, 18
 May 2021 07:32:03 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 57/59] linux-user: Tidy TARGET_NR_rt_sigaction
Date: Tue, 18 May 2021 07:31:29 +0200
Message-Id: <20210518053131.87212-58-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0pe3gBwIz6emDT9fggT5RQr/jQo58spTr4RgIxpGqL/TG9Z4cUd
 Us7JSbtXuvIDmnvjow4BMUW/eI/CAMTQhNI6Jsj9HtVRgcQdnXMy2XOGRxS4169TwkH2Hmx
 2ZB78gzhw3Ly2zixnsLrIFnaJIFVFW+GcSJ6CUJ5afV5tuqDB3OgSQG3F03LjLbbZwTJi6G
 xxU+PZGvh1OUQWoBW5MlA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1QfqtfjQhwk=:1XQv3s3mSM2b6dYj0HtNp7
 WmjxbaZwv0qKqLfqW4GP4m2Ut/6lAN/v07UVFcs7CB0/sJTdif6VBFE0XNELVqC7l61HxvjQx
 EC0tG5pxSYYZgwrhMUC96OaCOq8pnOflxa76rvdksQePjxkat+6HqfwMj2tAx/Cj6moIruk7q
 gL4O6xFiihhca85+lblB5ZWO3WtecZn0xUi3DfHL8LjXvvoWj5H0ke6CNyFI38Sqiys4Zp3N9
 h8zqi6Cj1fKUq1M9rV6EH3XlGjVoQLwuouAB9dEtpOkUnx9FYxFrCgXmcM6VHLoMjQvnUAYHE
 dhETxysqoNL7ziYYeAWsvj6yw7jmlQ40sX+iXbWXPtxpJKOfm7+uciospmy4JZbVGApA9O6i0
 XQjK3F9YMj2C7arGpN7NLd6wCT2krP0+o7lGFgbXMIzDTY/H24wOPMignSp9KjCU98BcSJgID
 JyEmaMoBqQkmKUZHSDPlwldYaxTGYPhQXHa7w58BIV4vOtnCmXpM6gdVefb6Z6dTtbxsbxEYk
 4BNt7GZ2A2Liwx47jVLGp4=
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Initialize variables instead of elses.
Use an else instead of a goto.
Add braces.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210422230227.314751-8-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 32 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 8d7ac1ebcffa..c9f812091c3f 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9060,32 +9060,26 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             target_ulong sigsetsize = arg4;
             target_ulong restorer = 0;
 #endif
-            struct target_sigaction *act;
-            struct target_sigaction *oact;
+            struct target_sigaction *act = NULL;
+            struct target_sigaction *oact = NULL;
 
             if (sigsetsize != sizeof(target_sigset_t)) {
                 return -TARGET_EINVAL;
             }
-            if (arg2) {
-                if (!lock_user_struct(VERIFY_READ, act, arg2, 1)) {
-                    return -TARGET_EFAULT;
-                }
-            } else {
-                act = NULL;
+            if (arg2 && !lock_user_struct(VERIFY_READ, act, arg2, 1)) {
+                return -TARGET_EFAULT;
             }
-            if (arg3) {
-                if (!lock_user_struct(VERIFY_WRITE, oact, arg3, 0)) {
-                    ret = -TARGET_EFAULT;
-                    goto rt_sigaction_fail;
+            if (arg3 && !lock_user_struct(VERIFY_WRITE, oact, arg3, 0)) {
+                ret = -TARGET_EFAULT;
+            } else {
+                ret = get_errno(do_sigaction(arg1, act, oact, restorer));
+                if (oact) {
+                    unlock_user_struct(oact, arg3, 1);
                 }
-            } else
-                oact = NULL;
-            ret = get_errno(do_sigaction(arg1, act, oact, restorer));
-	rt_sigaction_fail:
-            if (act)
+            }
+            if (act) {
                 unlock_user_struct(act, arg2, 0);
-            if (oact)
-                unlock_user_struct(oact, arg3, 1);
+            }
         }
         return ret;
 #ifdef TARGET_NR_sgetmask /* not on alpha */
-- 
2.31.1


