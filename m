Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CF35704E7
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:03:06 +0200 (CEST)
Received: from localhost ([::1]:48232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAu08-00040F-Ul
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvD-0006L6-Vf
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:00 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvC-0002ng-2u
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:57:59 -0400
Received: by mail-wr1-x432.google.com with SMTP id h17so7181291wrx.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7NGRjcW6POBMRqlOP/cTnnyIXKw34HJdhD9MVrSH9hs=;
 b=YGfk2a3o145gMr7ZaO0pMjMZiC9R/Dxnvmbrph4eD9ep9e2pdT6dQKldkNcFcU+zHH
 vusdzwas6L2JFBS1H6h/3IfdPY24EMWNhNOleiFN5n3eqfaBzahy622DRtbbh2U3J+dT
 6lr7ZVneRpwM69T53XiZhQQsIDj2d+G+42SBL47C2cgVagyJRgUNfW5mIhG5VnmhNy9y
 8NiH3BsfVXDk198Wq/OWcLQTFkKqo4dPY1Qs9RHlgHu0gbqClV0G6PpPxaq5Lis7MkeQ
 sqwp5Dutrj0UIIfJg0dI/8eV73HNmdHrTVInYC2x+zHCq8ZZ7w3uwadVmo+yqC4HnWRo
 IKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7NGRjcW6POBMRqlOP/cTnnyIXKw34HJdhD9MVrSH9hs=;
 b=LQoYPOflluLq2PS4kT63K+d6PwFwZHAeXFsKH+K9wAW9+arGbfvDwNDqsa3tVU9GPl
 hMxjDdexXc2rImpwBUly75Mtr78SYPyUzgFdykiLs95WMo81NCWZCrQEG+3qQ/2jc4Vd
 N+IiazoUO5WEFn2ygIbIzaXh7S6WYtQP1Ibus3Xd+jS+x/aI+CrBDlz6UbwJFcYXPuMD
 21wUE3GnsmNBONzhgKp2Tf7Qew593qj4e0IsHMopUKEkZ6xzQLChrb6CexADRXN8cXHa
 8zHatkjyu00RvE2VjUpl5HiRPwSCUXUyoapchCC87lVtUeBBw9q75BkK1lPa45IoMHHr
 EbRw==
X-Gm-Message-State: AJIora9NpP6QT9woz72lzDR7kqkhX2LO0LH996WDRJW91Litdqf1Sd2P
 OYUW4/PRi87L8GZ5fB2a9HtYBpj/6h0jcw==
X-Google-Smtp-Source: AGRyM1tIeypE6hSnQHHZEbPLreSJMVwVdAslsL1o3omSkZa/BW8ml761e1Un0Vm6OR+4MFEc0hIWlw==
X-Received: by 2002:a5d:6149:0:b0:21d:6ba7:6095 with SMTP id
 y9-20020a5d6149000000b0021d6ba76095mr16720628wrt.680.1657547876760; 
 Mon, 11 Jul 2022 06:57:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.57.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:57:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/45] target/arm: Mark RDFFR, WRFFR, SETFFR as non-streaming
Date: Mon, 11 Jul 2022 14:57:10 +0100
Message-Id: <20220711135750.765803-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-6-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sme-fa64.decode | 2 --
 target/arm/translate-sve.c | 9 ++++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 73c71abc462..fa2b5cbf1a3 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -61,8 +61,6 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 
 FAIL    0000 0100 --1- ---- 1011 -0-- ---- ----   # FTSSEL, FEXPA
 FAIL    0000 0101 --10 0001 100- ---- ---- ----   # COMPACT
-FAIL    0010 0101 --01 100- 1111 000- ---0 ----   # RDFFR, RDFFRS
-FAIL    0010 0101 --10 1--- 1001 ---- ---- ----   # WRFFR, SETFFR
 FAIL    0100 0101 --0- ---- 1011 ---- ---- ----   # BDEP, BEXT, BGRP
 FAIL    0100 0101 000- ---- 0110 1--- ---- ----   # PMULLB, PMULLT (128b result)
 FAIL    0110 0100 --1- ---- 1110 01-- ---- ----   # FMMLA, BFMMLA
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5d1db0d3ff9..d6faec15fe9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1785,7 +1785,8 @@ static bool do_predset(DisasContext *s, int esz, int rd, int pat, bool setflag)
 TRANS_FEAT(PTRUE, aa64_sve, do_predset, a->esz, a->rd, a->pat, a->s)
 
 /* Note pat == 31 is #all, to set all elements.  */
-TRANS_FEAT(SETFFR, aa64_sve, do_predset, 0, FFR_PRED_NUM, 31, false)
+TRANS_FEAT_NONSTREAMING(SETFFR, aa64_sve,
+                        do_predset, 0, FFR_PRED_NUM, 31, false)
 
 /* Note pat == 32 is #unimp, to set no elements.  */
 TRANS_FEAT(PFALSE, aa64_sve, do_predset, 0, a->rd, 32, false)
@@ -1799,11 +1800,13 @@ static bool trans_RDFFR_p(DisasContext *s, arg_RDFFR_p *a)
         .rd = a->rd, .pg = a->pg, .s = a->s,
         .rn = FFR_PRED_NUM, .rm = FFR_PRED_NUM,
     };
+
+    s->is_nonstreaming = true;
     return trans_AND_pppp(s, &alt_a);
 }
 
-TRANS_FEAT(RDFFR, aa64_sve, do_mov_p, a->rd, FFR_PRED_NUM)
-TRANS_FEAT(WRFFR, aa64_sve, do_mov_p, FFR_PRED_NUM, a->rn)
+TRANS_FEAT_NONSTREAMING(RDFFR, aa64_sve, do_mov_p, a->rd, FFR_PRED_NUM)
+TRANS_FEAT_NONSTREAMING(WRFFR, aa64_sve, do_mov_p, FFR_PRED_NUM, a->rn)
 
 static bool do_pfirst_pnext(DisasContext *s, arg_rr_esz *a,
                             void (*gen_fn)(TCGv_i32, TCGv_ptr,
-- 
2.25.1


