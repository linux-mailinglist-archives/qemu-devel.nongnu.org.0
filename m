Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD8E5355FC
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 00:06:23 +0200 (CEST)
Received: from localhost ([::1]:38122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLcc-0001OQ-Ab
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 18:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCd-0001zN-Vv; Thu, 26 May 2022 17:39:33 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:41787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCc-0008Bz-BB; Thu, 26 May 2022 17:39:31 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 g13-20020a9d6b0d000000b0060b13026e0dso1795674otp.8; 
 Thu, 26 May 2022 14:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ec57wqfj4/4HaYaaPMeNNLCFRUZkog8v+rdAl0XYud4=;
 b=HiVBwELznCkGd+JmGLz9W+dU5/4neUSGSYqI6GydgmQEsxIbfZ1YHd6Sto//jziJOF
 tcDowsSska2bJ0eSt6Drj6dd43R0d5EL0RQP6TX2XngkhB7sTiGnWpG3d4c0SOhyFzb4
 RDTyUhyz5lC3ZfMEwCDw/CakuLnKvCNkZjX6bPM2pFM2uziHSjEkXmJr2hOxWPI2gD8d
 qNcKhGQznclKM1EYQSmXG1rP4eZLS3gJ/SlQyifvtZ3+2tbrSbBRKblNLjbUFrO2c9kP
 9Cz4MpB7qzcDl04u3RVFBqjKC3guSvhZsHBRgbR6L8REeA08JclJFmN/Fu/ySaGPySav
 QDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ec57wqfj4/4HaYaaPMeNNLCFRUZkog8v+rdAl0XYud4=;
 b=mcVB8eMEce30eE7MhBBfqpyD2RdoJvc2U0gMiTXm9rxyZtG0oHd4ypjzTR4xtQE0Ka
 QMSW1dePhkuPWI8j33ojsqNcQYNhL/lO8dXpVG6SILFH29xoehz5VLvgzop+Z6bUG7z1
 JMaO2KhQnJ9T0Nqdp4dhHloijyHQ1Us5lTELIO5uQYTpUPPMMZTg0q4HV2cvF0AHWYfX
 mgi+fJ79rgPNyDNDWk8EPStePRvPGnu5iBzSqY0/cO9zVGdy3Vw6TQd5LWSUUiowb632
 CJqnlSWPXWkaEyCDwp0iuky6cGf+7b6n54+2AU3vbh0WSTESzYyWwB14EVs6/hU5Y1kc
 EZVQ==
X-Gm-Message-State: AOAM532ZD325WTPwQPLVOgrOmpiwwVKuFhh9DH0lMnb5/npIvP91Wffq
 2RT0d1jBveQglq7VpT5pjsKW0aaUAYI=
X-Google-Smtp-Source: ABdhPJxJW0R/I8NqpVMzDV9RAxFMRks/OCLp6nzOswDL+09FQqnCZn9gkY6l6/5hFZeSdCWUo/80Pg==
X-Received: by 2002:a9d:69d7:0:b0:60b:cee:4cd0 with SMTP id
 v23-20020a9d69d7000000b0060b0cee4cd0mr9408198oto.145.1653601168742; 
 Thu, 26 May 2022 14:39:28 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:39:28 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 20/34] target/ppc: declare vmsum[um]bm helpers with call flags
Date: Thu, 26 May 2022 18:38:01 -0300
Message-Id: <20220526213815.92701-21-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Move vmsumubm and vmsummbm to decodetree, declare both helpers with
TCG_CALL_NO_RWG, and drop the unused env argument.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220517123929.284511-11-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                 | 4 ++--
 target/ppc/insn32.decode            | 3 +++
 target/ppc/int_helper.c             | 6 ++----
 target/ppc/translate/vmx-impl.c.inc | 5 ++++-
 target/ppc/translate/vmx-ops.c.inc  | 2 --
 5 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 640a70cd5c..f0761fe38d 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -223,8 +223,8 @@ DEF_HELPER_FLAGS_2(vupkhsw, TCG_CALL_NO_RWG, void, avr, avr)
 DEF_HELPER_FLAGS_2(vupklsb, TCG_CALL_NO_RWG, void, avr, avr)
 DEF_HELPER_FLAGS_2(vupklsh, TCG_CALL_NO_RWG, void, avr, avr)
 DEF_HELPER_FLAGS_2(vupklsw, TCG_CALL_NO_RWG, void, avr, avr)
