Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A55933A0D5
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 21:00:57 +0100 (CET)
Received: from localhost ([::1]:33016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLARU-0002kZ-CN
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 15:00:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAGt-0008Sa-VY
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:50:00 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAGs-0007Lu-Dn
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:49:59 -0500
Received: by mail-wr1-x435.google.com with SMTP id k8so3605018wrc.3
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E92VnqLwuF8/5Gj1qGvWBeROavRT6+04OcSXoUXN6bc=;
 b=Mq6OYJEtS1fTrb1NxhNkapBm0jb85tzUOvWAE65fJr1rpPWaQf6gIxcfbWWDe84e56
 swwwZvN8TRnUinci4GoBmNtOMWZy4iHFIypsNP8O4rzs3TvCjoWx/EYqN+F7bSHtbaNN
 QAYRcWVjd4EpxJ5mPZvkpXyDzqZmOb8H/lmvFQGEZCQSa/+VVtngn9L1s725IZV3NJtr
 IqOkZ17ddnHlsoJWGY7XhBsPTgRY888CIpaJtRoumhYJ2xqmrO9Q/MrJoH/T3a3wuPg5
 fWiMhQWq4n77bV0/0FhsXuCaWve1cfe7GMDGvXTQZoy+9GqiXbCmdS7s1tCQdkIFGl3h
 t6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=E92VnqLwuF8/5Gj1qGvWBeROavRT6+04OcSXoUXN6bc=;
 b=FyYkQ9Yc6JlRT0MDPb6R1he559dEAClHCkuDPy+m3RmpBU+UTEAq8R/6m8o8tRWdkA
 NvutMyvyvuWdizYmDRi1QMEAHW+TW3wRRXflO5G5+Lrc6TxcIPi64Ax805d9NCFtUfk+
 qBXZN7oCBnBVebuFsJMoqUtEGadectYTYtdcKALm/WkRQbRIT1U31K7cOKJYy85gpCsV
 J+qq9/NtM65NNZ6sNgv1sEfBD7mBnglE7EbGVrC/HAV0DGfxdgt/dktRljIiJx9hwnd4
 /kO+XPxGEpRCiO7ZKv7mi93PxBVV+7PzfGvJ4OZ/TIEuH6nKe5XidP4Z5jzp1IfGtzz6
 1vbw==
X-Gm-Message-State: AOAM532/4QlbcQCs3FzXcFUhIi9aIz87CxnkRRx2GoAIxS1FcIMfPEZf
 lbbWwRu+s1gTy0JN1Tn/zTPkdeuBenzn8Q==
X-Google-Smtp-Source: ABdhPJzs5XunLyNb/OJSLmUXQC9l7Pb6jf6NC7iVSDE4AAiRTiqhhqpk0wzSh1rv7uagp3YxUz/YAA==
X-Received: by 2002:a5d:6807:: with SMTP id w7mr19883830wru.103.1615664996641; 
 Sat, 13 Mar 2021 11:49:56 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id l9sm7030024wmq.2.2021.03.13.11.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 11:49:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/27] target/mips: Introduce mxu_translate_init() helper
Date: Sat, 13 Mar 2021 20:48:19 +0100
Message-Id: <20210313194829.2193621-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313194829.2193621-1-f4bug@amsat.org>
References: <20210313194829.2193621-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the MXU register initialization code from mips_tcg_init()
as a new mxu_translate_init() helper. Make it public and replace
!TARGET_MIPS64 ifdef'ry by the 'TARGET_LONG_BITS == 32' check to
elide this code at preprocessing time.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h |  1 +
 target/mips/translate.c | 28 ++++++++++++++++------------
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index a5c49f1ee22..a807b3d2566 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -179,6 +179,7 @@ extern TCGv bcond;
 void msa_translate_init(void);
 
 /* MXU */
+void mxu_translate_init(void);
 bool decode_ase_mxu(DisasContext *ctx, uint32_t insn);
 
 /* decodetree generated */
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 2139109744f..a1a9a850085 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -2045,7 +2045,20 @@ static const char * const mxuregnames[] = {
     "XR1",  "XR2",  "XR3",  "XR4",  "XR5",  "XR6",  "XR7",  "XR8",
     "XR9",  "XR10", "XR11", "XR12", "XR13", "XR14", "XR15", "MXU_CR",
 };
-#endif
+
+void mxu_translate_init(void)
+{
+    for (unsigned i = 0; i < NUMBER_OF_MXU_REGISTERS - 1; i++) {
+        mxu_gpr[i] = tcg_global_mem_new(cpu_env,
+                                        offsetof(CPUMIPSState, active_tc.mxu_gpr[i]),
+                                        mxuregnames[i]);
+    }
+
+    mxu_CR = tcg_global_mem_new(cpu_env,
+                                offsetof(CPUMIPSState, active_tc.mxu_cr),
+                                mxuregnames[NUMBER_OF_MXU_REGISTERS - 1]);
+}
+#endif /* !TARGET_MIPS64 */
 
 /* General purpose registers moves. */
 void gen_load_gpr(TCGv t, int reg)
@@ -28047,18 +28060,9 @@ void mips_tcg_init(void)
     cpu_llval = tcg_global_mem_new(cpu_env, offsetof(CPUMIPSState, llval),
                                    "llval");
 
-#if !defined(TARGET_MIPS64)
-    for (i = 0; i < NUMBER_OF_MXU_REGISTERS - 1; i++) {
-        mxu_gpr[i] = tcg_global_mem_new(cpu_env,
-                                        offsetof(CPUMIPSState,
-                                                 active_tc.mxu_gpr[i]),
-                                        mxuregnames[i]);
+    if (TARGET_LONG_BITS == 32) {
+        mxu_translate_init();
     }
-
-    mxu_CR = tcg_global_mem_new(cpu_env,
-                                offsetof(CPUMIPSState, active_tc.mxu_cr),
-                                mxuregnames[NUMBER_OF_MXU_REGISTERS - 1]);
-#endif /* !TARGET_MIPS64 */
 }
 
 void restore_state_to_opc(CPUMIPSState *env, TranslationBlock *tb,
-- 
2.26.2


