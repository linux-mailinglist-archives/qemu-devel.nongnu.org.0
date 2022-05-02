Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E91A6516AA2
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 08:06:33 +0200 (CEST)
Received: from localhost ([::1]:44424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlPCa-0007Ax-Fv
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 02:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nlP8e-00068e-Au
 for qemu-devel@nongnu.org; Mon, 02 May 2022 02:02:29 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nlP8c-0002IE-MH
 for qemu-devel@nongnu.org; Mon, 02 May 2022 02:02:28 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so3325844pjv.4
 for <qemu-devel@nongnu.org>; Sun, 01 May 2022 23:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qtzaf5i1ojClLuW9yjfdQgtUBTOsPhQs1atEdoXlipk=;
 b=ArMKGUorm7em4xlua9Ro9QbzMVIxUj1CrfXmo1e1smnVqoaV3FZF6JLW5ghQR3Kxwa
 pEnO7o5LD4l0tOkesK4nRpdedzP/2bhXiKLlZLtpqH1GvZW7B9hAL/60xtuaeKzjHZAa
 9eNKCd2yuBuyOX0GyIdSZaPXh3NGcGJAt+PtryAb3FHFWJuFkGLLfAZnKfepvL9tkUZZ
 QfTM5IEbHMdrjszOZ8jtzFpG/wXNXBCXiFjBoOzANemskqwMc9LWMxWWc3z4VLlLfjrR
 MTHwLfZ69+ZSi96bf+gyxfaE5iYI9QPfbQPeydlubyVRvd63D/OqIMBrGTqagcgLJNi8
 oR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qtzaf5i1ojClLuW9yjfdQgtUBTOsPhQs1atEdoXlipk=;
 b=J4cP2EjGCqH1QHiybvgskB0m1QX/W8vXYlKHTu0ZKIJ91OiB4gZ6Aiijj/c/VUYIgs
 pMMcsqHQvnEsxF5iBNxK51SmH4X64c2C0gAP0eXTyDVuMp8vouJiJryr9S+KmOVvv8Bc
 UJx6laZdTcHvu/WNYWSdE8d0hz6DEbJWqcjlAGfX+Dkjos4pIxijCh/tebFDhyAiPrhM
 LO5SegDYLUPq+EU4qwSHRLNaPSfb/QZkvLo00LHNNpe1VnvBSFkfHYwJsK/xy2Mppj13
 cO5ZdPnBlpL/HHDfTnuBxhYLcdivU4EPM1f8hXi/+4FqWhWOycp+7FDWX2IEY+6kHAJE
 xNTw==
X-Gm-Message-State: AOAM531LcvtV6cEpIonbigOpr6lGh0+L6CAJK3owgVl20BvCenUyJlVq
 CqMyO6TZRrLgh0veAB1dKmU0rLmlgCE=
X-Google-Smtp-Source: ABdhPJyIRcCMr0wnFeC2Fwo7EmFMmDfNUamqUrgoGtyd5STOML4Wcj7FZys1klSZ2DACmRlWfBHyIA==
X-Received: by 2002:a17:90a:8a92:b0:1d7:3cca:69d8 with SMTP id
 x18-20020a17090a8a9200b001d73cca69d8mr16358628pjn.61.1651471344750; 
 Sun, 01 May 2022 23:02:24 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:fa8:c0d6:ea14:bd48])
 by smtp.gmail.com with ESMTPSA id
 m7-20020aa79007000000b0050dc7628189sm3923373pfo.99.2022.05.01.23.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 23:02:24 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/xtensa: implement cache test option opcodes
Date: Sun,  1 May 2022 23:02:14 -0700
Message-Id: <20220502060214.1729948-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't model caches, so for l*ct opcodes return tags with all bits
(including Valid) set to 0. For all other opcodes don't do anything.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/translate.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 0cc44e9b3aba..3ade428a1bd3 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1765,6 +1765,12 @@ static void translate_ldst(DisasContext *dc, const OpcodeArg arg[],
     tcg_temp_free(addr);
 }
 
+static void translate_lct(DisasContext *dc, const OpcodeArg arg[],
+                          const uint32_t par[])
+{
+    tcg_gen_movi_i32(arg[0].out, 0);
+}
+
 static void translate_l32r(DisasContext *dc, const OpcodeArg arg[],
                            const uint32_t par[])
 {
@@ -3318,6 +3324,14 @@ static const XtensaOpcodeOps core_ops[] = {
         .translate = translate_ldst,
         .par = (const uint32_t[]){MO_UB, false, false},
         .op_flags = XTENSA_OP_LOAD,
+    }, {
+        .name = "ldct",
+        .translate = translate_lct,
+        .op_flags = XTENSA_OP_PRIVILEGED,
+    }, {
+        .name = "ldcw",
+        .translate = translate_nop,
+        .op_flags = XTENSA_OP_PRIVILEGED,
     }, {
         .name = "lddec",
         .translate = translate_mac16,
@@ -3331,6 +3345,14 @@ static const XtensaOpcodeOps core_ops[] = {
     }, {
         .name = "ldpte",
         .op_flags = XTENSA_OP_ILL,
+    }, {
+        .name = "lict",
+        .translate = translate_lct,
+        .op_flags = XTENSA_OP_PRIVILEGED,
+    }, {
+        .name = "licw",
+        .translate = translate_nop,
+        .op_flags = XTENSA_OP_PRIVILEGED,
     }, {
         .name = (const char * const[]) {
             "loop", "loop.w15", NULL,
@@ -4634,12 +4656,28 @@ static const XtensaOpcodeOps core_ops[] = {
         .name = "saltu",
         .translate = translate_salt,
         .par = (const uint32_t[]){TCG_COND_LTU},
+    }, {
+        .name = "sdct",
+        .translate = translate_nop,
+        .op_flags = XTENSA_OP_PRIVILEGED,
+    }, {
+        .name = "sdcw",
+        .translate = translate_nop,
+        .op_flags = XTENSA_OP_PRIVILEGED,
     }, {
         .name = "setb_expstate",
         .translate = translate_setb_expstate,
     }, {
         .name = "sext",
         .translate = translate_sext,
+    }, {
+        .name = "sict",
+        .translate = translate_nop,
+        .op_flags = XTENSA_OP_PRIVILEGED,
+    }, {
+        .name = "sicw",
+        .translate = translate_nop,
+        .op_flags = XTENSA_OP_PRIVILEGED,
     }, {
         .name = "simcall",
         .translate = translate_simcall,
-- 
2.30.2


