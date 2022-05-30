Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE0A538648
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:45:02 +0200 (CEST)
Received: from localhost ([::1]:59928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviVp-0005bi-Cy
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvj-0003Ls-Ut
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:44 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:53799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvd-0007Gx-9n
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:41 -0400
Received: by mail-wm1-x330.google.com with SMTP id r129so1359848wmr.3
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aDFaadxJvzUJRVexXAXlncbRaDQ7Ch+GouHQCAMIfA4=;
 b=Xs3C9nQCOSH9ekil5/fhNXNkFIvcXS5q7L77ULCYlLir+/N07ht3sOF/Fcd9ltfEI+
 LocBg4pyxu8MQ/WN3z6c/GJM8EmX7o+P7ahg1Iq+6iPX/d0ga5LjqCHx1MxUkx0gBMEi
 uy+oy5AXq6wi0Ag0jBngw4fe+NS+q4EOF6V53yUEqZdm0g6L1XZ3lT+lD8pat8kp7po+
 80am8cLi0brASb5Cxo/eREvkKfkp2ZxFf2CXsy5MvhAm9YKTefFJhpeko9kPxDxjX7AA
 /Sn8Yv39ePtx6xZsYPdHTJJP8Ja8iypf7FUI3/6h9PkpG0x2Pf5b7tUra1lvcCAegj3b
 Z0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aDFaadxJvzUJRVexXAXlncbRaDQ7Ch+GouHQCAMIfA4=;
 b=UAdzjY6Fz9VmzoefvnnEBojBilh97hPdYRHLjArp4WOIANqNah52YCw7tKanwq1nPt
 Fp89smOjadLdwsKVzUt2YtZ3ekAyzCgdn+k31NJq01WyuvtB0At/VfSsNnZS53F12oA5
 LD4H92kzyvGp13WNbKyq5KYhJhSNie8NpT5SKjcBY69LQJnwOhFngbahP5uTGm4ZBZpO
 Rdk9hi5ZMCo8eydrktGY6LSyAhRrJcid3ymIJ6cljjRr5FizJMzy1KFxGx1MtR7MOGH6
 TE1AgUz4X0Rb9oK7+uh9c1aLyERlbfcN60Q4oCZ1+/SeYloh6ptz1Udmvbpv7/EbvEz0
 ATwQ==
X-Gm-Message-State: AOAM532T78MjDAMRpoiF0EJjlDP0FAx9EVuBdHztGskOQ+6e5En1aoiH
 JvmdldDibiX2ymEPRrFXIstzFUUQlMGVwQ==
X-Google-Smtp-Source: ABdhPJxKdlNrCj9jA108RF+SiuAvhvDnCh3FRMpVDRD4g3oeH6E0KjYVeROlTdrqNmhif8Wp5uW/yQ==
X-Received: by 2002:a05:600c:2254:b0:397:581d:34fa with SMTP id
 a20-20020a05600c225400b00397581d34famr19879353wmm.181.1653926855836; 
 Mon, 30 May 2022 09:07:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 032/117] target/arm: Merge gen_gvec_fn_zz into do_mov_z
Date: Mon, 30 May 2022 17:05:43 +0100
Message-Id: <20220530160708.726466-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

There is only one caller for gen_gvec_fn_zz; inline it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-30-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0a69a1ef65e..5ab9de46a71 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -258,15 +258,6 @@ static bool gen_gvec_ool_arg_zpzz(DisasContext *s, gen_helper_gvec_4 *fn,
     return gen_gvec_ool_zzzp(s, fn, a->rd, a->rn, a->rm, a->pg, data);
 }
 
-/* Invoke a vector expander on two Zregs.  */
-static void gen_gvec_fn_zz(DisasContext *s, GVecGen2Fn *gvec_fn,
-                           int esz, int rd, int rn)
-{
-    unsigned vsz = vec_full_reg_size(s);
-    gvec_fn(esz, vec_full_reg_offset(s, rd),
-            vec_full_reg_offset(s, rn), vsz, vsz);
-}
-
 /* Invoke a vector expander on three Zregs.  */
 static void gen_gvec_fn_zzz(DisasContext *s, GVecGen3Fn *gvec_fn,
                             int esz, int rd, int rn, int rm)
@@ -292,7 +283,9 @@ static void gen_gvec_fn_zzzz(DisasContext *s, GVecGen4Fn *gvec_fn,
 static bool do_mov_z(DisasContext *s, int rd, int rn)
 {
     if (sve_access_check(s)) {
-        gen_gvec_fn_zz(s, tcg_gen_gvec_mov, MO_8, rd, rn);
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_mov(MO_8, vec_full_reg_offset(s, rd),
+                         vec_full_reg_offset(s, rn), vsz, vsz);
     }
     return true;
 }
-- 
2.25.1


