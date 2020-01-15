Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2EE13BE23
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 12:05:01 +0100 (CET)
Received: from localhost ([::1]:52060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irgTs-0002d1-Ts
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 06:05:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36478)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1irgT1-0002Cw-R1
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 06:04:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1irgT0-0005Ur-G8
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 06:04:07 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:44519)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1irgT0-0005U5-78
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 06:04:06 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M4K6z-1irxRo1ikr-000P0f; Wed, 15 Jan 2020 12:04:01 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH] m68k: Fix regression causing Single-Step via GDB/RSP to not
 single step
Date: Wed, 15 Jan 2020 12:03:59 +0100
Message-Id: <20200115110359.1885149-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:szrhL/JLSJLxoMy7WYuHN52PEJhvSYOTD1RP/BVtfjJXAQSULS/
 jd8s1MOB2pwerV0oFDJcQJjaXs1yl/k9s4X+Gf0Dzs2KzFFaT5tnnPwObM1MaLLv/hrS8vq
 ZIN3NWNPaugvOXXBN/UJ7g+uCktUxH59jyTbrHZ5/fXR0I6VTbzBkRUEuWJh1nCOKYogI6r
 r0QFJOo2nw3oWJO6ScZEQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:M480FcUBQ9I=:/iv6OR5/aBXOlFxhYfuUZx
 1syCtE+g/7EHxBwiOg6+/MXxsfZ/SC1KGqgvpJsfy+3WseYqpPc4aRkfiUtG086AWs2TSlRWl
 ma68XwORid/U3JmAxrFM58ZsYMMKStV/LhXxNjHxw0u8EJTd97XPNKufdSJ7sWXtvC5o4HyXv
 SGGBBoGcRgvn54Ggo1CplBCu71PXk7wQV919NS/pCoRe/6to7a8Bu9ZQBT/scpug+Spo2Os6z
 Gt7ZXVwZ5h6C6JaAYthJUPOYmePqekGDA4jYpJjUaDfVsB9Om0kx17KkMFuYL/lJpUko8jsIs
 YV7pPEEBQycYQv2dAEoe6bTGUC7E2jjhzXgXBICZTqUaus+IZolVOGvojFjGOqHlhniMLpanl
 ZeI71MY8j9+TQk2juuXYDL7xNuf7VUfirDVPqdzbaCLSFS/uC0UuQ++nPXe+NqQ0N/L/u4vYP
 mLveNL255hlz7jEOPclyUfa8VfUpdPI1N2BehEqmk5HuVEUrGe2RZfTZjDvH25shTy8cRIA8v
 L+UeyqD10z2b0xtLHxmZt3+O/zifDdHnbyZkOUSsDo0FqqlRgVdP+QjsPsR0VTIgal7AoOg3I
 xHtw2u3afOnopaExI2NKFB24o4hJe2cRuR+GiufZRINUS/A/bYxeT6vavg1EVcBhcjBqQajOO
 NAjZMRqCclSH91VFPo0EQkw+wXRyWO8fdfNXJehn9qjTTku3kev2CKcfTCvysRVumnc6xDa6t
 RcD/1PS9IaJfrgPqyt9ZhAnARkuMAvaIgbrev2FkaoWcbZP82J0jsLVdV8mrqrju05Lw+P0uU
 pZGiJj8EOpNnis+oms5t6zo5uR0ZcDkIennFauZRrJCw8YBPUlwGkaBOTd1GFGb1xPXWNBgmv
 4BmI5E9BlbjuragVY8lg==
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
Cc: Lucien Murray-Pitts <lucienmp_antispam@yahoo.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A regression that was introduced, with the refactor to TranslatorOps,
drops two lines that update the PC when single-stepping is being performed.

Fixes: 11ab74b01e0a ("target/m68k: Convert to TranslatorOps")
Reported-by: Lucien Murray-Pitts <lucienmp_antispam@yahoo.com>
Suggested-by: Lucien Murray-Pitts <lucienmp_antispam@yahoo.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---

Notes:
    v2: update patch from Lucien with changes from Richard
        update subject to prefix it with "m68k:"
        rebase

 target/m68k/translate.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index fcdb7bc8e4..a400c2295f 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -6198,29 +6198,36 @@ static void m68k_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    if (dc->base.is_jmp == DISAS_NORETURN) {
-        return;
-    }
-    if (dc->base.singlestep_enabled) {
-        gen_helper_raise_exception(cpu_env, tcg_const_i32(EXCP_DEBUG));
-        return;
-    }
-
     switch (dc->base.is_jmp) {
+    case DISAS_NORETURN:
+        break;
     case DISAS_TOO_MANY:
         update_cc_op(dc);
-        gen_jmp_tb(dc, 0, dc->pc);
+        if (dc->base.singlestep_enabled) {
+            tcg_gen_movi_i32(QREG_PC, dc->pc);
+            gen_helper_raise_exception(cpu_env, tcg_const_i32(EXCP_DEBUG));
+        } else {
+            gen_jmp_tb(dc, 0, dc->pc);
+        }
         break;
     case DISAS_JUMP:
         /* We updated CC_OP and PC in gen_jmp/gen_jmp_im.  */
-        tcg_gen_lookup_and_goto_ptr();
+        if (dc->base.singlestep_enabled) {
+            gen_helper_raise_exception(cpu_env, tcg_const_i32(EXCP_DEBUG));
+        } else {
+            tcg_gen_lookup_and_goto_ptr();
+        }
         break;
     case DISAS_EXIT:
         /*
          * We updated CC_OP and PC in gen_exit_tb, but also modified
          * other state that may require returning to the main loop.
          */
-        tcg_gen_exit_tb(NULL, 0);
+        if (dc->base.singlestep_enabled) {
+            gen_helper_raise_exception(cpu_env, tcg_const_i32(EXCP_DEBUG));
+        } else {
+            tcg_gen_exit_tb(NULL, 0);
+        }
         break;
     default:
         g_assert_not_reached();
-- 
2.24.1


