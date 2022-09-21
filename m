Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6225C0280
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 17:53:57 +0200 (CEST)
Received: from localhost ([::1]:34716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob22u-0000kG-61
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 11:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ob21J-0006UA-JZ
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:52:17 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:41293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ob21H-0006Bt-NC
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:52:17 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MZCrZ-1onyKS1P0L-00V4ac; Wed, 21
 Sep 2022 17:52:13 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 2/5] target/m68k: Fix MACSR to CCR
Date: Wed, 21 Sep 2022 17:52:08 +0200
Message-Id: <20220921155211.402559-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220921155211.402559-1-laurent@vivier.eu>
References: <20220921155211.402559-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nnqJ3MrRMuBEcK2Kv0wFZ2GPdzC+MoASgbQT9b0fR59pF15zrzG
 jO3A4SwFWpeQLOFW3C7R4yKyjiQkfRTteCPNgO1tR5MHsLzZz9iYxpM9l2I0LYkZnsHgEZo
 gXKv8odzFnugt++p+5DgBVHmJfxjeWnMYSD2fUYDSewpo2vwE5GoeIzB6GBZZSngusNYA0/
 p766PK1GzoFV2Z9SMG93w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Rya1V/2mp4I=:OkGzkoeAUiJZceb/QqkN91
 RMn9cubIeJKNddODLXZnz9PoZXpnAArDtDI36kaQU42oXjMNJ8LI1U/PgKNHFmL0w6WhGfHq0
 ZKHpHfDRhtIN+2H0cmYntTbwLYPpZRGytOg3ePqod9T8n048nxWh2rRuLx8wqVwrqqJ7Ehs8J
 YBvPN7yE1aB1M64ZZnGcjPpN7/wK3K/1DACYGxAc7m24h923pO7rMVFms0bXxP2/QeRWG2tIk
 C4WYsDBcQaZFgPxL5GR3o2H5YB8zsXfOH1AYD5P47+aQCnHkRkqrggOFT8s/94cUzZ1l1xP8I
 Y2pNxdqxvPWO+RTzyf3axZKH3ciLbHD8GbhJF/XJOcX3XifnWPx9bf9fxDdE+UQzLhJk//VuR
 +FS23jZy0TisEL2ZQLykuUR0O8nQ1WNJNLdC3V639eT1Yf9Gc/VCzRGILWugCUjVEr8KZiHI0
 wd95K4NAjreQGijL3Yfed59g1eiI3RCehZ1Y+T9VBShVWWna/l8P+zfCs+ai6z8KjzPCV0WcG
 iXp8xcwmd2NO9nsALm6JC4XmS7Q5eoO+YcGCA169hHj0NHj20F3cEPKffkHw5dQqnYRGAgqsX
 QKhSQ5tGkMUDnpPh10Rkzk5dzOWgu6uVVwshcnZtxLVMSyxGyEQlvwxaDawGjgWhhlikRZX1Z
 Z7db8aOHAi5HmkF8rzvF5JM9ZBWnfpIAMGgBfdlukA87zXEHkNeXeJcoMpotlPK8Q3b9oLFq4
 l7//KVD7D7CZW4ulV4kFV1VImvYmluzfk+QL4FWJyuofnIyZ+FTcZdfPCxyG9rlYfpnlt2rpi
 l2yRC4N
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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

From: Richard Henderson <richard.henderson@linaro.org>

First, we were writing to the entire SR register, instead
of only the flags portion.  Second, we were not clearing C
as per the documentation (X was cleared via the 0xf mask).

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220913142818.7802-2-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/translate.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index ffcc761d6011..c9bb05380323 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -5912,8 +5912,10 @@ DISAS_INSN(from_mext)
 DISAS_INSN(macsr_to_ccr)
 {
     TCGv tmp = tcg_temp_new();
-    tcg_gen_andi_i32(tmp, QREG_MACSR, 0xf);
-    gen_helper_set_sr(cpu_env, tmp);
+
+    /* Note that X and C are always cleared. */
+    tcg_gen_andi_i32(tmp, QREG_MACSR, CCF_N | CCF_Z | CCF_V);
+    gen_helper_set_ccr(cpu_env, tmp);
     tcg_temp_free(tmp);
     set_cc_op(s, CC_OP_FLAGS);
 }
-- 
2.37.3


