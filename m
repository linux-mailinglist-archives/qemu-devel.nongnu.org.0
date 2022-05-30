Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6185386F6
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 20:01:18 +0200 (CEST)
Received: from localhost ([::1]:60428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjhd-00064V-DT
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 14:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwS-0003w9-AD
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:29 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwL-0007Mm-VE
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:27 -0400
Received: by mail-wr1-x429.google.com with SMTP id s24so7958985wrb.10
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DdWcBdfKkOMkgAvfhlhQLbGKNqFirJCaLZypma6j4Gk=;
 b=Djbrtjz4DMgmMjY7iEZUXFzOidibZWrHOw0QYnV978yFrosWA4SP8FuRLQ4rPYhvpn
 qnyGXatUy+mXY+EeNzBBSzshvRgIf9gzKoV4yD6s0kdcklKR1L/YvEC3duME1MO1z5t/
 E/Vz0IXtAVesg0WSArKVdaJ0dc93kC6OAtK2JQ4sJ2CnSF3L1uCoPGNtFb4NQuqNhPIr
 RaY46mphmDOPqWlskIfG5O885BnPGLEhA/zYTW4j+vzDOP88QYIOQnLwLQEZNM6TlwMt
 tr+m+MxoBXWwSLA5j4pBmiGGdaaRkZrKJl+g4jPAG0xcWAGDKyA616k+WRl36+f3Vh9b
 29gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DdWcBdfKkOMkgAvfhlhQLbGKNqFirJCaLZypma6j4Gk=;
 b=4w3vvBKClu2xbkOgt/Y7ESdvetcWVQJ8fG5ArbcUgUOiq5yTDZBXnDupisjgaooiJd
 W4qscCe8N7QE2V6YH0J6eBJlwKFkTeiXmxpApiwyS5eSohWNI3OREYisKREm1e37Bl0E
 RRP2Jtaut/vAZewb/J1LWB7enjVj0bVj3d2v7w7L6zFADZTmIhw/8ZmWeIkh+rQ3U0Xw
 KngaKu0a21kuuQGUbFEqKaj403f5+rZkeh/y/M3025pSvZLt5+zMCZbpzMLtfkwdwd18
 WhW4ix0cuwrGec1pikVQfmlPGfDbyN8BFiQcwfYmEKmxTqwp5pFM0jZNara4cwxgeB+P
 Ca7A==
X-Gm-Message-State: AOAM530FMzoQYOegrCwOH/GTGLjNxuW+wvff+wp+Hv48cFpSzg+k4knt
 LW/gizWeEYspgJR1VNFMPmNgTCBYBGZPJQ==
X-Google-Smtp-Source: ABdhPJwpwIx5n4MJ1CEmODbpm8GBz5gqW24XWh2iZnVWujSAvRTL0/9HVTP7QvO3/eBkJJRyz+9ASw==
X-Received: by 2002:adf:ea04:0:b0:210:134:4398 with SMTP id
 q4-20020adfea04000000b0021001344398mr21244402wrm.356.1653926901105; 
 Mon, 30 May 2022 09:08:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 076/117] target/arm: Reject copy w/ shifted byte early
Date: Mon, 30 May 2022 17:06:27 +0100
Message-Id: <20220530160708.726466-77-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

Remove the unparsed extractions in trans_CPY_{m,z}_i which are intended
to reject an 8-bit shift of an 8-bit constant for 8-bit element.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-74-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve.decode      | 10 ++++++++--
 target/arm/translate-sve.c |  6 ------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 8cff63cf257..7e79198f5ba 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -528,8 +528,14 @@ DUPM            00000101 11 0000 dbm:13 rd:5
 FCPY            00000101 .. 01 .... 110 imm:8 .....             @rdn_pg4
 
 # SVE copy integer immediate (predicated)
-CPY_m_i         00000101 .. 01 .... 01 . ........ .....   @rdn_pg4 imm=%sh8_i8s
-CPY_z_i         00000101 .. 01 .... 00 . ........ .....   @rdn_pg4 imm=%sh8_i8s
+{
+  INVALID       00000101 00 01 ---- 01 1 -------- -----
+  CPY_m_i       00000101 .. 01 .... 01 . ........ .....   @rdn_pg4 imm=%sh8_i8s
+}
+{
+  INVALID       00000101 00 01 ---- 00 1 -------- -----
+  CPY_z_i       00000101 .. 01 .... 00 . ........ .....   @rdn_pg4 imm=%sh8_i8s
+}
 
 ### SVE Permute - Extract Group
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index bf988cab3eb..83980f5ee6b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2024,9 +2024,6 @@ static bool trans_FCPY(DisasContext *s, arg_FCPY *a)
 
 static bool trans_CPY_m_i(DisasContext *s, arg_rpri_esz *a)
 {
-    if (a->esz == 0 && extract32(s->insn, 13, 1)) {
-        return false;
-    }
     if (sve_access_check(s)) {
         do_cpy_m(s, a->esz, a->rd, a->rn, a->pg, tcg_constant_i64(a->imm));
     }
@@ -2040,9 +2037,6 @@ static bool trans_CPY_z_i(DisasContext *s, arg_CPY_z_i *a)
         gen_helper_sve_cpy_z_s, gen_helper_sve_cpy_z_d,
     };
 
-    if (a->esz == 0 && extract32(s->insn, 13, 1)) {
-        return false;
-    }
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
         tcg_gen_gvec_2i_ool(vec_full_reg_offset(s, a->rd),
-- 
2.25.1


