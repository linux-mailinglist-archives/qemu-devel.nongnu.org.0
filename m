Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCD0F4C06
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 13:45:46 +0100 (CET)
Received: from localhost ([::1]:53240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT3e5-0003KW-Ih
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 07:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45981)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1iT3bB-0001b1-TW
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 07:42:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <edgar.iglesias@gmail.com>) id 1iT3bA-0000Ot-MZ
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 07:42:45 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:52308)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
 id 1iT3bA-0000L7-Ez
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 07:42:44 -0500
Received: by mail-wm1-x341.google.com with SMTP id c17so6058217wmk.2
 for <qemu-devel@nongnu.org>; Fri, 08 Nov 2019 04:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9JFteoyFShjxDG1bJSY5A5RCb3N4szoLWvl3shrMJDg=;
 b=SVhQ8nIfLm3NFz7n5Kn4X5uEqIW83SpAoIQ/IIyUNKA/lBQCXm35v58588Et/vlL7D
 KQYP8rjXad7zUuDccUzsuRKbGOob7Q/+oceNQNzn+eqBQYP2LF22HlAroO0zm6tRjxyM
 Q9akNDHp3tZvGfOc+uqNMv85uQjyEKqjLBsFbJO1VWJn+d/AeEUkkzxWEJ/+5W4gExd3
 N0cUe0baUvO2tzbqQHPztxP1YVls9EQidlISgdGVBZHCCeGY7NYSpPQGTArijCn7B/ss
 MoZYGtQASS0e65P5ZCOxyHWQncZWr5iAkowMAKXnrZ0AxC0N3VysUB2oZpejIQpHNkYk
 XdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9JFteoyFShjxDG1bJSY5A5RCb3N4szoLWvl3shrMJDg=;
 b=husZ+ukn7JSkhmySa+UkOdStOv3FpF3b3tSR61gR0tCLQdgTTdASVu658VfQWmBdgg
 uwQx+nwMTgqawMpQdhNmOc1YVw+2+0GqjayfXxO6WiZ8aKqEmVvwO1MjslRgF1AKI5PP
 NsqMoqEEXZyKzkdxrziPoKoast0AWVY95agzHP6X9oZwg1IfRrK4nwOTPEIfmTkQ2hyl
 K9x5qZ06a3d6VQm/Hr71Af6SB/PVXlB7TC1ympmykwlkbKxKjG4BknC1b59gvOBP3Byc
 8Sgl3buPFmhzpRPk3KTSjihfuDqCTPulRZiPR2zEnnJORuj5AsAgdKfrQDcCX74IerJa
 K5tw==
X-Gm-Message-State: APjAAAXFDdEOJCXM+J+O1AK+i3WAm0T6lSJyPmc1RywlVWeZnVHp0o+Y
 ZMj4lmqRe2lTmgC8REfZPqqQ6/X8s2o=
X-Google-Smtp-Source: APXvYqzZd4QXgPqIW0fOYm22ZWWNYnvs84UVyFK8JJFkOon52ozmalhXCejj6PfioVXRAYxnHNuF2Q==
X-Received: by 2002:a7b:c7c7:: with SMTP id z7mr7624314wmk.133.1573216962944; 
 Fri, 08 Nov 2019 04:42:42 -0800 (PST)
Received: from localhost (ec2-34-244-242-0.eu-west-1.compute.amazonaws.com.
 [34.244.242.0])
 by smtp.gmail.com with ESMTPSA id r5sm5732026wrl.86.2019.11.08.04.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 04:42:42 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] target/microblaze: Plug temp leaks for loads/stores
Date: Fri,  8 Nov 2019 13:42:17 +0100
Message-Id: <20191108124219.31348-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191108124219.31348-1-edgar.iglesias@gmail.com>
References: <20191108124219.31348-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, philmd@redhat.com,
 luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Simplify endian reversion of address also plugging TCG temp
leaks for loads/stores.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/microblaze/translate.c | 46 +++++++++++++++--------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 761f535357..c8442b18e1 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -962,17 +962,7 @@ static void dec_load(DisasContext *dc)
         switch (size) {
             case 1:
             {
-                /* 00 -> 11
-                   01 -> 10
-                   10 -> 10
-                   11 -> 00 */
-                TCGv low = tcg_temp_new();
-
-                tcg_gen_andi_tl(low, addr, 3);
-                tcg_gen_sub_tl(low, tcg_const_tl(3), low);
-                tcg_gen_andi_tl(addr, addr, ~3);
-                tcg_gen_or_tl(addr, addr, low);
-                tcg_temp_free(low);
+                tcg_gen_xori_tl(addr, addr, 3);
                 break;
             }
 
@@ -1006,9 +996,16 @@ static void dec_load(DisasContext *dc)
     tcg_gen_qemu_ld_i32(v, addr, mem_index, mop);
 
     if ((dc->cpu->env.pvr.regs[2] & PVR2_UNALIGNED_EXC_MASK) && size > 1) {
+        TCGv_i32 t0 = tcg_const_i32(0);
+        TCGv_i32 treg = tcg_const_i32(dc->rd);
+        TCGv_i32 tsize = tcg_const_i32(size - 1);
+
         tcg_gen_movi_i64(cpu_SR[SR_PC], dc->pc);
-        gen_helper_memalign(cpu_env, addr, tcg_const_i32(dc->rd),
-                            tcg_const_i32(0), tcg_const_i32(size - 1));
+        gen_helper_memalign(cpu_env, addr, treg, t0, tsize);
+
+        tcg_temp_free_i32(t0);
+        tcg_temp_free_i32(treg);
+        tcg_temp_free_i32(tsize);
     }
 
     if (ex) {
@@ -1095,17 +1092,7 @@ static void dec_store(DisasContext *dc)
         switch (size) {
             case 1:
             {
-                /* 00 -> 11
-                   01 -> 10
-                   10 -> 10
-                   11 -> 00 */
-                TCGv low = tcg_temp_new();
-
-                tcg_gen_andi_tl(low, addr, 3);
-                tcg_gen_sub_tl(low, tcg_const_tl(3), low);
-                tcg_gen_andi_tl(addr, addr, ~3);
-                tcg_gen_or_tl(addr, addr, low);
-                tcg_temp_free(low);
+                tcg_gen_xori_tl(addr, addr, 3);
                 break;
             }
 
@@ -1124,6 +1111,10 @@ static void dec_store(DisasContext *dc)
 
     /* Verify alignment if needed.  */
     if ((dc->cpu->env.pvr.regs[2] & PVR2_UNALIGNED_EXC_MASK) && size > 1) {
+        TCGv_i32 t1 = tcg_const_i32(1);
+        TCGv_i32 treg = tcg_const_i32(dc->rd);
+        TCGv_i32 tsize = tcg_const_i32(size - 1);
+
         tcg_gen_movi_i64(cpu_SR[SR_PC], dc->pc);
         /* FIXME: if the alignment is wrong, we should restore the value
          *        in memory. One possible way to achieve this is to probe
@@ -1131,8 +1122,11 @@ static void dec_store(DisasContext *dc)
          *        the alignment checks in between the probe and the mem
          *        access.
          */
-        gen_helper_memalign(cpu_env, addr, tcg_const_i32(dc->rd),
-                            tcg_const_i32(1), tcg_const_i32(size - 1));
+        gen_helper_memalign(cpu_env, addr, treg, t1, tsize);
+
+        tcg_temp_free_i32(t1);
+        tcg_temp_free_i32(treg);
+        tcg_temp_free_i32(tsize);
     }
 
     if (ex) {
-- 
2.20.1


