Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94345447C8
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 11:41:18 +0200 (CEST)
Received: from localhost ([::1]:54666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzEfF-00074l-EI
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 05:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7S-0001ZL-7c
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:22 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7Q-0005wl-AN
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:21 -0400
Received: by mail-wr1-x436.google.com with SMTP id k16so31477811wrg.7
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EuesFPP2ejmD1fMqQKFfEmxikNEPVrFLtiBcjEpaFDk=;
 b=eMZ6cqXEA7rm1G6az+CJ/89YVforU6AL/xrTqOn7qWmJwniNPn+CQlofDzxNN2gipE
 AG5aFAwfIqcriNAg+rQc9Ms/vDGMcLiSj5h4wqmenczjxf7MDRBrFmmX6CeO9qXRdddJ
 okDY+Mn+cNLS6wjXhgz7yZsOHoOvllT7Eb2MOeXHrCP6JIPLkaKgOnQoVFsAjt0HGzo/
 zaeTJgtF5XfjUXRzTcm1V4pAV+RiHXVd6QEvjlGEBL02zBmQnk5wJJouZf4+CPpNfni0
 Po+tOu/MKA14C/zcl0rJAEXvIuip4uyEWykSrE06CQCeiaKJg6Ma2dlV2FAuJIfegcL4
 fusw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EuesFPP2ejmD1fMqQKFfEmxikNEPVrFLtiBcjEpaFDk=;
 b=Vn0TD4K6+Y8Obbvt7p1p6p0XMHmbZGubdHvzhFnTTEJBXrzGTvIoBVEFHcZAUOWp0V
 96ZdlKSpW7MHWr4Pojj/5bJRwso6pZaZug/vANME8qYSfZ31xnOKiJL0aYnS683IcNDx
 ASZvVhs1/i6P4zVLhOHrs5pouGEp+A9VReAxztNVHtPTn439DjtccoSaCNfVsRjwVwR1
 DBrSICvHW7YbYGHu0Ah8hwHIgb07NO5LNXn51iGHliMPVbSeKkEXBfDvSpx+IEolTl02
 V+fWsc3r0lUSIkUDIt8GLTiy5X1meRWEP8YivNPbwFxwnGLozclb3waUP2NOueXJo7Ch
 WiBA==
X-Gm-Message-State: AOAM530ruAZXMbj/VO5pnnOa0mH6u/C3DUsYY3ywViDkYjSA/4tPUC34
 YHH6Pq4nQCyiwEJlnLl7+bseoBoVUdTiaw==
X-Google-Smtp-Source: ABdhPJx04aIAuDrm1FMf0ABenZFJQ0+NNaMrPTfT+Uqy4WoKlASDESEUUodFtqcr8b04tn2qlajHNg==
X-Received: by 2002:a05:6000:1547:b0:218:568a:bd2e with SMTP id
 7-20020a056000154700b00218568abd2emr10444077wry.716.1654765579600; 
 Thu, 09 Jun 2022 02:06:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/55] target/arm: Rename TBFLAG_A64 ZCR_LEN to VL
Date: Thu,  9 Jun 2022 10:05:18 +0100
Message-Id: <20220609090537.1971756-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Richard Henderson <richard.henderson@linaro.org>

With SME, the vector length does not only come from ZCR_ELx.
Comment that this is either NVL or SVL, like the pseudocode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220607203306.657998-2-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           | 3 ++-
 target/arm/translate-a64.h | 2 +-
 target/arm/translate.h     | 2 +-
 target/arm/helper.c        | 2 +-
 target/arm/translate-a64.c | 2 +-
 target/arm/translate-sve.c | 2 +-
 6 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 0ee1705a4fa..e791ffdd6b6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3241,7 +3241,8 @@ FIELD(TBFLAG_M32, MVE_NO_PRED, 5, 1)            /* Not cached. */
  */
 FIELD(TBFLAG_A64, TBII, 0, 2)
 FIELD(TBFLAG_A64, SVEEXC_EL, 2, 2)
-FIELD(TBFLAG_A64, ZCR_LEN, 4, 4)
+/* The current vector length, either NVL or SVL. */
+FIELD(TBFLAG_A64, VL, 4, 4)
 FIELD(TBFLAG_A64, PAUTH_ACTIVE, 8, 1)
 FIELD(TBFLAG_A64, BT, 9, 1)
 FIELD(TBFLAG_A64, BTYPE, 10, 2)         /* Not cached. */
diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index f2e8ee0ee1f..dbc917ee65b 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -104,7 +104,7 @@ static inline TCGv_ptr vec_full_reg_ptr(DisasContext *s, int regno)
 /* Return the byte size of the "whole" vector register, VL / 8.  */
 static inline int vec_full_reg_size(DisasContext *s)
 {
-    return s->sve_len;
+    return s->vl;
 }
 
 bool disas_sve(DisasContext *, uint32_t);
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 9f0bb270c5b..f473a21ed48 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -42,7 +42,7 @@ typedef struct DisasContext {
     bool ns;        /* Use non-secure CPREG bank on access */
     int fp_excp_el; /* FP exception EL or 0 if enabled */
     int sve_excp_el; /* SVE exception EL or 0 if enabled */
-    int sve_len;     /* SVE vector length in bytes */
+    int vl;          /* current vector length in bytes */
     /* Flag indicating that exceptions from secure mode are routed to EL3. */
     bool secure_routed_to_el3;
     bool vfp_enabled; /* FP enabled via FPSCR.EN */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 37cf9fa6aba..c228deca755 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11181,7 +11181,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
             zcr_len = sve_zcr_len_for_el(env, el);
         }
         DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
-        DP_TBFLAG_A64(flags, ZCR_LEN, zcr_len);
+        DP_TBFLAG_A64(flags, VL, zcr_len);
     }
 
     sctlr = regime_sctlr(env, stage1);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 935e1929bb9..d438fb89e73 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14608,7 +14608,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
     dc->pstate_il = EX_TBFLAG_ANY(tb_flags, PSTATE__IL);
     dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
-    dc->sve_len = (EX_TBFLAG_A64(tb_flags, ZCR_LEN) + 1) * 16;
+    dc->vl = (EX_TBFLAG_A64(tb_flags, VL) + 1) * 16;
     dc->pauth_active = EX_TBFLAG_A64(tb_flags, PAUTH_ACTIVE);
     dc->bt = EX_TBFLAG_A64(tb_flags, BT);
     dc->btype = EX_TBFLAG_A64(tb_flags, BTYPE);
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 836511d7191..67761bf2cc5 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -111,7 +111,7 @@ static inline int pred_full_reg_offset(DisasContext *s, int regno)
 /* Return the byte size of the whole predicate register, VL / 64.  */
 static inline int pred_full_reg_size(DisasContext *s)
 {
-    return s->sve_len >> 3;
+    return s->vl >> 3;
 }
 
 /* Round up the size of a register to a size allowed by
-- 
2.25.1


