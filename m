Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 990C9538686
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:06:17 +0200 (CEST)
Received: from localhost ([::1]:52238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviqO-0005hG-No
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwL-0003rP-H2
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:26 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwJ-0007OA-Sp
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:21 -0400
Received: by mail-wm1-x32a.google.com with SMTP id bg25so6643089wmb.4
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=b2+9IpbEIMpachdLXp76ixemTS7BOkj9nnjCImRfs9o=;
 b=zskzloONbSeYWDofVc8yq6PWlIL8ublK+Md2VTV22TyOSNwdekcq5seUSpNcmg9Mpu
 8AdQcCkXpfKyVD1fHk1BByho2pW/ok+icTccfYxPrLZO0YezsLTN59TxVrHJgG7gWUN8
 wXwwwVzaWoWin5g/NrSp1Tm+NfGwL3xjbUo/A9pA1j7q2IpAE9VycfVXmpNLOqbUaS5j
 V5L0wbLpCgBRdHNfJRLp365Y5rxKYzfzIp29A/E0Q+hQtkGAM8Kx9NdPWfgcHRBbfUvN
 zw7r/JrCMZw92Ji2b07JtUBEPVmX8cZdAStXVWHISJE+2raKtDYo0Gg5WQGehnxl5oVB
 6LPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b2+9IpbEIMpachdLXp76ixemTS7BOkj9nnjCImRfs9o=;
 b=Xz9PkWkhOGNo+LDYqGIY/71i2w+yPPVrE531pzURja0AuuYjHIjU7Mb4o/+h+FlKN8
 viG/OGoxU2jA+IJltA/6BBD9QPSPscvAb8v8zSrd81uOk1IcPvu+d/9ySA/s95QmsVkd
 fpBU37iqshXZMUWyI9rZPAV55P4rqreoR9dwzHHL6QUcpANKMuFCwBDT9bMZ7d7MtRDY
 NbPRw46KnKCYAQwfaJtKktTCorIL8FzHef/clRFaQiFu003PKaxp43DpabDUbHC6CQU8
 DkNxNUVfFoOtzbHFPd06L0r67pbhoLrumB1PRpbeP49CJmsGbmkt9zJeU1FyWKb2HcTb
 xnQQ==
X-Gm-Message-State: AOAM532EbtxMIPkD7x7lVBKm5kpR7eGixhfnqO4I7ZZB9QlMcAH7EaFh
 RKlafIWnnF4JN/O3Ci2djQHNjJBVOMI7NA==
X-Google-Smtp-Source: ABdhPJyfCboYOhluYMWOkDfm+BFZrCDidzWLmUfyR7Itwhinir9qatgASfW56eijfDfsapmPPvgu2Q==
X-Received: by 2002:a05:600c:210a:b0:397:592f:6152 with SMTP id
 u10-20020a05600c210a00b00397592f6152mr19862194wml.99.1653926898074; 
 Mon, 30 May 2022 09:08:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 072/117] target/arm: Use TRANS_FEAT for do_brk2, do_brk3
Date: Mon, 30 May 2022 17:06:23 +0100
Message-Id: <20220530160708.726466-73-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-70-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 45 ++++++++++++--------------------------
 1 file changed, 14 insertions(+), 31 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 03b2eddd8b4..d44b24e9883 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2879,40 +2879,23 @@ static bool do_brk2(DisasContext *s, arg_rpr_s *a,
     return true;
 }
 
-static bool trans_BRKPA(DisasContext *s, arg_rprr_s *a)
-{
-    return do_brk3(s, a, gen_helper_sve_brkpa, gen_helper_sve_brkpas);
-}
+TRANS_FEAT(BRKPA, aa64_sve, do_brk3, a,
+           gen_helper_sve_brkpa, gen_helper_sve_brkpas)
+TRANS_FEAT(BRKPB, aa64_sve, do_brk3, a,
+           gen_helper_sve_brkpb, gen_helper_sve_brkpbs)
 
-static bool trans_BRKPB(DisasContext *s, arg_rprr_s *a)
-{
-    return do_brk3(s, a, gen_helper_sve_brkpb, gen_helper_sve_brkpbs);
-}
+TRANS_FEAT(BRKA_m, aa64_sve, do_brk2, a,
+           gen_helper_sve_brka_m, gen_helper_sve_brkas_m)
+TRANS_FEAT(BRKB_m, aa64_sve, do_brk2, a,
+           gen_helper_sve_brkb_m, gen_helper_sve_brkbs_m)
 
-static bool trans_BRKA_m(DisasContext *s, arg_rpr_s *a)
-{
-    return do_brk2(s, a, gen_helper_sve_brka_m, gen_helper_sve_brkas_m);
-}
+TRANS_FEAT(BRKA_z, aa64_sve, do_brk2, a,
+           gen_helper_sve_brka_z, gen_helper_sve_brkas_z)
+TRANS_FEAT(BRKB_z, aa64_sve, do_brk2, a,
+           gen_helper_sve_brkb_z, gen_helper_sve_brkbs_z)
 
-static bool trans_BRKB_m(DisasContext *s, arg_rpr_s *a)
-{
-    return do_brk2(s, a, gen_helper_sve_brkb_m, gen_helper_sve_brkbs_m);
-}
-
-static bool trans_BRKA_z(DisasContext *s, arg_rpr_s *a)
-{
-    return do_brk2(s, a, gen_helper_sve_brka_z, gen_helper_sve_brkas_z);
-}
-
-static bool trans_BRKB_z(DisasContext *s, arg_rpr_s *a)
-{
-    return do_brk2(s, a, gen_helper_sve_brkb_z, gen_helper_sve_brkbs_z);
-}
-
-static bool trans_BRKN(DisasContext *s, arg_rpr_s *a)
-{
-    return do_brk2(s, a, gen_helper_sve_brkn, gen_helper_sve_brkns);
-}
+TRANS_FEAT(BRKN, aa64_sve, do_brk2, a,
+           gen_helper_sve_brkn, gen_helper_sve_brkns)
 
 /*
  *** SVE Predicate Count Group
-- 
2.25.1