-DEF_HELPER_5(vmsumubm, void, env, avr, avr, avr, avr)
-DEF_HELPER_5(vmsummbm, void, env, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_4(VMSUMUBM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_4(VMSUMMBM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_4(VPERM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_4(VPERMR, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_4(vpkshss, void, env, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 435cf1320c..fdb8d76456 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -599,6 +599,9 @@ VMULLD          000100 ..... ..... ..... 00111001001    @VX
 
 ## Vector Multiply-Sum Instructions
 
+VMSUMUBM        000100 ..... ..... ..... ..... 100100   @VA
+VMSUMMBM        000100 ..... ..... ..... ..... 100101   @VA
+
 VMSUMCUD        000100 ..... ..... ..... ..... 010111   @VA
 VMSUMUDM        000100 ..... ..... ..... ..... 100011   @VA
 
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 9a361ad241..85a7442103 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -875,8 +875,7 @@ VMRG(w, u32, VsrW)
 #undef VMRG_DO
 #undef VMRG
 
-void helper_vmsummbm(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
-                     ppc_avr_t *b, ppc_avr_t *c)
+void helper_VMSUMMBM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
 {
     int32_t prod[16];
     int i;
@@ -928,8 +927,7 @@ void helper_vmsumshs(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
     }
 }
 
-void helper_vmsumubm(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
-                     ppc_avr_t *b, ppc_avr_t *c)
+void helper_VMSUMUBM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
 {
     uint16_t prod[16];
     int i;
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index e66301c007..4cbd724641 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2587,9 +2587,12 @@ static bool trans_VSEL(DisasContext *ctx, arg_VA *a)
     return true;
 }
 
-GEN_VAFORM_PAIRED(vmsumubm, vmsummbm, 18)
 GEN_VAFORM_PAIRED(vmsumuhm, vmsumuhs, 19)
 GEN_VAFORM_PAIRED(vmsumshm, vmsumshs, 20)
+
+TRANS_FLAGS(ALTIVEC, VMSUMUBM, do_va_helper, gen_helper_VMSUMUBM)
+TRANS_FLAGS(ALTIVEC, VMSUMMBM, do_va_helper, gen_helper_VMSUMMBM)
+
 GEN_VAFORM_PAIRED(vmaddfp, vnmsubfp, 23)
 
 GEN_VXFORM_NOA(vclzb, 1, 28)
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index d960648d52..5b85322c06 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -221,11 +221,9 @@ GEN_VXFORM_UIMM(vcfsx, 5, 13),
 GEN_VXFORM_UIMM(vctuxs, 5, 14),
 GEN_VXFORM_UIMM(vctsxs, 5, 15),
 
-
 #define GEN_VAFORM_PAIRED(name0, name1, opc2)                           \
     GEN_HANDLER(name0##_##name1, 0x04, opc2, 0xFF, 0x00000000, PPC_ALTIVEC)
 GEN_VAFORM_PAIRED(vmhaddshs, vmhraddshs, 16),
-GEN_VAFORM_PAIRED(vmsumubm, vmsummbm, 18),
 GEN_VAFORM_PAIRED(vmsumuhm, vmsumuhs, 19),
 GEN_VAFORM_PAIRED(vmsumshm, vmsumshs, 20),
 GEN_VAFORM_PAIRED(vmaddfp, vnmsubfp, 23),
-- 
2.36.1


