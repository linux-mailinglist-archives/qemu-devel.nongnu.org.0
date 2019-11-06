Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3877F16C2
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Nov 2019 14:11:31 +0100 (CET)
Received: from localhost ([::1]:57878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSL5u-0001hR-II
	for lists+qemu-devel@lfdr.de; Wed, 06 Nov 2019 08:11:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36536)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iSL00-0003fm-Lb
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 08:05:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iSKzz-00031f-Em
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 08:05:24 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:46979)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1iSKzz-000310-5O
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 08:05:23 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MkpjD-1i4rov2Kcx-00mHgo; Wed, 06 Nov 2019 14:05:10 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL v2 05/13] linux-user/sparc: Use WREG constants in
 sparc/target_cpu.h
Date: Wed,  6 Nov 2019 14:04:48 +0100
Message-Id: <20191106130456.6176-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191106130456.6176-1-laurent@vivier.eu>
References: <20191106130456.6176-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MhlD5dVVZ7dtnCdYUPRmKP25QXNwXDN6lyKD4g0G1XO5VAFwss4
 cWAz8NkDxJqW8m/c8QpLJLT1JM/ro7c/zd6ai9TJGR3iYwQYmE+T/YgE3KOAHT4QdtKaPLg
 37doHcSjGhD3XI+KL9IPwasUjOMlmOAWzJHtjOESsIs7h4IxQdMa6T+3AI+Fxqnrx2eXoK3
 bZoSXnm4cOHANj/9ZMrOw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xkGsBVyoy+4=:bOXgfNrSiZ9CadHSqeQCxd
 e8WqA9Dixy24nCBYaqXpPBNJNEi6LCFzfsYkaDT1CFF8W+fbQLsGMd2iggOmMNJdBN4WgXZlk
 S9FlzDIbgvTsatt/VmeSbv5gJ2PiwDgmbWOjTPp6vtizRX+y/oiaSHiP650KKwO8k9ZVpN+Le
 gfinaToEDVBzulmOHCH493Lpu5NZ2czailDKelT3gTGXyVkuglv5a6NQJTivz34HTPX4o32ep
 xhUrrJbYWk9at04w3C5ag4CwaPbHiiVA50SrOhyqIiKhu4t/66J5w3aOWB7NcEooy5ptUw9zL
 qNohoH25iGMAMtuE2U8b5zruSS+eISFtMpKDWE5JRHjGJgk/sCDgXLuXcpp8J80+LX7TKLjaH
 jwuhN6KbR6UTHRmG4iTwKAlfgMTrBquZRglleH2Su4W9r4ywJ6Rx/mC6EVFoF9IJagK0yGfR6
 p4VaKL1WbhjpwIk9Ex7Ot/1bjxcp210cP5Xi7/I4GHUpqzoVze0lm6CSQ9WU+6nCxzSOCQ7Vj
 h0u2H7UTYVi3a0beVC3u/egh+o9+7w+2Cq0v1x9J6sgH2CMvl2LD49JcZeAZfXpdEMwhynikV
 oJ6U4FAFK2G1q+qiGULfzX2A7LWIZ5Nb5XENa9NrhcgWuXF3yBXEp+KwEzpm3t3K1NAXORP5w
 ahrQqDSaFY08l+pI+SJxvk0KF/tTGbtcVfWg3+2yvKbScvV/1ZDK8HYEJaZjQsCsptlsqFN0q
 ZLsJW7lcScUVm6nb4oHXN3kf2JZ5qLAWO00K2A9ki1UT7NNJUye7aiLPBJAMIjEGoVK72/bHG
 EanAPDGfOkCuKjTYF35skvtGtaT98lFOiTOlO9JRw5QJpkOL1AJeKQ5LOEtvBH2Oi4UepqxaG
 amB8GK/53Py3rPnLaOFA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.187
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

This fixes a naming bug wherein we used "UREG_FP" to access the
stack pointer.  OTOH, the "UREG_FP" constant was also defined
incorrectly such that it *did* reference the stack pointer.

Note that the kernel legitimately uses the name "FP", because it
utilizes the rolled stack window in processing the system call.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20191106113318.10226-5-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/target_cpu.h | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/linux-user/sparc/target_cpu.h b/linux-user/sparc/target_cpu.h
index 1ffc0ae9f2ec..b30fbc72c43b 100644
--- a/linux-user/sparc/target_cpu.h
+++ b/linux-user/sparc/target_cpu.h
@@ -41,15 +41,9 @@ static inline void cpu_set_tls(CPUSPARCState *env, target_ulong newtls)
     env->gregs[7] = newtls;
 }
 
-#ifndef UREG_I6
-#define UREG_I6        6
-#endif
-#ifndef UREG_FP
-#define UREG_FP        UREG_I6
-#endif
-
 static inline abi_ulong get_sp_from_cpustate(CPUSPARCState *state)
 {
-    return state->regwptr[UREG_FP];
+    return state->regwptr[WREG_SP];
 }
+
 #endif
-- 
2.21.0


