Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E703CF16CF
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Nov 2019 14:14:27 +0100 (CET)
Received: from localhost ([::1]:57912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSL8k-0006yw-L3
	for lists+qemu-devel@lfdr.de; Wed, 06 Nov 2019 08:14:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36497)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iSKzx-0003Yq-D8
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 08:05:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iSKzv-0002ys-Qy
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 08:05:21 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:57175)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1iSKzv-0002y3-HF
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 08:05:19 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N4i3j-1hkzWM2Av1-011kB0; Wed, 06 Nov 2019 14:05:17 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL v2 13/13] linux-user/alpha: Set r20 secondary return value
Date: Wed,  6 Nov 2019 14:04:56 +0100
Message-Id: <20191106130456.6176-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191106130456.6176-1-laurent@vivier.eu>
References: <20191106130456.6176-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sT58QnB+9d3LffVxpnM5Qac7Rc7XxNgy+jbm6hcpvpCOZtG5bCa
 Xk0r88/fTxQXxtQGImnrI0Juy3vZimxPwTHS2X5Rbj7FeZr39RLaLdNrHDZTBrDJOzlF1lz
 f7lExXIb919ZyTBKXsjAAF1GGgU3+Zr3qX5SQxbrzdiekbxo9c2unQUCI9r2JHgIVNZ08NM
 TIgV+ouom55nFs9eoodMA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:85v3dB7Rzso=:aRwOqgolEVh7fzd222PCJ7
 4ZIEFhuVbHwj9aaaRbm8O3+49AsBoVe3NbWBl5CtG+DWT0sCEyiyT+pueSh8JnmGvM+qR4MlH
 VwU8hTPhYpIoLhPyhrSgZjnO25cAbS5tEZPhf1ZtDZereh7XNaBwQ3ntozyiZU/P7nOQSvTjh
 fQhFhQ2uWZ2I76etvxlzmtlyaEaxbYTZiznS5IOidiksU3gnG9oul2FmC84zqyxKrW8jT5Prq
 c/A5hbnqwDpu4Q5u1PtEwrlJvSJDdci8WExzIo2+6FtoFtSPaH3l89mJCjOsIxCAUUN9zIXIp
 JhMrsKug9xRm78/HCE+diyTewdT9WTyjoSgAdO4uHCtnhn6+8zQ+vfgT8HdhqQVN7NzBOQkEf
 ok6ydOkFYlBs+sJVT6s3OG2Atjt3Pnf34r+a5AvHFgvl4R0hzJ0VcI6n45ZgEpFSZ0X2+eYJR
 NnED1yu1c28dDBkqEHdl+1z4OYD68MG5rsHZqVQa5f3zyuDPYg9dxbOSoY4IT+Pr2ADq+6rq2
 /fiYfbkdAGYk80HCGt9X2keG2wIr7ZTK3Ur7L/LcBu2es7GM2LuhhGTlE4u12NZF5SP3D3zZU
 4ssejeP30UeYRfKZ3W07hbWXSspYdsSiq/BIYXBtCKs9H5+WNnQlA3RC5LGHcnOia15CfdrTc
 Lov7WUmRgjfErsfbcK8TDGtNefGkdb7eyIGr2PVkMLYOlANQWujgepK0t58xnDwIpxid/+xKQ
 KcusbiSYUh80Ex/1q75PHrT9BLNcmJ538cBbc3Q5Tq20N5nq+mrCZyB/Bz8KcwFkvRJnS6yiw
 fvJoe5Dvr8nRLXCwiGjoK92X9jCsJY+E7kAT4TbcM+72t+lDn0rKwewEjt0Nsm67swAPi1ggA
 pGVyAlJyMW9a25Srebqw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.135
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This value is not, as far as I know, used by any linux software,
but it is set by the kernel and is part of the ABI.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20191106113318.10226-13-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/alpha/target_cpu.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/linux-user/alpha/target_cpu.h b/linux-user/alpha/target_cpu.h
index dd25e18f47fb..ad408ab5cc8e 100644
--- a/linux-user/alpha/target_cpu.h
+++ b/linux-user/alpha/target_cpu.h
@@ -27,10 +27,19 @@ static inline void cpu_clone_regs_child(CPUAlphaState *env, target_ulong newsp,
     }
     env->ir[IR_V0] = 0;
     env->ir[IR_A3] = 0;
+    env->ir[IR_A4] = 1;  /* OSF/1 secondary return: child */
 }
 
 static inline void cpu_clone_regs_parent(CPUAlphaState *env, unsigned flags)
 {
+    /*
+     * OSF/1 secondary return: parent
+     * Note that the kernel does not do this if SETTLS, because the
+     * settls argument register is still live after copy_thread.
+     */
+    if (!(flags & CLONE_SETTLS)) {
+        env->ir[IR_A4] = 0;
+    }
 }
 
 static inline void cpu_set_tls(CPUAlphaState *env, target_ulong newtls)
-- 
2.21.0


