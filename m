Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BD5486319
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:45:19 +0100 (CET)
Received: from localhost ([::1]:47666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QGj-0004As-J6
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:45:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDU-0007bm-8l
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:41:56 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:39177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDO-0004iY-QE
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:41:55 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mr9OA-1mYsk70HpO-00oCxw; Thu, 06
 Jan 2022 11:41:41 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 03/27] linux-user: Mark cpu_loop() with noreturn attribute
Date: Thu,  6 Jan 2022 11:41:13 +0100
Message-Id: <20220106104137.732883-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
References: <20220106104137.732883-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kVevOnxjNrQhpzT+PA/6z1ynTQwWO7QfZ6cCl2xJUGUpuvdxdG3
 189dG2/ysVgxmI2NUEF76+4K3MClklRn1DTMDe1dBSp2t3f0L+3hjd/TnFSr8qtAIaa2Sx7
 toy+C27U2KwwyBlZSDfluugXhFKbWGjMbng2NyKDwjxvS47tDPFM2skTu8N83bsYBfu+Him
 zuA3eDkSdWCexojhM1CpA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7LhMDGCzNZk=:DdEsEJ8rnnbhknn6D8l+gM
 18rMT2uA1ukv7+o/3iyqOw6zmeA4WVzg+Z0YSN/5gD0N7v/Il5TIk3JD9A08OQI9PpNci74eY
 N7F+MAMNDVtvlWUU1JAbr4WPhalE1Jvk53ZLDoOWbz+WCCXl1VprR5Pj7YtXdqgu27XLFXDIH
 ZdCgsbB4jWkSZY9LvxVeic8Ib6isFTM5fxuFEzSDBgWNdUsNvjwMyipfiLuS7meUScoIRN99F
 XOzHeoiVYftgkp74by2XjHZrwh2Ix79MT/Vb2hQ2HQHncYNDKYJWxwRsKjyEeI2Ga0FAsxCU+
 bw11fGBQ37rjOhU9NwJTbXug9NW+tstCOJGA8umc8e47iw5FDsAAGb+ktkfh6V5McGdilG7wG
 yVCdKi2B3Aa9mNBZ8mTiigu4mcyalAbQPLBw6gTQaKMOEn2CklWXDJt/MNbNoSNIm5WHvGGHG
 EvRPKU82/wjAGiv5EMp5LRAn7OX3zT44mtD0gNmBIi0CPuv21ymiyMtZxXx2XwcEdaXIOLya+
 WaWK3MBNxjHSLKU6mxLD0AECDhU1p8R+PnIPw7ARN61stjK2dhsUSOpSfRkNdUOkQL4QAFN+V
 id2GWRlN+bRRGITWo1tt/UzlCqyPkTo9rvFou08GwxkptuV5cmRrkjW15J+vaRkv3Cb9dSPxo
 NVDpr8aQO+BBVSRa3d/jhG5H+dhvfWkE19lklCagGMblyuACHY3Y0y4q/R4Y1DdKajio=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Bin Meng <bmeng.cn@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

cpu_loop() never exits, so mark it with QEMU_NORETURN.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-By: Warner Losh <imp@bsdimp.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Message-Id: <20211106113916.544587-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/user-internals.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index f71f37282994..a8fdd6933b23 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -64,7 +64,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
                     abi_long arg5, abi_long arg6, abi_long arg7,
                     abi_long arg8);
 extern __thread CPUState *thread_cpu;
-void cpu_loop(CPUArchState *env);
+void QEMU_NORETURN cpu_loop(CPUArchState *env);
 const char *target_strerror(int err);
 int get_osversion(void);
 void init_qemu_uname_release(void);
-- 
2.33.1


