Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DF8383CC2
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:54:57 +0200 (CEST)
Received: from localhost ([::1]:54450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiOG-0007z2-Te
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihm7-00076l-8O
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:31 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:48479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlc-0004bT-Ml
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:30 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MsrV2-1lTFHc3BmK-00tDcJ; Mon, 17
 May 2021 20:14:56 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 57/59] linux-user: Tidy TARGET_NR_rt_sigaction
Date: Mon, 17 May 2021 20:14:22 +0200
Message-Id: <20210517181424.8093-58-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BlVMGI2zvZfRIVjR+rXCubQm5WdKvDzhBPC8hICZpzPMZ4acVYv
 yis88kGPYpRO63B/PJ1RsRelOMaNUVGW5es10Gu51hbiLLRwbkMG3q2PaVaRD/IR+q+vWfj
 Ig2htFXyinA1E0ZZzayeSiyS3l8dxPFgQgJhhOQIQX8sQtzXsBf21kyNAEKPenPYESD5hLS
 0QrK9KJACNZegm+as5u5w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:D0wpYJislns=:QKASAKOlpjHTzRnvjt5klq
 rb8s4vJF/j+MPI5IDc5Io9mui1qBy29rYpUH4UoIJyZgoBabavdmOMAVr1/Byp+A6donhQrAc
 zc4VRLjZ5ji1LfoVq7fPDnXPKWU/D+fjOm4uu3LUnCKyaRS2f6VnkQrvrYDR8IdYnROHC2VpK
 ScC0aH+xb9Ds6Nc76DPzto1R10CoOAQIhcjfit0QHRAh2gdaaVe8DaSJh9O6Yq50MhLcaTrbY
 SsRsFk2JaiAXMVBvsVIugh1rEl4B8esFKJ7KKyeSDk4DLwru06CVYoHflDUvhHfY4vOlWD4sX
 ZeaJmMzw2JXktztQyc+DcZmV+SKH1gyGUDyJb1vQronwHA6HDQiCT6V0UF1aylk5BIwPB3i+V
 CNosD+IrwGhuoW4TRI4QkJOz+SeB1sRrg+ZlgIU8Nfl/tdHrud5/fRFH1R8Qgz/dXRQp1cqKO
 +RV/2tD1YRnfatIuyBHnrSSh5//bPrnfe9aZ0J3XwtJgi53ZGdGHiTgHBVFDsbzo/OBEzfkhu
 xTrDjjI4k2OUMkGCN4g4v4=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
index 2c5ced1570b5..0ed58e9f5c06 100644
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


